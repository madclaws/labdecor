defmodule Labdecor do
  @colorCode ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f"]

  def main(_) do
    create_folder()
    color_value = get_color_code(7, "#")
    write_settings_file(color_value)
  end

  defp create_folder do
    case File.mkdir(".vscode") do
      :ok -> IO.puts("folder created successfully")
      {:error, err} -> IO.puts("Error occured, #{err}")
    end
  end


  def get_color_code(0, _) do
    ""
  end

  def get_color_code(num, color) do
      color <> get_color_code(num - 1, Enum.random(@colorCode))
  end

  defp write_settings_file(color_value) do
    settings_string = "{\n\t\"workbench.colorCustomizations\": {\n\t\t\"titleBar.activeBackground\": \"#{color_value}\",\n\t\t\"titleBar.inactiveBackground\": \"#{color_value}\"\n\t}\n}"
    case File.write(".vscode\\settings.json", settings_string) do
      :ok -> IO.puts("Settings created successfully")
      {:error, error} -> IO.puts("Error occured due to #{error}")
    end
  end

end
