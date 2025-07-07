
module "rg" {
    source = "../../Modules/RG"
    rg_name = "rg-todo-app-dev"
    location = "East US"
}

module "dev_vnet" {
    depends_on = [ module.rg ]
    source = "../../Modules/VNET"
    vnet_name = "todo-vnet-dev"
    location = "East US"
    rg_name = "rg-todo-app-dev"
    address_space = ["10.60.0.0/16"]
}

module "subnet_fe_dev" {
    source = "../../Modules/SUBNET"
    depends_on = [ module.dev_vnet ]
    subnet_name = "fe-subnet-dev"
    rg_name = "rg-todo-app-dev"
    vnet_name = "todo-vnet-dev"
    address_prefixes = ["10.60.0.0/24"]
}

module "subnet_be_dev" {
    source = "../../Modules/SUBNET"
    depends_on = [ module.dev_vnet ]
    subnet_name = "be-subnet-dev"
    rg_name = "rg-todo-app-dev"
    vnet_name = "todo-vnet-dev"
    address_prefixes = ["10.60.1.0/24"]
}

module "pip_fe_dev" {
    source = "../../Modules/PIP"
    depends_on = [ module.rg ]
    pip_name = "fe-pip-dev"
    rg_name = "rg-todo-app-dev"
    location = "East US"
}

module "pip_be_dev" {
    source = "../../Modules/PIP"
    depends_on = [ module.rg ]
    pip_name = "be-pip-dev"
    rg_name = "rg-todo-app-dev"
    location = "East US"
}

module "fe_vm_dev" {
    source = "../../Modules/VM"
    depends_on = [module.subnet_fe_dev, module.pip_fe_dev, module.rg]
    nic_name = "fe-nic-dev"
    location = "East US"
    vm_name = "fe-vm-dev"
    rg_name = "rg-todo-app-dev"
    vnet_name = "dev-vnet"
    subnet_name = "dev-fe-subnet"
    pip_name = "fe-pip-dev"
}

module "keyvault" {
    source = "../../Modules/KV"
    kv_name = "kv-todo-app-dev"
    location = "East US"
    rg_name = "rg-todo-app-dev"

}

# module "db" {
#     source = "../../Modules/db"
#     mssql_server_name = "mssql-server-dev"
#     rg_name = "rg-todo-app-dev"
#     location = "East US"
#     mssql_db_name = "todo-db-dev"

    
#   }