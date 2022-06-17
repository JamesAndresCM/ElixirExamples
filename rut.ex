defmodule RutEx do
  @mod_dv 11
  def parse_rut(rut) when is_integer(rut) do
    rut 
    |> Integer.to_string 
    |> String.graphemes()
    |> Enum.reverse() 
    |> Enum.map(&String.to_integer/1)
  end

  def parse_rut(rut) when is_nil(rut), do: false
  def parse_rut(_), do: false

  def calculate_dv(rut) when is_integer(rut) do
    {:ok, calc_dv(parse_rut(rut))}
  end
  
  def calculate_dv(_), do: false

  defp calc_dv(rut) when is_list(rut) do
    dv = rut
    |> Enum.with_index(2) 
    |> Enum.reduce(0, fn({n, index}, acc) -> if index > 7, do: (index - 6) * n + acc, else: index * n + acc end) 
    |> rem(@mod_dv)
    case @mod_dv - dv do 
      @mod_dv -> "0"

      10 -> "k"
      
      other -> to_string(other) 
    end
  end
end
