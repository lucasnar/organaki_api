# OrganakiApi

This is the backend API to the Organaki app, an app to connect local producers
of organic food directly with consumers.

## Running the API

### Dependencies

  * Elixir 1.14.4
  * Erlang 25.3.2
    * For both of the above, we recommend setting up [`asdf`](https://github.com/asdf-vm/asdf) (with the erlang and elixir plugins), then just run `asdf install` in this repo
  * Install [docker](https://www.docker.com/)

### Running the server

To start your Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Run `docker-compose up` to start services at their default port
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can make requests to [`localhost:4000`](http://localhost:4000).

### Running tests

  * Run `docker-compose up` to start services at their default port
  * Run `mix test` or inside IEx with `iex -S mix test`
