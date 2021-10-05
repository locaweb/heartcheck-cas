require 'json'

module Heartcheck
  module Checks
    # Check for a cas service
    # Base is set in heartcheck gem
    class Cas < Base
      def validate
        services.each do |service|
          begin
            tgt = tgt_url(service)

            if tgt.nil?
              @errors << "Cannot get TGT"
              next
            end

            if ticket(service, tgt).nil?
              @errors << "Cannot get ticket"
              next
            end
          rescue StandardError => e
            @errors << e.message
          end
        end
      end

      private

      def tgt_url(service)
        response = Heartcheck::Cas::HttpClient.post(service[:server], {
          'username' => service[:username],
          'password' => service[:password]
        })

        response.code.eql?('201') ? response['Location'] : nil
      end

      def ticket(service, tgt)
        response = Heartcheck::Cas::HttpClient.post(tgt, {'service' => service[:service]})
        response.code.eql?('200') ? response.body : nil
      end
    end
  end
end
