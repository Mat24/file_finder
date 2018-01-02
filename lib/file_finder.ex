defmodule FileFinder do
    def main(args) do
      find_result = args
        |> finder([])
        |> List.flatten
      IO.inspect find_result
    end
  
    def finder([path: path, filename: exp], acc) do 
        files = case File.ls(path) do
            {:ok, result} -> result
            {:error, _} -> []
        end
     
     finder(files, path, exp, acc)
    end
  
    def finder([], _actual_path, _exp, acc), do: acc
  
    def finder({:ok, files}, actual_path, exp, acc), do: finder(files, actual_path, exp, acc)
  
    def finder([head | tail], actual_path, exp, acc) do
      IO.puts "Processing... #{Path.join(actual_path,head)}"
      case File.dir? head do
        true ->
              new_path = Path.join(actual_path,head)
              subfinder = finder([path: new_path, filename: exp], []) 
              finder(tail, actual_path, exp, [subfinder | acc])
        false when head == exp -> finder(tail, actual_path, exp, ["#{actual_path}/#{exp}"|acc])
        false -> finder(tail, actual_path, exp, acc)
      end
    end
end