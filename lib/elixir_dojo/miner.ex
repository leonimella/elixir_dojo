defmodule ElixirDojo.Miner do
  require Logger
  use GenServer
  use Tesla

  @bcb_url Application.get_env(:elixir_dojo, :bcb_mining_base_url)
  @bcb_path Application.get_env(:elixir_dojo, :bcb_mining_path)

  plug(Tesla.Middleware.BaseUrl, @bcb_url)
  plug(Tesla.Middleware.JSON)

  def start_link(state \\ []) do
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  def init(state) do
    schedule()
    {:ok, state}
  end

  def handle_info(:mine, state) do
    schedule()
    response = get(@bcb_path)

    Logger.info("#{inspect(response)}")

    # do work

    {:noreply, state}
  end

  def schedule, do: Process.send_after(self(), :mine, 2_000)
end
