class SearchesController < ApplicationController
  
  def new
  end

  def index
  end

  def show
  end
  
  def create
    # Instantiate and query through twitter results against the hashtags. .results is a twitter api parameter, which helps returning tweet info against the hashtag search quesry.
    twitter_search = TwitterSearch.new
    @twitter_results = twitter_search.query(:tag => params[:search]).results
    
    # Instantiate and query through instagram results against the hashtags
    instagram_search = InstagramSearch.new
    @instagram_results = instagram_search.query(:tag => params[:search])
        
    respond_to do |format|
      format.js
    end
  end
end
