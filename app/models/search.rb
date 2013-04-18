class Search < ActiveRecord::Base
  belongs_to :user
  
  attr_accessible :tags
  # attr_reader :tag, :excludes
end
