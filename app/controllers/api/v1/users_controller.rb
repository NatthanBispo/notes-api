class Api::V1::UsersController < Api::ApiController
  def create
    user = User.new(user_params)

    if user.save
      sign_in user, store: false
      respond_with user, location: '', scope: user.refresh_token
    else
      render_unprocessable_entity(user.errors.full_messages)
    end
  end

  private

  def user_params
    params.permit(:email, :password)
  end

end
