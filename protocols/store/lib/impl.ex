defimpl Computer, for: Laptop do
  def on(item), do: "The #{item.typestore} is turning on.."
  def off(item), do: "The #{item.typestore} is turning off..."
end

defimpl Computer, for: PC do
  def on(_item), do: 1 + 1
  def off(_item), do: "OFFF PCCCCCC!!!!!!!!"
end

defimpl Computer, for: Any do
  def on(_item), do: "Turn on"
  def off(_item), do: "Turn off"
end
