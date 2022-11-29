--local QBCore = exports["qb-core"]:GetCoreObject()  -- IF YOU ARE USING QBCORE
local inprac = false
local ped = 's_m_y_swat_01'
kd = 0
local locations = {
    {x = -1294.09, y = -3388.15, z = 13.94, h = 13.94}, 
    {x = -1292.09, y = -3388.15, z = 13.94, h = 13.94}, 
    {x = -1287.09, y = -3388.15, z = 13.94, h = 13.94}, 
    {x = -1282.09, y = -3386.15, z = 13.94, h = 13.94}, 
    {x = -1284.09, y = -3383.15, z = 13.94, h = 13.94},
    {x = -1286.09, y = -3378.15, z = 13.94, h = 13.94},
    {x = -1288.09, y = -3389.15, z = 13.94, h = 13.94},
    {x = -1290.09, y = -3384.15, z = 13.94, h = 13.94},
    {x = -1292.09, y = -3375.15, z = 13.94, h = 13.94},
    {x = -1261.09, y = -3397.15, z = 13.94, h = 13.94}, 
    {x = -1264.09, y = -3393.15, z = 13.94, h = 13.94},
    {x = -1268.09, y = -3400.15, z = 13.94, h = 13.94},
    {x = -1272.09, y = -3402.15, z = 13.94, h = 13.94},
    {x = -1274.09, y = -3393.15, z = 13.94, h = 13.94},
}

RegisterCommand('leave',function()
    local playerped = PlayerPedId()
    SetEntityCoords(playerped, playercoordsback)
    --exports['qb-core']:HideText() -- IF YOU ARE USING QBCORE
    SetPedInfiniteAmmoClip(playerped,false)
    TriggerServerEvent("practicerouting", 0)
end)


RegisterCommand('practice',function()
    playercoordsback = GetEntityCoords(PlayerPedId())
    local playerped = PlayerPedId()
    inprac = true
    local tpcoords = vector3(-1263.17, -3360.49, 13.95)
    TriggerServerEvent("practicerouting", math.random(1,65535))
    SetEntityCoords(playerped,tpcoords)
    SetPedInfiniteAmmoClip(playerped, true)
    RequestModel(ped)
    while not HasModelLoaded(ped) do 
        Citizen.Wait(1)
    end
    while inprac do 
        Wait(0)
        local plyCoords = GetEntityCoords(playerped, false)
        local dis = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, -1263.17, -3360.49, 13.95)
        --exports['qb-core']:DrawText('Do /leave to exit','right') -- IF YOU ARE USING QBCORE
        if dis >= 30 then
            inprac = false
            SetEntityCoords(PlayerPedId(),playercoordsback)
        end
            if pvpped == nil then
                local location = locations[math.random(#locations)]
        pvpped = CreatePed(4,ped,location.x,location.y,location.z,0.0,false,false)
            elseif pvpped ~= nil then
                local pvppedhealth = GetEntityHealth(pvpped)
                if pvppedhealth <= 0 then
                local location = locations[math.random(#locations)]
                kd = kd + 1
               -- QBCore.Functions.Notify("Killed Dummys : " .. kd) -- IF YOU ARE USING QBCORE
                DeletePed(pvpped)
                pvpped = CreatePed(4,ped,location.x,location.y,location.z,0.0,false,false)
            end
        end
    end
end)


