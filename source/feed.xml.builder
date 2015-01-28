xml.instruct!
xml.feed "xmlns" => "http://www.w3.org/2005/Atom" do
  site_url = "http://www.lacroixdesign.net/"
  xml.title "LaCroix Design Co."
  xml.subtitle "Empowering businesses to become more successful, we design and develop innovative experiences that deliver measurable results."
  xml.id URI.join(site_url, blog("blog").options.prefix.to_s)
  xml.link "href" => URI.join(site_url, blog("blog").options.prefix.to_s)
  xml.link "href" => URI.join(site_url, current_page.path), "rel" => "self"
  xml.updated(blog("blog").articles.first.date.to_time.iso8601) unless blog("blog").articles.empty?
  # xml.author { xml.name "LaCroix Design Co." }

  blog("blog").articles[0..5].each do |article|
    xml.entry do
      xml.title article.title
      xml.link "rel" => "alternate", "href" => URI.join(site_url, article.url)
      xml.id URI.join(site_url, article.url)
      xml.published article.date.to_time.iso8601
      xml.updated File.mtime(article.source_file).iso8601
      xml.author { xml.name find_team_member_by_name(article.data.author).name }
      # xml.summary article.summary, "type" => "html"
      xml.content article.body, "type" => "html"
      thumbnail = nil
      thumbnail ||= article.data.image
      if thumbnail
        xml.media :thumbnail,
                  "xmlns:media" => "http://search.yahoo.com/mrss/",
                  "url" => post_image_path(thumbnail, article)
      end
    end
  end
end
