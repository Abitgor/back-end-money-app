# frozen_string_literal: true

class Api::V1::CostsController < Api::V1::BaseController
  before_action :set_cost

  def show
  end

  def index
    @costs = Cost.joins(category: {user_id: current_user.id})
  end

  private

  def set_cost
    @cost ||= Cost.find(params[:id])
  end
end
