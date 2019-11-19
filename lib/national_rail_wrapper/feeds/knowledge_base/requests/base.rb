module NationalRailWrapper
  module Feeds::KnowledgeBase::Requests
    class Base < Feeds::BaseFeed::Requests::Base

      def request_params
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
