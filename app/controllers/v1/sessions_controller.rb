class V1::SessionsController < V1::BaseController
  skip_before_action :authenticate_user_from_token!

  def create
    user = User.find_for_database_authentication(email: params[:email])
    return invalid_login unless user

    if user.valid_password? params[:password]
      sign_in :user, user
      render json: user, status: :ok, root: nil
    else
      invalid_login
    end
  end

  private

  def invalid_login
    warden.custom_failure!
    render json: { error: 'Login attempt failed!'}, status: :unprocessable_entity
  end
end
