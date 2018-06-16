defmodule ChatterBackendWeb.Router do
  use ChatterBackendWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
#    plug :put_auth_token
  end

#  defp put_auth_token(conn, _) do
#    assign(conn, :user_token, UUID.uuid4())
#  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ChatterBackendWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", ChatterBackendWeb do
  #   pipe_through :api
  # end
end
