require_relative '../error'

module Wikirate4ruby
  module Entities
    class Company < Entities::Card
      ATTRIBUTES = %i[headquarters wikipedia aliases open_corporates os_id cik answers_url].freeze
      attr_reader(*ATTRIBUTES)

      def initialize(company)
        super company
        raise parsing_error name = "IncompatibleCardType", message = "The input Card is not a Company but a #{@type}" if @type != "Company"

        @headquarters = get_content 'headquarters'
        @wikipedia = get_content 'wikipedia'
        @aliases = get_content 'aliases'
        @open_corporates = get_content 'open_corporates'
        @os_id = get_content 'oar_id'
        @cik = get_content 'cik'
        @answers_url = get_content 'answers_url'

      end

    end
  end
end
