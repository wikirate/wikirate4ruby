require_relative '../error'

module Wikirate4ruby
  module Entities
    class RelationshipAnswer < Entities::Answer
      ATTRIBUTES = %i[metric_id inverse_metric_id subject_company subject_company_id object_company object_company_id].freeze
      attr_reader(*ATTRIBUTES)

      def initialize(relationship_answer)
        super relationship_answer
        raise parsing_error name = "IncompatibleCardType", message = "The input Card is not an Relationship Answer but a #{@type}" if @type != 'Relationship Answer'

        @metric_id = get_content 'metric_id'
        @inverse_metric_id = get_content 'inverse_metric_id'
        @subject_company = get_name 'subject_company'
        @subject_company_id = get_content 'subject_company_id'
        @object_company = get_name 'object_company'
        @object_company_id = get_content 'object_company_id'

      end
    end
  end
end
