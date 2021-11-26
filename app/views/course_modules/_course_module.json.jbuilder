json.extract! course_module, :id, :Title, :ModuleCode, :ModuleOverview, :ModuleLeader, :ModuleLeaderID, :Credits, :Year, :created_at, :updated_at
json.url course_module_url(course_module, format: :json)
