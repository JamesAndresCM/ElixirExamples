defmodule Template do
  def greetings do
    quote do
      def greeting(s), do: IO.puts("hello how are you #{s}")
      def greeting2, do: IO.puts("hello how are you")
    end
  end

  def goodbye do
    quote do
      def bye(s), do: IO.puts("hi, good by #{s}")
    end
  end

  defmacro __using__(opt) when is_atom(opt) do
    apply(__MODULE__, opt, [])
  end
end
