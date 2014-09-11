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

  # Output <li>'s of the user's social links
  # The <ul> is NOT included
  def team_member_social_list(member)
    partial "partials/team_member_social_list", locals: {member:  member}
  end

end
