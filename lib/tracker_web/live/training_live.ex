defmodule TrackerWeb.TrainingLive do
  alias Tracker.Training
  use TrackerWeb, :live_view

  alias Tracker.Training

  @impl Phoenix.LiveView
  def mount(_params, _session, socket) do
    socket = assign(socket, :workout, Training.get_all_workouts())

    {:ok, socket}
  end


  @impl Phoenix.LiveView
  def render(assigns) do
    ~H"""
    <ul>
      <%= for workout <- @workout do%>
        <li><%= <<workout>>%></li>
      <% end %>
    </ul>
    """
  end
end
