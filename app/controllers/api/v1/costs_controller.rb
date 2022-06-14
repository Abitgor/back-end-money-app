# frozen_string_literal: true

class Api::V1::CostsController < Api::V1::BaseController
  before_action :set_cost,only: %i[show]
  include DateFilterSupportConcern

  def show
  end

  def index
    date_rage_filters = date_filter(params)
    @costs = Cost.joins(:category).where(Category.arel_table[:user_id].eq(current_user.id))
    @costs = @costs.where(created_at: date_rage_filters) if date_rage_filters.present?
  end

  private

  def set_cost
    @cost ||= Cost.find(params[:id])
  end
end
