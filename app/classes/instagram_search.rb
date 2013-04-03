class InstagramSearch
  attr_reader :search_instagram, :tag, :count, :max_tag_id
  
  def initialize
    Instagram.configure do |config|
         config.client_id = ENV["INSTAGRAM_CLIENT_ID"]
         config.client_secret = ENV["INSTAGRAM_CLIENT_SECRET"]
    end
  end
  
  def query(args)
    @tag = args[:tag]
    @count = args[:count] || 10
    @max_tag_id = args[:max_tag_id] || 0
    # Search being made here with values beince replaced accordingly.
    Instagram.tag_recent_media(tag, {:count => count}, :max_tag_id => max_tag_id)
  end
end
