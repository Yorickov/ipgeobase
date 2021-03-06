# frozen_string_literal: true

require 'net/http'
require 'addressable/uri'
require 'happymapper'

module Ipgeobase
  class HttpService
    URL = 'http://ip-api.com'
    RESPONSE_FORMAT = 'xml'

    def initialize(ip)
      @ip = ip

      @client = setup_client
      @xml_parser = setup_parser
    end

    def call
      row_response = make_request
      response = parse(row_response)

      success?(response) ? response : false
    end

    private

    attr_reader :client, :xml_parser, :ip

    def prepared_uri
      uri = Addressable::URI.parse(URL)
      uri.path = [RESPONSE_FORMAT, ip].join('/')
      uri
    end

    def make_request
      client.get(prepared_uri)
    end

    def parse(data)
      xml_parser.parse(data)
    end

    def success?(response)
      response.status == 'success'
    end

    def setup_client
      Net::HTTP
    end

    def setup_parser
      HappyMapper
    end
  end
end
