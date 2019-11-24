module NationalRailWrapper
  module Feeds::HistoricalServicePerformance::Requests
    class Base < Feeds::Base::Requests::Base
      def request_params(method, body, query, auth_token)
        {
          method: method,
          body: body.empty? ? '' : body.to_json, 
          params: query, 
          headers: {
            'Content-Type' => 'application/json', 
            "Authorization" => "Basic #{auth_token}"
          }, 
          ssl_verifypeer: false
        }
      end

      def base_url 
        'https://hsp-prod.rockshore.net/api/v1'
      end
    end
  end
end
