module NationalRailWrapper
  module Feeds
    module KnowledgeBase
      module Parsers
        class NationalServiceIndicators 
          def initialize(data)
            @data = data
          end

          def to_json
            options = Nokogiri::XML::ParseOptions.new.nonet.noent.noblanks
            doc = Nokogiri::XML.parse(@data, nil, nil, options)
            doc.xpath('/xmlns:NSI/xmlns:TOC').map do |toc_node|
              {
                toc_code: toc_node.xpath('./xmlns:TocCode').first&.content,
                toc_name: toc_node.xpath('./xmlns:TocName').first&.content,
                status: toc_node.xpath('./xmlns:Status').first&.content,
                status_image: toc_node.xpath('./xmlns:StatusImage').first&.content,
                status_description: toc_node.xpath('./xmlns:StatusDescription').first&.content,
                service_groups: service_groups(toc_node.xpath('./xmlns:ServiceGroup')),
                twitter_account: toc_node.xpath('./xmlns:TwitterAccount').first&.content,
                additional_info: toc_node.xpath('./xmlns:AdditionalInfo').first&.content, 
                custom_additional_info: toc_node.xpath('./xmlns:CustomAdditionalInfo').first&.content
              }
            end
          end

          private

          def service_groups(service_groups)
            service_groups.map do |service_group| 
              {
                group_name: service_group.xpath('./xmlns:GroupName').first&.content,
                current_distruption: service_group.xpath('./xmlns:CurrentDisruption').first&.content,
                custom_detail: service_group.xpath('./xmlns:CustomDetail').first&.content,
                custom_url: service_group.xpath('./xmlns:CustomURL').first&.content
              }
            end
          end
        end
      end
    end
  end
end