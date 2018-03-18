require 'rails_helper'

RSpec.describe 'Locations API', type: :request do
  let(:panel_provider) { FactoryBot.create :panel_provider }
  let(:panel_provider_id) { panel_provider.id }

  describe 'GET /locations/:country_code' do
    let(:country) { panel_provider.countries.first }
    let(:country_code) { country.country_code }

    before do
      get "/locations/#{country_code}", nil, 'HTTP_PANEL_PROVIDER' => panel_provider_id
    end

    context 'when panel provider header is not set' do
      let(:panel_provider_id) { nil }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns empty body' do
        expect(response.body).to be_empty
      end
    end

    context 'when panel provider does not exist' do
      let(:panel_provider_id) { 123 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find PanelProvider/)
      end
    end

    context 'when country code does not exist' do
      let(:country_code) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Country/)
      end
    end

    context 'when country code exists' do
      it 'returns locations' do
        expect(json).not_to be_empty
        expect(json.size).to eq(country.locations.count)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end
end
