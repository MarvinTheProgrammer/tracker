defmodule TrackerWeb.TrainingLive do
  alias Tracker.Training
  use TrackerWeb, :live_view

  alias Tracker.Training

  @impl Phoenix.LiveView
  def mount(_params, _session, socket) do
    #Join through and many-to-many by alchemist lab
    socket = assign(socket, :workout, Training.get_all_workouts())
    IO.inspect(socket)
    {:ok, socket}
  end


  @impl Phoenix.LiveView
  def render(assigns) do
    ~H"""
    <ul>
      <%= for workout <- @workout do%>
        <li>Duration <%= workout.duration %></li>
        <%= for sets <- workout.sets do%>
        <li>Max Weight: <%= sets.max_weight %></li>
        <li>Name: <%= sets.exercise.name %></li>
        <% end %>
      <% end %>
    </ul>
    """
  end
end
