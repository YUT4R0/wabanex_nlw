defmodule WabanexNlwWeb.Resolvers.Training do
  def create(%{input: params}, _context), do: WabanexNlw.Trainings.Create.call(params)
end
