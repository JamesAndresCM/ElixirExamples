defmodule TodoList do
  defstruct auto_id: 1, entries: %{}

  def new(), do: %TodoList{}
  def new(entries \\ []) do
    Enum.reduce(entries, %TodoList{}, fn entry, todo_list_acc -> add(todo_list_acc, entry) end)
  end

  def add(todo_list, entry) do
    entry = Map.put(entry, :id, todo_list.auto_id)
    new_entries = Map.put(todo_list.entries, todo_list.auto_id, entry)
    %TodoList{todo_list | entries: new_entries, auto_id: todo_list.auto_id + 1}
  end
  
  def entries(todo_list, date) do
    todo_list.entries
    |> Stream.filter(fn {_, entry} -> entry.date == date end)
    |> Enum.map(fn {_, entry} -> entry end)
  end
  
  def update(todo_list, id, update_data) do
    case Map.fetch(todo_list.entries, id) do
      :error -> 
        todo_list
      {:ok, old} -> 
        new_entry = update_data.(old)
        new_entries = Map.put(todo_list.entries, new_entry.id, new_entry)
        %TodoList{todo_list | entries: new_entries}
    end
  end

  def update_data(todo_list, %{} = new_entry) do
    update(todo_list, new_entry.id, fn _ -> new_entry end)
  end

  defimpl String.Chars, for: TodoList do
    def to_string(todo_list) do
      todo_list.entries |> Enum.each(fn {_, v} -> IO.puts("id: #{v[:id]}, title: #{v[:title]}") end)
    end
  end
end

todo_one = TodoList.new |> TodoList.add(%{date: ~D[2022-05-29], title: "Shopping"}) |> TodoList.add(%{date: ~D[2022-05-30], title: "Games"})
todo_one.entries
todo_one = TodoList.update(todo_one, 1, &Map.put(&1, :title, "Test"))
to_string(todo_one)


