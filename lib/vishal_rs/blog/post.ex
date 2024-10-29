defmodule VishalRs.Blog.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :title, :string
    field :slug, :string
    field :body, :string
    field :published, :boolean, default: false

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :body, :slug, :published])
    |> validate_required([:title, :body, :published])
    |> slugify()
    |> unique_constraint(:slug)
  end

  def slugify(changeset) do
    if get_field(changeset, :slug) == nil do
      slug = get_field(changeset, :title) || ""

      slug = String.downcase(slug)
      |> String.replace(~r/[^a-zA-Z0-9 &]/, "")
      |> String.replace("&", "and")
      |> String.split()
      |> Enum.join("-")
      put_change(changeset, :slug, slug)
    else
      changeset
    end
  end
end

defimpl Phoenix.Param, for: VishalRs.Blog.Post do
  def to_param(%{slug: slug}) do
    "#{slug}"
  end
end
