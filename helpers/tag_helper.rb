module TagHelper

  # Display IcoMoon font icon
  def icon key
    "<i data-icon=&#x#{h(key)}></i>"
  end

  # URL path for blog articles
  def article_path(article)
    prefix = article.blog_data.options.prefix.gsub(/\//, '')
    "#{prefix}/#{article.slug}/"
  end

  # Hero image
  def hero_image(image = nil)
    render(:partial, "components/_hero-image",
      :locals => { image: image }) { yield if block_given? }
  end

end
