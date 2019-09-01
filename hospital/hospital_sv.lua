RegisterServerEvent('hospital:price')
AddEventHandler('hospital:price', function()
  	local price = 500
	TriggerEvent('es:getPlayerFromId', source, function(user)
  	user:removeBlackMoney((price))
 	end)
end)
