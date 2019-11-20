module NationalRailWrapper
  module Feeds::Base::Requests
    class Base
      
      def call(options = {})
        method          = options.fetch(:method, :get)
        path            = options.fetch(:path, '')
        body            = options.fetch(:body, {})
        query           = options.fetch(:query, {})
        auth_token      = options.fetch(:auth_token, {})

        url = base_url + path

        request = Typhoeus::Request.new(url, request_params)
        response = request.run

        response
      end

      def request_params 
        raise NotImplementedError
      end

      def base_url 
        raise NotImplementedError
      end
    end
  end
end

