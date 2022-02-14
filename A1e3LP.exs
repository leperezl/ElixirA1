defmodule Counter do
    def count(s) do
        res = %{}
        fs = []
        case s do
            s when is_nil(s) -> {:error, "this is a nil value"}
            s when is_list(s)->  fs = s|> List.to_string() |> String.downcase() |>  String.replace(["~","...","/","!","@","#","$","%","^","&","*","(",")",".",",","/","<",";",">","'","?","[","]","{","}","|", "\n", "\t"]," ") |> String.split() |> spit(res)
            s -> fs =s |> String.downcase()|>
             String.replace(["~","...","/","!","@","#","$","%","^","&","*","(",")",".",",","/","<",";",">","'","?","[","]","{","}","|", "\n", "\t"]," ") |> 
             String.split() |> spit(res)

        end
        
    end
    
    def spit(g,map) do
        countRec(g,map)
        #Enum.frequencies(g)
    end
    def countRec([h|t], map) do
        map = value_add(h,map)
        countRec(t,map)
    end

    def countRec([], map) do
        map
    end

    def value_add(h, map) do
        if(is_nil(Map.get(map, h))) do
            map = Map.put(map, h, 1)
        else
            map = Map.put(map, h, Map.get(map, h)+1)
        end
    end
end