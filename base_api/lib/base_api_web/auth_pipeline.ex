defmodule BaseApi.Guardian.AuthPipeline do
  use Guardian.Plug.Pipeline, otp_app: :BaseApi,
  module: BaseApi.Guardian,
  error_handler: BaseApi.AuthErrorHandler

  plug Guardian.Plug.VerifyHeader, realm: "Bearer"
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end