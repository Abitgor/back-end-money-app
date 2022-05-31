require 'rails_helper'

RSpec.describe 'Categories requests', type: :request do
  let(:current_user) { create(:user, email: "abitgor@gmail.com", password: "12345679") }
  let!(:auth_header) { get_headers(current_user.email, "12345679") }
  let(:valid_params) {{
    name: "Money"
  }}

  describe 'put #update' do

    it 'response is successful' do
      category = create(:category, name: "Money", user: current_user)
      put "/api/v1/categories/#{category.id}",
          params: valid_params, headers: auth_header, as: :json
      category.reload
      expect(category.name).to eq valid_params[:name]
    end
  end

  describe 'post #create' do

    it 'response is successful' do
      expect(Category.count).to eq 0
      post "/api/v1/categories", params: valid_params, headers: auth_header, as: :json
      expect(Category.count).to eq 1
    end
  end

  describe 'delete #destroy' do
    let!(:category) { create(:category, name: "Money", user: current_user) }

    it 'response is successful' do
      expect(Category.count).to eq 1
      delete "/api/v1/categories/#{category.id}", headers: auth_header, as: :json
      expect(Category.count).to eq 0
    end
  end

  describe 'get #index' do
    let!(:category1) { create(:category, name: "Money", user: current_user) }
    let!(:category2) { create(:category, name: "No Money", user: current_user) }

    it 'response is successful' do

      get "/api/v1/categories", headers: auth_header, as: :json
      expect(json["categories"].size).to eq 2
    end
  end
end