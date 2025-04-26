if napoleonLoaded then
    return
end

pcall(function()
    getgenv().napoleonLoaded = true
end)

local api = loadstring(
    game:HttpGet('https://sdkapi-public.luarmor.net/library.lua')
)()

local ID = game.PlaceId

local games = if ID == 73956553001240 or ID == 134314141048307 or ID == 109684591839194 or ID == 86789627188240 or ID == 6931042565 or ID == 74691681039273 or ID == 79136731857959 then
  -- // Volleyball legends
 '10231c45388ada5c77add5a7583a2b19'
    else
     nil

if games == nil then
    return print(games)
end

api.script_id = games

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local linkvertise = 'https://ads.luarmor.net/get_key?for=hubKey-bbTFbWlaffcB'
local keyFile = 'NAPOLEON_IS_THE_GREATEST_KEY.txt'

local function getKey()
    if isfile(keyFile) then
        return readfile(keyFile)
    end
end

local key = getKey()

local status = api.check_key(script_key or key)

if status.code == 'KEY_VALID' then
    script_key = script_key or key

    task.delay(2, function()
        Rayfield:Destroy()
    end)
    api.load_script()
    return
end

local Window = Rayfield:CreateWindow({
    Name = 'Napoleon',
    LoadingTitle = 'bonaparte.',
    LoadingSubtitle = 'by jvjir',
    Discord = {
        Enabled = true,
        Invite = 'bWzCFPk83g',
        RememberJoins = true,
    },
})

local tabKey = Window:CreateTab('Key', 4483362458)
local Input = tabKey:CreateInput({
    Name = 'Key Here',
    PlaceholderText = '...',
    OnEnter = true,
    Callback = function(key)
        local status = api.check_key(key)

        if status.code == 'KEY_VALID' then
            writefile(keyFile, key)
            script_key = script_key or key
            Rayfield:Destroy()
            api.load_script()
        else
            print(status.code)
        end
    end,
})

tabKey:CreateLabel('press enter to submit\ntap anywhere to submit')
tabKey:CreateButton({
    Name = 'Get key (linkvertise.com)',
    Callback = function()
        setclipboard(linkvertise)
    end,
})
