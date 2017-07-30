class ApplicationController < ActionController::API
  before_action :authenticate_user_from_token!

  def authenticate_user_from_token!
    token = request.headers['Authorization']

    if token
      authenticate_with_auth_token token
    else
      authentication_error
    end
  end

  private

  def authenticate_with_auth_token token
    unless token.include?(':')
      authentication_error
      return
    end

    user = User.find_by_email(token.split(':')[0])

    if user && Devise.secure_compare(user.access_token, token.split(':')[1])
      sign_in user, store: false
    else
      authentication_error
    end
  end

  def authentication_error
    render json: "You're not authorized to view this resource!", status: :unauthorized
  end
end
