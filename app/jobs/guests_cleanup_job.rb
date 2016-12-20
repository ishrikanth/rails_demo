class GuestsCleanupJob < ApplicationJob
  queue_as :default

  def perform(user)
  	user.destroy
    # Do something later
  end
end
