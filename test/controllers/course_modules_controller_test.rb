require 'test_helper'

class CourseModulesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @course_module = course_modules(:one)
  end

  test "should get index" do
    get course_modules_url
    assert_response :success
  end

  test "should get new" do
    get new_course_module_url
    assert_response :success
  end

  test "should create course_module" do
    assert_difference('CourseModule.count') do
      post course_modules_url, params: { course_module: { Credits: @course_module.Credits, ModuleCode: @course_module.ModuleCode, ModuleLeader: @course_module.ModuleLeader, ModuleLeaderID: @course_module.ModuleLeaderID, ModuleOverview: @course_module.ModuleOverview, Title: "Test" , Year: @course_module.Year } }
    end

    assert_redirected_to course_module_url(CourseModule.last)
  end

  test "should show course_module" do
    get course_module_url(@course_module)
    assert_response :success
  end

  test "should get edit" do
    get edit_course_module_url(@course_module)
    assert_response :success
  end

  test "should update course_module" do
    patch course_module_url(@course_module), params: { course_module: { Credits: @course_module.Credits, ModuleCode: @course_module.ModuleCode, ModuleLeader: @course_module.ModuleLeader, ModuleLeaderID: @course_module.ModuleLeaderID, ModuleOverview: @course_module.ModuleOverview, Title: @course_module.Title, Year: @course_module.Year } }
    assert_redirected_to course_module_url(@course_module)
  end

  test "should destroy course_module" do
    assert_difference('CourseModule.count', -1) do
      delete course_module_url(@course_module)
    end

    assert_redirected_to course_modules_url
  end
end
