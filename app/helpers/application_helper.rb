module ApplicationHelper

  def gravatar_for(user, options = { size: 200})
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
   size = options[:size]
   gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
   image_tag(gravatar_url, alt: user.name, class: "border-radius-50")
  end

  def markdown_to_html(text)
    return "" if text.nil?
   Kramdown::Document.new(text, input: "markdown").to_html
  end


  def trade_author(trade)
    user_signed_in? && current_user.id == trade.user_id
  end

end
