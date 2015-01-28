module ApplicationHelper

  # Convert a hex color to a Sass color object, with alpha
  def rgba(hex, alpha = 1)
    color = Sass::Script::Value::Color.from_hex(hex, alpha)
    color.options = {}
    color
  end

end
