require 'test_helper'

class ModuleLeadersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @module_leader = module_leaders(:one)
  end

  test "should get index" do
    get module_leaders_url
    assert_response :success
  end

  test "should get new" do
    get new_module_leader_url
    assert_response :success
  end

  test "should create module_leader" do
    assert_difference('ModuleLeader.count') do
      post module_leaders_url, params: { module_leader: { department: @module_leader.department, firstName: @module_leader.firstName, lastName: @module_leader.lastName, office: @module_leader.office, officeHours: @module_leader.officeHours } }
    end

    assert_redirected_to module_leader_url(ModuleLeader.last)
  end

  test "should show module_leader" do
    get module_leader_url(@module_leader)
    assert_response :success
  end

  test "should get edit" do
    get edit_module_leader_url(@module_leader)
    assert_response :success
  end

  test "should update module_leader" do
    patch module_leader_url(@module_leader), params: { module_leader: { department: @module_leader.department, firstName: @module_leader.firstName, lastName: @module_leader.lastName, office: @module_leader.office, officeHours: @module_leader.officeHours } }
    assert_redirected_to module_leader_url(@module_leader)
  end

  test "should destroy module_leader" do
    assert_difference('ModuleLeader.count', -1) do
      delete module_leader_url(@module_leader)
    end

    assert_redirected_to module_leaders_url
  end
end
