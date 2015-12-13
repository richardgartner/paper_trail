class ApplicationController < ActionController::Base
  protect_from_forgery

  # Some applications and libraries modify `current_user`. Their changes need
  # to be reflected in `whodunnit`, so the `set_paper_trail_whodunnit` below
  # must happen after this.
  before_filter :modify_current_user

  # Going forward, we'll no longer add this `before_filter`, requiring people
  # to do so themselves, allowing them to control the order in which this filter
  # happens.
  before_filter :set_paper_trail_whodunnit

  def rescue_action(e)
    raise e
  end

  # Returns id of hypothetical current user
  def current_user
    @current_user
  end

  def info_for_paper_trail
    {:ip => request.remote_ip, :user_agent => request.user_agent}
  end

  private

  def modify_current_user
    @current_user = OpenStruct.new(id: 153)
  end
end
