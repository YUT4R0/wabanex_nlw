defmodule WabanexNlw.IMC do
  def calculate(%{"filename" => filename}) do
    filename |> File.read() |> handle_file()
  end

  defp handle_file({:ok, content}) do
    data = content
      |> String.replace("\r", "")
      |> String.split("\n")
      |> Enum.map(fn line -> parse_line(line) end)
      |> Enum.into(%{})
    {:ok, data}
  end
  defp handle_file({:error, _reason}), do: {:error, "Error while opening the file"}

  defp parse_line(line) do
    line
    |> String.split(",")
    |> List.update_at(1, &String.to_float/1)
    |> List.update_at(2, &String.to_float/1)
    |> calculate_imc()
    |> IO.inspect()
  end

  defp calculate_imc([name, h, weight]), do: {name, weight / (h * h)}
end
