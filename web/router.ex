defmodule PhoenixJokenAuth.Router do
  use PhoenixJokenAuth.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug Joken.Plug, on_verifying: &PhoenixJokenAuth.Router.verify_call/1
    plug :match
    plug :dispatch
  end

  scope "/", PhoenixJokenAuth do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", PhoenixJokenAuth do
    pipe_through :api

    get "/", PageController, :index
  end

  def verify_call(token) do
    IO.inspect "expecting this to be called, but get a compilation error instead..."
    token
  end
end
