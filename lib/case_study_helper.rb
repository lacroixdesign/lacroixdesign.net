module CaseStudyHelper

  # Published case studies
  def find_case_study_by_title(title)
    blog('case-studies').articles.find {|a| a.title == title }
  end

  # Image path for case study cover logo
  def case_study_logo_path(article, extension)
    filename = article.data.cover_logo || 'cover-logo'
    image_path "#{article_path(article)}#{filename}.#{extension.to_s}"
  end

  def case_study_logo(article, options = {})
    options[:src] = case_study_logo_path(article, :svg)
    options[:alt] = article.title
    options[:onerror] = "this.src='#{case_study_logo_path(article, :png)}'"
    tag(:img, options)
  end

  # Image path for case study cover background
  def case_study_bg_path(article)
    image_path "#{article_path(article)}#{article.data.cover_bg || 'cover-bg.jpg'}"
  end

end
