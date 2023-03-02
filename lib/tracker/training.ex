defmodule Tracker.Training do

  import Ecto.Query

  alias Tracker.Repo
  alias Tracker.Training.Workout

  def get_every_workout()  do
    Workout
    |> Repo.all()
    |> Repo.preload(:exercise)

  end

  def get_a_workout_by_id(id)  do
    query = from w in "workout",
            where: w.exercise_id == id,
            select: {w.exercise_id, w.max_weight, w.num_sets}
    query
    |> Repo.all()
    |> Repo.preload(:exercise)

  end
end
