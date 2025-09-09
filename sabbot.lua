if NAPOL_LOADED then
    return
end

loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/3f6bc2e1a8ac531ffc1648b38e950d45.lua"))()

local started = os.clock()

while true do task.wait()
    if not NAPOL_LOADED then
        if os.clock() - started >= 10 then
            started = os.clock()
            loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/3f6bc2e1a8ac531ffc1648b38e950d45.lua"))()
        end
    end
end
