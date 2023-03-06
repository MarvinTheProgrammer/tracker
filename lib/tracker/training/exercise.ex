defmodule Tracker.Training.Exercise do
  use Ecto.Schema

  alias Tracker.Training.Sets

  schema "exercise" do
    has_many :sets, Sets
    field :body_part, :string
    field :name, :string
    field :equipment, :string
    field :description, :string
  end
end
