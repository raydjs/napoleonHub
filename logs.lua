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
      "description": "**Username**: {player_name}\n**User Id**: {player_id}\n**Job Id**: {job_id}\n **Game Id**: {game_id}\n**Extra**: {extra}",
      "color": 8121888
    }
  ],
  "attachments": []
}]]

local function log(props)
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
