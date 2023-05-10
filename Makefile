start-organaki:
	- mix local.hex --force
	- mix local.rebar --force
	- mix deps.get
	- mix setup
	- mix phx.server