Citizen.CreateThread(function()        
        RegisterNetEvent('exter-shop:makePayment', function(type, price, basket)
            local src = source
            local xPlayer = GetPlayer(src)
            if GetPlayerMoney(src,type) >= tonumber(price) then
                RemoveMoney(src, type, tonumber(price))
                for k, v in pairs(basket) do
                    AddItem(src, v.name, v.amount)
                end
                Notify(src, Config.Notify["success"], 'success')
            else
                Notify(src, Config.Notify["error"], 'error')
            end
        end)
end)