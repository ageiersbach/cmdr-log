class Api::EventsController < ApplicationController
  skip_before_action :verify_authenticity_token #hot doggin' it


  def create
    puts "API::EventsController#create"
    puts params
    head :ok
  end

end
