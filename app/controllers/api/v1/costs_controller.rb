# frozen_string_literal: true

class Api::V1::CostsController < Api::V1::BaseController
  before_action :set_cost,only: %i[show destroy update]
  before_action :set_category, only: %i[update create]
  include DateFilterSupportConcern

  def show
  end

  def create
    @cost = @category.costs.create!(cost_params.merge({user_id: current_user.id}))
    CostComment.create!(cost_description: params[:cost_description],cost: @cost) if params[:cost_description].present?
  end

  def update
    @cost.update!(cost_params)
    if params[:category_name].present?
      @cost.update(category: @category)
    end
    if params[:cost_description].present?
      if @cost.cost_comment.present?
          @cost.cost_comment.update(cost_description: params[:cost_description])
        else
         CostComment.create!(cost_description: params[:cost_description],cost: @cost)
      end
    end
  end

  def destroy
    @cost.destroy!
    render :json => {status: 200,message: "Successful delete!" }
  end

  def index
    date_rage_filters = date_filter(params)
    @costs = Cost.joins(:category).where(Category.arel_table[:user_id].eq(current_user.id))
    @costs = @costs.where(created_at: date_rage_filters) if date_rage_filters.present?
    @costs = @costs.order(created_at: :desc)
  end

  private

  def cost_params
    params.permit(:amount)
  end

  def set_category
    @category  = Category.find_or_create_by!(name: params[:category_name], user: current_user)
    render json:{status:404, error:{massage: "Category not found"}} unless @category.present?
  end

  def set_cost
    @cost ||= Cost.find(params[:id])
  end
end
