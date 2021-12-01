require 'test_helper'

class SelectedModulesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @selected_module = selected_modules(:one)
  end

  test "should get index" do
    get selected_modules_url
    assert_response :success
  end

  test "should get new" do
    get new_selected_module_url
    assert_response :success
  end

  test "should create selected_module" do
    assert_difference('SelectedModule.count') do
      post selected_modules_url, params: { selected_module: { CourseModuleID: @selected_module.CourseModuleID, StudentID: @selected_module.StudentID } }
    end

    assert_redirected_to selected_module_url(SelectedModule.last)
  end

  test "should show selected_module" do
    get selected_module_url(@selected_module)
    assert_response :success
  end

  test "should get edit" do
    get edit_selected_module_url(@selected_module)
    assert_response :success
  end

  test "should update selected_module" do
    patch selected_module_url(@selected_module), params: { selected_module: { CourseModuleID: @selected_module.CourseModuleID, StudentID: @selected_module.StudentID } }
    assert_redirected_to selected_module_url(@selected_module)
  end

  test "should destroy selected_module" do
    assert_difference('SelectedModule.count', -1) do
      delete selected_module_url(@selected_module)
    end

    assert_redirected_to selected_modules_url
  end
end
