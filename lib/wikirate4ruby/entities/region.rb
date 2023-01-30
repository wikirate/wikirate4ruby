require_relative '../error'

module Wikirate4ruby
  module Entities
    class Region < Entities::Card
      ATTRIBUTES = %i[jurisdiction_code ilo_region country].freeze
      attr_reader(*ATTRIBUTES)

      def initialize(region)
        super region
        raise parsing_error name = "IncompatibleCardType", message = "The input Card is not a Region but a #{@type}" if @type != 'Region'

        @jurisdiction_code = @data["items"][1]["content"]
        @ilo_region = @data["items"][2]["content"]
        @country = @data["items"][3]["content"][0]

      end
    end
  end
end
