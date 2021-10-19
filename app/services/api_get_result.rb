class ApiGetResult < ApplicationService
  attr_reader :response

  def initialize
    @response = nil
  end

  def call
    api_response = Net::HTTP.get URI('https://private-27c18-curbrockpaperscissors.apiary-proxy.com/rps-stage/throw')

    response = JSON.parse(api_response).fetch('body', nil)
  end
end
