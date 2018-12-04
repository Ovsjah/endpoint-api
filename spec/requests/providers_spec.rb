require 'rails_helper'

RSpec.describe 'Providers API', type: :request do
  let!(:provider) { create(:provider) }
  let(:id) { provider.id }

  # Test suite for POST /create
  describe 'POST /create' do
    # valid payload
    let(:valid_attributes) { { email: 'devil@hell.mail', first_name: 'Luci', last_name: 'Devil', amount: 666 } }

    context 'when the request is valid' do
      before { post '/create', params: valid_attributes }

      it 'creates a provider' do
        expect(json['email']).to eq(valid_attributes[:email])
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/create', params: { last_name: 'Shcweinefresser' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body).to match(/Validation failed: Email can't be blank/)
      end
    end
  end
end
