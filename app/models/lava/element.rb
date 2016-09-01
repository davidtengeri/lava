module Lava
  class Element < ActiveRecord::Base
    include Models::Element

    before_save :convert_video_url

    belongs_to :user
    belongs_to :page

    private

    def convert_video_url
      if self.element_type == 'video' && self.value.present? && self.value.match(/https:\/\/vimeo\.com\/.*/)
        self.value = self.value.gsub(/https:\/\/vimeo\.com\//, 'https://player.vimeo.com/video/')
      end
    end
  end
end