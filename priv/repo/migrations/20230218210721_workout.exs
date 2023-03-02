defmodule Tracker.Repo.Migrations.Workout do
  use Ecto.Migration

  def change do
    create table("workout") do
      add :exercise_id, references(:exercise), null: false
      add :max_wieght, :integer
      add :num_sets, :integer
      add :total_workout_id, :integer

      timestamps()
    end
  end
end
