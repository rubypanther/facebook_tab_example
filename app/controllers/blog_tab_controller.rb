class BlogTabController < ApplicationController
  def index
  end

  def tab
    @rss = RSS::Parser.parse(open("http://gror.blogspot.com/feeds/posts/default").read, false)
    render :text => "<ul>"+ @rss.items.collect{|i|"<li><h3>%s (%s)</h3><br />%s<br /></li>" % [ i.title.content, i.updated.content, i.content.content ] }.join("\n") + "</ul>"
  end
end
