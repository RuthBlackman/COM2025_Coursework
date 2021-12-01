class SelectedModule < ApplicationRecord

  belongs_to :user
  belongs_to :course_module

  scope :by_user, -> (user) { where([" user_id = ?", user.id]) }

  validates :course_module_id, uniqueness: {scope: :user_id}

end
