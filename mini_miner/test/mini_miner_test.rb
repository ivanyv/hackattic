require 'test_helper'
require_relative '../mini_miner'

describe MiniMiner do
  include StubAPI

  before do
    @miner = MiniMiner.new(ENV.fetch('ACCESS_TOKEN'))
    stub_api body: 'mini_miner/problem.json'
  end

  it 'runs' do
    puts @miner.run!
  end
end
