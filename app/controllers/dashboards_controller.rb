class DashboardsController < ApplicationController
  # before_action :require_user
  protect_from_forgery unless: -> { true }

  def show
    puts request.body.read
  end
end
