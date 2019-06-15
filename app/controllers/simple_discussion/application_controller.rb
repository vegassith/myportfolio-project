class SimpleDiscussion::ApplicationController < ::ApplicationController
  before_action :set_sidebar_topics, except: [:update, :create, :toggle_status, :destory]
  layout "simple_discussion"

  def page_number
    page = params.fetch(:page, '').gsub(/[^0-9]/, '').to_i
    page = "1" if page.zero?
    page
  end

  def is_moderator_or_owner?(object)
    is_moderator? || object.user == current_user
  end
  helper_method :is_moderator_or_owner?

  def is_moderator?
    current_user.respond_to?(:moderator) && current_user.moderator?
  end
  helper_method :is_moderator?

  def require_mod_or_author_for_post!
    unless is_moderator_or_owner?(@forum_post)
      redirect_to_root
    end
  end

  def require_mod_or_author_for_thread!
    unless is_moderator_or_owner?(@forum_thread)
      redirect_to_root
    end
  end

  private

  def redirect_to_root
    redirect_to simple_discussion.root_path, alert: "You aren't allowed to do that."
  end

  def set_sidebar_topics
    @set_sidebar_topics = Topic.with_blogs
  end

end
