class Admin::DashboardController < ApplicationController

  http_basic_authenticate_with :name => "Jungle", :password => "book"

  def show

  # We could use AR models to query the database directly from the ERB views. However a better, more MVC approach to this is to let the controller fetch the data and pass it to the template. In other words, set instance variables in the controller action with values, and then render those instance variables in the ERB template


  #   Display a count of how many products are in the database
  @product_count = Product.count
 
  # Display a count of how many categories are in the database
  @category_list = Product.group(:category_id).count

  end
end
