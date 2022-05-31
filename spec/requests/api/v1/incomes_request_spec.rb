require 'rails_helper'

RSpec.describe 'Incomes requests', type: :request do
  let(:current_user) { create(:user, email: "abitgor@gmail.com", password: "12345679") }
  let!(:auth_header) { get_headers(current_user.email, "12345679") }
  let(:valid_params) {{
    amount: 111.111,
    source: "Job"
  }}

  describe 'put #update' do

    it 'response is successful' do
      income = create(:income, amount: 0, source: "Job", user: current_user)
      put "/api/v1/incomes/#{income.id}",
          params: valid_params, headers: auth_header, as: :json
      income.reload
      expect(income.amount).to eq valid_params[:amount]
    end
  end

  describe 'post #create' do

    it 'response is successful' do
      expect(Income.count).to eq 0
      post "/api/v1/incomes", params: valid_params, headers: auth_header, as: :json
      expect(Income.count).to eq 1
    end
  end

  describe 'delete #destroy' do
    let!(:income) { create(:income, amount: 0, source: "Job", user: current_user) }

    it 'response is successful' do
      expect(Income.count).to eq 1
      delete "/api/v1/incomes/#{income.id}", headers: auth_header, as: :json
      expect(Income.count).to eq 0
    end
  end

  describe 'get #index' do
    let!(:incomes) { create_list(:income, 2, amount: 0, source: "Job", user: current_user) }

    it 'response is successful' do

      get "/api/v1/incomes", headers: auth_header, as: :json
      expect(json["incomes"].size).to eq 2
    end
  end
end