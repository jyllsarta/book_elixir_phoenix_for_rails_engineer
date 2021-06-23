defmodule BookElixirPhoenixForRailsEngineer.Posts do
  @moduledoc """
  The Posts context.
  """

  import Ecto.Query, warn: false
  alias BookElixirPhoenixForRailsEngineer.Repo

  alias BookElixirPhoenixForRailsEngineer.Posts.Post
  alias BookElixirPhoenixForRailsEngineer.Users.User

  @doc """
  Returns the list of posts.

  ## Examples

      iex> list_posts()
      [%Post{}, ...]

  """
  def list_posts do
    Repo.all(Post)
  end

  @doc """
  Returns the list of posts created by the user.
  """
  def list_posts(%User{} = user) do
    Post
    # ここ本が間違えてるじゃん、 P12の |> Post.filter_by_user(Post, user) の通りだと Postを二重に渡して引数多すぎエラーになる
    # ...がサンプルコードは今後の章で修正されてしまっているのでプルリクが送れない
    |> Post.filter_by_user(user) 
    |> Repo.all()
  end

  @doc """
  Gets a single post.

  Raises `Ecto.NoResultsError` if the Post does not exist.

  ## Examples

      iex> get_post!(123)
      %Post{}

      iex> get_post!(456)
      ** (Ecto.NoResultsError)

  """
  def get_post!(id), do: Repo.get!(Post, id)

  @doc """
  Gets a single post created by the user.
  """
  def get_post!(%User{} = user, id) do
    Post
    |> Post.filter_by_user(user)
    |> Repo.get!(id)
  end

  @doc """
  Creates a post.

  ## Examples

      iex> create_post(%{field: value})
      {:ok, %Post{}}

      iex> create_post(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_post(attrs \\ %{}) do
    %Post{}
    |> Post.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a post.

  ## Examples

      iex> update_post(post, %{field: new_value})
      {:ok, %Post{}}

      iex> update_post(post, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_post(%Post{} = post, attrs) do
    post
    |> Post.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a post.

  ## Examples

      iex> delete_post(post)
      {:ok, %Post{}}

      iex> delete_post(post)
      {:error, %Ecto.Changeset{}}

  """
  def delete_post(%Post{} = post) do
    Repo.delete(post)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking post changes.

  ## Examples

      iex> change_post(post)
      %Ecto.Changeset{data: %Post{}}

  """
  def change_post(%Post{} = post, attrs \\ %{}) do
    Post.changeset(post, attrs)
  end
end
