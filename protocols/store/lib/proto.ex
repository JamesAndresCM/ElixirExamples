defprotocol Computer do
  @fallback_to_any true
  def on(item)
  def off(item)
end
