class BlogTabController < ApplicationController
  def index
  end

  def tab
    @rss = RSS::Parser.parse(open("http://gror.blogspot.com/feeds/posts/default").read, false)
    render :text => "<ul>"+ @rss.items.collect{|i|"<li>%s</li>" % i.title.content }.join("<br/>") + "</ul>"
  end
end
