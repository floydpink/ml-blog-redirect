require 'bundler/setup'
require 'sinatra'

ROOT = "http://www.harimenon.com"

# Redirect
# http://ml.blog.harimenon.com/2011/02/blog-post.html
# to
# http://www.harimenon.com/blog/2011/02/09/എഴുതണമെന്നു-ആഗ്രഹമുണ്ടായാല്‍-മാത്രം-പോരല്ലോ/
get '/2011/02/blog-post.html' do
  redirect "#{ROOT}/blog/2011/02/09/%E0%B4%8E%E0%B4%B4%E0%B5%81%E0%B4%A4%E0%B4%A3%E0%B4%AE%E0%B5%86%E0%B4%A8%E0%B5%8D%E0%B4%A8%E0%B5%81-%E0%B4%86%E0%B4%97%E0%B5%8D%E0%B4%B0%E0%B4%B9%E0%B4%AE%E0%B5%81%E0%B4%A3%E0%B5%8D%E0%B4%9F%E0%B4%BE%E0%B4%AF%E0%B4%BE%E0%B4%B2%E0%B5%8D%E2%80%8D-%E0%B4%AE%E0%B4%BE%E0%B4%A4%E0%B5%8D%E0%B4%B0%E0%B4%82-%E0%B4%AA%E0%B5%8B%E0%B4%B0%E0%B4%B2%E0%B5%8D%E0%B4%B2%E0%B5%8B/", 301
end
get '/2009/11/blog-post.html' do
  redirect "#{ROOT}/blog/2009/11/17/%E0%B4%87%E0%B4%9F%E0%B4%B5%E0%B5%87%E0%B4%B3-%E0%B4%A4%E0%B5%81%E0%B4%9F%E0%B4%B0%E0%B5%81%E0%B4%A8%E0%B5%8D%E0%B4%A8%E0%B5%81/", 301
end
get '/2009/07/blog-post_23.html' do
  redirect "#{ROOT}/blog/2009/07/23/%E0%B4%B6%E0%B5%8D%E0%B4%B0%E0%B5%80%E0%B4%B6%E0%B5%88%E0%B4%B2%E0%B4%A4%E0%B5%8D%E0%B4%A4%E0%B5%86%E0%B4%95%E0%B5%8D%E0%B4%95%E0%B5%8A%E0%B4%B0%E0%B5%81-%E0%B4%A4%E0%B5%80%E0%B4%B0%E0%B5%8D%E2%80%8D%E0%B4%A4%E0%B5%8D%E0%B4%A5%E0%B4%AF%E0%B4%BE%E0%B4%A4%E0%B5%8D%E0%B4%B0-%E0%B4%AD%E0%B4%BE%E0%B4%97%E0%B4%82-%E0%B4%92%E0%B4%A8%E0%B5%8D%E0%B4%A8%E0%B4%B0/", 301
end
get '/2009/07/blog-post.html' do
  redirect "#{ROOT}/blog/2009/07/08/%E0%B4%B6%E0%B5%8D%E0%B4%B0%E0%B5%80%E0%B4%B6%E0%B5%88%E0%B4%B2%E0%B4%A4%E0%B5%8D%E0%B4%A4%E0%B5%86%E0%B4%95%E0%B5%8D%E0%B4%95%E0%B5%8A%E0%B4%B0%E0%B5%81-%E0%B4%A4%E0%B5%80%E0%B4%B0%E0%B5%8D%E2%80%8D%E0%B4%A4%E0%B5%8D%E0%B4%A5%E0%B4%AF%E0%B4%BE%E0%B4%A4%E0%B5%8D%E0%B4%B0-%E0%B4%AD%E0%B4%BE%E0%B4%97%E0%B4%82-%E0%B4%92%E0%B4%A8%E0%B5%8D%E0%B4%A8%E0%B5%8D/", 301
end
get '/2009/06/blog-post_29.html' do
  redirect "#{ROOT}/blog/2009/06/29/%E0%B4%AA%E0%B5%8D%E0%B4%B0%E0%B4%B5%E0%B4%BE%E0%B4%B8%E0%B4%BF%E0%B4%AE%E0%B4%A8%E0%B4%B8%E0%B5%8D%E0%B4%B8%E0%B5%8D/", 301
end
get '/2009/06/blog-post.html' do
  redirect "#{ROOT}/blog/2009/06/25/%E0%B4%8E%E0%B4%A8%E0%B5%8D%E0%B4%A4%E0%B4%BE%E0%B4%A3%E0%B4%BF%E0%B4%A4%E0%B4%BF%E0%B4%A8%E0%B5%8D%E0%B4%B1%E0%B5%86-%E0%B4%92%E0%B4%95%E0%B5%8D%E0%B4%95%E0%B5%86-%E0%B4%85%E0%B4%B0%E0%B5%8D%E2%80%8D%E0%B4%A4%E0%B5%8D%E0%B4%A5%E0%B4%82/", 301
end

# Redirect
# http://ml.blog.harimenon.com/search/label/അർദ്ധവിരാമം
# to
# http://www.harimenon.com/blog/categories/അർദ്ധവിരാമം/

# DevTool -> devtools
# asp.net -> asp-net
# ruby-on-rails -> ruby-on-rails

get '/search/label/:label' do |label|
  category = label.downcase.gsub(/\W/) { '-' }
  redirect "#{ROOT}/blog/categories/#{category}/", 301
end

# http://ml.blog.harimenon.com/2009_06_01_archive.html
# =>
# http://www.harimenon.com/blog/archives/
get '/:year_:month_:day_archive.html' do
  redirect "#{ROOT}/blog/archives/", 301
end


# ml.blog.harimenon.com -> www.harimenon.com/blog/categories/malayalam-blog/
get '/' do
  redirect "#{ROOT}/blog/categories/malayalam-blog/", 301
end


# Feeds
# ml.blog.harimenon.com/feeds/posts/default => FeedBurner
get '/feeds/posts/default' do
  redirect "#{ROOT}/atom.xml", 301
end
