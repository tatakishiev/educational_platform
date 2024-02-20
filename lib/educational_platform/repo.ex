defmodule EducationalPlatform.Repo do
  use Ecto.Repo,
    otp_app: :educational_platform,
    adapter: Ecto.Adapters.Postgres
end
