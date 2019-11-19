module NationalRailWrapper
  module Feeds::KnowledgeBase::Requests
    class NationalServiceIndicators < Base
      def run(auth_token)
        call(path: '/4.0/serviceIndicators', auth_token: auth_token)
      end
    end
  end
end