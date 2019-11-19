module NationalRailWrapper
  module Feeds::KnowledgeBase::Requests
    class TicketRestrictions < Base
      def run(auth_token)
        call(path: '/4.0/ticket-restrictions', auth_token: auth_token)
      end
    end
  end
end