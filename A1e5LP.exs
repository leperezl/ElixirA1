defmodule Store do
    def new do
        []
    end

    def add_item(inv, item) do
        [item | inv]
    end
end

#%{name: "shirt", price: 40, quantity_by_size: %{L: 7, s: 5}}
#%{name: "Pants", price: 50, quantity_by_size: %{L: 1, s: 6}}