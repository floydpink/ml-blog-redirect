require 'bundler/setup'
require 'sinatra'

ROOT = "http://www.harimenon.com"

# Redirect
# http://ml.blog.harimenon.com/2011/02/blog-post.html
# to
# http://www.harimenon.com/blog/2011/02/09/എഴുതണമെന്നു-ആഗ്രഹമുണ്ടായാല്‍-മാത്രം-പോരല്ലോ/
get '/2011/02/blog-post.html' do
  redirect "#{ROOT}/blog/2011/02/09/എഴുതണമെന്നു-ആഗ്രഹമുണ്ടായാല്‍-മാത്രം-പോരല്ലോ/", 301
end
get '/2009/11/blog-post.html' do
  redirect "#{ROOT}/blog/2009/11/17/ഇടവേള-തുടരുന്നു/", 301
end
get '/2009/07/blog-post_23.html' do
  redirect "#{ROOT}/blog/2009/07/23/ശ്രീശൈലത്തെക്കൊരു-തീര്‍ത്ഥയാത്ര-ഭാഗം-ഒന്നര/", 301
end
get '/2009/07/blog-post.html' do
  redirect "#{ROOT}/blog/2009/07/08/ശ്രീശൈലത്തെക്കൊരു-തീര്‍ത്ഥയാത്ര-ഭാഗം-ഒന്ന്/", 301
end
get '/2009/06/blog-post_29.html' do
  redirect "#{ROOT}/blog/2009/06/29/പ്രവാസിമനസ്സ്/", 301
end
get '/2009/06/blog-post.html' do
  redirect "#{ROOT}/blog/2009/06/25/എന്താണിതിന്റെ-ഒക്കെ-അര്‍ത്ഥം/", 301
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
