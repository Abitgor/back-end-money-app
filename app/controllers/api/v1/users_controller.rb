class Api::V1::UsersController < Api::V1::BaseController
  before_action :set_user
  def show
  end

  def update
    @user.update!(user_params)
  end
  private

  def user_params
    params.permit(:currency)
  end

  def set_user
    @user = current_user
  end
end
