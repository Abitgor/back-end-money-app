# frozen_string_literal: true

class Api::V1::Categories::CostsController < Api::V1::BaseController
  before_action :set_category
  before_action :set_cost, only: %i[destroy update]
  include DateFilterSupportConcern

  def create
    @cost = @category.costs.create!(cost_params.merge({user_id: current_user.id}))
    @cost.cost_comment.create!(cost_description: params[:cost_description]) if params[:cost_description].present?
  end

  def update
    @cost.update!(cost_params)
  end

  def destroy
    @cost.destroy!
    render :json => {status: 200,message: "Successful delete!" }
  end

  def index
    date_rage_filters = date_filter(params)
    @costs = @category.costs
    @costs = @costs.where(created_at: date_rage_filters) if date_rage_filters.present?
  end

  private
  def set_cost
    @cost = @category.costs.find(params[:id])
  end

  def cost_params
    params.permit(:amount, :currency)
  end

  def set_category
    @category  = Category.find(params[:category_id])
  end
end
