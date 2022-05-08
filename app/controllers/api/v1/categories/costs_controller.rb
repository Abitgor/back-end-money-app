# frozen_string_literal: true

class Api::V1::Categories::CostsController < Api::V1::BaseController
  before_action :set_category
  def create
    @cost = @category.costs.create!(cost_params.merge({user_id: current_user.id}))
  end

  def destroy
    @cost = Cost.find(params[:id])
    @cost.destroy!
    render :json => {status: 200,message: "Successful delete!" }
  end

  def index
    @costs = @category.costs
  end

  private

  def cost_params
    params.permit(:amount, :currency)
  end

  def set_category
    @category  = Category.find(params[:category_id])
  end
end
