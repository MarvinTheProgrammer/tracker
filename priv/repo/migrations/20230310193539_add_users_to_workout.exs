defmodule Tracker.Repo.Migrations.AddUsersToWorkout do
  use Ecto.Migration

  def change do
    alter table("workout") do
      add :user_id, references(:users)
    end
  end
end
