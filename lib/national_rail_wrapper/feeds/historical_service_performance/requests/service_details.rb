module NationalRailWrapper
  module Feeds::HistoricalServicePerformance::Requests
    class ServiceDetails < Base
      def run(auth_token: , body:)
        call(path: base_url + '/serviceDetails', method: :post, body: body, auth_token: auth_token)
      end
    end
  end
end
