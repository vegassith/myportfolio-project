module ApplicationHelper

  def login_helper
   if current_user.is_a?(User) 
     (link_to "Logout", destroy_user_session_path, method: :delete) +
     "<br>".html_safe +
     ( link_to "Edit", edit_user_registration_path)
   else 
     (link_to "Login", user_session_path) +
     "<br>".html_safe +
     (link_to "Register", new_user_registration_path)
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
