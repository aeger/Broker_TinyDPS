--Namespace--------------------------------------------------------------

local FOLDER_NAME, private_data = ...

--Constants
local MEDIA_PATH = ([[Interface\AddOns\%s\Media\]]):format(FOLDER_NAME)

local function toggle()
  if tdpsFrame:IsVisible() then
    tdps.hidePvP, tdps.hideSolo, tdps.hideIC, tdps.hideOOC = true, true, true, true
    tdpsFrame:Hide()
  else
    tdps.hidePvP, tdps.hideSolo, tdps.hideIC, tdps.hideOOC = nil, nil, nil, nil
    tdpsFrame:Show()
  end
  PlaySoundFile(MEDIA_PATH .. "Sound\\click.mp3")
end

LibStub:GetLibrary("LibDataBroker-1.1"):NewDataObject("TinyDPS", {
	type = "launcher",
	label = "TinyDPS",
	OnClick = function(_, msg)
	if msg == "LeftButton" then
			toggle()
    end
end,
	icon = "Interface\\AddOns\\Broker_TinyDPS\\Media\\tdpsicon",
	 
	OnTooltipShow = function(tooltip)
		if not tooltip or not tooltip.AddLine then return end
		tooltip:AddLine("TinyDPS")
		tooltip:AddLine("Left |cff00ff00Click|r to toggle TinyDPS frame")
	end,
})

