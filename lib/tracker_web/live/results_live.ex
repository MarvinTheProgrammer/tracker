defmodule TrackerWeb.ResultsLive do
  alias Tracker.{Training, Accounts}
  use TrackerWeb, :live_view

  def mount(_params, session, socket) do
    user = Accounts.get_user_by_session_token(session["user_token"])
    IO.inspect(user)
    {:ok, assign(socket,
    chart_data: Training.get_results_labels(user.id),
    current_user: user)}
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
