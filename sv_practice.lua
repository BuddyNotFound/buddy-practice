RegisterNetEvent('practicerouting',function(bucket)
    local src = source
    local bucketid = bucket
    if bucketid ~= nil then
    SetPlayerRoutingBucket(src, bucketid)
    print(GetPlayerName(src) .. " Send To : " ..bucketid)
    end
end)