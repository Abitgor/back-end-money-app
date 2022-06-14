require 'rails_helper'

RSpec.describe 'Category costs requests', type: :request do
  let(:current_user) { create(:user, email: "abitgor@gmail.com", password: "12345679") }
  let!(:auth_header) { get_headers(current_user.email, "12345679") }
  let(:valid_params) {{
    amount: 111.111,
    currency: "USD",
    cost_description: "asdasdasdasd"
  }}
  let!(:category) { create(:category, user: current_user, name: "Money") }

  describe 'put #update' do

    it 'response is successful' do
      cost = create(:cost, amount: 0, currency: "USD", user: current_user,category: category)
      put "/api/v1/categories/#{category.id}/costs/#{cost.id}",
          params: valid_params, headers: auth_header, as: :json
      cost.reload
      expect(cost.amount).to eq valid_params[:amount]
    end
  end

  describe 'post #create' do

    it 'response is successful' do
      expect(Cost.count).to eq 0
      post "/api/v1/categories/#{category.id}/costs", params: valid_params, headers: auth_header, as: :json
      expect(Cost.count).to eq 1
    end
  end

  describe 'delete #destroy' do
    let!(:cost) { create(:cost, amount: 0, currency: "USD", user: current_user,category: category) }

    it 'response is successful' do
      expect(Cost.count).to eq 1
      delete "/api/v1/categories/#{category.id}/costs/#{cost.id}", headers: auth_header, as: :json
      expect(Cost.count).to eq 0
    end
  end

  describe 'get #index' do
    let!(:costs) { create_list(:cost, 2, amount: 0, currency: "USD", user: current_user,category: category) }

    it 'response is successful' do

      get "/api/v1/categories/#{category.id}/costs", headers: auth_header, as: :json
      expect(json["costs"].size).to eq 2
    end
  end
end