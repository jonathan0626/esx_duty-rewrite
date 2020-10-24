ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('duty:onoff')
AddEventHandler('duty:onoff', function(job)

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local job = xPlayer.job.name
    local grade = xPlayer.job.grade
	local bandage = xPlayer.getInventoryItem("bandage")["count"]
	local medikit = xPlayer.getInventoryItem("medikit")["count"]
	local playerLoadout = {}
    
    if  job == 'mechanic' or job == 'taxi' then
        xPlayer.setJob('off' ..job, grade)
        TriggerClientEvent('esx:showNotification', _source, _U('offduty'))
	elseif  job == 'police' then
		for i=1, #xPlayer.loadout, 1 do
		xPlayer.removeWeapon(xPlayer.loadout[i].name)
		end
		xPlayer.setJob('off' ..job, grade)
        TriggerClientEvent('esx:showNotification', _source, _U('offduty'))
	elseif  job == 'ambulance' then
        xPlayer.setJob('off' ..job, grade)
		xPlayer.removeInventoryItem("bandage", bandage)
		xPlayer.removeInventoryItem("medikit", medikit)
        TriggerClientEvent('esx:showNotification', _source, _U('offduty'))		
    elseif job == 'offpolice' then
        xPlayer.setJob('police', grade)
        TriggerClientEvent('esx:showNotification', _source, _U('onduty'))
    elseif job == 'offambulance' then
        xPlayer.setJob('ambulance', grade)
        TriggerClientEvent('esx:showNotification', _source, _U('onduty'))
    elseif job == 'offmechanic' then
        xPlayer.setJob('mechanic', grade)
        TriggerClientEvent('esx:showNotification', _source, _U('onduty'))
    elseif job == 'offtaxi' then
        xPlayer.setJob('taxi', grade)
        TriggerClientEvent('esx:showNotification', _source, _U('onduty'))
    end

end)