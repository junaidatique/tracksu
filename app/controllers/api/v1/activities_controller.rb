##
# User must be authenticated to use ActivitiesController
#
class Api::V1::ActivitiesController < Api::V1::ApiController
  before_action :authenticate_user!
  before_action :set_activity, only: [:update, :destroy]
  load_and_authorize_resource

##
# Returns a list of activities for current user for current date.
#
# Search is also available if 'search_date' params in provided otherwise current date is used.
#
# GET /api/v1/activities
#
# params:
#   {search_date: '09/11/2016'}
#
# = Example
#
#   resp = conn.get("/api/v1/activities", headers: { Access_Token: "Secret token"}, params: {search_date: '09/11/2016'})
#
#   resp.status
#   => 200
#
#   resp.body
#   => {"activities":[{"id":7,"place":{"id":2,"name":"Fort Road","address":"Fort Road, Rawalpindi, Pakistan","latitude":33.5741022, "longitude":73.0603163,"customer_type":"Customer"},"activity_date":"2016-11-20","start_time":"2016-11-20T11:53:00.000Z", "comment":"this is postman comment","purposes":[{"id":4,"title":"Purpose 1"}],"saleproducts":[{"id":12,"product":{"id":1, "title":"Product 1 1"},"quantity":3,"rate":2.0}]}]}
  def index
    #@activities = current_user.activities
    if search_param['search_date'].present?
      @activities = current_user.activities.where('activity_date = ?', Date.strptime(search_param['search_date'], "%d/%m/%Y"))
      @date = params['search_date']
    else
      @activities = current_user.activities.where('activity_date = ?', Date.today)
      @date = Date.today
    end
    render 'activities'
  end
##
# Creates an activity for current user
#
# Returns a list of activities for current user
#
# POST /api/v1/activities
#
# params:
#   {activity: {comment: 'this is test comment', start_time: '09/11/2016 00:53', place_attributes: [{id: 123, customer_type:”1”}], purpose_ids: [1,2,3], saleproducts_attributes: [{product_id: 4, rate: 10.9, quantity: 5}, {product_id: 5, rate: 4.0, quantity: 3}]}}
#
# = Example
#
#   resp = conn.post("/api/v1/activities/",
#                   headers: { Access_Token: "Secret token"},
#                   params:  {activity: {comment: 'this is test comment', start_time: '09/11/2016 00:53', place_attributes: [{id: 123, customer_type:”1”}], purpose_ids: [1,2,3], saleproducts_attributes: [{product_id: 4, rate: 10.9, quantity: 5}, {product_id: 5, rate: 4.0, quantity: 3}]}}
#
#   resp.status
#   => 200
#
#   resp.body
#   => {"activities":[{"id":7,"place":{"id":2,"name":"Fort Road","address":"Fort Road, Rawalpindi, Pakistan","latitude":33.5741022, "longitude":73.0603163,"customer_type":"Customer"},"activity_date":"2016-11-20","start_time":"2016-11-20T11:53:00.000Z", "comment":"this is postman comment","purposes":[{"id":4,"title":"Purpose 1"}],"saleproducts":[{"id":12,"product":{"id":1, "title":"Product 1 1"},"quantity":3,"rate":2.0}]}]}
  def create
    puts activity_params.inspect
    @activity = current_user.activities.new(activity_params)
    @activity.save
    @activities = current_user.activities.where('activity_date = ?', @activity.activity_date)

    render 'activities'
  end


  private


  def activity_params
    params.require(:activity).permit(:comment, :start_time, place_attributes: [:id, :customer_type], purpose_ids: [], saleproducts_attributes: [:product_id, :rate, :quantity, :_destroy])
  end

  def search_param
    params.permit(:search_date)
  end

  def activity_update_params
    params.require(:activity).permit(:name, :user_id)
  end

  def activities_update_params
    params.require(:activity).permit(activities: [:id, :name, :user_id])
  end
  def activities_destroy_params
    params.require(:activity).permit(activities: [:id])
  end

  def set_activity
    @activity = current_user.activities.find(params[:id])
  end
end