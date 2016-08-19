require 'test_helper'

class BankDetailsControllerTest < ActionController::TestCase
  setup do
    @bank_detail = bank_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bank_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bank_detail" do
    assert_difference('BankDetail.count') do
      post :create, bank_detail: { account_no: @bank_detail.account_no, bank_name: @bank_detail.bank_name, user_id: @bank_detail.user_id }
    end

    assert_redirected_to bank_detail_path(assigns(:bank_detail))
  end

  test "should show bank_detail" do
    get :show, id: @bank_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bank_detail
    assert_response :success
  end

  test "should update bank_detail" do
    patch :update, id: @bank_detail, bank_detail: { account_no: @bank_detail.account_no, bank_name: @bank_detail.bank_name, user_id: @bank_detail.user_id }
    assert_redirected_to bank_detail_path(assigns(:bank_detail))
  end

  test "should destroy bank_detail" do
    assert_difference('BankDetail.count', -1) do
      delete :destroy, id: @bank_detail
    end

    assert_redirected_to bank_details_path
  end
end
