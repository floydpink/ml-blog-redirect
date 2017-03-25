require 'bundler/setup'
require 'sinatra'
require 'open-uri'

ROOT = "https://new.harimenon.com"

# Redirect
# http://ml.blog.harimenon.com/2011/02/blog-post.html
# to
# https://harimenon.com/2011/02/10/ezuthanamennu-aagrahamundaayal-matram-porallo/
get '/2011/02/blog-post.html' do
  redirect "#{ROOT}/2011/02/10/ezuthanamennu-aagrahamundaayal-matram-porallo/", 301
end
get '/2009/11/blog-post.html' do
  redirect "#{ROOT}/2009/11/18/idavela-thudarunnu/", 301
end
get '/2009/07/blog-post_23.html' do
  redirect "#{ROOT}/2009/07/24/srisailathekkoru-theerthayatra-part-one-and-half/", 301
end
get '/2009/07/blog-post.html' do
  redirect "#{ROOT}/2009/07/08/srisailathekkoru-theerthayatra-part-one/", 301
end
get '/2009/06/blog-post_29.html' do
  redirect "#{ROOT}/2009/06/30/pravasimanassu/", 301
end
get '/2009/06/blog-post.html' do
  redirect "#{ROOT}/2009/06/25/enthaanithinte-okke-artham/", 301
end

# Redirect
# http://ml.blog.harimenon.com/search/label/അർദ്ധവിരാമം
# to
# https://harimenon.com/categories/അർദ്ധവിരാമം/

# DevTool -> devtools
# asp.net -> asp-net
# ruby-on-rails -> ruby-on-rails

get '/search/label/:label' do |label|
  category = URI::encode(label).downcase.gsub(/[^\w|%]|%20/) { '-' }
  redirect "#{ROOT}/categories/#{category}/", 301
end

# http://ml.blog.harimenon.com/2009_06_01_archive.html
# =>
# https://harimenon.com/archives/
get '/:year_:month_:day_archive.html' do
  redirect "#{ROOT}/archives/", 301
end


# ml.blog.harimenon.com -> www.harimenon.com/categories/malayalam-blog/
get '/' do
  redirect "#{ROOT}/categories/malayalam-blog/", 301
end


# Feeds
# ml.blog.harimenon.com/feeds/posts/default => FeedBurner
get '/feeds/posts/default' do
  redirect "#{ROOT}/atom.xml", 301
end

get '/robots.txt' do
  content_type 'text/plain'
  'User-agent: *' + "\n" + 'Disallow: /'
end
