# defmodule FileFinder do
#   def main(orig_path, filename, acc) do
     
#     [orig_path: orig_path, filename: filename]
#      |> validate_and_change_dir
#      |> list_dir_content
#      |> file_finder(filename,acc)

#   end

#   def validate_and_change_dir(keymap_values) do
#     case File.cd(keymap_values[:orig_path]) do
#       :ok -> keymap_values
#       _ -> raise "Directorio no valido: #{keymap_values[:orig_path]}"
#     end
#   end

#   def list_dir_content(keymap_values) doext install iampeterbanjo.elixirlinter
#     {:ok, content_list} = File.ls
#     content_list
#   end

#   def file_finder(file_list, filename,acc), do: file_finderp(file_list, filename, acc)

#   defp file_finderp([], _filename, acc), do: acc

#   defp file_finderp([head | tail], filename, acc) do
#     IO.puts "Elemento actual: #{head}, #{head == filename}"
#     {:ok, pwd} = File.cwd
#     cond do
#       head == filename -> file_finderp(tail, filename, ["Archivo encontrado en: #{pwd}/#{filename}" | acc])
#       File.dir?(head) -> file_finderp(main("#{head}", filename, acc), filename)
#       True -> file_finderp(tail, filename, acc)
#     end
    
#   end

# end


