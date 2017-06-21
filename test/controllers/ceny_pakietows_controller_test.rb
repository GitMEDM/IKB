require 'test_helper'

class CenyPakietowsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ceny_pakietows_index_url
    assert_response :success
  end

  test "should get nowa" do
    get ceny_pakietows_nowa_url
    assert_response :success
  end

  test "should get edycja" do
    get ceny_pakietows_edycja_url
    assert_response :success
  end

  test "should get usun" do
    get ceny_pakietows_usun_url
    assert_response :success
  end

end
