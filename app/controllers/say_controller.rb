class SayController < ApplicationController

	authorize_resource class: false
	
  def hello
  end

  def goodbye
  end

  def products
  	@products = ["Marker", "pen","sketch", "box"]
  end
end
