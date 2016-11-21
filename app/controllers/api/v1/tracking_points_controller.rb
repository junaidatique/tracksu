##
# User must be authenticated to use TrackingPointsController
#
class Api::V1::TrackingPointsController < Api::V1::ApiController
  before_action :authenticate_user!
  load_and_authorize_resource

##
# Returns a list of tracking points for current user or a given date
#
# GET /api/v1/tracking_points
#
# params:
#   {search_date: '09/11/2016'}
#
# = Example
#
#   resp = conn.get("/api/v1/tracking_points", headers: { Access_Token: "Secret token"}, params: {search_date: '09/11/2016'})
#
#   resp.status
#   => 200
#
#   resp.body
#   => {"tracking_points":[{"id":1,"latitude":"31.4689618","longitude":"74.2983535"},{"id":2,"latitude":"31.4689618","longitude":"74.2983535"}]}
  def index
    if search_param['search_date'].present?
      @tracking_points = current_user.tracking_points.where('DATE(created_at) = ?', Date.strptime(search_param['search_date'], "%d/%m/%Y"))
    else
      @tracking_points = current_user.tracking_points.where('DATE(created_at) = ?', Date.today)
    end

    render 'tracking_points'
  end
##
# Creates a tracking point for current user
#
# Returns a list of tracking points for current user for current day
#
# POST /api/v1/tracking_points
#
# params:
#
#
# = Example
#
#   resp = conn.post("/api/v1/tracking_points/",
#                   headers: { Access_Token: "Secret token"},
#                   params:  {tracking_point: {latitude: 33.123, longitude: 74.987}}
#
#   resp.status
#   => 200
#
#   resp.body
#   => {"tracking_points":[{"id":1,"latitude":"31.4689618","longitude":"74.2983535"},{"id":2,"latitude":"31.4689618","longitude":"74.2983535"}]}
  def create

    @tracking_point = current_user.tracking_points.new tracking_point_params
    @tracking_point.save
    @tracking_points = current_user.tracking_points.where('DATE(created_at) = ?', Date.today)
    render 'tracking_points'
  end

  private


  def tracking_point_params
    params.require(:tracking_point).permit(:latitude, :longitude)
  end


end