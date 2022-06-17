class Api::V1::UsersController < Api::V1::BaseController
  before_action :set_user
  def user_details
  end

  def update_profile
    @user.update!(user_params)
  end

  private

  def user_params
    params.permit(:currency, :password)
  end

  def set_user
    @user = current_user
  end
end
