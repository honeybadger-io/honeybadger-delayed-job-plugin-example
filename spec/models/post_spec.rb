require 'rails_helper'

describe Post do
  after { Delayed::Worker.new.work_off }

  it "delays .slow_method" do
    expect(Post.delay.slow_method(1)).to be_a Delayed::Job
  end
end
