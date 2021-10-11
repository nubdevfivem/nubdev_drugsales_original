ESX = nil
TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

for k, v in pairs(Config.DrugsList) do
    ESX.RegisterUsableItem(v.Name, function(source, args)
        TriggerClientEvent("nubdev_drugsales:startsales",source,v.Name,math.random(v.Price[1],v.Price[2]))
    end)
end

RegisterNetEvent("nubdev_drugsales:sellsuccess")
AddEventHandler("nubdev_drugsales:sellsuccess",function(item,price)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    xPlayer.removeInventoryItem(item, 1)
    xPlayer.addAccountMoney('black_money', price)
end)

ESX.RegisterServerCallback("nubdev_drugsales:checkpolice",function(src,cb)
    cb(CheckPolice())
end)

function CheckPolice()
    local cops = 0
    local xPlayers = ESX.GetPlayers()
    for i = 1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        if xPlayer.job.name == 'police' then
            cops = cops + 1
        end
    end
    return cops
end