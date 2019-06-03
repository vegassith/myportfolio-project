module CurrentUserConcern
  extend ActiveSupport::Concern
  
  def current_user
    super || guest_user
  end

  def guest_user
    guest = GuestUser.new
    guest.name = "Guest Name"
    guest.first_name = "Guest"
    guest.last_name = "User"
    guest.email = "guest@test.org"
    guest
  end
end