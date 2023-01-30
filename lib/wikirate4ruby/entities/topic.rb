require_relative '../error'

module Wikirate4ruby
  module Entities
    class Topic < Entities::Card
      ATTRIBUTES = %i[bookmarkers metrics datasets].freeze
      attr_reader(*ATTRIBUTES)

      def initialize(topic)
        super topic
        raise parsing_error name = "IncompatibleCardType", message = "The input Card is not a Topic but a #{@type}" if @type != 'Topic'

        @bookmarkers = get_content 'bookmarkers'
        @metrics = get_content 'metrics'
        @datasets = get_content 'datasets'

      end
    end
  end
end
