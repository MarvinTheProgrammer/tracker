defmodule Tracker.Repo.Migrations.Results do
  use Ecto.Migration

  def change do
    create table("results") do
      add :waist, :float
      add :arms, :float
      add :weight, :float

      timestamps()
    end
  end
end
