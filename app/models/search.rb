class Search < ActiveRecord::Base
  belongs_to :user
  attr_accessible :tags
end
