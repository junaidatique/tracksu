class Tracksu::TracksuController < ApplicationController
  layout 'tracksu'

  before_action :authenticate_user!

end