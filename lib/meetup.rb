require 'httparty'
require 'hashie'

module Meetup

  class Api
    include HTTParty
    base_uri "api.meetup.com/2"

    attr_accessor :api_key

    def initialize(api_key = ENV['MEETUP_API_KEY'])
      @api_key = api_key
    end

    def find_groups(options = {})
      Hashie::Mash.new(Meetup::Api.get("/groups", query: merged(options)))
    end

    # API docs: http://www.meetup.com/meetup_api/console/?path=/2/cities
    def find_cities(options = {})
      Hashie::Mash.new(Meetup::Api.get("/cities", query: merged(options)))
    end

    def create_event(options = {})
      Hashie::Mash.new( Meetup::Api.post("/events", query: merged(options)) )
    end

    private

    # This merged method will combine your api key with every request, pass it into the get query
    def merged(options)
      {key: api_key}.merge(options)
    end
  end
end
