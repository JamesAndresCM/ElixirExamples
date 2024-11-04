defmodule JsExcercises do
  defmodule FizzBuzz do
    def calculate(n) when rem(n, 15) == 0, do: IO.puts "FizzBuzz"
    def calculate(n) when rem(n, 3) == 0, do: IO.puts "Fizz"
    def calculate(n) when rem(n, 5) == 0, do: IO.puts "Buzz"
    def calculate(n), do: IO.puts n
  end

  defmodule Figure do
    def build(quantity, character) when quantity > 0  do
      Enum.with_index(1..quantity, fn _x,y -> IO.puts String.duplicate(character, y + 1)  end)
    end

    def build(quantity, _character) when quantity <= 0 do
      IO.puts "error you must provide quantity greater than zero"
    end
  end

  defmodule Min do
    def calculate(nums) when is_list(nums) and length(nums) > 1 do
      Enum.reduce(nums, Enum.at(nums, 0), fn x, acc -> 
        if x < acc do 
          x
        else 
          acc
        end
      end)
    end

    def calculate(_nums), do: IO.puts("Error: must provide a list with more than one element")
  end

  defmodule CountChar do
    defstruct [:text, :letter]
    
    def new(attrs) do
     %__MODULE__{
      text: Map.get(attrs, :text, ""),
      letter: Map.get(attrs, :letter, "")
     }
    end

    def count(%__MODULE__{text: text, letter: letter}) when is_binary(text) and is_binary(letter) do
      # solution with filter
      text |> String.graphemes |> Enum.filter(fn x -> x == letter end) |> length()
      # solution with reduce
      # new_text = text |> String.graphemes
      #Enum.reduce(new_text, [], fn x, acc ->
      #  if x == letter do
      #    [x | acc]
      #  else
      #    acc
      #  end
      # end) |> Enum.count
    end

    def count(_), do: IO.puts "Error invalid input..."
  end
end

Enum.each(1..100, fn x -> 
  JsExcercises.FizzBuzz.calculate(x)
end)

JsExcercises.Figure.build(0,"1")
JsExcercises.Figure.build(7,"*")

IO.puts JsExcercises.Min.calculate([10,23,123,1,90])
JsExcercises.Min.calculate([])

#IO.puts JsExcercises.CountChar.count("amarala", "a")
texto = JsExcercises.CountChar.new(%{text: "amarala", letter: "a"})
IO.puts "the word #{texto.text} has #{JsExcercises.CountChar.count(texto)} ocurrences of the letter #{texto.letter}"

JsExcercises.CountChar.count(%{})
