defmodule ElixirQueue do
  use GenServer

  def start_link(initial_state) do
    GenServer.start_link(__MODULE__, initial_state)
  end

  def enqueue(pid, element) do
    GenServer.cast(pid, {:enqueue, element})
  end

  def dequeue(pid) do
    GenServer.call(pid, :dequeue)
  end

  @impl true
  def init(initial_state) do
    GenServer.start_link(__MODULE__, initial_state)
  end

  @impl true
  def handle_cast({:enqueue, element}, state) do
    {:noreply, List.insert_at(state, length(state), element)}
  end

  @impl true
  def handle_call(:dequeue, _from, [head | tail]) do
    {:reply, head, tail}
  end

  @impl true
  def handle_call(:dequeue, _from, []), do: {:reply, nil, []}
end
