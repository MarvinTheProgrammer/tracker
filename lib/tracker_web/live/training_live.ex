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
    <div class="dropdown">
      <%= for workout <- @workout do%>
      <div class="select">
        <span class="selected">Duration <%= workout.duration %></span>
        <div class="caret"></div>
      </div>
      <ul class="menu">
      <%= for sets <- workout.sets do%>
        <li>Max Weight: <%= sets.max_weight %></li>
        <li>Name: <%= sets.exercise.name %></li>
      <% end %>
      </ul>
      <% end %>
    </div>
    """
  end
end
