# frozen_string_literal: true

require_relative 'test_helper'
require 'wikirate4ruby/client'

class TestWikirate4ruby < Minitest::Test

  include Wikirate4ruby::REST
  include Wikirate4ruby::Entities

  def initialize(name)
    super
    @client = Client.new(ENV["API_KEY"])
  end

  def test_that_it_has_a_version_number
    refute_nil ::Wikirate4ruby::VERSION
  end

  def test_get_company
    assert @client.get_company(7217).is_a? Company
  end

  def test_get_metric
    assert @client.get_metric(826_615).is_a? Metric
  end

  def test_get_answer
    assert @client.get_answer(13_727_963).is_a? Answer
  end

  def test_get_relationship_answer
    assert @client.get_relationship_answer(14_478_531).is_a? Answer
  end

  def test_get_topic
    assert @client.get_topic("Environment").is_a? Topic
  end

  def test_get_source
    assert @client.get_source("Source_000100642").is_a? Source
  end

  def test_get_company_group
    assert @client.get_company_group(5_671_631).is_a? CompanyGroup
  end

  def test_get_research_group
    assert @client.get_research_group(3_478_301).is_a? ResearchGroup
  end

  def test_get_project
    assert @client.get_project(14_495_617).is_a? Card
  end

  def test_get_dataset
    assert @client.get_dataset(8_543_400).is_a? Dataset
  end

  def test_get_companies
    companies = @client.get_companies
    assert companies.length == 20
    assert companies[0].is_a? Company
  end

  def test_get_metrics
    metrics = @client.get_metrics
    assert metrics.length == 20
    assert metrics[0].is_a? Metric
  end

  def test_get_answers
    answers = @client.get_answers("Direct_greenhouse_gas_GHG_emissions_Scope_1_GRI_305_1_a_formerly_G4_EN15_a", "Global_Reporting_Initiative")
    assert answers.length == 20
    assert answers[0].is_a? Answer
  end

  def test_get_relationship_answers
    answers = @client.get_relationship_answers("Supplied_by", "Commons")
    assert answers.length == 20
    assert answers[0].is_a? RelationshipAnswer
  end

  def test_get_topics
    topics = @client.get_topics
    assert topics.length == 20
    assert topics[0].is_a? Topic
  end

  def test_get_sources
    sources = @client.get_sources
    assert sources.length == 20
    assert sources[0].is_a? Source
  end

  def test_get_company_groups
    company_groups = @client.get_company_groups
    assert company_groups.length == 20
    assert company_groups[0].is_a? CompanyGroup
  end

  def test_get_research_groups
    research_groups = @client.get_research_groups
    assert research_groups.length == 20
    assert research_groups[0].is_a? ResearchGroup
  end

  def test_get_projects
    projects = @client.get_projects
    assert projects.length == 20
    assert projects[0].is_a? Card
  end

  def test_get_datasets
    datasets = @client.get_datasets
    assert datasets.length == 20
    assert datasets[0].is_a? Dataset
  end
end
