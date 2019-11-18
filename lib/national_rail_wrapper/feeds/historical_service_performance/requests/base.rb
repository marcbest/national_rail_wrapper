module NationalRailWrapper
  module Feeds::HistoricalServicePerformance::Requests
    class Base

      def call(options = {})

        method          = options.fetch(:method, :get)
        path            = options.fetch(:path, '')
        body            = options.fetch(:body, {})
        query           = options.fetch(:query, {})
        auth_token      = options.fetch(:auth_token, {})

        url = path

        request_params = {
          method: method,
          body: body.empty? ? '' : body.to_json, 
          params: query, 
          headers: {
            'Content-Type' => 'application/json', 
            "Authorization" => "Basic #{auth_token}"
          }, 
          ssl_verifypeer: false
        }

        request = Typhoeus::Request.new(url, request_params)
        response = request.run

        response
      end

      def base_url 
        'https://hsp-prod.rockshore.net/api/v1'
      end
    end
  end
end
