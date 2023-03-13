defmodule Tracker.Training do

  import Ecto.Query

  alias Tracker.Repo
  alias Tracker.Training.{Results, Workout, Sets, Exercise}

  def get_results(user_id)  do
    query = from r in Results,
    where: r.user_id == ^user_id,
    order_by: [desc: r.updated_at]

    query
    |> Repo.all()
  end

  def get_results_labels(user_id) do
    get_results(user_id)
    |> data_extractor([], [])
  end

  defp data_extractor([], label_acc, values_acc) do
    label_reverse = label_acc
    values_reverse = values_acc

    %{:labels => label_reverse,
      :values => values_reverse}
  end

  defp data_extractor([head | tail], label_acc, values_acc) do
    date_string =
      head.updated_at
      |> NaiveDateTime.to_date()
      |> Date.to_string()
    data_extractor(tail, [date_string | label_acc], [head.weight | values_acc])
  end

  def get_all_workouts() do

    query = from w in Workout,
      join: s in Sets,
      on: w.id == s.workout_id,
      join: e in Exercise,
      on:  e.id == s.exercise_id

    query
    |> Repo.all()
    |> Repo.preload(sets: [:exercise])
    |> Enum.uniq()


  #   query = from w in "workout",
  #     join: s in "sets",
  #     on: w.id == s.workout_id,
  #     join: e in "exercise",
  #     on:  e.id == s.exercise_id,
  #     select: {w.workout_type, w.duration, w.updated_at, s.max_weight, s.num_sets, e.body_part, e.name}

  #  query
  #   |> Repo.all()


    # Results of Repo.all()
    # [
    #   {"arms", 30.0, ~N[2023-03-03 21:23:19.000000], 35, 5, "bicep long head",
    #    "seated bicep curl"},
    #   {"arms", 30.0, ~N[2023-03-03 21:23:19.000000], 25, 6, "bicep short head",
    #    "preacher curl"},
    #   {"chest", 35.0, ~N[2023-03-04 21:23:19.000000], 180, 4, "chest",
    #    "bench press"},
    #   {"chest", 35.0, ~N[2023-03-04 21:23:19.000000], 40, 6, "chest", "cable flys"}
    # ]
  end
end
