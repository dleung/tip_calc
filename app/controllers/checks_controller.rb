class ChecksController < ApplicationController
	layout false

  def template
  	render text: '', layout: 'layouts/application'
  end

  def item
  	render 'home/_item', layout: false
  end
end
