class Tweet < ActiveRecord::Base
  attr_accessible :content
  validates :content, :length => { :minimum => 1, :maximum => 140 }
end
