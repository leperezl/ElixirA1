defmodule Binar do
    def search(nums, target) do
        len = tuple_size(nums)
        first = 0
        last = len - 1
        search2(nums, target, first, last)
    end

    def search2(nums, target, first, last) do
        mid = div((last+first),2)
        cond do
        target < elem(nums, first) or target > elem(nums, last) -> {:not_found}
        target == elem(nums,mid) -> {:ok, {target}}
        target >= elem(nums,mid) and mid != first-> search2(nums,target, mid, last)
        target <= elem(nums,mid) and mid != last -> search2(nums,target, first, mid)
        true -> :not_found
        end
    end

end