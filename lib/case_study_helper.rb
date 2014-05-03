module CaseStudyHelper

  # Published case studies
  def find_case_study_by_title(title)
    blog('case-studies').articles.find {|a| a.title == title }
  end

  # Image path for case study preview logo
  def case_study_logo_path(article)
    image_path "#{article_path(article)}#{article.data.preview_logo || 'preview-logo.png'}"
  end

  # Image path for case study preview background
  def case_study_bg_path(article)
    image_path "#{article_path(article)}#{article.data.preview_bg || 'preview-bg.jpg'}"
  end

end
