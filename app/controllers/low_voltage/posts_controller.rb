class LowVoltage::PostsController < ApplicationController
  layout Proc.new { |_| LowVoltage.configuration.layout }

  if LowVoltage.configuration.use_action_caching
    caches_action :index, :cache_path => Proc.new { |c| c.params[:offset] }
    caches_action :show, :cache_path => Proc.new { |c| c.params[:id] }
  end

  def index
    @offset = params[:offset].to_i || 0
    @total_posts, @posts = load_posts(@offset)
  end

  def show
    @post = post_factory.new(current_post)
  end

  private

  def current_post
    post_finder.find
  end

  def post_finder
    post_finder_factory.new(params[:id])
  end

  def post_finder_factory
    LowVoltage::PostFinder
  end

  def post_factory
    LowVoltage::Post
  end

  def load_posts(offset=0, limit=LowVoltage.configuration.posts_per_page)
    range = (offset)..(offset+limit-1)
    posts = Dir.glob(LowVoltage.configuration.full_content_path).map do |path|
      path = post_factory.new(path)
    end.sort! { |a,b| b.date <=> a.date }
    [posts.count(), posts.slice(range)]
  end

end
