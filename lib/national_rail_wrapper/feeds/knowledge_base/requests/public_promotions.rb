module NationalRailWrapper
  module Feeds::KnowledgeBase::Requests
    class PublicPromotions < Base
      def run(auth_token)
        call(path: base_url + '/4.0/promotions-publics', auth_token: auth_token)
      end
    end
  end
end
