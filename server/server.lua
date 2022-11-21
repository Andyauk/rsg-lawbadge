local QRCore = exports['qr-core']:GetCoreObject()

QRCore.Commands.Add("lawbadge", 'put on / take off badge', {}, false, function(source, args)
    local src = source
    local Player = QRCore.Functions.GetPlayer(src)
    if Player.PlayerData.job.name == Config.LawJob and Player.PlayerData.job.onduty then
        TriggerClientEvent("rsg-lawbadge:client:lawbadge", src)
    else
        TriggerClientEvent('QRCore:Notify', src, 'you must be on duty to wear your badge', 'error')
    end
end)
