ESX                           = nil

local lastatm = 0

Citizen.CreateThread(function ()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(5)
    end
end)
		
Citizen.CreateThread(function()
    while true do

Citizen.Wait(5)
        local entitty, distance = ESX.Game.GetClosestObject({
            'prop_atm_02',
			'prop_atm_03',
			'prop_fleeca_atm',
      '3424098598'
        })
	
        if distance ~= -1 and distance <= 1.3 then

            if entitty ~= nil then
			

					local atmCoords = GetEntityCoords(entitty)
					ESX.Game.Utils.DrawText3D({ x = atmCoords.x, y = atmCoords.y, z = atmCoords.z + 1.5 }, '[H] Hack ATM', 0.4)
                    ESX.TriggerServerCallback('hack:anycops', function(anycops)
                    if anycops >= Config.CopsRequired then
                    if IsControlJustReleased(0, 74) then
                    if lastatm ~= entitty then
                       lastatm = entitty
                       OpemAtm()
                
					   										
                    else
                        ESX.ShowNotification('You\'ve already attempted to hack this machine')
                    end
                  end
                end
              end
end)
            else
                Citizen.Wait(500)
            end
        else
            Citizen.Wait(1000)
        end
    end
end)



					  

function OpemAtm()
	TriggerServerEvent('hack:hackatm1')
	FreezeEntityPosition(PlayerPedId(), true)
    RegisterNetEvent('alertATM')
    AddEventHandler('alertATM', function()
  pedIsTryingToSellDrugs = true
  local plyPos = GetEntityCoords(GetPlayerPed(-1),  true)
    local s1, s2 = Citizen.InvokeNative( 0x2EB41072B4C1E4C0, plyPos.x, plyPos.y, plyPos.z, Citizen.PointerValueInt(), Citizen.PointerValueInt() )
    local street1 = GetStreetNameFromHashKey(s1)
    local street2 = GetStreetNameFromHashKey(s2)

  ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

  local sex = nil
  if skin.sex == 0 then
  sex = "Male"
  else
  sex = "Female"
  end
  TriggerServerEvent('atmInProgressPos', plyPos.x, plyPos.y, plyPos.z)
  if s2 == 0 then
  TriggerServerEvent('atmInProgressS1', street1, sex)
  elseif s2 ~= 0 then
  TriggerServerEvent('atmInProgress', street1, street2, sex)
  end


  end)

end)
	exports['progressBars']:startUI(180000, "Hacking ATM...") ---This is the part you add
    Citizen.Wait(1800000)
    TriggerServerEvent('hack:hackatm')
	FreezeEntityPosition(PlayerPedId(), false)
    ClearPedTasksImmediately(PlayerPedId())
	DeleteObject(prop)
end


--Tablet
RegisterNetEvent('hack:tablet')
AddEventHandler('hack:tablet', function(prop_name, secondaryprop_name)
	if IsAnimated then
		local prop_name = prop_name or 'prop_cs_tablet'
		local playerPed = GetPlayerPed(-1)
		DeleteObject(prop)
		IsAnimated = false
	elseif not IsAnimated then
		local prop_name = 'prop_cs_tablet'
    	IsAnimated = true
		local playerPed = GetPlayerPed(-1)
	    Citizen.CreateThread(function()
	        local x,y,z = table.unpack(GetEntityCoords(playerPed))
			prop = CreateObject(GetHashKey(prop_name), x, y, z+0.2,  true,  true, true)
			AttachEntityToEntity(prop, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 57005), 0.17, 0.10, -0.13, 20.0, 180.0, 180.0, true, true, false, true, 1, true) -- tablet
	        RequestAnimDict('amb@world_human_seat_wall_tablet@female@base')
	        while not HasAnimDictLoaded('amb@world_human_seat_wall_tablet@female@base') do
	            Citizen.Wait(100)
	        end
            TaskPlayAnim(playerPed, 'amb@world_human_seat_wall_tablet@female@base', 'base', 3.0, -8, -1, 49, 0, 0, 0, 0)
	    end)
	end
end)
