local RSGCore = exports['rsg-core']:GetCoreObject()

-----------------------------------------------------------------------
-- version checker
-----------------------------------------------------------------------
local function versionCheckPrint(_type, log)
    local color = _type == 'success' and '^2' or '^1'

    print(('^5['..GetCurrentResourceName()..']%s %s^7'):format(color, log))
end

local function CheckVersion()
    PerformHttpRequest('https://raw.githubusercontent.com/Rexshack-RedM/rsg-lawman/main/version.txt', function(err, text, headers)
        local currentVersion = GetResourceMetadata(GetCurrentResourceName(), 'version')

        if not text then 
            versionCheckPrint('error', 'Currently unable to run a version check.')
            return 
        end

        --versionCheckPrint('success', ('Current Version: %s'):format(currentVersion))
        --versionCheckPrint('success', ('Latest Version: %s'):format(text))
        
        if text == currentVersion then
            versionCheckPrint('success', 'You are running the latest version.')
        else
            versionCheckPrint('error', ('You are currently running an outdated version, please update to version %s'):format(text))
        end
    end)
end

-----------------------------------------------------------------------

RSGCore.Commands.Add("lawbadge", 'put on / take off badge', {}, false, function(source, args)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if Player.PlayerData.job.type == "leo" and Player.PlayerData.job.onduty then
        TriggerClientEvent("rsg-lawbadge:client:lawbadge", src)
    else
        TriggerClientEvent('ox_lib:notify', source, {title = '🚨', description = 'you must be on duty to wear your badge', type = 'error', duration = 5000 })
    end
end)

--------------------------------------------------------------------------------------------------
-- start version check
--------------------------------------------------------------------------------------------------
CheckVersion()
