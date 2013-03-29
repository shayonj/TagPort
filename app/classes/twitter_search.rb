class TwitterSearch 
  attr_reader :client, :tag, :count, :lang, :result_type
  
  def initialize
    @client = Twitter::Client.new(
      :endpoint => "http://api.twitter.com",
      :consumer_key => ENV["TWITTER_CONSUMER_KEY"], 
      :consumer_secret => ENV["TWITTER_CONSUMER_SECRET"],
      :oauth_token => ENV["TWITTER_OAUTH_TOKEN"],
      :oauth_token_secret => ENV["TWITTER_OAUTH_SECRET"]
    )
    client.send(:connection).headers["Accept-Encoding"] = ""
  end
  
  
  def query(args)
    @tag = args[:tag]
    @count = args[:count] || 10
    @lang = args[:lang] || "en"
    @result_type = args[:result_type] || "recent"
    
    client.search("#".concat(tag), :count => count, :lang => lang, :result_type => result_type)
  end

end
