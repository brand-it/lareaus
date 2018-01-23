# frozen_string_literal: true

module ImageHelper
  # <img src="blank.gif" data-src="my_image.png" width="600" height="400" class="lazy">
  def lazy_image_tag(src, placecholder = nil, tag_options: {}, img_options: {})
    tag_options ||= {}
    tag_options[:data] ||= {}
    tag_options[:data][:src] = image_url(src, img_options)
    tag_options[:class] = ['lazy', tag_options[:class]].compact
    placeholder_url = image_url(placecholder, img_options) if placecholder.present?
    image_tag placeholder_url.to_s, tag_options
  end
end
