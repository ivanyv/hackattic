class MiniMiner
  API = {
    problem: '/challenges/mini_miner/problem',
    solve: '/challenges/mini_miner/solve'
  }.freeze

  def initialize(access_token)
    @access_token = access_token
  end

  def run!
    puts @access_token
  end
end
