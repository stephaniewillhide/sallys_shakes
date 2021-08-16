class DashboardController < ApplicationController
  def index
    @shakes = Shake.all
  end
end
