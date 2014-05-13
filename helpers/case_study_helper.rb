module CaseStudyHelper

  # Find case studies
  def find_case_study_by_title(title)
    unless title
      raise "A title is required to look up a case study"
    end
    case_study = blog('case-studies').articles.find {|a| a.title == title }
    unless case_study
      raise "Could not find a case study with the title of: #{title}"
    end
    case_study
  end

  # Case study image
  def case_study_image_path(image, article = current_page)
    image_path "#{article_path(article)}#{image}"
  end

  # Image path for case study cover logo
  def case_study_logo_path(extension, article = current_page)
    filename = article.data.cover_logo || 'cover-logo'
    image_path "#{article_path(article)}#{filename}.#{extension.to_s}"
  end

  def case_study_logo(options = {}, article = current_page)
    src = case_study_logo_path(:svg, article)
    options[:alt] = article.title
    options[:onerror] = "this.src='#{case_study_logo_path(:png, article)}'"
    image_tag src, options
  end

  # Image path for case study cover background
  def case_study_bg_path(article = current_page)
    image_path "#{article_path(article)}#{article.data.cover_bg || 'cover-bg.jpg'}"
  end

  # Slideshow builder
  def case_study_slideshow(image_names, article = current_page)
    path   = article_path(article)
    slides = image_names.map do |name|
      {
        src: "#{path}slides/#{name}.jpg",
        alt: article.title
      }
    end
    component "slideshow", { slides: slides }
  end

end
