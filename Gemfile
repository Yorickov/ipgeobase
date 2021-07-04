# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gemspec

gem 'addressable'
gem 'nokogiri-happymapper', require: 'happymapper'
gem 'rake', '~> 13.0'

group :development do
  gem 'pry', '~> 0.13.1'
  gem 'rubocop', '~> 1.7'
  gem 'rubocop-minitest'
  gem 'rubocop-performance', require: false
  gem 'solargraph'
end

group :test do
  gem 'minitest', '~> 5.0'
  gem 'webmock'
end
