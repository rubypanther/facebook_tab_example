class BlogTabController < ApplicationController
  def index
  end

  def tab
    @rss = RSS::Parser.parse(open("http://gror.blogspot.com/feeds/posts/default").read, false)
    render :text => @rss.items.collect{|i|i.title.content }.join("<br/>")
  end
end
