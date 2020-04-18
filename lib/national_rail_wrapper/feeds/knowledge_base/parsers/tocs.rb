module NationalRailWrapper
  module Feeds
    module KnowledgeBase
      module Parsers
        class Tocs
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
        end
      end
    end
  end
end
