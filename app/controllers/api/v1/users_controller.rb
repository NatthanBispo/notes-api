class Api::V1::UsersController < Api::ApiController
  before_action :authenticate_user_from_token!, only: [:destroy]

  def create
    user = User.new(user_params)

    if user.save
      sign_in user, store: false
      respond_with user, location: '', scope: user.refresh_token
    else
      render_unprocessable_entity(user.errors.full_messages)
    end
  end

  def destroy
    return render_success(current_user) if current_user.destroy

    render_unprocessable_entity(current_user.errors.full_messages)
  end

  private

  def user_params
    params.permit(:email, :password)
  end
end
