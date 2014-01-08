class Post < ActiveRecord::Base
  attr_accessible :title

  def self.failing_method
    fail 'oops'
  end
end
