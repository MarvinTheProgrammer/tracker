defmodule Tracker.Repo.Migrations.Workout do
  use Ecto.Migration

  def change do
    create table("workout") do
      add :workout_type, :string
      add :duration, :float
      timestamps()
    end
  end
end
