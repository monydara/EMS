require 'test_helper'

class AcdCourseControllerTest < ActionController::TestCase
  test "should get code:string" do
    get :code:string
    assert_response :success
  end

  test "should get name:string" do
    get :name:string
    assert_response :success
  end

  test "should get course_type:string" do
    get :course_type:string
    assert_response :success
  end

  test "should get program_type:string" do
    get :program_type:string
    assert_response :success
  end

  test "should get acd_degree_id:integer" do
    get :acd_degree_id:integer
    assert_response :success
  end

  test "should get abbr:string" do
    get :abbr:string
    assert_response :success
  end

  test "should get is_deleted:boolean" do
    get :is_deleted:boolean
    assert_response :success
  end

  test "should get created_by:integer" do
    get :created_by:integer
    assert_response :success
  end

end
