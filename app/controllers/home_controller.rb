class HomeController < ApplicationController
  def index
  	redirect_to '/tasks'
  end
end
