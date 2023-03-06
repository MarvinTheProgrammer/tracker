defmodule Tracker.Repo.Migrations.Sets do
  use Ecto.Migration

  def change do
    create table("sets") do
      add :workout_id, references(:workout), null: false
      add :exercise_id, references(:exercise), null: false
      add :max_weight, :integer
      add :num_sets, :integer
    end
  end
end
