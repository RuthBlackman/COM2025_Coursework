class SelectedModule < ApplicationRecord

  scope :by_user, -> (user) { where([" user_id = ?", user.id]) }

end
