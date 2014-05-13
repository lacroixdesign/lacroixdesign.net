module TeamHelper

  # Find team member
  def find_team_member_by_name(name)
    unless name
      raise "A name is required to look up team member/author"
    end
    member = data.team.find {|a| a.name == name }
    unless member
      raise "Could not find team member/author by the name of: #{name}"
    end
    member
  end

  # Team image path
  def team_image_path(image, article = current_page)
    image_path "#{article_path(article)}#{image}"
  end

end
