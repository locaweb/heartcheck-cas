# enconding: utf-8
require 'net/http'

module Heartcheck
  module Cas
    class HttpClient
      def self.post(url, params)
        self.new.post(url, params)
      end

      def post(url, params)
        uri = URI(url)
        request = Net::HTTP::Post.new(uri.request_uri)
        request.set_form_data(params)
        base_client(uri).request(request)
      end

      def base_client(uri)
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = uri.scheme.eql?('https')
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        http
      end
    end
  end
end
