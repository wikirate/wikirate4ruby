require_relative '../error'

module Wikirate4ruby
  module Entities
    class CheckedBy < Entities::Card
      ATTRIBUTES = %i[checks].freeze
      attr_reader(*ATTRIBUTES)

      def initialize(checked_by)
        super checked_by
        raise parsing_error name = 'IncompatibleCardType', message = "The input Card is not a Checked By but a #{@type}" unless @name.end_with? 'checked by'

        @checks = get_content 'checks'

      end

    end
  end
end
