module Accounts
  API_KEY=ENV['accounts_key']
end

module NucleoClient
  HYDRA = Typhoeus::Hydra.new
  HOST  = 'metododerose.org/nucleo_api'
end
NucleoClient::School.force_ssl
NucleoClient::Federation.force_ssl