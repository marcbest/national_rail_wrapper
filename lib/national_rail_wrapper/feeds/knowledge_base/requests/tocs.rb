module NationalRailWrapper
  module Feeds::KnowledgeBase::Requests
    class Tocs < Base
      def run(auth_token) 
        call(path: '/4.0/tocs', auth_token: auth_token)
      end
    end
  end
end
