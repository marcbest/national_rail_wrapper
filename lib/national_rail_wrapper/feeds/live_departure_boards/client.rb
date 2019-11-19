module NationalRailWrapper
  module Feeds
    module LiveDepartureBoards
      class  Client < NationalRailWrapper::Client


        private

        def auth_token
          Base64.strict_encode64("#{@credentials[:username]}:#{@credentials[:password]}")
        end
      end
    end
  end
end
