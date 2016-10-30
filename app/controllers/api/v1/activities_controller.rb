##
# User must be authenticated to use ActivitiesController
#
class Api::V1::ActivitiesController < Api::V1::ApiController
  before_action :set_activity, only: [:index, :create, :update, :destroy]
  load_and_authorize_resource

##
# Returns a list of activities for current user
#
# GET /api/v1/activities
#
# params:
#   {}
#
# = Example
#
#   resp = conn.get("/api/v1/activities/", headers: { Access_Token: "Secret token"})
#
#   resp.status
#   => 200
#
#   resp.body
  def index
    @activities = current_user.activities
    render 'activities'
  end
##
# Creates multiple activities for current user
#
# Returns a list of activities for current user
#
# POST /api/v1/activities
#
# params:
#   {activity: { activities:[{name: 'activity1', user_id:1, local_id:'123abc'},{name: 'activity2', user_id:3, local_id:'123abc'}..]}}
#
# = Example
#
#   resp = conn.post("/api/v1/activities/",
#                   headers: { Access_Token: "Secret token"},
#                   params:  {activity: { activities:[{name: 'activity1', local_id:'PORT201604011118336191', user_id:1},
#                            {name: 'activity2', local_id:'PORT201604011118336192', user_id:1}]}})
#
#   resp.status
#   => 200
#
#   resp.body
  def create
    activities_array = []
    activity_params[:activities].each do |key, activities_param|
      activity = Activity.new(activities_param)
      activity.user_id = current_user.id
      activities_array << activity
    end
    activities_response = Activity.import activities_array
    @activities = Activity.where(id: activities_response[:ids])

    render 'activities'
  end
##
# Update a activity
#
# Returns a updated activity
#
# PUT /api/v1/activities/:id
#
# params:
#   {activity: { name: 'activity1', user_id:1}}
#
# = Example
#
#   resp = conn.put("/api/v1/activities/1",
#                   headers: { Access_Token: "Secret token"},
#                   params:  {activity: {name: 'activity112', user_id:1}})
#
#   resp.status
#   => 200
#
#   resp.body

  def update
    @activity.update(activity_update_params)
    render 'activity'
  end

##
# Destroy a activity
#
# Returns a message
#
# DELETE /api/v1/activities/:id
#
# params:
#   {}
#
# = Example
#
#   resp = conn.delete("/api/v1/activities/1",
#                   headers: { Access_Token: "Secret token"})
#
#   resp.status
#   => 200
#
#   resp.body
#   => {"message":"Activity has been destroyed"}
#
  def destroy
    @message = ''
    if @activity.destroy
      @message = 'Activity has been destroyed'
    else
      @message = @activity.errors.full_messages.first
    end
    render 'message'
  end

  private
  def activity_params
    params.require(:activity).permit(activities: [:name, :user_id, :local_id])
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