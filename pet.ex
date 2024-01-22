defmodule Pet do
  defstruct color: nil, age: nil

  def new(attrs) do
    %__MODULE__{
      color: Map.get(attrs, :color, nil),
      age: Map.get(attrs, :age, nil)
    }
  end

  def new(), do: %Pet{}

  def get_color(pet) do
    pet.color
  end

  def get_age(pet) do
    pet.age
  end

  def is_dog?(name \\ "dog") do
   if name == "dog" do 
     "yes"
    else 
      "no"
    end
  end
end

pet = Pet.new(%{color: "black", age: 3})
IO.inspect pet
IO.inspect Pet.get_color(pet)
IO.puts "is dog? " <> Pet.is_dog?


# example with macros and getters
defmodule GetterMacros do
  defmacro define_getter(field) do
    quote do
      def unquote(:"get_#{field}")(pet) do
        pet.unquote(field)
      end
    end
  end
end

defmodule Pet do
  import GetterMacros

  defstruct color: nil, age: nil

  define_getter :color
  define_getter :age

  def new(attrs \\ %{}) do
    %__MODULE__{
      color: Map.get(attrs, :color, nil),
      age: Map.get(attrs, :age, nil)
    }
  end
end

