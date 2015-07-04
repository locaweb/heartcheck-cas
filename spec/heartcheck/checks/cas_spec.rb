require 'spec_helper'

describe Heartcheck::Checks::Cas do
  let :service do
    {
        service: 'localhost',
        username: 'username',
        password: 'password',
        server: 'https://cas.server.com/v1/tickets'
    }
  end
  
  subject do
    described_class.new.tap do |config|
      config.add_service(service)
    end
  end
  
  describe '#validate' do
    context 'request a ticket to the cas server' do
      it 'error message when raise error' do
        expect(Heartcheck::Cas::HttpClient).
          to receive(:post).and_raise("Yo")

        subject.validate
        expect(subject.instance_variable_get(:@errors)).to contain_exactly("Yo")
      end

      it 'error message with wrong credentials' do
        expect(Heartcheck::Cas::HttpClient).
          to receive(:post).with(service[:server], {
                     'username' => service[:username],
                     'password' => service[:password]
                   }).and_return(double(code: '403'))

        subject.validate

        expect(subject.instance_variable_get(:@errors)).to contain_exactly("Cannot get TGT")
      end
      
      it 'error message with invalid tgt-url' do
        response = double(code: '201')
        expect(response).to receive(:[]).with('Location').and_return('the-tgt-url')
        
        expect(Heartcheck::Cas::HttpClient).to receive(:post).with(service[:server], {
          'username' => service[:username],
          'password' => service[:password]
        }).and_return(response)


        expect(Heartcheck::Cas::HttpClient).to receive(:post).
          with('the-tgt-url', { 'service' => service[:service] }).
            and_return(double(code: '403'))
        
        subject.validate

        expect(subject.instance_variable_get(:@errors)).to contain_exactly("Cannot get ticket")
      end

      it 'request a ticket and works fine' do
        tgt = double(code: '201')
        expect(tgt).to receive(:[]).with('Location') { 'the-tgt-url' }
        
        expect(Heartcheck::Cas::HttpClient).to receive(:post).with(service[:server], {
          'username' => service[:username],
          'password' => service[:password]
        }).and_return(tgt)

        ticket = double(code: '200')
        expect(ticket).to receive(:body) { 'ticketz' }

        expect(Heartcheck::Cas::HttpClient).to receive(:post).
          with('the-tgt-url', {'service' => service[:service]}).
            and_return(ticket)
        
        subject.validate

        expect(subject.instance_variable_get(:@errors)).to be_empty
      end
    end
  end
end
