module LowVoltage
  class PostFinder
    VALID_CHARACTERS = "a-zA-Z0-9~!@$%^&*()#`_+-=<>\"{}|[];',?".freeze

    def initialize(post_id)
      @post_id = post_id
    end

    def find
      Rails.root.join("app/views/#{content_path}/#{clean_path}.md")
    end

    def content_path
      LowVoltage.configuration.content_path
    end

    protected

    # The raw page id passed in by the user
    attr_reader :post_id

    private

    def clean_path
      path = Pathname.new("/#{clean_id}")
      path.cleanpath.to_s[1..-1]
    end

    def clean_id
      @post_id.tr("^#{VALID_CHARACTERS}", '')
    end

  end
end
