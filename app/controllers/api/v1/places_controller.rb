##
# User must be authenticated to use PlacesController
#
class Api::V1::PlacesController < Api::V1::ApiController
  before_action :authenticate_user!
  load_and_authorize_resource

##
# Returns a list of places for current user.
#
# GET /api/v1/places
#
# params:
#   {}
#
# = Example
#
#   resp = conn.get("/api/v1/places", headers: { Access_Token: "Secret token"})
#
#   resp.status
#   => 200
#
#   resp.body
#   => {"places":[{"id":2,"name":"Fort Road","address":"Fort Road, Rawalpindi, Pakistan","latitude":33.5741022,"longitude":73 .0603163,"customer_type":"Customer"}]}
  def index
    render 'places'
  end
##
# Creates a place for current user
#
# Returns a list of places for current user
#
# POST /api/v1/places
#
# params:
#  {place: {places [{name: 'Place Name', address: 'Place Address', latitude: 33.123, longitude: 74.987, local_id: "PORT201604011118336191"},{name: 'Place Name', address: 'Place Address', latitude: 33.123, longitude: 74.987, local_id: "PORT201604011118336191"}]}} 
#
#
# = Example
#
#   resp = conn.post("/api/v1/places/",
#                   headers: { Access_Token: "Secret token"},
#                   params:  {place: {places [{name: 'Place Name', address: 'Place Address', latitude: 33.123, longitude: 74.987, local_id: "PORT201604011118336191"},{name: 'Place Name', address: 'Place Address', latitude: 33.123, longitude: 74.987, local_id: "PORT201604011118336191"}]}})
#
#   resp.status
#   => 200
#
#   resp.body
#   => {"places":[{"id":2,"name":"Fort Road","address":"Fort Road, Rawalpindi, Pakistan","latitude":33.5741022,"longitude":73 .0603163,"customer_type":"Customer", local_id: "PORT201604011118336191"}, {"id":2,"name":"Fort Road","address":"Fort Road, Rawalpindi, Pakistan","latitude":33.5741022,"longitude":73 .0603163,"customer_type":"Customer", local_id: "PORT201604011118336191"}]}
  def create
    @places = []
    place_param = params.require(:place).permit(places: [:name, :address, :latitude, :longitude, :local_id]).to_h
    place_param[:places].each do |key, param|
      place = current_user.company.places.new(param)
      place.save
      @places << place
    end
    render 'places'
  end

  private
  def place_params
    #params.require(:place).permit(places: [:name, :address, :latitude, :longitude, :local_id])
  end


end