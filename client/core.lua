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


function TriggerCallback(name, cb, ...)
    EXTER.ServerCallbacks[name] = cb
    TriggerServerEvent('exter-rentacarv2:server:triggerCallback', name, ...)
end

RegisterNetEvent('exter-rentacarv2:client:triggerCallback', function(name, ...)
    if EXTER.ServerCallbacks[name] then
        EXTER.ServerCallbacks[name](...)
        EXTER.ServerCallbacks[name] = nil
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
    if CoreName == "qb-core" or CoreName == "qbx_core" then
        local player = Core.Functions.GetPlayer(source)
        player.Functions.AddItem(name, amount, false, metadata)
    elseif CoreName == "es_extended" then
        local player = Core.GetPlayerFromId(source)
        local hasQs = GetResourceState('qs-inventory') == 'started'
        local hasEsx = GetResourceState('esx_inventoryhud') == 'started'
        local hasOx = GetResourceState('ox_inventory') == 'started'

        if hasQs then
            return exports['qs-inventory']:AddItem(source, name, amount, false, metadata)
        elseif hasEsx then
            return player.addInventoryItem(name, amount)
        elseif hasOx then
            return exports["ox_inventory"]:AddItem(source, name, amount, metadata)
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



function GetVehicleProperties(vehicle)
    if CoreName == "qb-core" then
        if DoesEntityExist(vehicle) then
            local pearlescentColor, wheelColor = GetVehicleExtraColours(vehicle)

            local colorPrimary, colorSecondary = GetVehicleColours(vehicle)
            if GetIsVehiclePrimaryColourCustom(vehicle) then
                local r, g, b = GetVehicleCustomPrimaryColour(vehicle)
                colorPrimary = { r, g, b }
            end

            if GetIsVehicleSecondaryColourCustom(vehicle) then
                local r, g, b = GetVehicleCustomSecondaryColour(vehicle)
                colorSecondary = { r, g, b }
            end

            local extras = {}
            for extraId = 0, 12 do
                if DoesExtraExist(vehicle, extraId) then
                    local state = IsVehicleExtraTurnedOn(vehicle, extraId) == 1
                    extras[tostring(extraId)] = state
                end
            end

            local modLivery = GetVehicleMod(vehicle, 48)
            if GetVehicleMod(vehicle, 48) == -1 and GetVehicleLivery(vehicle) ~= 0 then
                modLivery = GetVehicleLivery(vehicle)
            end

            local tireHealth = {}
            for i = 0, 3 do
                tireHealth[i] = GetVehicleWheelHealth(vehicle, i)
            end

            local tireBurstState = {}
            for i = 0, 5 do
                tireBurstState[i] = IsVehicleTyreBurst(vehicle, i, false)
            end

            local tireBurstCompletely = {}
            for i = 0, 5 do
                tireBurstCompletely[i] = IsVehicleTyreBurst(vehicle, i, true)
            end

            local windowStatus = {}
            for i = 0, 7 do
                windowStatus[i] = IsVehicleWindowIntact(vehicle, i) == 1
            end

            local doorStatus = {}
            for i = 0, 5 do
                doorStatus[i] = IsVehicleDoorDamaged(vehicle, i) == 1
            end

            local xenonColor
            local hasCustom, r, g, b = GetVehicleXenonLightsCustomColor(vehicle)
            if hasCustom then
                xenonColor = table.pack(r, g, b)
            else
                xenonColor = GetVehicleXenonLightsColor(vehicle)
            end

            return {
                model = GetEntityModel(vehicle),
                plate = GetVehicleNumberPlateText(vehicle),
                plateIndex = GetVehicleNumberPlateTextIndex(vehicle),
                bodyHealth = Round(GetVehicleBodyHealth(vehicle), 0.1),
                engineHealth = Round(GetVehicleEngineHealth(vehicle), 0.1),
                tankHealth = Round(GetVehiclePetrolTankHealth(vehicle), 0.1),
                fuelLevel = Round(GetVehicleFuelLevel(vehicle), 0.1),
                dirtLevel = Round(GetVehicleDirtLevel(vehicle), 0.1),
                oilLevel = Round(GetVehicleOilLevel(vehicle), 0.1),
                color1 = colorPrimary,
                color2 = colorSecondary,
                pearlescentColor = pearlescentColor,
                dashboardColor = GetVehicleDashboardColour(vehicle),
                wheelColor = wheelColor,
                wheels = GetVehicleWheelType(vehicle),
                wheelSize = GetVehicleWheelSize(vehicle),
                wheelWidth = GetVehicleWheelWidth(vehicle),
                tireHealth = tireHealth,
                tireBurstState = tireBurstState,
                tireBurstCompletely = tireBurstCompletely,
                windowTint = GetVehicleWindowTint(vehicle),
                windowStatus = windowStatus,
                doorStatus = doorStatus,
                neonEnabled = {
                    IsVehicleNeonLightEnabled(vehicle, 0),
                    IsVehicleNeonLightEnabled(vehicle, 1),
                    IsVehicleNeonLightEnabled(vehicle, 2),
                    IsVehicleNeonLightEnabled(vehicle, 3)
                },
                neonColor = table.pack(GetVehicleNeonLightsColour(vehicle)),
                interiorColor = GetVehicleInteriorColour(vehicle),
                extras = extras,
                tyreSmokeColor = table.pack(GetVehicleTyreSmokeColor(vehicle)),
                xenonColor = xenonColor,
                modSpoilers = GetVehicleMod(vehicle, 0),
                modFrontBumper = GetVehicleMod(vehicle, 1),
                modRearBumper = GetVehicleMod(vehicle, 2),
                modSideSkirt = GetVehicleMod(vehicle, 3),
                modExhaust = GetVehicleMod(vehicle, 4),
                modFrame = GetVehicleMod(vehicle, 5),
                modGrille = GetVehicleMod(vehicle, 6),
                modHood = GetVehicleMod(vehicle, 7),
                modFender = GetVehicleMod(vehicle, 8),
                modRightFender = GetVehicleMod(vehicle, 9),
                modRoof = GetVehicleMod(vehicle, 10),
                modEngine = GetVehicleMod(vehicle, 11),
                modBrakes = GetVehicleMod(vehicle, 12),
                modTransmission = GetVehicleMod(vehicle, 13),
                modHorns = GetVehicleMod(vehicle, 14),
                modSuspension = GetVehicleMod(vehicle, 15),
                modArmor = GetVehicleMod(vehicle, 16),
                modKit17 = GetVehicleMod(vehicle, 17),
                modTurbo = IsToggleModOn(vehicle, 18),
                modKit19 = GetVehicleMod(vehicle, 19),
                modSmokeEnabled = IsToggleModOn(vehicle, 20),
                modKit21 = GetVehicleMod(vehicle, 21),
                modXenon = IsToggleModOn(vehicle, 22),
                modFrontWheels = GetVehicleMod(vehicle, 23),
                modBackWheels = GetVehicleMod(vehicle, 24),
                modCustomTiresF = GetVehicleModVariation(vehicle, 23),
                modCustomTiresR = GetVehicleModVariation(vehicle, 24),
                modPlateHolder = GetVehicleMod(vehicle, 25),
                modVanityPlate = GetVehicleMod(vehicle, 26),
                modTrimA = GetVehicleMod(vehicle, 27),
                modOrnaments = GetVehicleMod(vehicle, 28),
                modDashboard = GetVehicleMod(vehicle, 29),
                modDial = GetVehicleMod(vehicle, 30),
                modDoorSpeaker = GetVehicleMod(vehicle, 31),
                modSeats = GetVehicleMod(vehicle, 32),
                modSteeringWheel = GetVehicleMod(vehicle, 33),
                modShifterLeavers = GetVehicleMod(vehicle, 34),
                modAPlate = GetVehicleMod(vehicle, 35),
                modSpeakers = GetVehicleMod(vehicle, 36),
                modTrunk = GetVehicleMod(vehicle, 37),
                modHydrolic = GetVehicleMod(vehicle, 38),
                modEngineBlock = GetVehicleMod(vehicle, 39),
                modAirFilter = GetVehicleMod(vehicle, 40),
                modStruts = GetVehicleMod(vehicle, 41),
                modArchCover = GetVehicleMod(vehicle, 42),
                modAerials = GetVehicleMod(vehicle, 43),
                modTrimB = GetVehicleMod(vehicle, 44),
                modTank = GetVehicleMod(vehicle, 45),
                modWindows = GetVehicleMod(vehicle, 46),
                modKit47 = GetVehicleMod(vehicle, 47),
                modLivery = modLivery,
                modKit49 = GetVehicleMod(vehicle, 49),
                liveryRoof = GetVehicleRoofLivery(vehicle),
            }
        else
            return
        end
    elseif CoreName == "es_extended" then
        if not DoesEntityExist(vehicle) then
            return
        end
    
        local colorPrimary, colorSecondary = GetVehicleColours(vehicle)
        local pearlescentColor, wheelColor = GetVehicleExtraColours(vehicle)
        local hasCustomPrimaryColor = GetIsVehiclePrimaryColourCustom(vehicle)
        local dashboardColor = GetVehicleDashboardColor(vehicle)
        local interiorColor = GetVehicleInteriorColour(vehicle)
        local customPrimaryColor = nil
        if hasCustomPrimaryColor then
            customPrimaryColor = { GetVehicleCustomPrimaryColour(vehicle) }
        end
    
        local hasCustomXenonColor, customXenonColorR, customXenonColorG, customXenonColorB = GetVehicleXenonLightsCustomColor(vehicle)
        local customXenonColor = nil
        if hasCustomXenonColor then
            customXenonColor = { customXenonColorR, customXenonColorG, customXenonColorB }
        end
    
        local hasCustomSecondaryColor = GetIsVehicleSecondaryColourCustom(vehicle)
        local customSecondaryColor = nil
        if hasCustomSecondaryColor then
            customSecondaryColor = { GetVehicleCustomSecondaryColour(vehicle) }
        end
    
        local extras = {}
        for extraId = 0, 20 do
            if DoesExtraExist(vehicle, extraId) then
                extras[tostring(extraId)] = IsVehicleExtraTurnedOn(vehicle, extraId)
            end
        end
    
        local doorsBroken, windowsBroken, tyreBurst = {}, {}, {}
        local numWheels = tostring(GetVehicleNumberOfWheels(vehicle))
    
        local TyresIndex = { -- Wheel index list according to the number of vehicle wheels.
            ["2"] = { 0, 4 }, -- Bike and cycle.
            ["3"] = { 0, 1, 4, 5 }, -- Vehicle with 3 wheels (get for wheels because some 3 wheels vehicles have 2 wheels on front and one rear or the reverse).
            ["4"] = { 0, 1, 4, 5 }, -- Vehicle with 4 wheels.
            ["6"] = { 0, 1, 2, 3, 4, 5 }, -- Vehicle with 6 wheels.
        }
    
        if TyresIndex[numWheels] then
            for _, idx in pairs(TyresIndex[numWheels]) do
                tyreBurst[tostring(idx)] = IsVehicleTyreBurst(vehicle, idx, false)
            end
        end
    
        for windowId = 0, 7 do -- 13
            RollUpWindow(vehicle, windowId) --fix when you put the car away with the window down
            windowsBroken[tostring(windowId)] = not IsVehicleWindowIntact(vehicle, windowId)
        end
    
        local numDoors = GetNumberOfVehicleDoors(vehicle)
        if numDoors and numDoors > 0 then
            for doorsId = 0, numDoors do
                doorsBroken[tostring(doorsId)] = IsVehicleDoorDamaged(vehicle, doorsId)
            end
        end
    
        return {
            model = GetEntityModel(vehicle),
            doorsBroken = doorsBroken,
            windowsBroken = windowsBroken,
            tyreBurst = tyreBurst,
            tyresCanBurst = GetVehicleTyresCanBurst(vehicle),
            plate = Trim(GetVehicleNumberPlateText(vehicle)),
            plateIndex = GetVehicleNumberPlateTextIndex(vehicle),
    
            bodyHealth = Round(GetVehicleBodyHealth(vehicle), 1),
            engineHealth = Round(GetVehicleEngineHealth(vehicle), 1),
            tankHealth = Round(GetVehiclePetrolTankHealth(vehicle), 1),
    
            fuelLevel = Round(GetVehicleFuelLevel(vehicle), 1),
            dirtLevel = Round(GetVehicleDirtLevel(vehicle), 1),
            color1 = colorPrimary,
            color2 = colorSecondary,
            customPrimaryColor = customPrimaryColor,
            customSecondaryColor = customSecondaryColor,
    
            pearlescentColor = pearlescentColor,
            wheelColor = wheelColor,
    
            dashboardColor = dashboardColor,
            interiorColor = interiorColor,
    
            wheels = GetVehicleWheelType(vehicle),
            windowTint = GetVehicleWindowTint(vehicle),
            xenonColor = GetVehicleXenonLightsColor(vehicle),
            customXenonColor = customXenonColor,
    
            neonEnabled = { IsVehicleNeonLightEnabled(vehicle, 0), IsVehicleNeonLightEnabled(vehicle, 1), IsVehicleNeonLightEnabled(vehicle, 2), IsVehicleNeonLightEnabled(vehicle, 3) },
    
            neonColor = table.pack(GetVehicleNeonLightsColour(vehicle)),
            extras = extras,
            tyreSmokeColor = table.pack(GetVehicleTyreSmokeColor(vehicle)),
    
            modSpoilers = GetVehicleMod(vehicle, 0),
            modFrontBumper = GetVehicleMod(vehicle, 1),
            modRearBumper = GetVehicleMod(vehicle, 2),
            modSideSkirt = GetVehicleMod(vehicle, 3),
            modExhaust = GetVehicleMod(vehicle, 4),
            modFrame = GetVehicleMod(vehicle, 5),
            modGrille = GetVehicleMod(vehicle, 6),
            modHood = GetVehicleMod(vehicle, 7),
            modFender = GetVehicleMod(vehicle, 8),
            modRightFender = GetVehicleMod(vehicle, 9),
            modRoof = GetVehicleMod(vehicle, 10),
            modRoofLivery = GetVehicleRoofLivery(vehicle),
    
            modEngine = GetVehicleMod(vehicle, 11),
            modBrakes = GetVehicleMod(vehicle, 12),
            modTransmission = GetVehicleMod(vehicle, 13),
            modHorns = GetVehicleMod(vehicle, 14),
            modSuspension = GetVehicleMod(vehicle, 15),
            modArmor = GetVehicleMod(vehicle, 16),
    
            modTurbo = IsToggleModOn(vehicle, 18),
            modSmokeEnabled = IsToggleModOn(vehicle, 20),
            modXenon = IsToggleModOn(vehicle, 22),
    
            modFrontWheels = GetVehicleMod(vehicle, 23),
            modCustomFrontWheels = GetVehicleModVariation(vehicle, 23),
            modBackWheels = GetVehicleMod(vehicle, 24),
            modCustomBackWheels = GetVehicleModVariation(vehicle, 24),
    
            modPlateHolder = GetVehicleMod(vehicle, 25),
            modVanityPlate = GetVehicleMod(vehicle, 26),
            modTrimA = GetVehicleMod(vehicle, 27),
            modOrnaments = GetVehicleMod(vehicle, 28),
            modDashboard = GetVehicleMod(vehicle, 29),
            modDial = GetVehicleMod(vehicle, 30),
            modDoorSpeaker = GetVehicleMod(vehicle, 31),
            modSeats = GetVehicleMod(vehicle, 32),
            modSteeringWheel = GetVehicleMod(vehicle, 33),
            modShifterLeavers = GetVehicleMod(vehicle, 34),
            modAPlate = GetVehicleMod(vehicle, 35),
            modSpeakers = GetVehicleMod(vehicle, 36),
            modTrunk = GetVehicleMod(vehicle, 37),
            modHydrolic = GetVehicleMod(vehicle, 38),
            modEngineBlock = GetVehicleMod(vehicle, 39),
            modAirFilter = GetVehicleMod(vehicle, 40),
            modStruts = GetVehicleMod(vehicle, 41),
            modArchCover = GetVehicleMod(vehicle, 42),
            modAerials = GetVehicleMod(vehicle, 43),
            modTrimB = GetVehicleMod(vehicle, 44),
            modTank = GetVehicleMod(vehicle, 45),
            modWindows = GetVehicleMod(vehicle, 46),
            modLivery = GetVehicleMod(vehicle, 48) == -1 and GetVehicleLivery(vehicle) or GetVehicleMod(vehicle, 48),
            modLightbar = GetVehicleMod(vehicle, 49),
        }
    end
end
