module LowVoltage
  class PostFinder < HighVoltage::PageFinder

    def find
      Rails.root.join("app/views/#{content_path}/#{clean_path}.md")
    end

    def content_path
      LowVoltage.configuration.content_path
    end

  end
end
