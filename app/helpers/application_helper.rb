module ApplicationHelper
  def icon(icon_name, options = {})
    options[:type] ||= 'fa'
    check_icon_type(options[:type])
    content_tag :i, nil, class: [options[:type], "fa-#{icon_name}", options[:class]].compact
  end

  private

  def check_icon_type(type)
    types = %w[fa fal fab]
    raise "#{type.inspect} is not know type" unless types.include?(type)
  end
end
