defmodule OrganakiApiWeb.Router do
  use OrganakiApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :auth do
    plug OrganakiApi.Accounts.Pipeline
  end

  pipeline :ensure_auth do
    plug Guardian.Plug.EnsureAuthenticated
  end

  scope "/api", OrganakiApiWeb do
    pipe_through [:api, :auth]

    resources "/producers", ProducerController, only: [:index, :create, :show]
    resources "/tags", TagController, only: [:index]
    post "/login", SessionController, :login
    get "/logout", SessionController, :logout
  end

  scope "/api", OrganakiApiWeb do
    pipe_through [:api, :auth, :ensure_auth]

    resources "/producers", ProducerController, only: [:update, :delete]
  end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:organaki_api, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      live_dashboard "/dashboard", metrics: OrganakiApiWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
