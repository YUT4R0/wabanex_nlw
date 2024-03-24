defmodule WabanexNlwWeb.Schema.Types.User do
  use Absinthe.Schema.Notation
  import_types WabanexNlwWeb.Schema.Types.Custom.UUID4

  @desc "User schema (logic representing a user)"
  object :user do
    field :id, non_null(:uuid4)
    field :name, non_null(:string)
    field :email, non_null(:string)
  end

  @desc "User mutation (logic representing a user creation)"
  input_object :create_user_input do
    field :name, non_null(:string), description: "User name"
    field :email, non_null(:string), description: "User email"
    field :password, non_null(:string), description: "User password"
  end
end
