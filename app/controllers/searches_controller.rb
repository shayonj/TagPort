class SearchesController < ApplicationController
  def new
  end

  def index
  end

  def show
  end

  def create
    # Initializing classes
    twitter_search = TwitterSearch.new
    instagram_search = InstagramSearch.new    

      

    # Making sure @tag is never return empty
    if params[:tag].nil? == true
      @tag = params[:search]
    else
      @tag = params[:tag]
    end

    # Setting search tag to filter results accordingly.
    @exclude = params[:exclude]

    # Looking to see if tag returns nil. If so it looks for the search params. Helps for the first load, since tag has not been set then and rest of the calls are done via ajax.
    if params[:tag].nil? == false
      @twitter_results = twitter_search.first_query(:tag => params[:tag], :count => 20, :max_id => params[:twitter_last_id]).results 
      @instagram_results = instagram_search.query(:tag => params[:tag], :count => 20, :max_tag_id => params[:instagram_max_tag_id])
    else
      # This where the first load goes. Since params[:search] is coming from the form itself.
      @twitter_results = twitter_search.first_query(:tag => params[:search], :count => 20).results
      @instagram_results = instagram_search.query(:tag => params[:search], :count => 20)
    end

    # Deleting results which pass the condition of having a text of any kind in a tweet or instagram caption
    if params[:exclude].empty? ==true
      @twitter_results
      @instagram_results
    else
      @twitter_results.delete_if{|n| n.text.include?(params[:exclude])}
      @instagram_results.delete_if{|p| p.caption.text.include?(params[:exclude]) }
    end


    # Making calls via ajax
    respond_to do |format|
      format.js {render :content_type => "text/javascript"}
    end
  end
end