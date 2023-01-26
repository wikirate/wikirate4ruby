require 'Faraday'
require_relative 'entities/card'
require_relative 'entities/metric'
require_relative 'entities/company'
require_relative 'entities/source'
require_relative 'entities/topic'
require_relative 'entities/dataset'
require_relative 'entities/research_group'
require_relative 'entities/answer'
require_relative 'entities/relationship_answer'
require_relative 'entities/region'
require_relative 'entities/checked_by'
require 'json'

module Wikirate4ruby
  module REST
    class Client
      BASE_URL = 'https://wikirate.org'
      attr :api_key, :wikirate_api_url, :auth

      def initialize(api_key, wikirate_api_url = BASE_URL, auth = {})
        @api_key = api_key
        @wikirate_api_url = wikirate_api_url
        @auth = auth
      end

      def get_company(identifier)
        get_entity(identifier, Company)
      end

      def get_metric(identifier)
        get_entity(identifier, Metric)
      end

      def get_answer(identifier)
        get_entity(identifier, Answer)
      end

      def get_relationship_answer(identifier)
        get_entity(identifier, RelationshipAnswer)
      end

      def get_dataset(identifier)
        get_entity(identifier, Dataset)
      end

      def get_company_group(identifier)
        get_entity(identifier, Dataset)
      end

      def get_topic(identifier)
        get_entity(identifier, Topic)
      end

      def get_research_group(identifier)
        get_entity(identifier, ResearchGroup)
      end

      def get_source(identifier)
        get_entity(identifier, Source)
      end

      def get_region(identifier)
        get_entity(identifier, Region)
      end

      def get_card(identifier)
        get_entity(identifier, Card)
      end

      def get_checked_by(identifier)
        get_entity(identifier, CheckedBy)
      end

      def get_project(identifier)
        get_entity(identifier, Card)
      end

      def get_companies(params = {})
        companies = []
        response = get('Companies.json', endpoint_params = %w[limit offset],
                       filters = %w[name company_category company_group country], params)

        response['items'].each do |item|
          companies.append(Company.new(item))
        end
        companies
      end

      def get_metrics(params = {})
        puts params
        metrics = []
        response = get('Metrics.json', endpoint_params = %w[limit offset],
                       filters = %w[name bookmark wikirate_topic designer published metric_type value_type research_policy dataset], params)

        response['items'].each do |item|
          metrics.append(Metric.new(item))
        end
        metrics
      end

      private

      def get_entity(identifier, klass)
        return klass.new(request(:get, "~#{identifier}.json")) unless identifier.is_a? String

        klass.new(request(:get, "#{identifier}.json"))
      end

      # @param [String] endpoint
      # @param [Array] endpoint_params
      # @param [Array] filters
      # @param [Hash] params
      def get(endpoint, endpoint_params = [], filters = [], params = {})
        data = {}
        params.each do |key, value|
          next if value.nil?

          if endpoint_params.include? key
            data[key] = value.to_s
          elsif filters.include? key
            if key == 'value_from' or key == 'value_to'
              data["filter[value][#{key.gsub(".*_", "")}]"] = value.to_s
            else
              data["filter[#{key}]"] = value.to_s
            end
          else
            log.warn("Unexpected parameter #{key}")
          end
        end
        request(:get, endpoint, data)
      end

      # @param [String] method
      # @param [String] endpoint
      # @param [Array] data
      # @param [Hash] _options
      # @return [Hash]
      def request(method, endpoint, data = {}, **_options)
        url = URI.parse("#{wikirate_api_url}/#{endpoint}")

        connection = Faraday.new do |conn|
          unless auth.nil?
            conn.request :authorization, :basic, auth[:username], auth[:password]
          end
          conn.request :json
          conn.response :json
        end

        response = case method
                   when :get
                     connection.get(url, data, headers)
                   when :post
                     connection.post(url, data, headers)
                   when :put
                     connection.put(url, data, headers)
                   when :delete
                     connection.delete(url, data, headers)
                   end

        return response.body unless response.status != 200

        raise(error(response.status, response.body))
      end

      def headers
        {
          'Content-Type' => 'application/json',
          'X-API-KEY' => @api_key
        }
      end

      def error(code, body)
        Wikirate4ruby::Error::HTTP_ERRORS[code].new(JSON.pretty_generate(body))
      end
    end
  end
end
