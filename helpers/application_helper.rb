module ApplicationHelper

  # Display site description
  def site_description
    error_msg = "Site description is missing: add a `description` field in `data/site.yml`"
    data.site.description || (raise error_msg)
  end

  # Convert a hex color to a Sass color object, with alpha
  def rgba(hex, alpha = 1)
    color = Sass::Script::Value::Color.from_hex(hex, alpha)
    color.options = {}
    color
  end

end
