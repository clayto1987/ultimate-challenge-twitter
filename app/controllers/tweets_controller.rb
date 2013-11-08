class TweetsController < ApplicationController
  def index
    @one_tweet = Tweet.new
    @tweets = Tweet.order("created_at DESC")
  end

  def create
    @one_tweet = Tweet.new(params[:tweet])

    if @one_tweet.save
      flash[:success] = "Your tweet was successfully posted."
      #redirect to index action
      redirect_to :action => :index #redirects to new page and leaves state forgetting everything in @post
    else
      #flash.now[:error] = "Sorry, tweet must be between 1-140 characters long."
      #@post.title = "" #removes title prior to putting things back in the form
      #load up the view associated with the new action
      @tweets = Tweet.order("created_at DESC")
      render :action => :index #keeps state and remembers @post and puts the data back into the form
    end
  end
end
