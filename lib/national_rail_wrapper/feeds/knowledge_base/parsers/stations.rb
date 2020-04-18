module NationalRailWrapper
  module Feeds
    module KnowledgeBase
      module Parsers
        class Stations
          def initialize(data)
            @data = data
          end

          def to_json
            options = Nokogiri::XML::ParseOptions.new.nonet.noent.noblanks.huge
            doc = Nokogiri::XML.parse(@data, nil, nil, options)

            doc.xpath('/xmlns:StationList/xmlns:Station').map do |toc_node|
              {
                name: toc_node.xpath('./xmlns:Name')&.text,
                crs_code: toc_node.css('CrsCode')&.text,
                alternative_identifiers: toc_node.css('AlternativeIdentifiers')&.text,
                sixteen_character_name: toc_node.css('SixteenCharacterName')&.text,
                longitude: toc_node.css('Longitude')&.text,
                latitude: toc_node.css('Latitude')&.text,
                station_operator: toc_node.css('StationOperator')&.text,
                staffing_level: toc_node.css('Staffing/StaffingLevel')&.text,
                closed_circuit_television: toc_node.css('Staffing/ClosedCircuitTelevision')&.text,
                station_facilities: station_facilities(toc_node.css('StationFacilities')),
                # impaired_access: impaired_access(toc_node.css('ImpairedAccess'))
                car_park: car_park(toc_node.css('CarPark'))

              }
            end
          end


                # national_location_code: toc_node.xpath('./xmlns:NationalLocationCode').first&.content,
                # address: toc_node.xpath('./xmlns:Address').first&.content,
                # postal_address: toc_node.xpath('./xmlns:PostalAddress').first&.content,
                # #<add:A_5LineAddress> (mandatory) See section 2.4.1

                # station_operator: toc_node.css('StationOperator').text, #
                # Overall: toc_node.xpath('./xmlns:Overall').first&.content,
                # InformationSystems: toc_node.xpath('./xmlns:InformationSystems').first&.content,
                # cis: cis,
                # fares: fares(toc_node.xpath('./xmlns:Fares').first),
                # passenger_services: passenger_services,
                # impaired_access: impaired_access,
                # InterChange: inter_change,
                # StationAlerts: toc_node.xpath('./xmlns:PostalAddress').first&.content,
                # AlertText: toc_node.xpath('./xmlns:PostalAddress').first&.content,
                # LastChangedDate: toc_node.xpath('./xmlns:PostalAddress').first&.content,
                # car_park: car_park,
                # opening_hours: opening_hours,
                # contact_details: contact_details

          private

          def cis(toc_node)
          end

          def fares(fares)

          end

          def passenger_services(toc_node)
          end

          def station_facilities(node_set)
            {
              first_class_lounge: node_set.at('FirstClassLounge')&.text,
              waiting_room: node_set.at('WaitingRoom')&.text,
              trolleys: node_set.at('Trolleys')&.text,
              station_buffet: node_set.at('StationBuffet')&.text,
              toilets: node_set.at('Toilets')&.text,
              baby_change: node_set.at('BabyChange')&.text,
              showers: node_set.at('Showers')&.text,
              # telephone: {
              #   exists:
              #   usage_type:
              # },
              wifi: node_set.at('WiFi')&.text,
              post_box: node_set.at('BabyChange')&.text,
              # tourist_information_office:
              atm_machine: node_set.at('AtmMachine')&.text,
              bureau_de_change: node_set.at('BureauDeChange')&.text,
              shops: node_set.at('Shops')&.text
            }
          end

          def impaired_access(toc_node)
          end

          def inter_change(toc_node)
          end

          def car_park(node_set)
            {
              name: node_set.at('Name')&.text,
              spaces: node_set.at('Spaces')&.text
            }
          end

          def opening_hours(toc_node)
          end

          def contact_details(toc_node)
          end

        end
      end
    end
  end
end
