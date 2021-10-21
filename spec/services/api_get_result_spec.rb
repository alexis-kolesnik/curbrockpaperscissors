require 'rails_helper'

RSpec.describe ApiGetResult do
  describe '#call' do
    let(:success_response) { "{\"body\": \"rock\"}" }
    let(:error_response) { "{\"message\": \"Internal server error\"}" }

    it 'parse JSON with error message' do
      stub_request(:get, "https://private-27c18-curbrockpaperscissors.apiary-proxy.com/rps-stage/throw").
        with(
          headers: {
      	  'Accept'=>'*/*',
      	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      	  'Host'=>'private-27c18-curbrockpaperscissors.apiary-proxy.com',
      	  'User-Agent'=>'Ruby'
          }).
        to_return(status: 200, body: error_response, headers: {})

      expect(described_class.call).to eq(nil)
    end

    it 'parse JSON with fine message' do
      stub_request(:get, "https://private-27c18-curbrockpaperscissors.apiary-proxy.com/rps-stage/throw").
        with(
          headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'Host'=>'private-27c18-curbrockpaperscissors.apiary-proxy.com',
          'User-Agent'=>'Ruby'
          }).
        to_return(status: 200, body: success_response, headers: {})

      expect(described_class.call).to eq('rock')
    end
  end
end
