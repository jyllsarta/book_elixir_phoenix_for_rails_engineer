defmodule BookElixirPhoenixForRailsEngineer.Posts.Post do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query, warn: false

  alias BookElixirPhoenixForRailsEngineer.Users.User

  schema "posts" do
    field :body, :string
    belongs_to :user, User
    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:body, :user_id])
    |> validate_required([:body, :user_id])
  end

  @doc """
    Returns query filtered by user.
  """
  def filter_by_user(query, %User{id: user_id}) do
    from p in query, where: p.user_id == ^user_id
  end
end
