class Post < ActiveRecord::Base
  attr_accessible :title

  def self.failing_method
    fail 'oops'
  end

  def self.slow_method(duration = 2)
    sleep(duration)
  end
end
