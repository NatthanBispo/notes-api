class UserSerializer < ActiveModel::Serializer
  attributes :email, :token

  def token
    scope[:token] if scope.present?
  end
end
