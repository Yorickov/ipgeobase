# frozen_string_literal: true

require 'net/http'
require 'addressable/uri'
require 'happymapper'

module Ipgeobase
  class HttpService
    def initialize(ip)
      @client = Net::HTTP
      @xml_parser = HappyMapper
      @ip = ip
    end

    def call
      row_response = request
      response = xml_parser.parse(row_response)
      success?(response) ? response : false
    end

    private

    attr_reader :client, :xml_parser, :ip

    def prepared_uri
      uri = Addressable::URI.parse(URL)
      uri.path = [RESPONSE_FORMAT, ip].join('/')
      uri
    end

    def request
      client.get(prepared_uri)
    end

    def success?(response)
      response.status == 'success'
    end
  end
end
