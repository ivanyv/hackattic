require_relative '../config/init'

require 'minitest/autorun'
require 'webmock/minitest'

require_relative '../lib/hackattic/api'

Dir[File.join(File.expand_path('../support', __FILE__), '**/*.rb')].each(&method(:require))
