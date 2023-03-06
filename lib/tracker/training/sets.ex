defmodule Tracker.Training.Sets do
  use Ecto.Schema

  alias Tracker.Training.Exercise
  alias Tracker.Training.Workout

  schema "sets" do
    belongs_to :workout, Workout
    belongs_to :exercise, Exercise
    field :max_weight, :integer
    field :num_sets, :integer
  end
end
