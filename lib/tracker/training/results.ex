defmodule Tracker.Training.Results do
  use Ecto.Schema

  schema "results" do
    field :waist, :float
    field :arms, :float
    field :weight, :float

    timestamps()
  end
end
