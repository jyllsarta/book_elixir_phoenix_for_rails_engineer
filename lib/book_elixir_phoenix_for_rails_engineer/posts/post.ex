defmodule BookElixirPhoenixForRailsEngineer.Posts.Post do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query, warn: false
  use Waffle.Ecto.Schema

  alias BookElixirPhoenixForRailsEngineer.Users.User

  schema "posts" do
    field :body, :string
    field :image, BookElixirPhoenixForRailsEngineer.PostImageUploader.Type
    belongs_to :user, User
    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:body, :user_id])
    |> validate_required([:body, :user_id])
  end

  @doc false
  def image_changeset(post, attrs) do
    post
    |> cast_attachments(attrs, [:image])
    |> validate_required([:image])
  end

  @doc """
    Returns query filtered by user.
  """
  def filter_by_user(query, %User{id: user_id}) do
    from p in query, where: p.user_id == ^user_id
  end
end
