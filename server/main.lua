ESX = nil

-- ESX
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('sciroppo', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('sciroppo', 1)

	TriggerClientEvent('esx_basicneeds:sciroppo', source)
  TriggerClientEvent('esx_disease:guarigionetosse', source)
	
end)

ESX.RegisterUsableItem('antibiotico', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('antibiotico', 1)

	TriggerClientEvent('esx_disease:guarigionestomaco', source)
	
end)

ESX.RegisterUsableItem('antibioticorosacea', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('antibioticorosacea', 1)

	TriggerClientEvent('esx_disease:guarigionepelle', source)
	
end)

RegisterServerEvent('esx_disease:malato')
AddEventHandler('esx_disease:malato', function()
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.execute('UPDATE users SET malato = @malato WHERE identifier = @identifier',
	{
		['@malato'] = 'tosse',
		['@identifier']    = xPlayer.identifier
	})
end)

RegisterServerEvent('esx_disease:malatostomaco')
AddEventHandler('esx_disease:malatostomaco', function()
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.execute('UPDATE users SET malato = @malato WHERE identifier = @identifier',
	{
		['@malato'] = 'stomaco',
		['@identifier']    = xPlayer.identifier
	})
end)

RegisterServerEvent('esx_disease:malatopelle')
AddEventHandler('esx_disease:malatopelle', function()
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.execute('UPDATE users SET malato = @malato WHERE identifier = @identifier',
	{
		['@malato'] = 'rosacea',
		['@identifier']    = xPlayer.identifier
	})
end)

RegisterServerEvent('esx_disease:guarito')
AddEventHandler('esx_disease:guarito', function()
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.execute('UPDATE users SET malato = @malato WHERE identifier = @identifier',
	{
		['@malato'] = 'no',
		['@identifier']    = xPlayer.identifier
	})
end)

ESX.RegisterServerCallback('esx_disease:quadroclinico', function(source, cb)
    local _source = source
	local identifier = ESX.GetPlayerFromId(_source).identifier
    local userData = {}

    MySQL.Async.fetchAll('SELECT malato FROM users WHERE identifier = @identifier', {['@identifier'] = identifier},
    function (resulto)
        if (resulto[1] ~= nil) then
            malato = resulto[1].malato
            cb(malato)
        end
    end)
end)
