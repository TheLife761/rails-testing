require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task = tasks(:one)
  end

  test "should get index" do
    get tasks_url
    assert_response :success
    assert_not_nil assigns(:tasks)
  end

  test "should get show" do
    get task_url(@task)
    assert_response :success
  end

  test "should get new" do
    get new_task_url
    assert_response :success
  end

  test "should create task" do
    assert_difference('Task.count') do
      post tasks_url, params: { task: { title: "Nueva tarea", completed: false } }
    end

    assert_redirected_to tasks_path
    assert_equal 'Tarea creada exitosamente', flash[:notice]
  end

  test "should get edit" do
    get edit_task_url(@task)
    assert_response :success
  end

  test "should update task" do
    patch task_url(@task), params: { task: { title: "Tarea actualizada", completed: true } }
    assert_redirected_to task_path(@task)
    assert_equal 'Tarea actualizada exitosamente', flash[:notice]
  end

  test "should destroy task" do
    assert_difference('Task.count', -1) do
      delete task_url(@task)
    end

    assert_redirected_to tasks_path
    assert_equal 'Tarea eliminada exitosamente', flash[:notice]
  end
end
