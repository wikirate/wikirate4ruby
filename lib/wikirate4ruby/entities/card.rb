module Wikirate4ruby
  module Entities
    class Card
      CARD_ATTRIBUTES = %i[id type name content url codename html_url created_at updated_at requested_at].freeze
      attr_reader(*CARD_ATTRIBUTES)

      def initialize(card)
        @data = card
        @id = get_content 'id'
        @type = @data['type'].is_a?(String) ? @data['type'] : @data['type']['name']
        @name = @data['name']
        @content = @data['content']
        @url = @data['url']
        @codename = @data['codename']
        @html_url = @data['html_url']
        @created_at = @data['created_at']
        @updated_at = @data['updated_at']
        @requested_at = @data['requested_at']
      end

      def raw_json
        JSON.pretty_generate(@data)
      end

      # @return [Hash{String->Unknown}]
      def as_json
        {
          'id' => @id,
          'type' => @type,
          'name' => @name,
          'content' => @content,
          'url' => @url,
          'codename' => @codename,
          'html_url' => @html_url,
          'created_at' => @created_at,
          'updated_at' => @updated_at,
          'requested_at' => @requested_at
        }
      end

      def to_json(*_args)
        JSON.pretty_generate(to_hash)
      end

      def to_s
        to_json
      end

      protected

      def to_hash
        hash = {}
        instance_variables.each { |var| var.to_s == '@data' || instance_variable_get(var).nil? ? nil : hash[var.to_s.delete('@')] = instance_variable_get(var) }
        hash
      end

      def get_content(field)
        @data[field].is_a?(Hash) ? @data[field]['content'] : @data[field]
      end

      def get_name(field)
        @data[field].is_a?(Hash) ? @data[field]['name'] : @data[field]
      end

      def get_array_of(field, klass)
        return @data[field] unless @data[field].is_a? Array

        list = []
        @data[field].each do |item|
          list.append(klass.new(item))
        end
        list
      end

      def parsing_error(name, message)
        error = Wikirate4ruby::Error::ParsingError.from_processing_response({ :name => name, :message => message })
        return error
      end
    end
  end
end
