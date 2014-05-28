module ApplicationHelper

  # Display page title
  def page_title
    prefix = "#{current_page.data.title} | " if current_page.data.title
    suffix = data.site.title
    unless data.site.title
      raise "Site title is missing: add a `title` field in `data/site.yml`"
    end
    prefix + suffix
  end

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
