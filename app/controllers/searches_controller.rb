class SearchesController < ApplicationController
  
  def new
  end

  def index
  end

  def show
  end
  
  def create
    twitter_search = TwitterSearch.new
    @twitter_results = twitter_search.query(:tag => params[:search]).results
    instagram_search = InstagramSearch.new
    @instagram_results = instagram_search.query(:tag => params[:search])
        
    respond_to do |format|
      format.js
    end
  end
end
