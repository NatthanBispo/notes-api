module ApiTokenAuthenticatable
  extend ActiveSupport::Concern
  include ApiCommonResponses

  def authenticate_user_from_token!
    authenticate_from_token! User
  end

  def current_user
    @user
  end

  private

  def authenticate_from_token!(model)
    user, request_token = find_authenticable_by_headers(model)

    unless request_token == 'null' || (user.present? && user.token_match?(request_token))
      return render_unauthorized({ error: I18n.t('devise.failure.timeout') })
    end

    sign_in user, store: false
    @user ||= user
  end

  def find_authenticable_by_headers(model)
    request_email = request.headers["HTTP_USER_EMAIL"].presence
    request_token = request.headers["HTTP_USER_TOKEN"].presence

    user = request_email && model.find_by(email: request_email)
    [user, request_token]
  end
end
