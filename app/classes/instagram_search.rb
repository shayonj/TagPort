class InstagramSearch
  attr_reader :search_instagram, :tag, :count
  
  def initialize
    Instagram.configure do |config|
         config.client_id = ENV["INSTAGRAM_CLIENT_ID"]
         config.client_secret = ENV["INSTAGRAM_CLIENT_SECRET"]
    end
  end
  
  def query(args)
    @tag = args[:tag]
    @count = args[:count] || 10
    Instagram.tag_recent_media(tag, {:count => count})
  end
end
