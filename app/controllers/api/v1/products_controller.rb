##
# User must be authenticated to use ProductsController
#
class Api::V1::ProductsController < Api::V1::ApiController
  before_action :authenticate_user!
  load_and_authorize_resource

##
# Returns a list of products for current user.
#
# GET /api/v1/products
#
# params:
#   {}
#
# = Example
#
#   resp = conn.get("/api/v1/products", headers: { Access_Token: "Secret token"})
#
#   resp.status
#   => 200
#
#   resp.body
#  => {"products":[{"id":1,"title":"Product 1 1"},{"id":2,"title":"Product 2"}]}
  def index
    @products = @products.active
    render 'products'
  end

  private



end