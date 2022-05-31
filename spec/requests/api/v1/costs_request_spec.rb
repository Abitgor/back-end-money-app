require 'rails_helper'

RSpec.describe 'Cost requests', type: :request do
  let(:current_user) { create(:user, email: "abitgor@gmail.com", password: "12345679") }
  let!(:auth_header) { get_headers(current_user.email, "12345679") }
  let!(:category) { create(:category, user: current_user, name: "Money") }

  describe 'put #update' do

    it 'response is successful' do
      cost = create(:cost, amount: 0, currency: "USD", user: current_user,category: category)
      get "/api/v1/costs/#{cost.id}", headers: auth_header, as: :json
      expect(json["cost"]["amount"]).to eq 0
    end
  end
  describe 'get #index' do
    let!(:costs) { create_list(:cost, 2, amount: 0, currency: "USD", user: current_user,category: category) }

    it 'response is successful' do

      get "/api/v1/costs", headers: auth_header, as: :json
      expect(json["costs"].size).to eq 2
    end
  end
end