class HomeController < ApplicationController
  def index
    @home = Search.new
  end

  def contact
  end
  
  def come_aboard
  end
end
