defmodule Html do
  defmacro div(do: block) do
    quote do
      "<div>" <> unquote(block) <> "</div>"
    end
  end

  defmacro p(do: block) do
    quote do
      "<p>" <> unquote(block) <> "</p>"
    end
  end
end

defmodule Html.Tag do
  defmacro tag(name) do
    quote do
      def unquote(name)(do: block) do
        "<#{unquote(name)}>#{block}</#{unquote(name)}>"
      end

      def unquote(name)(attrs) do
        attrs_txt = Html.Tag.attrs_to_str(attrs)
        "<#{unquote(name)} #{attrs_txt}/>"
      end

      def unquote(name)(attrs, do: block) do
		    attrs_txt = Html.Tag.attrs_to_str(attrs)
        "<#{unquote(name)} #{attrs_txt}>#{block}</#{unquote(name)}>"
      end
    end
  end
  
  def attrs_to_str(attrs) do
    convert = fn({key, val}) ->
      "#{Atom.to_string(key)}='#{val}'"
    end
    attrs
    |> Enum.map(convert)
    |> Enum.join(" ")
  end
end

defmodule Html do
  import Html.Tag, only: :macros

  tag :div
  tag :p
end

data = Html.div class: "texto" do
  Html.p do: "Texto"
  Html.div class: "clear"
end

IO.puts(data)

