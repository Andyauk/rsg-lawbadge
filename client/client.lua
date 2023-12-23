local RSGCore = exports['rsg-core']:GetCoreObject()
local badge = false

RegisterNetEvent('rsg-lawbadge:client:lawbadge', function()
    local ped = PlayerPedId()
    RSGCore.Functions.GetPlayerData(function(PlayerData)
        if PlayerData.job.type == "leo" then
            if badge == false then
                if not IsPedMale(ped) then -- female
                    Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), 0x0929677D, true, true, true) -- ApplyShopItemToPed
                    Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, false) -- UpdatePedVariation
                else -- male
                    Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), 0xDB4C451D, true, false, true) -- ApplyShopItemToPed
                    Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, false) -- UpdatePedVariation
                end
                lib.notify({ title = '🚨', description = 'badge put on', type = 'inform', duration = 5000 })
                badge = true
            else
                if not IsPedMale(ped) then -- female
                    Citizen.InvokeNative(0x0D7FFA1B2F69ED82, PlayerPedId(), 0x0929677D, 0, 0) -- RemoveShopItemFromPed
                    Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, false) -- UpdatePedVariation
                else -- male
                    Citizen.InvokeNative(0x0D7FFA1B2F69ED82, PlayerPedId(), 0xDB4C451D, 0, 0) -- RemoveShopItemFromPed
                    Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, false) -- UpdatePedVariation
                end
                lib.notify({ title = '🚨', description = 'badge taken off', type = 'inform', duration = 5000 })
                badge = false
            end
        else
            lib.notify({ title = '🚨', description = 'only a law person can do this', type = 'error', duration = 5000 })
        end
    end)
end)
