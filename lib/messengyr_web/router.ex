defmodule MessengyrWeb.Router do
  use MessengyrWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", MessengyrWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/signup", PageController, :signup
    # :signup atom refers to web/templates/page/signup.html.eex
    get "/login", PageController, :login
    post "/signup", PageController, :create_user
  end

  # Other scopes may use custom stacks.
  # scope "/api", MessengyrWeb do
  #   pipe_through :api
  # end
end
