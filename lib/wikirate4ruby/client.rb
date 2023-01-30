require 'faraday'
require_relative 'entities/card'
require_relative 'entities/metric'
require_relative 'entities/company'
require_relative 'entities/source'
require_relative 'entities/topic'
require_relative 'entities/dataset'
require_relative 'entities/research_group'
require_relative 'entities/company_group'
require_relative 'entities/answer'
require_relative 'entities/relationship_answer'
require_relative 'entities/region'
require_relative 'entities/checked_by'
require 'json'
require 'logger'

module Wikirate4ruby
  module REST
    class Client
      include Wikirate4ruby::Entities
      BASE_URL = 'https://wikirate.org'
      attr :api_key, :wikirate_api_url, :auth

      def initialize(api_key, wikirate_api_url = BASE_URL, auth = {})
        @api_key = api_key
        @wikirate_api_url = wikirate_api_url
        @auth = auth
        @logger = Logger.new(STDOUT)
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
        get_entity(identifier, CompanyGroup)
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
        response = get('/Companies.json', endpoint_params = %w[limit offset],
                       filters = %w[name company_category company_group country], params)

        response['items'].each do |item|
          companies.append(Company.new(item))
        end
        companies
      end

      def get_metrics(params = {})
        metrics = []
        response = get('/Metrics.json', endpoint_params = %w[limit offset],
                       filters = %w[name bookmark wikirate_topic designer published metric_type value_type research_policy dataset], params)

        response['items'].each do |item|
          metrics.append(Metric.new(item))
        end
        metrics
      end

      def get_topics(params = {})
        topics = []
        response = get('/Topics.json', endpoint_params = %w[limit offset],
                       filters = %w[name bookmark], params)

        response['items'].each do |item|
          topics.append(Topic.new(item))
        end
        topics
      end

      def get_datasets(params = {})
        datasets = []
        response = get('/Data_Sets.json', endpoint_params = %w[limit offset],
                       filters = %w[name bookmark wikirate_topic], params)

        response['items'].each do |item|
          datasets.append(Dataset.new(item))
        end
        datasets
      end

      def get_projects(params = {})
        projects = []
        response = get('/Projects.json', endpoint_params = %w[limit offset],
                       filters = %w[name wikirate_status], params)

        response['items'].each do |item|
          projects.append(Card.new(item))
        end
        projects
      end

      def get_sources(params = {})
        sources = []
        response = get('/Sources.json', endpoint_params = %w[limit offset],
                       filters = %w[name wikirate_title wikirate_topic report_type year wikirate_link company_name], params)

        response['items'].each do |item|
          sources.append(Source.new(item))
        end
        sources
      end

      def get_research_groups(params = {})
        research_groups = []
        response = get('/Research_Groups.json', endpoint_params = %w[limit offset],
                       filters = %w[name], params)

        response['items'].each do |item|
          research_groups.append(ResearchGroup.new(item))
        end
        research_groups
      end

      def get_company_groups(params = {})
        company_groups = []
        response = get('/Company_Groups.json', endpoint_params = %w[limit offset],
                       filters = %w[name], params)

        response['items'].each do |item|
          company_groups.append(CompanyGroup.new(item))
        end
        company_groups
      end

      def get_answers(metric_name, metric_designer, params = {})
        answers = []
        response = get("/#{tranform_to_wr_friendly_name(metric_designer)}+#{tranform_to_wr_friendly_name(metric_name)}+Answers.json",
                       endpoint_params = %w[limit offset],
                       filters = %w[year verification value value_from value_to status source updated updater published
                                    dataset company_id company_name company_category company_group country], params)

        response['items'].each do |item|
          answers.append(Answer.new(item))
        end
        answers
      end

      def get_answers_by_metric_id(metric_id, params = {})
        answers = []
        response = get("/#{str_identifier(metric_id)}+Answers.json", endpoint_params = %w[limit offset],
                       filters = %w[year verification value value_from value_to status source updated updater published
                                    dataset company_id company_name company_category company_group country], params)

        response['items'].each do |item|
          answers.append(Answer.new(item))
        end
        answers
      end

      def get_company_answers(identifier, params = {})
        answers = []
        endpoint = "/#{str_identifier(identifier)}+Answers.json"
        response = get(endpoint, endpoint_params = %w[limit offset],
                       filters = %w[metric_name designer metric_type value_type research_policy year verification value
                                    value_from value_to status source updated updater published dataset company_id
                                    company_name company_category company_group country], params)

        response['items'].each do |item|
          answers.append(Answer.new(item))
        end
        answers
      end

      def get_relationship_answers(metric_name, metric_designer, params = {})
        answers = []
        response = get("/#{tranform_to_wr_friendly_name(metric_designer)}+#{tranform_to_wr_friendly_name(metric_name)}+RelationshipAnswers.json",
                       endpoint_params = %w[limit offset],
                       filters = %w[year name company_category company_group dataset updated updater source published], params)

        response['items'].each do |item|
          answers.append(RelationshipAnswer.new(item))
        end
        answers
      end

      def get_relationship_answers_by_metric_id(metric_id, params = {})
        answers = []
        response = get("/#{str_identifier(metric_id)}+RelationshipAnswers.json", endpoint_params = %w[limit offset],
                       filters = %w[year name company_category company_group dataset updated updater source published], params)

        response['items'].each do |item|
          answers.append(RelationshipAnswer.new(item))
        end
        answers
      end

      # @param [Hash] data
      # @return [Wikirate4ruby::Entities::Company]
      def add_company(data = {})
        required_params = %w[name headquarters]
        required_params.each do |param|
          if data[param].nil? || data[param] == ''
            raise Wikirate4ruby::Error::Wikirate4rubyError, "Invalid set of params! You need to define all the following
                                                             params to import a new company: #{required_params.to_s}"
          end
        end
        card_name = data['name']
        data.delete('name')
        params = creation_params('Company', data, %w[headquarters oar_id wikipedia open_corporates sec_cik])
        params['card[name]'] = card_name
        params['confirmed'] = true
        params['card[skip]'] = 'update_oc_mapping_due_to_headquarters_entry' if optional_params['open_corporates'].nil?
        response = post('/card/create', params)
        Company.new(response)
      end

      def update_company(data = {})
        if data['company'].nil? || data['company'] == ''
          raise Wikirate4ruby::Error::Wikirate4rubyError, "Invalid set of params! You need to define all the following params to update a
                                      company: [company]"
        end
        card_name = str_identifier(data['company'])
        data.delete 'company'

        params = creation_params('Company', data, %w[headquarters open_corporates oar_id wikipedia sec_cik])
        params['card[name]'] = card_name
        response = post('/card/update', params)
        Company.new(response)
      end

      def add_research_metric_answer(data = {})
        required_params = %w[metric_designer metric_name company year value source]
        required_params.each do |param|
          if data[param].nil? || data[param] == ''
            raise Wikirate4ruby::Error::Wikirate4rubyError, "Invalid set of params! You need to define all the following params to import a
                                      new research answer: #{required_params.to_s}"
          end
        end
        card_name = "#{data['metric_designer']}+#{data['metric_name']}+#{str_identifier(data['company'])}+#{data['year']}"
        %w[metric_designer metric_name company year].each do |key|
          data.delete key
        end
        params = creation_params('Answer', data, %w[source value discussion])
        params['card[name]'] = card_name
        response = post('/card/create', params)
        Answer.new(response)
      end

      def update_research_metric_answer(data = {})
        required_params = %w[metric_designer metric_name company]
        if data['answer_id'].nil?
          required_params.each do |param|
            if data[param].nil? || data[param] == ''
              raise Wikirate4ruby::Error::Wikirate4rubyError, "Invalid set of params! You need to define all the following params to import a
                                      new research answer: #{required_params.to_s}"
            end
          end
          card_name = "#{data['metric_designer']}+#{data['metric_name']}+#{str_identifier(data['company'])}+#{data['year']}"
          %w[metric_designer metric_name company year].each do |key|
            data.delete key
          end
          allowed_params = %w[source value discussion]
        else
          card_name = str_identifier(data['answer_id'])
          data.delete 'answer_id'
          allowed_params = %w[year source value discussion]
        end

        params = creation_params('Answer', data, allowed_params)
        params['card[name]'] = card_name
        puts(params)
        response = post('/card/update', params)
        Answer.new(response)
      end

      def add_relationship_metric_answer(data = {})
        required_params = %w[metric_designer metric_name subject_company object_company year value source]
        required_params.each do |param|
          if data[param].nil? || data[param] == ''
            raise Wikirate4ruby::Error::Wikirate4rubyError, "Invalid set of params! You need to define all the following params to import a
                                      new research answer: #{required_params.to_s}"
          end
        end
        card_name = "#{data['metric_designer']}+#{data['metric_name']}+#{str_identifier(data['subject_company'])}+#{data['year']}+#{str_identifier(data['object_company'])}"
        %w[metric_designer metric_name subject_company object_company year].each do |key|
          data.delete key
        end
        params = creation_params('RelationshipAnswer', data, %w[source value comments])
        params['card[name]'] = card_name
        response = post('/card/create', params)
        RelationshipAnswer.new(response)
      end

      def update_relationship_metric_answer(data = {})
        required_params = %w[metric_designer metric_name subject_company object_company year]
        if data['answer_id'].nil?
          required_params.each do |param|
            if data[param].nil? || data[param] == ''
              raise Wikirate4ruby::Error::Wikirate4rubyError, "Invalid set of params! You need to define all the following params to import a
                                      new research answer: #{required_params.to_s}"
            end
          end
          card_name = "#{data['metric_designer']}+#{data['metric_name']}+#{str_identifier(data['company'])}+#{data['year']}"
          %w[metric_designer metric_name subject_company year object_company].each do |key|
            data.delete key
          end
          allowed_params = %w[source value discussion]
        else
          card_name = str_identifier(data['answer_id'])
          data.delete 'answer_id'
          allowed_params = %w[year source value discussion]
        end

        params = creation_params('RelationshipAnswer', data, allowed_params)
        response = post("/update/#{card_name}", params)
        RelationshipAnswer.new(response)
      end

      # @param [Hash] data
      # @return [Wikirate4ruby::Entities::Source]
      def add_source(data = {})
        required_params = %w[link title]
        required_params.each do |param|
          if data[param].nil? || data[param] == ''
            raise Wikirate4ruby::Error::Wikirate4rubyError, "Invalid set of params! You need to define all the following params to import a
                                      new source: #{required_params.to_s}"
          end
        end
        params = creation_params('Source', data, %w[link title company report_type year])
        params['card[skip]'] = 'requirements'
        response = post('/card/create', params)
        Source.new(response)
      end

      def update_source(data = {})
        if data['source'].nil? || data['source'] == ''
          raise Wikirate4ruby::Error::Wikirate4rubyError, "Invalid set of params! You need to define all the following params to update a
                                      source: [source]"
        end
        card_name = str_identifier(data['source'])
        data.delete 'source'
        params = creation_params('Source', data, %w[link title company report_type year])
        params['card[skip]'] = 'requirements'
        response = post("/update/#{card_name}", params)
        Source.new(response)
      end

      private

      def get_entity(identifier, klass)
        klass.new(request(:get, "/#{str_identifier(identifier)}.json"))
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
            if %w[value_from value_to].include?(key)
              data["filter[value][#{key.gsub(/.*_/, '')}]"] = value.to_s
            else
              data["filter[#{key}]"] = value.to_s
            end
          else
            @logger.warn("Unexpected parameter #{key}")
          end
        end
        request(:get, endpoint, data)
      end

      def post(endpoint, data = {})
        request(:post, endpoint, data)
      end

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

      # @param [String] method
      # @param [String] endpoint
      # @param [Array] data
      # @param [Hash] _options
      # @return [Hash]
      def request(method, endpoint, data = {}, **_options)
        url = URI.parse("#{wikirate_api_url}#{endpoint}")

        connection = Faraday.new do |conn|
          conn.request :authorization, :basic, auth[:username], auth[:password] unless auth.nil?
          conn.request :url_encoded
          conn.request :json
          conn.response :json
        end

        response = case method
                   when :get
                     connection.get(url, data, headers)
                   when :post
                     connection.post(url) do |req|
                       req.params = data
                       req.headers = headers
                     end
                   when :put
                     connection.put(url, data, headers)
                   when :delete
                     connection.delete(url, data, headers)
                   end

        #follow redirect
        if response.status == 303
          endpoint = response.headers['location']
          endpoint[wikirate_api_url] = ''
          return get(endpoint)
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
end