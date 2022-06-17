defmodule TodoList do
  def new(), do: MultiDict.new()
 
  def search_by_id(todo_list, id) do
    MultiDict.get(todo_list, id)
  end

  def add_entry(todo_list, entry) do
    MultiDict.add(todo_list, Kernel.map_size(todo_list), entry)
  end

  def remove_entry(todo_list, id) do
    MultiDict.remove(todo_list, id)
  end
end

defmodule MultiDict do
  def new(), do: %{}

  def add(dict, key, value) do
    value = Map.merge(%{id: key + 1}, value)
    Map.update(dict, key + 1, value, fn values -> [value | values] end)
  end

  def get(dict, key) do
    Map.get(dict, key, [])
  end

  def remove(dict, key) do
    Map.delete(dict, key)
  end
end

todo_list = TodoList.new() |> TodoList.add_entry(%{title: "Enginner", date: ~D[2022-04-17]})
IO.puts("Todo List")
IO.inspect(todo_list)

IO.puts("\nadd new element")
todo_list = TodoList.add_entry(todo_list, %{title: "Dentist", date: ~D[2022-05-12]})
IO.inspect(todo_list)

IO.puts("\nsearch by id element(2)")
IO.inspect(TodoList.search_by_id(todo_list, 2))

IO.puts("\nremove id 2 from todo_list")
IO.inspect(TodoList.remove_entry(todo_list, 2))
