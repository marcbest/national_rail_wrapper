module NationalRailWrapper
  module Feeds::KnowledgeBase::Requests
    class Base < Feeds::Base::Requests::Base

      def request_params(method, body, query, auth_token)
        {
          method: method,
          body: body.empty? ? '' : body.to_json,
          params: query,
          headers: {'X-Auth-Token' => auth_token},
          ssl_verifypeer: false
        }
      end

      def base_url 
        'https://opendata.nationalrail.co.uk/api/staticfeeds'
      end

    end
  end
end
