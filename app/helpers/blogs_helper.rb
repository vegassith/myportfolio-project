module BlogsHelper

  def avatar(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url =  "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag gravatar_url, width: 60
end

  class CodeRayify < Redcarpet::Render::HTML
    def block_code(code, language)
      CodeRay.scan(code, langage).div
    end
  end

  def markdown(text)
    coderayified = CodeRayify.new(filter_html: true, hard_wrap: true)

    options = {
      fenced_code_blocks: true,
      no_intra_emphasis: true,
      autolink: true,
      lax_html_blocks: true,
    }

    markdown_to_html = Redcarpet::Markdown.new(coderayified, options)
    markdown_to_html.render(text).html_safe
  end

  def blog_status_color(blog)
    if blog.draft?
      'color: red;'
    end
  end

end
