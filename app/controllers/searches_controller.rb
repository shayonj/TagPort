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
    
    # Making sure @tag is never return empty
    if params[:tag].nil? == true
      @tag = params[:search]
    else
      @tag = params[:tag]
    end

    if params[:tag].nil? == false
      @twitter_results = twitter_search.first_query(:tag => params[:tag], :count =>28, :max_id => params[:twitter_last_id])
      @instagram_results = instagram_search.query(:tag => params[:tag], :count => 28, :max_tag_id => params[:instagram_max_tag_id])
    else
      @twitter_results = twitter_search.first_query(:tag => params[:search], :count =>28)
      @instagram_results = instagram_search.query(:tag => params[:search], :count => 28)
    end

    respond_to do |format|
      format.js {render :content_type => "text/javascript"}
    end
  end
end
