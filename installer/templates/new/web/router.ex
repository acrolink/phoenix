defmodule <%= application_module %>.Router do
  use <%= application_module %>.Web, :router<%= if html do %>

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end<% end %>

  pipeline :api do
    plug :accepts, ["json"]
  end<%= if html do %>

  scope "/", <%= application_module %> do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", <%= application_module %> do
  #   pipe_through :api
  # end<% else %>

  scope "/api", <%= application_module %> do
    pipe_through :api
  end<% end %>
end
