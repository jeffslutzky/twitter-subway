require 'nokogiri'
require 'open-uri'

class UsersController < ApplicationController

	def index
    if current_user
      @client = TwitterConnection.new(current_user).create_client
			# @client.home_timeline.each do |tweet|
			# 	if tweet.urls?
			# 		url = tweet.urls.first.attrs[:expanded_url]
			# 		html = open(url)
			# 		doc = Nokogiri::HTML(html)
			# 		@text = doc.css("body").to_html
   #  		end
  	# 	end
		end
 	end


end
