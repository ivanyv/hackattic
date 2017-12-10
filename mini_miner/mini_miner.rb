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
    @api.get API[:problem]
  end
end
