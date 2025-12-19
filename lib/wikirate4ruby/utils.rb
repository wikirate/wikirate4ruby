module Wikirate4ruby
  module Utils

    private

    def str_identifier(identifier)
      return nil if identifier.nil?

      # Numeric IDs become "~<id>"
      return "~#{identifier}" if identifier.is_a?(Integer) || identifier.to_s.match?(/\A\d+\z/)

      # Names become URL-safe keys
      transform_to_wr_friendly_name(identifier.to_s)
    end

    def transform_to_wr_friendly_name(name)
      # Replace special chars with spaces, but keep '+' so compound cardnames remain valid
      sanitized = name.gsub(%r{,|\.|/|\(|\)|&|;|@|#|\^|!|=|"|'|%|-}, ' ')
      sanitized = sanitized.squeeze(' ').strip
      sanitized.gsub(' ', '_')
    end

    def construct_endpoint(entity_type:, entity_id: nil)
      prefix = str_identifier(entity_id)
      prefix ? "#{prefix}+#{entity_type}.json" : "#{entity_type}.json"
    end

  end
end
