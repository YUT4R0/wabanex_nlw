defmodule WabanexNlwWeb.Resolvers.User do
  def get(%{id: user_id}, _context), do: WabanexNlw.Users.Get.call(user_id)
  def create(%{input: params}, _context), do: WabanexNlw.Users.Create.call(params)
end
