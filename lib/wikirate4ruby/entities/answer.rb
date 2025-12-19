require_relative '../error'

module Wikirate4ruby
  module Entities
    class Answer < Entities::Card
      ATTRIBUTES = %i[company year value comments record_url metric_name metric_designer sources checked_by].freeze
      attr_reader(*ATTRIBUTES)

      def initialize(answer)
        super answer
        raise parsing_error name = "IncompatibleCardType", message = "The input Card is not an Answer but a #{@type}" unless @type.include? 'Relationship'

        @metric_name = get_content('name').split('+')[1]
        @metric_designer = get_content('name').split('+')[0]
        @company = get_content 'company'
        @value = get_content 'value'
        @year = get_content 'year'
        @sources = get_array_of 'sources', Source
        @checked_by = get_content 'checked_by'
        @comments = get_content 'comments'
        @record_url = get_content 'record_url'

      end
    end
  end
end
