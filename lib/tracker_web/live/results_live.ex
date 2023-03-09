defmodule TrackerWeb.ResultsLive do
  alias Tracker.Training
  use TrackerWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :chart_data, Training.get_results_labels())}
  end

  def render(assigns) do
    ~H"""
    <div id="charting">
      <h1>Results</h1>
      <canvas id="chart-canvas"
              phx-hook="LineChart"
              data-chart={Jason.encode!(@chart_data)}>
      </canvas>
    </div>
    """
  end

end
