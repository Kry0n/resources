

local ped = GetPlayerPed(-1)
local veh = GetVehiclePedIsIn(ped)
local upsideDown = AddVehicleUpsidedownCheck(veh)
	if upsideDown ~= ("1409026")
		then
			SetVehicleEngineHeatlth(veh, -4000)
		
	end