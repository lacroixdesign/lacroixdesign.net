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

  # Team avatar path
  def team_member_avatar_path(author)
    image_path("team/#{author.avatar}.jpg")
  end

  # Team member URL path
  def team_member_path(member)
    "/team/#{member.slug}/"
  end

end
