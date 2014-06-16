require 'rails_helper'

describe Post do
  before do
    Delayed::Worker.delay_jobs = false
  end

  it "delays .slow_method" do
    expect(Post.delay.slow_method).to be_a Delayed::Job
  end
end
