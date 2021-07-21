# frozen_string_literal: true

require 'test_helper'

class IpgeobaseTest < Minitest::Test
  include StubHelper

  def setup
    @valid_ip = '8.8.8.8'
    @invalid_ip = 'abcd'
  end

  def test_that_it_has_a_version_number
    refute_nil ::Ipgeobase::VERSION
  end

  def test_success_request
    body = File.read(File.expand_path('./fixtures/success_response.xml', __dir__))
    stub_http_request(@valid_ip, body)

    expected = OpenStruct.new(city: 'Ashburn',
                              country: 'United States',
                              country_code: 'US',
                              lat: '39.03',
                              lon: '-77.5')

    response = Ipgeobase.lookup(@valid_ip)

    assert_equal expected, response
  end

  def test_failed_request
    body = File.read(File.expand_path('./fixtures/failed_response.xml', __dir__))
    stub_http_request(@invalid_ip, body)

    response = Ipgeobase.lookup(@invalid_ip)

    assert_equal Ipgeobase::FAILED_MESSAGE, response
  end
end
