module MacroHelper

  # Hero
  def macro_hero(**params, &block)
    required = [:image, :replace, :classes, :theme]
    opts = {
      replace: false,
      classes: "",
      theme: ""
    }.merge(params)
    macro("hero", opts, required, &block)
  end

  # Basic Card
  def macro_basic_card(**params, &block)
    required = [:image, :classes, :theme, :link, :el, :styles]
    opts = {
      el: "div",
      classes: "",
      styles: "",
      link: false,
      link_themes: "",
      link_styles: "",
      theme: ""
    }.merge(params)
    macro("basic_card", opts, required, &block)
  end

  # Post Box
  def macro_post_box(**params, &block)
    required = [:post, :classes, :theme]
    opts = {
      classes: "",
      theme: "theme--dark"
    }.merge(params)
    macro("post_box", opts, required, &block)
  end

  # Tweet Intent
  def macro_tweet_intent(page = current_page, **params, &block)
    params[:target] = "_blank"
    username   = page_author(page) ? "@#{page_author(page).twitter}" : ""
    text_param = "text=#{CGI::escape("#{username}\n\n")}"
    share_url  = page_short_url(page) || page_url(page)
    url_param  = "url=#{CGI::escape(share_url)}"
    related    = data.team.reverse.map {|a| a.twitter}.join(",")
    related_param = "related=#{related}"

    url =  "https://twitter.com/intent/tweet?"
    url += [text_param, url_param, related_param].join("&")
    link_to(url, params) { yield }
  end

private

  # Render macro
  def macro(name, params = {}, required_keys = [])
    required_keys.each do |key|
      unless params.has_key?(key)
        raise ArgumentError, "Argument `#{key}` is required for `macro_#{name}`"
      end
    end

    render(:partial, "macros/_#{name}", locals: params) { yield if block_given? }
  end

end
