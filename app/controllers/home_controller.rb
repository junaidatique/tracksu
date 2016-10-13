class HomeController < ApplicationController
  def index
    @main_class = "home"
  end
  def tour
    @main_class = "tour"
  end
  def pricing
    @main_class = "pricing"
  end
  def about
    @main_class = "about"
  end
end
