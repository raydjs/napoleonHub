if napoleonLoaded then
    return
end

pcall(function()
    getgenv().napoleonLoaded = true
end)

local api = loadstring(
    game:HttpGet('https://sdkapi-public.luarmor.net/library.lua')
)()

local TeleportService: TeleportService = cloneref(game:GetService("TeleportService"))

local repo = 'https://raw.githubusercontent.com/raydjs/Obsidian/main/'
local discord_link = 'discord.gg/bWzCFPk83g'
local Library = nil

while true do task.wait()
	local success, data = pcall(function()
		return loadstring(game:HttpGet(repo .. 'Library.lua'))()
	end)

	if success then
		Library = data
		break
	end
end

local ID = game.PlaceId

local games = if ID == 96802054849934 or ID == 73956553001240 or ID == 134314141048307 or ID == 109684591839194 or ID == 86789627188240 or ID == 6931042565 or ID == 74691681039273 or ID == 79136731857959 then
    -- // Volleyball legends
   '10231c45388ada5c77add5a7583a2b19'
      elseif ID == 70876832253163 then
	'6cb8843504e7bbaf2c12ad7fe51d8e60'
	elseif ID == 94647229517154 then
	'd48f6f73e12d8c126f3075f73224ea83'
	else
       nil

if games == nil then
	return
end
       
api.script_id = games

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

    Library:Unload()
    Library:Notify("Key is valid", 4)
    api.load_script()
    return
end

local Window = Library:CreateWindow({
	Title = "Napoleon Hub",
	Footer = discord_link,
	Icon = 105747086514734,
	NotifySide = "Right",
	ShowCustomCursor = false,
    MobileButtonsSide = "Left",
})

local Tabs = {
    Key = Window:AddKeyTab("Key System"),
}

Tabs.Key:AddLabel({
	Text = "Enter Key Here",
	DoesWrap = true,
	Size = 16,
})

Tabs.Key:AddKeyBox(function(_, ReceivedKey)
    local status = api.check_key(ReceivedKey)

    if status.code == 'KEY_VALID' then
        writefile(keyFile, ReceivedKey)
        script_key = script_key or ReceivedKey
        api.load_script()
        Library:Notify("SUCCESS!", 4)
        Library:Unload()
    else
        Library:Notify("INVALID", 4)
    end
end)

Tabs.Key:AddButton({
    Text = "Get Key (Linkvertise)",
    Func = function()
        setclipboard('https://ads.luarmor.net/get_key?for=hubKey-bbTFbWlaffcB')
        Library:Notify({
            Title = "Linkvertise has been copied!",
            Description = "Complete the link to get Key."
        }, 4)
    end,
})

Tabs.Key:AddButton({
    Text = "Get Key (Lootlab)",
    Func = function()
        setclipboard('https://ads.luarmor.net/get_key?for=lootLab-KHgdrTasHCWU')
        Library:Notify({
            Title = "LootLab has been copied!",
            Description = "Complete the link to get Key."
        }, 4)
    end,
})

Tabs.Key:AddButton({
    Text = "Join Discord",
    Func = function()
        setclipboard(discord_link)
        Library:Notify("Discord Link has been copied", 4)
    end,
})

Tabs.Key:AddButton({
    Text = "Rejoin Server",
    Func = function()
        TeleportService:Teleport(game.PlaceId)
        Library:Notify("Rejoining ...", 4)
    end,
})

