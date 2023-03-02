defmodule Tracker.Training.Workout do
  use Ecto.Schema
  alias Tracker.Training.Exercise

  schema "workout" do
    belongs_to :exercise, Exercise
    field :max_wieght, :integer
    field :num_sets, :integer
    field :total_workout_id, :integer

    timestamps()
  end
end
