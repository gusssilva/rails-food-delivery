require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get creat" do
    get orders_creat_url
    assert_response :success
  end

  test "should get show" do
    get orders_show_url
    assert_response :success
  end

end
