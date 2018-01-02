defmodule Commandline.CLI do  #do not forget the namespace here
  def main(args) do
    {opts,_,_} = OptionParser.parse(args,switches: [path: :string, filename: :string], aliases: [f: :filename])
    FileFinder.main(opts)
  end
end