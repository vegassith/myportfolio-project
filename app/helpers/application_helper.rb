module ApplicationHelper

  def login_helper(style = '')
   if current_user.is_a?(GuestUser) 
    (link_to "Login", user_session_path, class: style) +    
    (link_to "Register", new_user_registration_path, class: style)
   else 
    (link_to "Logout", destroy_user_session_path, method: :delete, class: style) + 
    ( link_to "Edit", edit_user_registration_path, class: style)
   end 
  end

  def source_helper(layout_name)
    if session[:source] 
      greeting = "Thanks for visiting me from #{session[:source]} and you are on the #{layout_name} layout"
      content_tag(:p, greeting, class: "source-greeting")
    end 
  end

  def sample_helper
    content_tag(:div, "My Content", class: "my-class")
  end


  def copyright_generator
    DeathStarViewTool::Renderer.copyright('Luke Skywalker', 'All rights reserved')
  end


end
