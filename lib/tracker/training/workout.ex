defmodule Tracker.Training.Workout do
  use Ecto.Schema
  alias Tracker.Training.Sets

  schema "workout" do
    has_many :sets, Sets
    field :workout_type, :string
    field :duration, :float

    timestamps()
  end
end
