class ApplicationController < ActionController::Base
  protect_from_forgery
  # removes the utf8 param from url if broswer is not IE.
  before_filter do
    @utf8_enforcer_tag_enabled = browser.ie?
  end
end
