class V1::UsersController < V1::BaseController
  skip_before_action :authenticate_user_from_token!, only: [:create]

  def create
    user = User.new user_params

    if user.save
      render json: user, status: 200, root: nil
    else
      render json: { error: 'Your registration failed, please try again.'}, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :phone_number, :password, :password_confirmation)
  end
end
