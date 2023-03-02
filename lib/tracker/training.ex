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
            join: e in "exercise",
            on: w.exercise_id == e.id,
            where: w.total_workout_id == ^id,
            select: {e.name, w.max_wieght, w.num_sets, w.inserted_at}
    query
    |> Repo.all()

  end
end
