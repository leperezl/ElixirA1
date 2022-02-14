defmodule Robot do
    def create(a,{b,c}) do
        case {a, {b,c}} do 
            {a, {b,c}} when  is_integer(b) and is_integer(c) ->
                create2(a, {b,c})
            {a, {b,c}} -> {:error, "not valid, coordenates need to be integers"}
        end
    end
    
    def create2(a, {b,c}) do
        case {a, {b,c}} do
            {a, {b,c}} -> {:north, {b,c}} 
            {a, {b,c}} -> {:south, {b,c}} 
            {:east, {b,c}} -> {:east, {b,c}}
            {:west, {b,c}} -> {:west, {b,c}}
            {_, {b,c}}->{:error, "not valid, direction needs to be correct"}
        end
    end
end