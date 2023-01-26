require_relative '../error'

module Wikirate4ruby
  module Entities
    class Metric < Entities::Card
      ATTRIBUTES = %i[metric_name metric_designer metric_type question about methodology value_type value_options report_type
                      research_policy unit range hybrid topics scores formula rubric variables answers bookmarkers datasets
                      companies calculations answers_url].freeze
      attr_reader(*ATTRIBUTES)

      def initialize(metric)
        super metric
        raise parsing_error name = "IncompatibleCardType", message = "The input Card is not a Metric but a #{@type}" if @type != 'Metric'

        @metric_name = @data['title']
        @metric_designer = @data['designer']
        @metric_type = get_content 'metric_type'
        @question = get_content 'question'
        @about = get_content 'about'
        @methodology = get_content 'methodology'
        @value_options = get_content 'value_options'
        @value_type = get_content 'value_type'
        @report_type = get_content 'report_type'
        @research_policy = get_content 'research_policy'
        @unit = get_content 'unit'
        @range = get_content 'range'
        @hybrid = get_content 'hybrid'
        @topics = get_content 'topics'
        @scores = get_content 'scores'
        @formula = get_content 'formula'
        @rubric = get_content 'rubric'
        @variables = get_content 'variables'
        @answers = get_content 'answers'
        @bookmarkers = get_content 'bookmarkers'
        @datasets = get_content 'datasets'
        @companies = get_content 'companies'
        @calculations = get_content 'calculations'
        @answers_url = get_content 'answers_url'

      end
    end
  end
end
