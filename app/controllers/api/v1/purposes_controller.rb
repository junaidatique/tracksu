##
# User must be authenticated to use PurposesController
#
class Api::V1::PurposesController < Api::V1::ApiController
  before_action :authenticate_user!
  load_and_authorize_resource

##
# Returns a list of purposes for current user.
#
# GET /api/v1/purposes
#
# params:
#   {}
#
# = Example
#
#   resp = conn.get("/api/v1/purposes", headers: { Access_Token: "Secret token"})
#
#   resp.status
#   => 200
#
#   resp.body
#   => {"purposes":[{"id":4,"title":"Purpose 1"}]}
  def index
    @purposes = @purposes.active
    render 'purposes'
  end

  private



end