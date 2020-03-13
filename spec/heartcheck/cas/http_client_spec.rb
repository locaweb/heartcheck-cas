require 'spec_helper'

describe Heartcheck::Cas::HttpClient do
  describe '#post' do
    context 'make a post request' do
      it 'should create a hastebin document' do
        response = described_class.post(
          'https://reqbin.com/echo/post/json', { data: 'Bacon' }
        )
        expect(response.code).to eq "200"
        expect(response.body).to match /success/
      end
    end
  end
end
