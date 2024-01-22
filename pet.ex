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
