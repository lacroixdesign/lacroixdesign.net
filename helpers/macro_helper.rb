module MacroHelper

  # Hero
  def macro_hero(**data, &block)
    required = [:image, :replace, :classes, :theme]
    opts = {
      replace: false,
      classes: "",
      theme: ""
    }.merge(data)
    macro("hero", opts, required, &block)
  end

  # Basic Card
  def macro_basic_card(**data, &block)
    required = [:image, :classes, :theme, :link, :el, :styles]
    opts = {
      el: "div",
      classes: "",
      styles: "",
      link: false,
      link_themes: "",
      link_styles: "",
      theme: ""
    }.merge(data)
    macro("basic_card", opts, required, &block)
  end

  # Post Box
  def macro_post_box(**data, &block)
    required = [:post, :classes, :theme]
    opts = {
      classes: "",
      theme: "theme--dark"
    }.merge(data)
    macro("post_box", opts, required, &block)
  end

private

  # Render macro
  def macro(name, data = {}, required_keys = [])
    required_keys.each do |key|
      unless data.has_key?(key)
        raise ArgumentError, "Argument `#{key}` is required for `macro_#{name}`"
      end
    end

    render(:partial, "macros/_#{name}", locals: data) { yield if block_given? }
  end

end
