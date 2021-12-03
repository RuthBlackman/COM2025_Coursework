class CourseModule < ApplicationRecord
  scope :by_user, -> (user) { joins("INNER JOIN selected_modules AS sm ON sm.course_module_id = course_modules.id").where([" sm.user_id = ?", user.id]) } #joins(:selected_modules).where([" selected_modules.user_id = ?", user.id]) }

  has_many :selected_modules, :dependent => :destroy

end
