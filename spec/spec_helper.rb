require 'simplecov'
SimpleCov.start

require 'rubygems'
require 'bundler'
Bundler.require :default, :development

require 'secret_hub'
require 'secret_hub/cli'
require_relative 'fake_public_key'
require_relative 'spec_mixin'

include SecretHub
include SpecMixin

ENV['SECRET_HUB_API_BASE'] = 'http://localhost:3000'

# Dummy secrets for testing
ENV['SECRET'] = 'there is no spoon'
ENV['PASSWORD'] = 'there is no spoon'
ENV['SECRET_KEY'] = 'there is no spoon'

system 'mkdir tmp' unless Dir.exist? 'tmp'

RSpec.configure do |c|
  c.fixtures_path = 'spec/approvals'
  c.include SpecMixin
end
