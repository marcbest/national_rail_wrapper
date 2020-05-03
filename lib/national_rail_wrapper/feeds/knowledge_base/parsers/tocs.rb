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

            doc.xpath('/xmlns:TrainOperatingCompanyList/xmlns:TrainOperatingCompany').map do |toc_node|
              {
                name: toc_node.css('Name')&.text,
                atoc_code: toc_node.css('AtocCode')&.text,
                atoc_member: toc_node.css('AtocMember')&.text,
                legal_name: toc_node.css('LegalName')&.text,
                station_operator: toc_node.css('LegalName')&.text,
                managing_director: toc_node.css('ManagingDirector')&.text, 
                logo: toc_node.css('Logo')&.text,
                network_map: toc_node.css('NetworkMap')&.text,
                company_website: toc_node.css('CompanyWebsite')&.text
              }
            end
          end
        end
      end
    end
  end
end
