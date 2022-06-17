# frozen_string_literal: true

class Api::V1::StatisticController < Api::V1::BaseController
  include DateFilterSupportConcern

  def recent_transactions
    transactions = CalculateRecentTransactionService.new(current_user).calculate!
    render json: transactions
  end

  def data_analytics
    data =  CalculateDataAnalyticsService.new(current_user).calculate!
    render json: data
  end
end
