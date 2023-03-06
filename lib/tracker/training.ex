defmodule Tracker.Training do

  import Ecto.Query

  alias Tracker.Repo
  alias Tracker.Training.{Results, Workout, Sets, Exercise}

  def get_results()  do
    Results
    |> Repo.all()
  end

  def get_all_workouts() do

    query = from w in "workout",
      join: s in "sets",
      on: w.id == s.workout_id,
      join: e in "exercise",
      on:  e.id == s.exercise_id,
      select: {w.workout_type, w.duration, w.updated_at, s.max_weight, s.num_sets, e.body_part, e.name}

   query
    |> Repo.all()
  end
end
