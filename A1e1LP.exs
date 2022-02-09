defmodule Task1_P1 do
    def kind(a,b,c) do
        case {a,b,c} do
            {a,b,c} when( (a + b>= c) and (a+c >= b) and (b+c >=a))->
                "heyy"
            {a,b,c} -> {:error,String.t(woa buddy)}
        end
        
    end
end