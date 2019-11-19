module NationalRailWrapper
  module Feeds::HistoricalServicePerformance::Requests
    class ServiceMetrics < Base
      def run(auth_token: , body:)
        call(path: '/serviceMetrics', method: :post, body: body, auth_token: auth_token)
      end
    end
  end
end

