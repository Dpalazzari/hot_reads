class Api::V1::LinksController < ApplicationController

  def create
    link = JSON.parse(request.body.read)
    returned_link = Link.find_or_create_by(url: link['url'])
    num_read = returned_link.times_read += 1
    returned_link.update_attribute(:times_read, num_read)
    returned_link.save
    render json: returned_link
  end

end
