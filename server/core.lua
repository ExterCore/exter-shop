Core = nil
CoreName = nil
CoreReady = false
Citizen.CreateThread(function()
    for k, v in pairs(Cores) do
        if GetResourceState(v.ResourceName) == "starting" or GetResourceState(v.ResourceName) == "started" then
            CoreName = v.ResourceName
            Core = v.GetFramework()
            CoreReady = true
            print("Core is ready: " .. CoreName)
        end
    end
end)

function GetPlayer(source)
    if CoreName == "qb-core" or CoreName == "qbx_core" then
        local player = Core.Functions.GetPlayer(source)
        return player
    elseif CoreName == "es_extended" then
        local player = Core.GetPlayerFromId(source)
        return player
    end
end

function GetPlayerCid(source)
    if CoreName == "qb-core" then
        local player = Core.Functions.GetPlayer(source)
        return player.PlayerData.citizenid
    elseif CoreName == "es_extended" then
        local player = Core.GetPlayerFromId(source)
        return player.getIdentifier()
    end
end


function Notify(source, text, length, type)
    if CoreName == "qb-core" or CoreName == "qbx_core" then
        Core.Functions.Notify(source, text, length, type)
    elseif CoreName == "es_extended" then
        local player = Core.GetPlayerFromId(source)
        player.showNotification(text)
    end
end

function GetPlayerMoney(src, type)
    if CoreName == "qb-core" or CoreName == "qbx_core" then
        local player = Core.Functions.GetPlayer(src)
        return player.PlayerData.money[type]
    elseif CoreName == "es_extended" then
        local player = Core.GetPlayerFromId(src)
        local acType = "bank"
        if type == "cash" then
            acType = "money"
        end
        local account = player.getAccount(acType).money
        return account
    end
end

function RemoveMoney(src, type, amount, description)
    if CoreName == "qb-core" or CoreName == "qbx_core" then
        local player = Core.Functions.GetPlayer(src)
        player.Functions.RemoveMoney(type, amount, description)
    elseif CoreName == "es_extended" then
        local player = Core.GetPlayerFromId(src)
        if type == "bank" then
            player.removeAccountMoney("bank", amount, description)
        elseif type == "cash" then
            player.removeMoney(amount, description)
        end
    end
end

function AddItem(source, name, amount, metadata)
    if (CoreName == "qb-core" or CoreName == "qbx_core") and Config.OldInv ~= "ox"  then
        local player = Core.Functions.GetPlayer(source)
        player.Functions.AddItem(name, amount, false, metadata)
    elseif (CoreName == "qb-core" or CoreName == "qbx_core") and Config.OldInv == "ox" then
        local player = Core.Functions.GetPlayer(source)
        exports['ox_inventory']:AddItem(source, name, amount)
    elseif CoreName == "es_extended" then
        local player = Core.GetPlayerFromId(source)
        local hasQs = GetResourceState('qs-inventory') == 'started'
        local hasEsx = GetResourceState('esx_inventoryhud') == 'started'
        local hasOx = GetResourceState('ox_inventory') == 'started'
        local hasPa = GetResourceState('ox_inventory') == 'started'

        if hasQs then
            return exports['qs-inventory']:AddItem(source, name, amount, false, metadata)
        elseif hasEsx then
            return player.addInventoryItem(name, amount)
        elseif hasOx then
            return exports["ox_inventory"]:AddItem(source, name, amount, metadata)
        elseif hasPa then
            exports['ox_inventory']:AddItem(source, name, amount)
        else
            --CUSTOM INVENTORY ADD ITEM FUNCTION HERE
        end

    end
end

function RemoveItem(source, name, amount, metadata)
    if CoreName == "qb-core" or CoreName == "qbx_core" then
        local player = Core.Functions.GetPlayer(source)
        player.Functions.RemoveItem(name, amount, metadata)
    elseif CoreName == "es_extended" then
        local player = Core.GetPlayerFromId(source)
        local hasQs = GetResourceState('qs-inventory') == 'started'
        local hasEsx = GetResourceState('esx_inventoryhud') == 'started'
        local hasOx = GetResourceState('ox_inventory') == 'started'

        if hasQs then
            return exports['qs-inventory']:RemoveItem(source, name, amount, metadata)
        elseif hasEsx then
            return player.removeInventoryItem(name, amount)
        elseif hasOx then
            return exports["ox_inventory"]:RemoveItem(source, name, amount, metadata)
        else
            --CUSTOM INVENTORY REMOVE ITEM FUNCTION HERE
        end
    end
end

function GetItem(source, name)
    if CoreName == "qb-core" or CoreName == "qbx_core" then
        local player = Core.Functions.GetPlayer(source)
        return player.Functions.GetItemByName(name)
    elseif CoreName == "es_extended" then
        local player = Core.GetPlayerFromId(source)
        local hasQs = GetResourceState('qs-inventory') == 'started'
        local hasEsx = GetResourceState('esx_inventoryhud') == 'started'
        local hasOx = GetResourceState('ox_inventory') == 'started'

        if hasQs then
            return exports['qs-inventory']:GetItem(source, name)
        elseif hasEsx then
            return player.getInventoryItem(name)
        elseif hasOx then
            return exports["ox_inventory"]:GetItem(source, name,nil, false)
        else
            --CUSTOM INVENTORY GET ITEM FUNCTION HERE
        end
    end
end

function GetItemCount (source,item)
    if CoreName == "qb-core" or CoreName == "qbx_core" then
        local player = Core.Functions.GetPlayer(source)
        return item.amount
    elseif CoreName == "es_extended" then
        local player = Core.GetPlayerFromId(source)
        local hasQs = GetResourceState('qs-inventory') == 'started'
        local hasEsx = GetResourceState('esx_inventoryhud') == 'started'
        local hasOx = GetResourceState('ox_inventory') == 'started'

        if hasQs then
            return exports['qs-inventory']:GetItem(source, item).amount
        elseif hasOx or hasEsx then
            return player.getInventoryItem(item).count
        -- elseif hasOx then
        --     return exports["ox_inventory"]:GetItem(source, item).amount
        else
            --CUSTOM INVENTORY GET ITEM COUNT FUNCTION HERE
        end
    end
end


function GetItems(source, name)
    if CoreName == "qb-core" or CoreName == "qbx_core" then
        local player = Core.Functions.GetPlayer(source)
        
        return player.Functions.GetItemsByName(name)
    elseif CoreName == "es_extended" then
        local player = Core.GetPlayerFromId(source)
        local hasQs = GetResourceState('qs-inventory') == 'started'
        local hasEsx = GetResourceState('esx_inventoryhud') == 'started'
        local hasOx = GetResourceState('ox_inventory') == 'started'

        if hasQs then
            return exports['qs-inventory']:GetItemsByName(source, name)
        elseif hasOx or hasEsx then
            return player.getInventoryItem(name)
        -- elseif hasOx then
        --     return exports["ox_inventory"]:GetItem(source,name, nil, false)
        else
            --CUSTOM INVENTORY GET ITEMS BY NAME FUNCTION HERE
        end
    end
end

function GetInventory(source)
    if CoreName == "qb-core" or CoreName == "qbx_core" then
        local player = Core.Functions.GetPlayer(source)
        return player.PlayerData.items
    elseif CoreName == "es_extended" then
        local player = Core.GetPlayerFromId(source)
        local hasQs = GetResourceState('qs-inventory') == 'started'
        local hasEsx = GetResourceState('esx_inventoryhud') == 'started'
        local hasOx = GetResourceState('ox_inventory') == 'started'

        if hasQs then
            return exports['qs-inventory']:GetPlayerInventory(source)
        elseif hasEsx then
            return player.getInventory()
        elseif hasOx then
            return exports["ox_inventory"]:GetPlayerInventory(source)
        else
            --CUSTOM INVENTORY GET INVENTORY FUNCTION HERE
        end
    end
end

function ItemCheckForCraft(player,reqItem)
    if CoreName == "qb-core" or CoreName == "qbx_core" then
        local items = player.PlayerData.items
        local tbl = {}

        for x, y in pairs(items) do
            for k, v in pairs(reqItem) do
                if y.name == v.requredItemName then
                    table.insert(tbl, {name = v.requredItemName, count = y.amount})
                end
            end
        end
        return tbl

    elseif CoreName == "es_extended" then
        local items = player.getInventory()
        local tbl = {}

        for x, y in pairs(items) do
            for k, v in pairs(reqItem) do
                if y.name == v.requredItemName then
                    table.insert(tbl, {name = v.requredItemName, count = y.count})
                end
            end
        end
        return tbl

    end
end


function ItemCountControl(source, name, amount)
    if CoreName == "qb-core" or CoreName == "qbx_core" then
        local player = Core.Functions.GetPlayer(source)
        return player.Functions.GetItemByName(name).amount >= amount
    elseif CoreName == "es_extended" then
        local player = Core.GetPlayerFromId(source)
        local hasQs = GetResourceState('qs-inventory') == 'started'
        local hasEsx = GetResourceState('esx_inventoryhud') == 'started'
        local hasOx = GetResourceState('ox_inventory') == 'started'

        if hasQs then
            return exports['qs-inventory']:GetItem(source, name).amount >= amount
        elseif hasEsx then
            return player.getInventoryItem(name).count >= amount
        elseif hasOx then
            return exports["ox_inventory"]:GetItem(source, name).amount >= amount
        else
            --CUSTOM INVENTORY ITEM COUNT CONTROL FUNCTION HERE
        end
    end
end


function RegisterUseableItem(name)
    while CoreReady == false do Citizen.Wait(0) end
    if CoreName == "qb-core" or CoreName == "qbx_core" then
        Core.Functions.CreateUseableItem(name, function(source, item)
        end)
    elseif CoreName == "es_extended" then
        local hasQs = GetResourceState('qs-inventory') == 'started'
        if hasQs then
            Core.RegisterUsableItem(name, function(source, item)
            end)
            return
        end
        Core.RegisterUsableItem(k, function(source, _, item)
        end)
    end
end

Config.ServerCallbacks = {}
function CreateCallback(name, cb)
    Config.ServerCallbacks[name] = cb
end

function TriggerCallback(name, source, cb, ...)
    if not Config.ServerCallbacks[name] then return end
    Config.ServerCallbacks[name](source, cb, ...)
end

RegisterNetEvent('exter-rentacarv2:server:triggerCallback', function(name, ...)
    local src = source
    TriggerCallback(name, src, function(...)
        TriggerClientEvent('exter-rentacarv2:client:triggerCallback', src, name, ...)
    end, ...)
end)