require_relative '../config/init'
require_relative '../mini_miner/mini_miner'

namespace :mini_miner do
  desc 'Retrieve Mini miner problem set and send back nonce'
  task run: :dotenv do
    MiniMiner.new(ENV.fetch('ACCESS_TOKEN')).run!
  end
end
