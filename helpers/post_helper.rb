module PostHelper

  # Post image path
  def post_image_path(image, article = current_page)
    image_path "#{article_path(article)}#{image}"
  end

end
