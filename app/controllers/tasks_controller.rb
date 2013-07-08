class TasksController < ApplicationController
	layout false

  def template
  	render text: '', layout: 'layouts/application'
  end

  def form
  	render '_form'
  end
end
