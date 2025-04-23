local Players = game:GetService('Players')

local TeleportCheck = false

queueteleport = (syn and syn.queue_on_teleport)
    or queue_on_teleport
    or (fluxus and fluxus.queue_on_teleport)

return function(scripts)
    Players.LocalPlayer.OnTeleport:Connect(function(State)
        if not TeleportCheck and queueteleport then
            TeleportCheck = true
            queueteleport(scripts)
        end
    end)
end
