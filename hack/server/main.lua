ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('hack:hackatm')
AddEventHandler('hack:hackatm', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local randomMoney = math.random(500, 2500)
	
        xPlayer.addMoney(randomMoney)
        TriggerClientEvent('esx:showNotification', src, 'You stole some change and recieved $' .. randomMoney .. '!')
    end)
	
	
RegisterServerEvent('hack:hackatm1')
AddEventHandler('hack:hackatm1', function()
	TriggerClientEvent('hack:tablet', source)
	TriggerClientEvent("alertATM", source)
    end)



RegisterServerEvent('atmInProgress')
AddEventHandler('atmInProgress', function(street1, street2, sex)
	local _source = source
	local xPlayers = ESX.GetPlayers(_source)
	for i=1, #xPlayers, 1 do
 	local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
 	if xPlayer.job.name == 'police' then
		TriggerClientEvent('chat:addMessage', xPlayers[i], { args = { "^*^1Dispatch: ", "ATM being tampered with by a " .. sex .." on "..street1 .. " and " ..street2 }, color = 255,255,0 })
		end
	end


end)

RegisterServerEvent('atmInProgressS1')
AddEventHandler('atmInProgressS1', function(street1, sex)
	local _source = source
	local xPlayers = ESX.GetPlayers(_source)
	for i=1, #xPlayers, 1 do
 		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
 		if xPlayer.job.name == 'police' then
			TriggerClientEvent('chat:addMessage', xPlayers[i], { args = { "^*^1Dispatch: ", "ATM being tampered with by a " .. sex .." on "..street1 }, color = 255,255,0 })
		end
	end


end)