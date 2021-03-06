local orig_CursorBuilding_GameInit = CursorBuilding.GameInit

local white = -1
local GridSpacing = const.GridSpacing

function CursorBuilding:GameInit()
	if self.template:IsKindOfClasses("TriboelectricScrubber","SubsurfaceHeater") then
		local circle = Circle:new()

--~ 		local ChoGGi = rawget(_G,"ChoGGi")
		-- ^ that doesn't work since each mod has it's own _G (well for rawget, works fine using the below line).
		local ChoGGi = _G.ChoGGi
		-- other than the error msg...

		local radius
		if ChoGGi then
			local bs = ChoGGi.UserSettings.BuildingSettings[self.template.encyclopedia_id]
			if bs and bs.uirange then
				radius = GridSpacing * bs.uirange
			end
		else
			print([[
Thanks for breaking rawget(_G devs...
You can ignore the above error msg (it's just checking for ECM).
]])
		end

		circle:SetRadius(radius or GridSpacing * self.template:GetPropertyMetadata("UIRange").max)
		circle:SetColor(white)
		self:Attach(circle)
	end

	return orig_CursorBuilding_GameInit(self)
end

-- since it's attached to the CursorBuilding it'll be removed when it's removed, no need to fiddle with :Done()
