require 'digest'
require_relative '../lib/hackattic/api'

class MiniMiner
  API = {
    problem: 'challenges/mini_miner/problem',
    solve:   'challenges/mini_miner/solve'
  }.freeze

  def initialize(access_token)
    @api = Hackattic::API.new(access_token)
  end

  def run!
    problem = @api.get API[:problem]
    nonce = nonce(problem['block'], problem['difficulty'])
    response = @api.post API[:solve], nonce: nonce
    response['result'] == 'passed'
  end

  private

  def nonce(block, difficulty)
    sorted = Hash[block.sort]
    expected = '0' * difficulty
    nonce = -1
    loop do
      sorted['nonce'] = nonce += 1
      digest = Digest::SHA256.digest(sorted.to_json)
      bits = leading_bits(digest, difficulty)
      return nonce if bits == expected
    end
  end

  def leading_bits(string, count)
    bytes = string.unpack("C#{(count / 8.0).ceil}")
    bytes.map { |byte| format('%08b', byte) }.join[0..count - 1]
  end
end
