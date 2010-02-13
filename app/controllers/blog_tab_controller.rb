class BlogTabController < ApplicationController
  def index
  end

  def tab
    @rss = rss = RSS::Parser.parse(open("http://gror.blogspot.com/feeds/posts/default").read, false)
    render :text => 'arrg'
  end
end
