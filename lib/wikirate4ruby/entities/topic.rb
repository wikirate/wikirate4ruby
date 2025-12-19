require_relative '../error'

module Wikirate4ruby
  module Entities
    class Topic < Entities::Card
      ATTRIBUTES = %i[title framework family parent children metrics datasets].freeze
      attr_reader(*ATTRIBUTES)

      def initialize(topic)
        super topic
        raise parsing_error name = "IncompatibleCardType", message = "The input Card is not a Topic but a #{@type}" if @type != 'Topic'

        @title = get_content 'title'
        @framework = get_content 'framework'
        @family = get_content 'family'
        @parent = get_content 'parent'
        @children = get_array_of 'children', String
        @metrics = get_content 'metrics'
        @datasets = get_content 'datasets'

      end
    end
  end
end
