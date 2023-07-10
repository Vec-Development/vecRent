Config = {}

Config.Rent = "qtarget" -- | qtarget | ox_target | ox_lib |
Config.PedModel = "a_m_m_business_01"

Config.Prices = {
  sultan = 100,
  futo = 110,
  faggio = 140
}

Config.Blips = {
  colour = 2,
  id = 225
}


Config.Rents = {
    legion = {
        title = "Legion | Rent",
        coords = vector3(222.08, -855.88, 29.2),
        heading = 334,
        vehicles = {
            {
                title = 'Sultan',
                icon = 'fas fa-car',
                description = 'Price: ' .. Config.Prices.sultan .. '$',
                event = 'vecRent:client:spawnVehicle',
                image = 'https://gtacars.net/images/f0d3d7573097ca3ece6f1ee26b81c71d',
                args = {vehicle = 'sultan', spawn = vector3(226.64, -854.08, 29.96), heading = 252, price = 100}
              },
              {
                title = 'Futo',
                icon = 'fas fa-car', 
                description = 'Price: ' .. Config.Prices.futo .. '$',
                event = 'vecRent:client:spawnVehicle',
                image = 'https://gtacars.net/images/8f09ecdb4bf6c5c1a64e10a8d9c92456',
                args = {vehicle = 'futo', spawn = vector3(226.64, -854.08, 29.96), heading = 252, price = 110}
              },
              {
                title = 'Faggio',
                icon = 'fas fa-motorcycle',
                description = 'Price: ' .. Config.Prices.faggio .. '$',
                event = 'vecRent:client:spawnVehicle',
                image = 'https://gtacars.net/images/490d53928ed54a3b2c656681ab98159c',
                args = {vehicle = 'faggio', spawn = vector3(226.64, -854.08, 29.96), heading = 252, price = 120}
              },
        }
    },
    sandy = {
        title = "Sandy | Rent",
        coords = vector3(1369.36, 3606.28, 33.88),
        heading = 220,
        vehicles = {
            {
                title = 'Sultan',
                icon = 'fas fa-car',
                description = 'Price: ' .. Config.Prices.sultan .. '$',
                event = 'vecRent:client:spawnVehicle',
                image = 'https://gtacars.net/images/f0d3d7573097ca3ece6f1ee26b81c71d',
                args = {vehicle = 'sultan', spawn = vector3(1375.64, 3604.76, 34.84), heading = 220, price = 100}, 
              },
              {
                title = 'Futo',
                icon = 'fas fa-car',
                description = 'Price: ' .. Config.Prices.sultan .. '$',
                event = 'vecRent:client:spawnVehicle',
                image = 'https://gtacars.net/images/8f09ecdb4bf6c5c1a64e10a8d9c92456',
                args = {vehicle = 'futo', spawn = vector3(1375.64, 3604.76, 34.84), heading = 220, price = 110}
              },
              {
                title = 'Faggio',
                icon = 'fas fa-motorcycle',
                description = 'Price: ' .. Config.Prices.faggio .. '$',
                event = 'vecRent:client:spawnVehicle',
                image = 'https://gtacars.net/images/490d53928ed54a3b2c656681ab98159c',
                args = {vehicle = 'faggio', spawn = vector3(1375.64, 3604.76, 34.84), heading = 220, price = 120}
              },
        }
    }
}