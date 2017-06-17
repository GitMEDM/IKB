require 'test_helper'

class BiegisControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get biegis_index_url
    assert_response :success
  end

  test "should get pokaz" do
    get biegis_pokaz_url
    assert_response :success
  end

  test "should get nowa" do
    get biegis_nowa_url
    assert_response :success
  end

  test "should get edycja" do
    get biegis_edycja_url
    assert_response :success
  end

  test "should get usun" do
    get biegis_usun_url
    assert_response :success
  end

end
