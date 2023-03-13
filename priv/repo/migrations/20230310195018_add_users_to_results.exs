defmodule Tracker.Repo.Migrations.AddUsersToResults do
  use Ecto.Migration

  def change do
    alter table("results") do
      add :user_id, references(:users)
    end
  end
end
