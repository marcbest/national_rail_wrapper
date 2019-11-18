module NationalRailWrapper
  module Feeds
    module KnowledgeBase
      class Client < NationalRailWrapper::Client
        
        def incidents
          request = KnowledgeBase::Requests::Incidents.new.run(auth_token)

          # Ox.parse(request.response_body).to_json  
        end

        def national_service_indicators
          request = KnowledgeBase::Requests::NationalServiceIndicators.new.run(auth_token)

          # Ox.parse(request.response_body).to_json  
        end

        def public_promotions
          request = KnowledgeBase::Requests::PublicPromotions.new.run(auth_token)

          # Ox.parse(request.response_body).to_json  
        end

        def stations
          request = KnowledgeBase::Requests::Stations.new.run(auth_token) 

          # Ox.parse(request.response_body).to_json  
        end

        def ticket_restrictions
          request = KnowledgeBase::Requests::TicketRestrictions.new.run(auth_token) 

          # Ox.parse(request.response_body).to_json  
        end

        def ticket_types
          request = KnowledgeBase::Requests::TicketTypes.new.run(auth_token)
          
          # Ox.parse(request.response_body).to_json  
        end

        def tocs
          request = KnowledgeBase::Requests::Tocs.new.run(auth_token)

          # Ox.parse(request.response_body).to_json  
        end

        private

        def auth_token
          return @auth_token if !@auth_token.nil? && @auth_token_expires_at >= Time.now

          response = Net::HTTP.post_form(URI('https://opendata.nationalrail.co.uk/authenticate'), @credentials)
          response.value # Raise an exception if not successful
          data = JSON.parse(response.body)
          token = data.fetch('token')

          # Token expires in 1 hour. Using 55 minutes provides a safety margin.
          @auth_token_expires_at = Time.now + (55 * 60)

          @auth_token = token
        end
      end
    end
  end
end
