# frozen_string_literal: true

class Api::V1::CostsController < Api::V1::BaseController
  before_action :set_cost,only: %i[show]

  def show
  end

  def index
    @costs = Cost.joins(:category).where(Category.arel_table[:user_id].eq(current_user.id))
  end

  private

  def set_cost
    @cost ||= Cost.find(params[:id])
  end
end
