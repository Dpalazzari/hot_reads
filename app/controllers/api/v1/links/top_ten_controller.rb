class Api::V1::Links::TopTenController < ApplicationController

  def index
    render json: Link.top_ten
  end

end
