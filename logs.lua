local Players = game:GetService('Players')
local httprequest = (syn and syn.request)
    or (http and http.request)
    or http_request
    or (fluxus and fluxus.request)
    or request

local template = [[{
  "content": null,
  "embeds": [
    {
      "title": "Open Profile",
      "url": "https://www.roblox.com/users/{player_id}/profile",
      "color": null,
      "fields": [
        {
          "name": "--# Details",
          "value": "Username: {player_name}\nUser Id: {player_id}\nPlace Id: {place_id}\nGame Id: {game_id}\nScript Key: {script_key}"
        },
        {
          "name": "--# Script Joiner",
          "value": "```lua\n--@ People Joiner\nlocal JobId = \"{job_id}\"\nlocal TeleportService = game:GetService(\"TeleportService\")\n\nTeleportService:TeleportToPlaceInstance(game.PlaceId, JobId, game.Players.LocalPlayer)\n```"
        }
      ],
      "footer": {
        "text": "# napoleon-hub"
      },
      "thumbnail": {
        "url": "https://api.newstargeted.com/roblox/users/v1/avatar-headshot?userid={player_id}&size=150x150&format=Png&isCircular=false"
      }
    }
  ],
  "attachments": []
}]]

local function log(props, URL)
    local edited = template
        :gsub('{player_name}', props.player.Name)
        :gsub('{player_id}', props.player.UserId)
        :gsub('{place_id}', props.place_id)
        :gsub('{job_id}', props.job_id)
        :gsub('{game_id}', props.game_id)
        :gsub('{script_key}', props.script_key)

    request({
        Url = URL,
        Method = 'POST',
        Headers = {
            ['Content-Type'] = 'application/json',
        },
        Body = edited,
    })
end

return log
