defmodule WabanexNlwWeb.Schema.Types.Training do
  use Absinthe.Schema.Notation

  import_types WabanexNlwWeb.Schema.Types.Exercise

  @desc "Training schema (logic representing a Training)"
  object :training do
    field :id, non_null(:uuid4)
    field :start_date, non_null(:string)
    field :end_date, non_null(:string)
    field :exercises, list_of(:exercise)
  end

  @desc "Training mutation (logic representing a Training creation)"
  input_object :create_training_input do
    field :user_id, non_null(:uuid4)
    field :start_date, non_null(:string)
    field :end_date, non_null(:string)
    field :exercises, list_of(:create_exercise_input)
  end
end
