defmodule Laptop do
  defstruct typestore: "LAPTOP", brand: "", model: "", serie: ""

  def new(brand \\ "Apple", model \\ "", serie \\ "", typestore \\ "LAPTOP") do
    %__MODULE__{brand: brand, model: model, serie: serie, typestore: typestore}
  end
end
