defmodule Triangle do
    def kind(a \\ 0,b \\ 0,c \\ 1000000000) do
        case {a,b,c} do
            {a,b,c} when( (a + b>= c) and (a+c >= b) and (b+c >=a))->
                #kind1(a,b,c)
                kind1(a,b,c)
            {a,b,c} -> {:error,'woa buddy, not a triangle'}
        end
        
    end

    def kind1(a,b,c) do
        case {a,b,c} do
            {a,a,a} -> {:ok, 'equilateral'}
            {a,a,_} -> {:ok, 'isosceles'}
            {a,_,a} -> {:ok, 'isosceles'}
            {_,b,b} -> {:ok, 'isosceles'}
            {_,_,_} -> {:ok, 'escalene'}
        end
    end
end