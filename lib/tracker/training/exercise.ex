defmodule Tracker.Training.Exercise do
  use Ecto.Schema

  schema "exercise" do
    field :body_part, :string
    field :name, :string
    field :equipment, :string
    field :description, :string
  end
end
