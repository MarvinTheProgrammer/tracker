defmodule Tracker.Training.Results do
  use Ecto.Schema

  alias Tracker.Training.Users

  schema "results" do
    field :waist, :float
    field :arms, :float
    field :weight, :float
    belongs_to :user, Users

    timestamps()
  end
end
