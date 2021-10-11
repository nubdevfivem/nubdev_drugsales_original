ESX = nil
local Open = false
local Callback = nil
local Working = true

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
        end)
        Citizen.Wait(0)
    end
end)

RegisterNetEvent("nubdev_minigamecard:openui")
AddEventHandler("nubdev_minigamecard:openui", function(timeout, cb)
    Callback = nil
    Working = true
    if Working then
        openui(timeout)
        Citizen.CreateThread(function()
            while Working do
                if Callback == "win" then
                    cb("win")
                    Working = false
                elseif Callback == "loss" then
                    cb("loss")
                    Working = false
                elseif Callback == "timeout" then
                    cb("timeout")
                    Working = false
                end
                Wait(10)
            end
        end)
    end
end)

function closeui()
    SetNuiFocus(false, false)
end

RegisterNUICallback("timeout", function(data, cb)
    Open = false
    closeui()
    Callback = "timeout"
    cb('ok')
end)

RegisterNUICallback("success", function(data, cb)
    closeui()
    Callback = data.result
    cb('ok')
end)

function openui(timeout)
    Open = true
    SetNuiFocus(true, true)
    SendNUIMessage({
        ui = true,
        timeout = timeout
    })
end
