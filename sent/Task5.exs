defmodule Store do
    def new do
        []
    end

    def add_item(inv, item) do
        [item | inv]
    end

    def add_size(inv,name, size, quantity) do
        item = search(inv,name)
        inv = List.delete(inv,item)
        itemF = Map.update!(item, :quantity_by_size, &(Map.put(&1, size, quantity)))
        [itemF | inv]
    end

    def remove_size(inv, name, size) do
        item = search(inv,name)
        inv = List.delete(inv,item)
        itemF = Map.update!(item, :quantity_by_size, &(Map.delete(&1, size)))
        [itemF | inv]
    end

    def sort_by_price(inv) do
        Enum.sort_by(inv, &(&1.price))
    end

    def increase_quantity( item, n) do
        keys = Map.keys(Map.get(item, :quantity_by_size))
        itemF = increase(keys,n,item)
    end

    def increase([h|t], n, item) do
        quants =Map.update!(Map.get(item, :quantity_by_size), h, &(&1 + n))
        item =Map.put(item, :quantity_by_size, quants)
        increase(t,n,item)
    end

    def increase( [], n, item) do
        item
    end
    

    def search([], name) do
        :no_item
    end

    def search([h|t], name) do
        cond do
            name == Map.get(h,name) -> h
            true -> search(t,name)
        end
    end
     
    def total_quantity(item) do
        keys = Map.keys(Map.get(item, :quantity_by_size))
        reply = total(keys, item,0)
    end

    def total([h|t], item, acc) do
        acc= Map.get(Map.get(item, :quantity_by_size), h) + acc
        total(t,item,acc)
    end

    def total( [], item, acc) do
        acc
    end

end

#%{name: "shirt", price: 40, quantity_by_size: %{L: 7, s: 5}}
#%{name: "Pants", price: 50, quantity_by_size: %{L: 1, s: 6}}