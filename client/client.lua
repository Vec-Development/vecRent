ESX = exports['es_extended']:getSharedObject()

RegisterNetEvent("vecRent:client:spawnVehicle")
AddEventHandler("vecRent:client:spawnVehicle", function(data)
	for k, v in pairs(Config.Rents) do
		if ESX.Game.IsSpawnPointClear(data.spawn, 5) then
            ESX.TriggerServerCallback("vecRent:server:checkMoney", function(have)
                if have then
                    ESX.Game.SpawnVehicle(data.vehicle, data.spawn, data.heading, function(vehicle)
                        print("succes" .. vehicle )
                    end)
                else
                    ESX.ShowNotification(Strings.noEnoughMoney)
                end
            end, data.price)
        else
            ESX.ShowNotification(Strings.spawnBlocked)
        end
	end
end)

RegisterNetEvent("vecRent:client:openMenu")
AddEventHandler("vecRent:client:openMenu", function()
    for k, v in pairs(Config.Rents) do
        lib.registerContext({
            id = 'rent',
            title = v.title,
            options = v.vehicles
        })
        lib.showContext('rent')
    end
end)

Citizen.CreateThread(function()
	for k, v in pairs(Config.Rents) do
        RequestModel(GetHashKey(Config.PedModel))
	    while not HasModelLoaded(GetHashKey(Config.PedModel)) do
	    Wait(1)
	end
	    PostaviPeda = CreatePed(4, Config.PedModel, v.coords , v.heading, false, true)
	    FreezeEntityPosition(PostaviPeda, true) 
	    SetEntityInvincible(PostaviPeda, true)
	    SetBlockingOfNonTemporaryEvents(PostaviPeda, true)
    end
end)

Citizen.CreateThread(function()
    for k, v in pairs(Config.Rents) do
        if Config.Rent == "qtarget" then
            exports.qtarget:AddTargetModel({Config.PedModel}, {
                options = {
                    {
                        event = "vecRent:client:openMenu",
                        icon = Strings.rentIcon,
                        label = Strings.targetRent
                    },
                },
                distance = 1.5
            })
        elseif Config.Rent == "ox_target" then
            exports.ox_target:addModel(Config.PedModel, {
                {
                    event = "vecRent:client:openMenu",
                    icon = Strings.rentIcon,
                    label = Strings.targetRent,
                    distance = 1.5
                }
            })
        elseif Config.Rent == "ox_lib" then
            while true do 
                Wait(0)
                sleep = true
                if #(GetEntityCoords(PlayerPedId()) - v.coords) < 2.0 then 
                    sleep = false
                    lib.showTextUI(Strings.textuvecRent, {
                        icon = Strings.rentIcon
                    })
                    if IsControlJustPressed(0, 38) then 
                        TriggerEvent('vecRent:client:openMenu')
                    end
                else
                    lib.hideTextUI()
                end
                if sleep then 
                    Wait(1312)
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    for k, v in pairs(Config.Rents) do
        local blip = AddBlipForCoord(v.coords)
        SetBlipSprite (blip, Config.Blips.id)
		SetBlipDisplay(blip, 4)
		SetBlipScale  (blip, 0.8)
		SetBlipColour (blip, Config.Blips.colour)
		SetBlipAsShortRange(blip, true)
        SetBlipHighDetail(blip, true)
		BeginTextCommandSetBlipName('STRING')
		AddTextComponentSubstringPlayerName(v.title)
		EndTextCommandSetBlipName(blip)
    end
end)