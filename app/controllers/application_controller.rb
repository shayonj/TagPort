class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter do
    @utf8_enforcer_tag_enabled = browser.ie?
  end
end
