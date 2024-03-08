class Api::ApiController < ActionController::API
  include ApiCommonResponses

  wrap_parameters false
  respond_to :json

end
