defmodule Counter do
    def count(s) do
        case s do
            s when is_nil(s) -> {:error, "this is a nil value"}
            s when is_list(s)->  fs = s|> List.to_string() |> String.downcase() |>  String.replace(["~","...","/","!","@","#","$","%","^","&","*","(",")",".",",","/","<",";",">","'","?","[","]","{","}","|", "\n", "\t"]," ") |> String.split( " ")
            s -> fs = s |> String.downcase()|> String.replace(["~","...","/","!","@","#","$","%","^","&","*","(",")",".",",","/","<",";",">","'","?","[","]","{","}","|", "\n", "\t"]," ") |> String.split( " ")

        end
    def countRec(ma, str) do
        res = %{}
        

    end
end