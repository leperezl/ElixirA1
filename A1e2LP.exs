defmodule Robot do
    def create(a,{b,c}) do
        case {a, {b,c}} do 
            {a, {b,c}} when  is_nil(b) or is_nil(c) ->
                {:error, "not valid, coordenates need to be integers"}
            {a, {b,c}} -> create2(a, {b,c})
        end
    end

    def create2({:north, {b,c}}) do
         {:north, {b,c}}
    end

    def create2({:south, {b,c}}) do
        {:south, {b,c}}
    end
    def create2({:east, {b,c}}) do
        {:east, {b,c}}
    end

    def create2({:west, {b,c}}) do
        {:west, {b,c}}
    end

    def create2({_, {b,c}}) do
        {:error, "not valid, direction needs to be correct"}
    end

    

        #instruc  = R  and ppsotion = :north - > :east
    
end