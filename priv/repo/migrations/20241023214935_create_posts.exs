defmodule VishalRs.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :stringm, null: false
      add :body, :text, null: false
      add :published, :boolean, default: false, null: false

      timestamps(type: :utc_datetime)
    end
  end
end
