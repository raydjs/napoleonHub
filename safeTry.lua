return function(fn, interval: number?)
    while true do task.wait(interval or .02) 
        local success, data = pcall(function()
            return fn()    
        end)

        if success then
            return data
        end
    end
end
