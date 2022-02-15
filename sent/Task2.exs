defmodule Robot do

    def create(:north, {b,c}) do
        case {:north, {b,c}} do 
            {:north, {b,c}} when  is_nil(b) or is_nil(c) ->
                {:error, "not valid, coordenates need to be integers"}
            {:north, {b,c}} ->   {:north, {b,c}}
        end
    end

    def create(:south, {b,c}) do
        case {:south, {b,c}} do 
            {:south, {b,c}} when  is_nil(b) or is_nil(c) ->
                {:error, "not valid, coordenates need to be integers"}
            {:south, {b,c}} ->   {:south, {b,c}}
        end
    end
    def create(:east, {b,c}) do
        case {:east, {b,c}} do 
            {:east, {b,c}} when  is_nil(b) or is_nil(c) ->
                {:error, "not valid, coordenates need to be integers"}
            {:east, {b,c}} ->   {:east, {b,c}}
        end
    end

    def create(:west, {b,c}) do
        case {:west, {b,c}} do 
            {:west, {b,c}} when  is_nil(b) or is_nil(c) ->
                {:error, "not valid, coordenates need to be integers"}
            {:west, {b,c}} ->   {:west, {b,c}}
        end
    end

    def create(_, {b,c}) do
        {:error, "not valid, direction needs to be correct"}
    end

    def simulate(a, b) do
        ins = b |> String.upcase() |> String.split("",trim: true)
        run(a,ins)
    end

    def run(a,[]) do
        a
    end

    def run({a,{b,c}},[h|t]) do
        cond do
            {a,{b,c}} == {:north, {b,c}} and h == "R" -> run({:east, {b,c}}, t)
            {a,{b,c}} == {:south, {b,c}} and h == "R" -> run({:west, {b,c}} , t)
            {a,{b,c}} == {:east, {b,c}} and h == "R" -> run({:south, {b,c}}, t)
            {a,{b,c}} == {:west, {b,c}} and h == "R" -> run({:north, {b,c}}, t) 
            {a,{b,c}} == {:north, {b,c}} and h == "L" -> run({:west, {b,c}}, t) 
            {a,{b,c}} == {:south, {b,c}} and h == "L" -> run({:east, {b,c}},t)
            {a,{b,c}} == {:east, {b,c}} and h == "L" -> run({:north, {b,c}} , t)
            {a,{b,c}} == {:west, {b,c}} and h == "L" -> run({:south, {b,c}}, t )
            {a,{b,c}} == {:north, {b,c}} and h == "A" -> run({:north, {b,c+1}}, t )
            {a,{b,c}} == {:south, {b,c}} and h == "A" -> run({:south, {b,c-1}}, t )
            {a,{b,c}} == {:east, {b,c}} and h == "A" -> run({:east, {b+1,c}}, t )
            {a,{b,c}} == {:west, {b,c}} and h == "A" -> run({:west, {b-1,c}}, t)
        end
    end
        #instruc  = R  and ppsotion = :north - > :east
    def direction({a,{b,c}}) do
        a
    end

    def position({a,{b,c}}) do
        {b,c}
    end
end