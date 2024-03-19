Rails.application.routes.draw do
  devise_for(:employees, controllers: {sessions: "sessions"})
  resources(:login, only: [:index])

  # # =========================================================================
  # # Categories
  # # =========================================================================
  #
  # resources(:categories, only: [:index, :show, :new, :create, :edit, :update])
  # post("/categories/new", to: "categories#create")
  # patch("/categories/:id/edit", to: "categories#update")
  # put("/categories/:id/edit", to: "categories#update")

  # =========================================================================
  # Customers
  # =========================================================================

  get("/customers", to: "customers#index", as: "index_customer")
  get("/customers/new", to: "customers#new", as: "new_customer")
  get("/customers/:customer_id", to: "customers#show", as: "show_customer")
  get(
    "/customers/:customer_id/edit",
    to: "customers#edit",
    as: "edit_customer"
  )

  post("/customers", to: "customers#create", as: "create_customer")
  patch("/customers/:customer_id", to: "customers#update", as: "update_customer")
  delete(
    "/customers/:customer_id",
    to: "customers#destroy",
    as: "destroy_customer"
  )

  # =========================================================================
  # Customer Addresses
  # =========================================================================

  get("/customers/:customer_id/addresses", to: "customer_addresses#index", as: "index_customer_address")
  get("/customers/:customer_id/addresses/new", to: "customer_addresses#new", as: "new_customer_address")
  get("/customers/:customer_id/addresses/:address_id", to: "customer_addresses#show", as: "show_customer_address")
  get(
    "/customers/:customer_id/addresses/:address_id/edit",
    to: "customer_addresses#edit",
    as: "edit_customer_address"
  )

  post("/customers/:customer_id/addresses", to: "customer_addresses#create", as: "create_customer_address")
  patch("/customers/:customer_id/addresses/:address_id", to: "customer_addresses#update", as: "update_customer_address")
  delete(
    "/customers/:customer_id/addresses/:address_id",
    to: "customer_addresses#destroy",
    as: "destroy_customer_address"
  )

  # =========================================================================
  # Employees
  # =========================================================================

  get("/employees", to: "employees#index", as: "index_employee")
  get("/employees/new", to: "employees#new", as: "new_employee")
  get("/employees/:employee_id", to: "employees#show", as: "show_employee")
  get(
    "/employees/:employee_id/edit",
    to: "employees#edit",
    as: "edit_employee"
  )

  post("/employees/search", to: "employees#search", as: "search_employee")

  post("/employees/:employee_id", to: "employees#create", as: "create_employee")
  patch("/employees/:employee_id", to: "employees#update", as: "update_employee")
  delete(
    "/employees/:employee_id",
    to: "employees#destroy",
    as: "destroy_employee"
  )

  # =========================================================================
  # Employee Addresses
  # =========================================================================

  get("/employees/:employee_id/addresses", to: "employee_addresses#index", as: "index_employee_address")
  get("/employees/:employee_id/addresses/new", to: "employee_addresses#new", as: "new_employee_address")
  get("/employees/:employee_id/addresses/:address_id", to: "employee_addresses#show", as: "show_employee_address")
  get(
    "/employees/:employee_id/addresses/:address_id/edit",
    to: "employee_addresses#edit",
    as: "edit_employee_address"
  )

  post("/employees/:employee_id/addresses", to: "employee_addresses#create", as: "create_employee_address")
  patch("/employees/:employee_id/addresses/:address_id", to: "employee_addresses#update", as: "update_employee_address")
  delete(
    "/employees/:employee_id/addresses/:address_id",
    to: "employee_addresses#destroy",
    as: "destroy_employee_address"
  )

  # # =========================================================================
  # # Orders
  # # =========================================================================
  #
  # resources(:orders, only: [:index, :show, :new, :create, :edit, :update])
  # get("orders/search", to: "orders#search")
  # post("/orders/new", to: "orders#create")
  # patch("/orders/:id/edit", to: "orders#update")
  # put("/orders/:id/edit", to: "orders#update")
  #
  # # =========================================================================
  # # Order Items
  # # =========================================================================
  #
  # resources(:order_items, only: [:index, :show, :new, :create, :edit, :update])
  # get("/orders/:order_id/items/new", to: "order_items#new")
  # get("/orders/:order_id/items", to: "order_items#index")
  # get("/orders/:order_id/items/:product_id", to: "order_items#show", as: "order_items_show")
  # get("/orders/:order_id/items/:product_id/edit", to: "order_items#edit")
  #
  # post("/orders/:order_id/items/new", to: "order_items#create")
  # put("/orders/:order_id/items/:product_id/edit", to: "order_items#update")
  # delete("/orders/:order_id/items/:product_id/edit", to: "order_items#destroy")

  # # =========================================================================
  # # Products
  # # =========================================================================
  #
  # resources(:products, only: [:index, :show, :new, :create, :edit, :update])
  # post("products/search", to: "products#search")
  # post("/products/new", to: "products#create")
  # patch("/products/:id/edit", to: "products#update")
  # put("/products/:id/edit", to: "products#update")

  # # =========================================================================
  # # Regions
  # # =========================================================================
  #
  # resources(:regions, only: [:index, :show, :new, :create, :edit, :update])
  # post("/regions/new", to: "regions#create")
  # patch("/regions/:id/edit", to: "regions#update")
  # put("/regions/:id/edit", to: "regions#update")

  # # =========================================================================
  # # Shippers
  # # =========================================================================
  #
  # resources(:shippers, only: [:index, :show, :new, :create, :edit, :update])
  # post("/shippers/new", to: "shippers#create")
  # patch("/shippers/:id/edit", to: "shippers#update")
  # put("/shippers/:id/edit", to: "shippers#update")

  # =========================================================================
  # Suppliers
  # =========================================================================

  get("/suppliers", to: "suppliers#index", as: "index_supplier")
  get("/suppliers/new", to: "suppliers#new", as: "new_supplier")
  get("/suppliers/:supplier_id", to: "suppliers#show", as: "show_supplier")
  get(
    "/suppliers/:supplier_id/edit",
    to: "suppliers#edit",
    as: "edit_supplier"
  )

  post("/suppliers/:supplier_id", to: "suppliers#create", as: "create_supplier")
  patch("/suppliers/:supplier_id", to: "suppliers#update", as: "update_supplier")
  delete(
    "/suppliers/:supplier_id",
    to: "suppliers#destroy",
    as: "destroy_supplier"
  )

  # # =========================================================================
  # # Supplier Addresses
  # # =========================================================================

  get("/suppliers/:supplier_id/addresses", to: "supplier_addresses#index", as: "index_supplier_address")
  get("/suppliers/:supplier_id/addresses/new", to: "supplier_addresses#new", as: "new_supplier_address")
  get("/suppliers/:supplier_id/addresses/:address_id", to: "supplier_addresses#show", as: "show_supplier_address")
  get(
    "/suppliers/:supplier_id/addresses/:address_id/edit",
    to: "supplier_addresses#edit",
    as: "edit_supplier_address"
  )

  post("/suppliers/:supplier_id/addresses", to: "supplier_addresses#create", as: "create_supplier_address")
  patch("/suppliers/:supplier_id/addresses/:address_id", to: "supplier_addresses#update", as: "update_supplier_address")
  delete(
    "/suppliers/:supplier_id/addresses/:address_id",
    to: "supplier_addresses#destroy",
    as: "destroy_supplier_address"
  )

  # =========================================================================
  # Home
  # =========================================================================

  root("home#index")
end
