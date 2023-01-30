module Wikirate4ruby
  module RequestUtils

    private

    def creation_params(entity, optional_params = {}, allowed_params = [])
      params = {
        'card[type]' => entity,
        'format' => 'json',
        'success[format]' => 'json'
      }

      optional_params.each do |key, value|
        next if value.nil?

        if allowed_params.include? key
          params["card[subcards][+#{key}]"] = (%w[company subject_company object_company].include? key) ? str_identifier(value) : value.to_s
        else
          @logger.warn("Unexpected parameter: #{key}")
        end
      end
      params
    end

    def error(code, body)
      Wikirate4ruby::Error::HTTP_ERRORS[code].new(JSON.pretty_generate(body))
    end

    def headers(api_key)
      {
        'Content-Type' => 'application/json',
        'X-API-KEY' => api_key
      }
    end
  end
end
