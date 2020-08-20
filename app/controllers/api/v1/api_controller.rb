##
# This is a base class for all api::v1 controllers
#
class Api::V1::ApiController < ActionController::Base

  # Prevent Unauthenticated accessibility of api.
  before_action :authenticate

  private
  def authenticate
    render :json=> {:message=> 'Unauthorized, Please contact to the vendor.'}, :status=>401 unless request.headers[:HTTP_ACCESS_TOKEN] == ENV['ACCESS_TOKEN']
  end
end