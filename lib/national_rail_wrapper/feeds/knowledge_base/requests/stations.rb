module NationalRailWrapper
  module Feeds::KnowledgeBase::Requests
    class Stations < Base

      def run(auth_token) 
        call(path: base_url + '/4.0/stations', auth_token: auth_token)
      end
    end
  end
end