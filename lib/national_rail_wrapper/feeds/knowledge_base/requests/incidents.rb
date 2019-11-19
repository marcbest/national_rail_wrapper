module NationalRailWrapper
  module Feeds::KnowledgeBase::Requests
    class Incidents < Base
      def run(auth_token)
        call(path: '/5.0/incidents', auth_token: auth_token)
      end
    end
  end
end

