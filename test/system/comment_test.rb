require "application_system_test_case"

class MainTest < ApplicationSystemTestCase
  def get_table
    all(:xpath , "//tbody[@id=\"result2\"]/tr/td").map(&:text).map(&:to_i)
  end

  def get_errors
    all(:xpath, "//div[@id=\"alerts\"]/div").map(&:text)
  end

  def   perform(a, b)
    visit "/"
    fill_in "a", with: a
    fill_in "b", with: b
    click_on "Создать новость"
  end

  test "test 1" do
    a, b = 24, 18
    expected = [
      6, 72
    ]

    perform a, b
    assert_equal expected, get_table
  end

  test "test 2" do
    a, b = "dfgdhf", "asdfgh"
    expected = [
      "dfgdhf", "asdfgh"
    ]

    perform a, b
    assert_equal expected, get_table
  end

end