defmodule Tracker.Repo.Migrations.Exercise do
  use Ecto.Migration

  def change do
    create table("exercise") do
      add :body_part, :string
      add :name, :string
      add :equipment, :string
      add :description, :text
    end
  end
end
