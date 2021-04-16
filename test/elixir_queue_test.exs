defmodule ElixirQueueTest do
  use ExUnit.Case

  test "should start a queue" do
    assert {:ok, pid} = ElixirQueue.start_link([])
    assert Process.alive?(pid)
  end

  test "should successfully enqueue an element" do
    {:ok, pid} = ElixirQueue.start_link([])

    element = {:hello, :world}
    response = ElixirQueue.enqueue(pid, element)

    expected_response = :ok

    assert response == expected_response
  end

  test "should successfully dequeue an element" do
    element = 1
    {:ok, pid} = ElixirQueue.start_link([element])

    response = ElixirQueue.dequeue(pid)

    assert response == element
  end

  test "should successfully dequeue an element in an empty queue" do
    {:ok, pid} = ElixirQueue.start_link([])

    response = ElixirQueue.dequeue(pid)

    assert response == nil
  end
end
