module LowVoltage
  class Configuration
    attr_accessor :layout, :content_path, :use_routes, :use_action_caching, :posts_per_page

    def initialize
      @layout = "application"
      @content_path = "posts"
      @use_routes = true
      @use_action_caching = true
      @posts_per_page = 10
    end

    def full_content_path
      Rails.root.join("app/views/#{LowVoltage.configuration.content_path}/*.md")
    end
  end
end
