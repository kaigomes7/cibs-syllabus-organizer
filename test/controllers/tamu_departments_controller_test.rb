# frozen_string_literal: true

require 'test_helper'

class TamuDepartmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tamu_department = tamu_departments(:one)
  end

  test 'should get index' do
    get tamu_departments_url
    assert_response :success
  end

  test 'should get new' do
    get new_tamu_department_url
    assert_response :success
  end

  test 'should create tamu_department' do
    assert_difference('TamuDepartment.count') do
      post tamu_departments_url,
           params: { tamu_department: { tamu_department_name: @tamu_department.tamu_department_name } }
    end

    assert_redirected_to tamu_department_url(TamuDepartment.last)
  end

  test 'should show tamu_department' do
    get tamu_department_url(@tamu_department)
    assert_response :success
  end

  test 'should get edit' do
    get edit_tamu_department_url(@tamu_department)
    assert_response :success
  end

  test 'should update tamu_department' do
    patch tamu_department_url(@tamu_department),
          params: { tamu_department: { tamu_department_name: @tamu_department.tamu_department_name } }
    assert_redirected_to tamu_department_url(@tamu_department)
  end

  test 'should destroy tamu_department' do
    assert_difference('TamuDepartment.count', -1) do
      delete tamu_department_url(@tamu_department)
    end

    assert_redirected_to tamu_departments_url
  end
end
