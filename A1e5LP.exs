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
    

    def search([], name) do
        :no_item
    end

    def search([h|t], name) do
        cond do
            name == Map.get(h,:name) -> h
            true -> search(t,name)
        end
    end

end

#%{name: "shirt", price: 40, quantity_by_size: %{L: 7, s: 5}}
#%{name: "Pants", price: 50, quantity_by_size: %{L: 1, s: 6}}