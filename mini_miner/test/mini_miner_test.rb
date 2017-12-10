require_relative '../../test/test_helper'
require_relative '../mini_miner'

describe MiniMiner do
  include StubAPI

  before do
    @miner = MiniMiner.new(ENV.fetch('ACCESS_TOKEN'))
    stub_api body: 'mini_miner/problem.json'
    stub_api method: :post, body: 'mini_miner/solve_response.json'
  end

  it 'runs!' do
    assert @miner.run!
  end

  describe '#nonce' do
    it 'returns 45 for the sample problem' do
      problem = JSON.parse(load_fixture('mini_miner/problem.json'))
      nonce = @miner.__send__(:nonce, problem['block'], problem['difficulty'])
      assert_equal 45, nonce
    end
  end

  describe '#leading_bits' do
    it 'returns 8 bits' do
      bits = @miner.__send__(:leading_bits, 'A', 8)
      assert_equal '01000001', bits
    end

    it 'returns 13 bits' do
      bits = @miner.__send__(:leading_bits, 'AA', 13)
      assert_equal '0100000101000', bits
    end
  end
end
