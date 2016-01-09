require 'nokogiri'
require 'open-uri'

class UsersController < ApplicationController

	def index
    if current_user
      @client = TwitterConnection.new(current_user).create_client
			@client.user_timeline(current_user, count:100).each do |tweet|
			  # tweet.text
			  offset = tweet.user.utc_offset
			  tweet_time = (tweet.created_at + offset).strftime("%a. %b %e, %Y @ %l:%M %p %z")
			  if tweet.urls?
			    url = tweet.urls.first.attrs[:expanded_url]
			  end
			end
		end
 	end


end
