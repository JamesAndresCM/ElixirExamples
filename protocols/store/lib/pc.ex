defmodule PC do
  defstruct typestore: "PC", brand: "", model: "", serie: ""
  
  def new(brand \\ "Apple", model \\ "", serie \\ "", typestore \\ "PC") do
    %__MODULE__{brand: brand, model: model, serie: serie, typestore: typestore}
  end
end
