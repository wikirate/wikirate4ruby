require_relative '../error'

module Wikirate4ruby
  module Entities
    class Dataset < Entities::Card
      ATTRIBUTES = %i[answers metrics companies license].freeze
      attr_reader(*ATTRIBUTES)

      def initialize(metric)
        super metric
        raise parsing_error name = "IncompatibleCardType", message = "The input Card is not a Dataset but a #{@type}" if @type != 'Data Set'

        @answers = get_array_of 'items', Answer
        @metrics = get_content 'metrics'
        @companies = get_content 'companies'
        @license = get_content 'license'

      end
    end
  end
end