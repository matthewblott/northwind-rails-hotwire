Rails.application.routes.draw do
  devise_for(:employees, controllers: {sessions: "sessions"})
  resources(:login, only: [:index])

  # =========================================================================
  # Categories
  # =========================================================================
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

  # =========================================================================
  # Orders
  # =========================================================================

  get("/orders", to: "orders#index", as: "index_order")
  get("/orders/new", to: "orders#new", as: "new_order")
  get("/orders/:order_id", to: "orders#show", as: "show_order")
  get(
    "/orders/:order_id/edit",
    to: "orders#edit",
    as: "edit_order"
  )

  post("/orders", to: "orders#create", as: "create_order")
  patch("/orders/:order_id", to: "orders#update", as: "update_order")
  delete(
    "/orders/:order_id",
    to: "orders#destroy",
    as: "destroy_order"
  )

  # =========================================================================
  # Order Items
  # =========================================================================

  # resources(:order_items, only: [:index, :show, :new, :create, :edit, :update])
  # get("/orders/:order_id/items/new", to: "order_items#new")
  # get("/orders/:order_id/items", to: "order_items#index")
  # get("/orders/:order_id/items/:product_id", to: "order_items#show", as: "order_items_show")
  # get("/orders/:order_id/items/:product_id/edit", to: "order_items#edit")
  #
  # post("/orders/:order_id/items/new", to: "order_items#create")
  # put("/orders/:order_id/items/:product_id/edit", to: "order_items#update")
  # delete("/orders/:order_id/items/:product_id/edit", to: "order_items#destroy")

  # =========================================================================
  # Products
  # =========================================================================

  get("/products", to: "products#index", as: "index_product")
  get("/products/new", to: "products#new", as: "new_product")
  get("/products/:product_id", to: "products#show", as: "show_product")
  get(
    "/products/:product_id/edit",
    to: "products#edit",
    as: "edit_product"
  )

  post("/products", to: "products#create", as: "create_product")
  patch("/products/:product_id", to: "products#update", as: "update_product")
  delete(
    "/products/:product_id",
    to: "products#destroy",
    as: "destroy_product"
  )

  # =========================================================================
  # Regions
  # =========================================================================

  get("/regions", to: "regions#index", as: "index_region")
  get("/regions/new", to: "regions#new", as: "new_region")
  get("/regions/:region_id", to: "regions#show", as: "show_region")
  get(
    "/regions/:region_id/edit",
    to: "regions#edit",
    as: "edit_region"
  )

  post("/regions/search", to: "regions#search", as: "search_region")

  post("/regions", to: "regions#create", as: "create_region")
  patch("/regions/:region_id", to: "regions#update", as: "update_region")
  delete(
    "/regions/:region_id",
    to: "regions#destroy",
    as: "destroy_region"
  )

  # =========================================================================
  # Shippers
  # =========================================================================

  get("/shippers", to: "shippers#index", as: "index_shipper")
  get("/shippers/new", to: "shippers#new", as: "new_shipper")
  get("/shippers/:shipper_id", to: "shippers#show", as: "show_shipper")
  get(
    "/shippers/:shipper_id/edit",
    to: "shippers#edit",
    as: "edit_shipper"
  )

  post("/shippers", to: "shippers#create", as: "create_shipper")
  patch("/shippers/:shipper_id", to: "shippers#update", as: "update_shipper")
  delete(
    "/shippers/:shipper_id",
    to: "shippers#destroy",
    as: "destroy_shipper"
  )

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

  # =========================================================================
  # Supplier Addresses
  # =========================================================================

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
