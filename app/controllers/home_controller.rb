class HomeController < ApplicationController

  def index
    links = Link.find_by_sql("select links.id, links.times_read from links;")
    @top_ten = links.reverse.take(10).map do |link|
      Link.find(link.id)
    end
  end

end
