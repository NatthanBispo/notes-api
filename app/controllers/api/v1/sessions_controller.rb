class Api::V1::SessionsController < Api::ApiController
  def create
    user = User.find_for_database_authentication(email: params[:email])

    if user.nil? || !user.valid_password?(params[:password])
      return render_unprocessable_entity(I18n.t('devise.failure.invalid_params'))
    end

    sign_in user, store: false
    token = user.refresh_token

    respond_with user, location: '', scope: token
  end

  private

  def session_params
    params.permit(:email, :password)
  end
end
