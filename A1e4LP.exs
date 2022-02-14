defmodule Binar do
    def search(nums, target) do
        len = tuple_size(nums)
        first = 0
        last = len - 1
        search(nums, target, first, last)
    end

    def search(nums, target, first, last) do
        mid = div((last+first),2)
        cond do

    end

end