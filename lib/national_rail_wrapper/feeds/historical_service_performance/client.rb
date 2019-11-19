module NationalRailWrapper
  module Feeds
    module HistoricalServicePerformance
      class Client < NationalRailWrapper::Client

        def service_details(rid, parse_result: false)
          body = {rid: rid}
          HistoricalServicePerformance::Requests::ServiceDetails.new.run(auth_token: auth_token, body: body)
        end

        def service_metrics(body, parse_result: false)
          HistoricalServicePerformance::Requests::ServiceMetrics.new.run(auth_token: auth_token, body: body)
        end

        private

        def auth_token
          Base64.strict_encode64("#{@credentials[:username]}:#{@credentials[:password]}")
        end
      end
    end
  end
end
