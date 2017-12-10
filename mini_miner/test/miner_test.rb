require_relative '../../test/test_helper'
require_relative '../miner'

describe MiniMiner do
  it 'runs' do
    MiniMiner.new(ENV.fetch('ACCESS_TOKEN')).run!
  end
end
