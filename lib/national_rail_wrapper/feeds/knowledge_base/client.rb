module NationalRailWrapper
  module Feeds
    module KnowledgeBase
      class Client < NationalRailWrapper::Client

        def incidents(parse_result: true)
          request = KnowledgeBase::Requests::Incidents.new.run(auth_token)

          parse_result ? Ox.parse(request.response_body).to_json : request.response_body
        end

        def national_service_indicators(parse_result: true)
          request = KnowledgeBase::Requests::NationalServiceIndicators.new.run(auth_token).response_body

          if parse_result
            KnowledgeBase::Parsers::NationalServiceIndicators.new(request).to_json
          else
            request.response_body
          end
        end

        def public_promotions(parse_result: true)
          request = KnowledgeBase::Requests::PublicPromotions.new.run(auth_token)

          parse_result ? response.to_json : request.response_body
        end

        def stations(parse_result: true)
          request = KnowledgeBase::Requests::Stations.new.run(auth_token).response_body

          if parse_result
            KnowledgeBase::Parsers::Stations.new(request).to_json
          else
            request.response_body
          end
        end

        def ticket_restrictions(parse_result: true)
          request = KnowledgeBase::Requests::TicketRestrictions.new.run(auth_token)

          parse_result ? Ox.parse(request.response_body).to_json : request.response_body
        end

        def ticket_types(parse_result: true)
          request = KnowledgeBase::Requests::TicketTypes.new.run(auth_token)

          parse_result ? Ox.parse(request.response_body).to_json : request.response_body
        end

        def tocs(parse_result: true)
          request = KnowledgeBase::Requests::Tocs.new.run(auth_token).response_body

          if parse_result
            KnowledgeBase::Parsers::Tocs.new(request).to_json
          else
            request.response_body
          end
        end

        private

        def parse_result(endpoint, response)
          "KnowledgeBase::Parsers::#{endpoint.camelize}".constantize.new(request).to_json
        end

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
