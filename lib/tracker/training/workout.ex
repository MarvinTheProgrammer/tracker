defmodule Tracker.Training.Workout do
  use Ecto.Schema
  alias Tracker.Training.{Sets, Users}

  schema "workout" do
    has_many :sets, Sets
    field :workout_type, :string
    field :duration, :float
    belongs_to :user, Users

    timestamps()
  end
end
