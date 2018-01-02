defmodule FileFinder do
    def main(args) do
      args
        |> String.split(" ")
        |> parse_args
        |> finder([])
        |> List.flatten
    end
  
    def finder([path: path, filename: exp], acc) do 
     {:ok, files} = File.ls(path)
     finder(files, path, exp, acc)
    end
  
    def finder([], _actual_path, _exp, acc), do: acc
  
    def finder({:ok, files}, actual_path, exp, acc), do: finder(files, actual_path, exp, acc)
  
    def finder([head | tail], actual_path, exp, acc) do
      IO.puts "Procesando... #{head}"
      case File.dir? head do
        true ->
              {:ok, sub_files} = File.ls(Path.join(actual_path, head))
              subfinder = finder(sub_files, "#{actual_path}/#{head}", exp, []) 
              finder(tail, actual_path, exp, [subfinder | acc])
        false when head == exp -> finder(tail, actual_path, exp, ["#{actual_path}/#{exp}"|acc])
        false -> finder(tail, actual_path, exp, acc)
      end
    end

    # Command line parser

    def parse_args(args) do
        {[path: path, filename: file],_,_} = OptionParser.parse args
        [path: path, filename: file]
    end
  end