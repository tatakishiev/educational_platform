defmodule EducationalPlatformWeb.ClassHTML do
  use EducationalPlatformWeb, :html

  embed_templates "class_html/*"

  @doc """
  Renders a class form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def class_form(assigns)
end
