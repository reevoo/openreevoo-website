defmodule OpenreevooWebsite.Router do
  use OpenreevooWebsite.Web, :router

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

  # Pipeline for serving badges
  pipeline :images do
    plug :put_secure_browser_headers
  end

  # Main website
  scope "/", OpenreevooWebsite do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Badge serving
  scope "/badges", OpenreevooWebsite do
    pipe_through :images

    get "/:project_name", BadgesController, :show
  end

  # API
  scope "/api", OpenreevooWebsite do
    pipe_through :api

    post "/review", ReviewsController, :create
  end
end
