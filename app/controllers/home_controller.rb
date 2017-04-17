class HomeController < ApplicationController

  def index
    @top_ten = Link.top_ten
  end

end
