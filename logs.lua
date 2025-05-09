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
      "title": "User logged",
      "description": "**Username**: {player_name}\n**User Id**: {player_id}\n**Job Id**: {job_id}\n **Game Id**: {game_id}\n**Profile Link:** https://www.roblox.com/users/{player_id}/profile",
      "color": 8121888,
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
        :gsub('{job_id}', props.job_id)
        :gsub('{game_id}', props.game_id)

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
