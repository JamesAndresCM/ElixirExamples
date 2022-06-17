defmodule MathTasks do

  # Private function that sum two numbers together
  defp sum(x, y) do
    IO.puts "==== starting sum"
    :timer.sleep(1000)
    IO.puts "finishing sum"
    x + y
  end

  # Private function that mutiply two numbers together
  defp mult(x, y) do
    IO.puts "==== starting mult"
    :timer.sleep(1000)
    IO.puts "finishing mult"
    x * y
  end

  # This function is the one that perform the operation we want
  def perform do

    # Let's create a new process for each function, by using the
    # Task.async/1 function. These processes will be really
    # lightweight Erlang processes that can run concurrently
    sum_task = Task.async(fn -> sum(1,2) end)
    multi_task = Task.async(fn -> mult(3,4) end)

    # Let's get those new processes result before performing the
    # thrid operation
    sum = Task.await(sum_task)
    multi = Task.await(multi_task)

    # A third operation that uses the result from both methods above
    # to perform a new calculation
    sum - multi
  end
end

# Let's call the perform function to check how it's going to behave
# MathTasks.perform
