# frozen_string_literal: true

class Api::V1::IncomesController < Api::V1::BaseController
  before_action :set_income, only: %i[show destroy update]
  def create
    @income = current_user.incomes.create!(income_params)
  end

  def destroy
    @income.destroy!
    render :json => {status: 200,message: "Successful delete!" }
  end

  def show
  end

  def update
    @income.update!(income_params)
  end

  def index
    @incomes = current_user.incomes
  end

  private

  def set_income
    @income = current_user.incomes.find(params[:id])
  end

  def income_params
    params.permit(:amount, :source)
  end
end
