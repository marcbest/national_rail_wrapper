module NationalRailWrapper
  module Feeds::KnowledgeBase::Requests
    class TicketTypes < Base
      def run(auth_token) 
        call(path: '/4.0/ticket-types', auth_token: auth_token)
      end
    end
  end
end
