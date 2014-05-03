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

end
