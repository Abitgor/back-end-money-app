# frozen_string_literal: true

class Api::V1::CategoriesController < Api::V1::BaseController
  before_action :set_category, only: %i[destroy update]

  def create
    @category = current_user.categories.create!(categories_params)
  end

  def destroy
    @category.destroy!
    render :json => {status: 200,message: "Successful delete!" }
  end

  def index
    @categories = current_user.categories
  end

  def update
    @category.update!(categories_params)
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def categories_params
    params.permit(:name)
  end
end
