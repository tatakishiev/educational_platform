defmodule EducationalPlatform.Courses do
  @moduledoc """
  The Courses context.
  """

  import Ecto.Query, warn: false
  alias EducationalPlatform.Repo

  alias EducationalPlatform.Courses.Lessons

  @doc """
  Returns the list of lesson.

  ## Examples

      iex> list_lesson()
      [%Lessons{}, ...]

  """
  def list_lesson do
    Repo.all(Lessons)
  end

  @doc """
  Gets a single lessons.

  Raises `Ecto.NoResultsError` if the Lessons does not exist.

  ## Examples

      iex> get_lessons!(123)
      %Lessons{}

      iex> get_lessons!(456)
      ** (Ecto.NoResultsError)

  """
  def get_lessons!(id), do: Repo.get!(Lessons, id)

  @doc """
  Creates a lessons.

  ## Examples

      iex> create_lessons(%{field: value})
      {:ok, %Lessons{}}

      iex> create_lessons(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_lessons(attrs \\ %{}) do
    %Lessons{}
    |> Lessons.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a lessons.

  ## Examples

      iex> update_lessons(lessons, %{field: new_value})
      {:ok, %Lessons{}}

      iex> update_lessons(lessons, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_lessons(%Lessons{} = lessons, attrs) do
    lessons
    |> Lessons.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a lessons.

  ## Examples

      iex> delete_lessons(lessons)
      {:ok, %Lessons{}}

      iex> delete_lessons(lessons)
      {:error, %Ecto.Changeset{}}

  """
  def delete_lessons(%Lessons{} = lessons) do
    Repo.delete(lessons)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking lessons changes.

  ## Examples

      iex> change_lessons(lessons)
      %Ecto.Changeset{data: %Lessons{}}

  """
  def change_lessons(%Lessons{} = lessons, attrs \\ %{}) do
    Lessons.changeset(lessons, attrs)
  end

  alias EducationalPlatform.Courses.Class

  @doc """
  Returns the list of class.

  ## Examples

      iex> list_class()
      [%Class{}, ...]

  """
  def list_class do
    Repo.all(Class)
  end

  @doc """
  Gets a single class.

  Raises `Ecto.NoResultsError` if the Class does not exist.

  ## Examples

      iex> get_class!(123)
      %Class{}

      iex> get_class!(456)
      ** (Ecto.NoResultsError)

  """
  def get_class!(id), do: Repo.get!(Class, id)

  @doc """
  Creates a class.

  ## Examples

      iex> create_class(%{field: value})
      {:ok, %Class{}}

      iex> create_class(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_class(attrs \\ %{}) do
    %Class{}
    |> Class.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a class.

  ## Examples

      iex> update_class(class, %{field: new_value})
      {:ok, %Class{}}

      iex> update_class(class, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_class(%Class{} = class, attrs) do
    class
    |> Class.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a class.

  ## Examples

      iex> delete_class(class)
      {:ok, %Class{}}

      iex> delete_class(class)
      {:error, %Ecto.Changeset{}}

  """
  def delete_class(%Class{} = class) do
    Repo.delete(class)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking class changes.

  ## Examples

      iex> change_class(class)
      %Ecto.Changeset{data: %Class{}}

  """
  def change_class(%Class{} = class, attrs \\ %{}) do
    Class.changeset(class, attrs)
  end
end
