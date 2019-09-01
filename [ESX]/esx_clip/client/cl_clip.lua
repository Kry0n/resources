ESX          = nil




Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx_clip:clipcli')
AddEventHandler('esx_clip:clipcli', function()
  local ped = GetPlayerPed(-1)
  if IsPedArmed(ped, 4) then
    local hash = GetSelectedPedWeapon(ped)
    local blackweapons = {
        [-2084633992],
        [171789620],
        [-275439685],
        [-771403250],
        [2017895192],
        [-1357824103],
        [-1121678507],
        [1627465347],
        [-619010992]
    }

    if blackweapons[hash] then
      TriggerServerEvent('esx_clip:remove')
      AddAmmoToPed(ped, hash, 25)
      ESX.ShowNotification("Weapon is a black weapon")
    else
      ESX.ShowNotification("Weapon is not a black weapon")
    end
  else 
    -- Player does not have a gun? I dont think this else is needed
    ESX.ShowNotification("ce type de munition ne convient pas")
  end
end)
