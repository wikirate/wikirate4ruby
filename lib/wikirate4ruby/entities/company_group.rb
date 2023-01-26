require_relative '../error'

module Wikirate4ruby
  module Entities
    class CompanyGroup < Entities::Card
      ATTRIBUTES = %i[links companies specification].freeze
      attr_reader(*ATTRIBUTES)

      def initialize(metric)
        super metric
        raise parsing_error name = "IncompatibleCardType", message = "The input Card is not a Company Group but a #{@type}" if @type != 'Company Group'

        @links = get_content 'links'
        @companies = get_content 'companies'
        @specification = get_content 'specification'

      end

    end
  end
end