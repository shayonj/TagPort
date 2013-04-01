class SearchesController < ApplicationController

  def new
  end

  def index
  end

  def show
  end

  def create

    twitter_search = TwitterSearch.new
    instagram_search = InstagramSearch.new
      
    if params[:search].nil? == true
      @twitter_results = twitter_search.first_query(:tag => params[:tag], :count =>20, :max_id => params[:twitter_last_id])
      @instagram_results = instagram_search.query(:tag => params[:tag], :count => 20)
    else
      @twitter_results = twitter_search.first_query(:tag => params[:search], :count =>20)
      @instagram_results = instagram_search.query(:tag => params[:search], :count => 20)
    end
    
     #Instantiate and query through instagram results against the hashtags
     
       

    respond_to do |format|
      format.js
    end
  end
end
