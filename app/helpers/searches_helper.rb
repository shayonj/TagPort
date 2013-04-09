module SearchesHelper
  
  # Converting links in text as hyperlins and hyperlinking the twitter mentions accordingly. A little messy but works neat ;)

  def cust_link(text)
    text.gsub(/((https?:\/\/|www\.)([-\w\.]+)+(:\d+)?(\/([\w\/_\.]*(\?\S+)?)?)?)/, %Q{<a href="\\1", class="custom", target="_blank">\\1</a>}).gsub(/@(\w+)/, %Q{<a href="http://twitter.com/\\1", class="custom", target="_blank">@\\1</a>}).html_safe
  end

end
