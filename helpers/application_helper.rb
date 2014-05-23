module ApplicationHelper

  # Display site description
  def site_description
    error_msg = "Site description is missing: add a `description` field in `data/site.yml`"
    data.site.description || (raise error_msg)
  end

end
