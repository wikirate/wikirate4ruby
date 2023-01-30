require_relative '../error'

module Wikirate4ruby
  module Entities
    class Source < Entities::Card
      ATTRIBUTES = %i[title file link description report_type metrics companies
       answers year].freeze
      attr_reader(*ATTRIBUTES)

      def initialize(source)
        super source
        raise parsing_error name = "IncompatibleCardType", message = "The input Card is not a Source but a #{@type}" if @type != 'Source'

        @title = get_content 'title'
        @file = get_content 'file'
        @link = get_content 'link'
        @description = get_content 'description'
        @report_type = get_content 'report_type'
        @metrics = get_content 'metric'
        @companies = get_content 'company'
        @answers = get_content 'answer'
        @year = get_content 'year'

      end
    end
  end
end