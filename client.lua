ESX = nil
local IsDead = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

function SetDisplay(bool)
    SendNUIMessage({
        type = "show",
        status = bool,
        timer = GlobalState.Zaman ,
 
    })

    SendNUIMessage({action = 'starttimer', value = GlobalState.Zaman})

    SendNUIMessage({action = 'showbutton'})

	SetNuiFocus(bool, bool)
end

AddEventHandler('esx:onPlayerDeath', function(data)
    SetDisplay(true, true)
    IsDead = true

    
    Citizen.Wait(GlobalState.Zaman * 60 * 1000)

    if IsDead then
        respawn()
    end
end)

AddEventHandler('playerSpawned', function(spawn)
    SetDisplay(false, false)
    IsDead = false
end)

RegisterNUICallback("bildirim", function(data)
    -- SendNUIMessage({action = 'hidebutton'})
    TriggerEvent("ab-PolisBildirim:BildirimGonder", "Yaralı Vatandaş", false)

 
    -- SetNuiFocus(false, false)
end)

function respawn()
    SetDisplay(false, false)
	SetEntityCoordsNoOffset(PlayerPedId(), GlobalState.ReviveKord, false, false, false, true)
    NetworkResurrectLocalPlayer(GlobalState.ReviveKord, GlobalState.ReviveHeading, true, false)
	SetPlayerInvincible(PlayerPedId(), false)
	ClearPedBloodDamage(PlayerPedId())
end