require 'minitest/autorun'
require 'minitest/pride'
require './robot.rb'

class TestRobot < MiniTest::Test

  def setup
    @robot = Robot.new
  end

  def teardown
    @robot = nil
  end

  def test_that_foreign_robot_needing_repairs_sent_to_station_1
    # skip
    # arrange
    @robot.needs_repairs = true
    @robot.foreign_model = true
    # act
    result = @robot.station
    expect = 1
    # assert
    assert_equal(expect, result)
  end

  def test_that_vintage_robot_needing_repairs_sent_to_station_2
    # skip
    # arrange
    @robot.needs_repairs = true
    @robot.vintage_model = true
    # act
    result = @robot.station
    expect = 2
    # assert
    assert_equal(expect, result)
  end

  def test_that_standard_robot_needing_repairs_sent_to_station_3
    # skip
    # arrange
    @robot.needs_repairs = true
    # act
    result = @robot.station
    expect = 3
    # assert
    assert_equal(expect, result)
  end

  def test_that_robot_in_good_condition_sent_to_station_4
    # skip
    # arrange
    @robot.needs_repairs = false
    # act
    result = @robot.station
    expect = 4
    # assert
    assert_equal(expect, result)
  end

  def test_prioritize_tasks_with_empty_todo_list_returns_negative_one
    # skip
    # arrange
    @robot.todos = []
    # act
    result = @robot.prioritize_tasks
    expect = -1
    # assert
    assert_equal(expect, result)
  end

  def test_prioritize_tasks_with_todos_returns_max_todo_value
    # skip
    # arrange
    @robot.todos = [1, 3, 5, 2]
    # act
    result = @robot.prioritize_tasks
    expect = 5
    # assert
    assert_equal(expect, result)
  end

  def test_workday_on_day_off_returns_false
    # skip
    # arrange
    @robot.day_off = "Sunday"
    # act
    result = @robot.workday?("Sunday")
    expect = false
    # assert
    assert_equal(expect, result)
  end

  def test_workday_not_day_off_returns_true
    # skip
    # arrange
    @robot.day_off = "Sunday"
    # act
    result = @robot.workday?("Monday")
    expect = true
    # assert
    assert_equal(expect, result)
  end

end
