module NationalRailWrapper
  module Feeds
    module KnowledgeBase
      module Parsers
        class Incidents
          def initialize(data)
            @data = data
          end

          def to_json
            options = Nokogiri::XML::ParseOptions.new.nonet.noent.noblanks
            doc = Nokogiri::XML.parse(@data, nil, nil, options)
            doc.xpath('/xmlns:NSI/xmlns:TOC').map do |toc_node|
              {

              }
            end
          end

          private

        end
      end
    end
  end
end