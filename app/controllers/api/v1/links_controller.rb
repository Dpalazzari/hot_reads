class Api::V1::LinksController < ApplicationController

  def create
    link = JSON.parse(request.body.read)
    returned_link = Link.find_or_create_by(url: link['url'])
    returned_link.times_read += 1
    render json: returned_link
  end

end
