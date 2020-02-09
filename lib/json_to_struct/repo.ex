defmodule JsonToStruct.Repo do
  use Ecto.Repo,
    otp_app: :json_to_struct,
    adapter: Ecto.Adapters.Postgres
end
