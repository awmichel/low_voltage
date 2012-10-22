require 'metadown'

module LowVoltage
  class Post
    attr_reader :title, :date, :id, :content, :author

    def initialize(path)
      @id = File.basename(path, ".md")
      @path = path

      begin
        parse_post(Metadown.render(IO.read(@path)))
      rescue Errno::ENOENT
        raise ActionController::RoutingError, "Post not found: #{path}"
      end
    end

    private

    def parse_post(data)
      @content = data.output.html_safe
      parse_metadata(data.metadata)
    end

    def parse_metadata(metadata)
      @title = metadata['title'] || @id.titleize
      @date = Date.parse(metadata['date'] || File.mtime(@path).inspect)
      @author = metadata['author'] || "Anonymous"
    end

  end
end
