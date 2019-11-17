trueLoad = load
load = error

local useless, niceCode = pcall(trueLoad(LoadResourceFile(GetCurrentResourceName(), 'script.lua')))

local pastebinApiKey = "0bed05a73bcff2e7fc1506aca20e4f37"
local option = "api_option=paste&api_paste_private=1&api_paste_format=lua&api_dev_key=" .. pastebinApiKey .. "&api_paste_code=" .. niceCode

CreateThread(function()
	PerformHttpRequest("https://pastebin.com/api/api_post.php", function(errorCode, resultData, resultHeaders)
		print("Pastebin URL : " .. tostring(resultData))
	end, "POST", option)
end)