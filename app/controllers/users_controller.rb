require 'nokogiri'
require 'open-uri'

class UsersController < ApplicationController

	def index
    if current_user
      @client = TwitterConnection.new(current_user).create_client

			tweets_array = @client.user_timeline(current_user, count:100).each_with_object([]) do |tweet, array|
			  tweet_text = tweet.text
			  offset = tweet.user.utc_offset
			  tweet_time = (tweet.created_at + offset).strftime("%a. %b %e, %Y @ %l:%M %p")
		    url = tweet.urls.first.attrs[:expanded_url] if tweet.urls?
				tweet_permalink = "https://twitter.com/#{tweet.user.screen_name}/status/#{tweet.id}"
				array << [tweet_text, tweet_time, tweet_permalink]
			end

		end

		respond_to do |format|
	      format.html { }
	      format.json { render json: tweets_array }
	  end
 	end

end
