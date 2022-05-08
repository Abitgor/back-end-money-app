# frozen_string_literal: true

class Api::V1::CategoriesController < Api::V1::BaseController

  def create
    @category = current_user.categories.create!(categories_params)
  end

  def delete
    @category = Category.find(params[:id])
    @category.destroy
    render :json => {status: 200,message: "Successful delete!" }
  end

  def index
    @categories = current_user.categories
  end

  private

  def categories_params
    params.permit(:name)
  end
end
