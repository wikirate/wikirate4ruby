module Wikirate4ruby
  module Utils

    private

    def str_identifier(identifier)
      (identifier.is_a? String) ? "#{tranform_to_wr_friendly_name(identifier)}" : "~#{identifier}"
    end

    def tranform_to_wr_friendly_name(name)
      name = name.gsub(%r{,|\.|/|\(|\)|&|;|@|#|\^|!|=|"|'|%|-}, ' ').squeeze(' ')
      name.strip!
      name.gsub(/ /, '_')
    end
  end
end
