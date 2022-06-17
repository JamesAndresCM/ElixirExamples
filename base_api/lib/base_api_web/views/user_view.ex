defmodule BaseApiWeb.UserView do
  use BaseApiWeb, :view
  alias BaseApiWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "show.json")}
  end

  def render("show.json", %{user: user}) do
    render_one(user, UserView, "detail_user.json")
  end

  def render("user.json", %{user: user}) do
    %{message: "Your current logged as #{user.email}"}
  end

  def render("detail_user.json", %{user: user}) do
    %{ id: user.id, email: user.email }
  end

  def render("jwt.json", %{jwt: jwt}) do
    %{jwt: jwt}
  end
end
