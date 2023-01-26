require_relative '../error'

module Wikirate4ruby
  module Entities
    class ResearchGroup < Entities::Card
      ATTRIBUTES = %i[researchers].freeze
      attr_reader(*ATTRIBUTES)

      def initialize(metric)
        super metric
        raise parsing_error name = "IncompatibleCardType", message = "The input Card is not a Research Group but a #{@type}" if @type != 'Research Group'

        @researchers = get_content 'researchers'

      end

    end
  end
end