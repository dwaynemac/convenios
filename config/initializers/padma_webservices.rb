module Accounts
  API_KEY=ENV['accounts_key']
end

module NucleoClient
  HYDRA = Typhoeus::Hydra.new
end