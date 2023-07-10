ESX = exports['es_extended']:getSharedObject()

ESX.RegisterServerCallback("vecRent:server:checkMoney", function(source, cb, price)
    xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getMoney() >= price then
        cb(true)
        xPlayer.removeInventoryItem("money", price)
    else
        cb(false)
    end
end)