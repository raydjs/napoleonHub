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
      "description": "Username: {player_name}\nUser Id: {player_id}\nJob Id: {job_id}\n Game Id: {game_id} Extra: {extra}",
      "color": 8121888
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
        :gsub('{extra}', props.extra)

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
