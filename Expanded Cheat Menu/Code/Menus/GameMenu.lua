-- See LICENSE for terms

function OnMsg.ClassesGenerate()

	local S = ChoGGi.Strings
	local Actions = ChoGGi.Temp.Actions
	local StringFormat = string.format
	local c = #Actions

	c = c + 1
	Actions[c] = {ActionName = S[302535920000680--[[Annoying Sounds--]]],
		ActionMenubar = "Game",
		ActionId = ".Annoying Sounds",
		ActionIcon = "CommonAssets/UI/Menu/ToggleCutSmoothTrans.tga",
		RolloverText = S[302535920000681--[[Toggle annoying sounds (Sensor Tower, Mirror Sphere, Rover deployed drones, Drone incessant beeping).--]]],
		OnAction = function()
			ChoGGi.MenuFuncs.AnnoyingSounds_Toggle()
		end,
	}

	c = c + 1
	Actions[c] = {ActionName = S[302535920001292--[[List All Objects--]]],
		ActionMenubar = "Game",
		ActionId = ".List All Objects",
		ActionIcon = "CommonAssets/UI/Menu/select_objects.tga",
		RolloverText = S[302535920001293--[[A list of objects; double-click on one to select and move the camera to it.--]]],
		OnAction = ChoGGi.MenuFuncs.ListAllObjects,
	}

	c = c + 1
	Actions[c] = {ActionName = S[302535920000864--[[Delete Large Rocks--]]],
		ActionMenubar = "Game",
		ActionId = ".Delete Large Rocks",
		ActionIcon = "CommonAssets/UI/Menu/selslope.tga",
		RolloverText = S[302535920001238--[[Removes rocks for that smooth map feel.--]]],
		OnAction = ChoGGi.CodeFuncs.DeleteLargeRocks,
	}

	c = c + 1
	Actions[c] = {ActionName = S[302535920001366--[[Delete Small Rocks--]]],
		ActionMenubar = "Game",
		ActionId = ".Delete Small Rocks",
		ActionIcon = "CommonAssets/UI/Menu/selslope.tga",
		RolloverText = S[302535920001238--[[Removes rocks for that smooth map feel.--]]],
		OnAction = ChoGGi.CodeFuncs.DeleteSmallRocks,
	}

	c = c + 1
	Actions[c] = {ActionName = S[302535920000674--[[Terrain Editor Toggle--]]],
		ActionMenubar = "Game",
		ActionId = ".Terrain Editor Toggle",
		ActionIcon = "CommonAssets/UI/Menu/smooth_terrain.tga",
		RolloverText = S[302535920000675--[[Opens up the map editor with the brush tool visible.--]]],
		OnAction = ChoGGi.CodeFuncs.TerrainEditor_Toggle,
		ActionShortcut = ChoGGi.Defaults.KeyBindings.TerrainEditor_Toggle,
		ActionBindable = true,
	}

	c = c + 1
	Actions[c] = {ActionName = S[302535920000485--[[Terrain Flatten Toggle--]]],
		ActionMenubar = "Game",
		ActionId = ".Terrain Flatten Toggle",
		ActionIcon = "CommonAssets/UI/Menu/FixUnderwaterEdges.tga",
		RolloverText = S[302535920000486--[[Use the shortcut to turn this on as it will use where your cursor is as the height to flatten to.

	Use Shift + Arrow keys to change the height/radius.--]]],
		OnAction = ChoGGi.MenuFuncs.FlattenTerrain_Toggle,
		ActionShortcut = ChoGGi.Defaults.KeyBindings.FlattenTerrain_Toggle,
		ActionBindable = true,
	}

	c = c + 1
	Actions[c] = {ActionName = S[302535920000623--[[Change Terrain Type--]]],
		ActionMenubar = "Game",
		ActionId = ".Change Terrain Type",
		ActionIcon = "CommonAssets/UI/Menu/DisablePostprocess.tga",
		RolloverText = function()
			return ChoGGi.ComFuncs.SettingState(
				GetTerrainNamesCombo()[terrain.GetTerrainType(0,0)].text,
				302535920000624--[[Green or Icy mars? Coming right up!
(don't forget a light model)--]]
			)
		end,
		OnAction = ChoGGi.MenuFuncs.ChangeTerrainType,
	}

	c = c + 1
	Actions[c] = {ActionName = S[302535920001111--[[Whiter Rocks--]]],
		ActionMenubar = "Game",
		ActionId = ".Whiter Rocks",
		ActionIcon = "CommonAssets/UI/Menu/place_particles.tga",
		RolloverText = S[302535920001113--[[Helps the rocks blend in better when using the polar ground texture.--]]],
		OnAction = ChoGGi.MenuFuncs.WhiterRocks,
	}

	c = c + 1
	Actions[c] = {ActionName = S[302535920000493--[[Change Map--]]],
		ActionMenubar = "Game",
		ActionId = ".Change Map",
		ActionIcon = "CommonAssets/UI/Menu/load_city.tga",
		RolloverText = S[302535920000494--[[Change map (options to pick commander, sponsor, etc...

	Attention: If you get yellow ground areas; just load it again.
	The map disaster settings don't do jack (use ECM>Mission>Disasters).--]]],
		OnAction = ChoGGi.MenuFuncs.ChangeMap,
	}

	c = c + 1
	Actions[c] = {ActionName = S[302535920000265--[[Pulsating Pins--]]],
		ActionMenubar = "Game",
		ActionId = ".Pulsating Pins",
		ActionIcon = "CommonAssets/UI/Menu/JoinGame.tga",
		RolloverText = function()
			return ChoGGi.ComFuncs.SettingState(
				ChoGGi.UserSettings.DisablePulsatingPinsMotion,
				302535920000335--[[Pins will no longer do the pulsating motion (hover over to stop).--]]
			)
		end,
		OnAction = ChoGGi.MenuFuncs.PulsatingPins_Toggle,
	}

	c = c + 1
	Actions[c] = {ActionName = S[302535920000625--[[Change Light Model--]]],
		ActionMenubar = "Game",
		ActionId = ".Change Light Model",
		ActionIcon = "CommonAssets/UI/Menu/light_model.tga",
		RolloverText = function()
			return ChoGGi.ComFuncs.SettingState(
				ChoGGi.UserSettings.Lightmodel,
				302535920000626--[[Changes the lighting mode (temporary or permanent).--]]
			)
		end,
		OnAction = ChoGGi.MenuFuncs.ChangeLightmodel,
	}

	c = c + 1
	Actions[c] = {ActionName = S[302535920000627--[[Change Light Model Custom--]]],
		ActionMenubar = "Game",
		ActionId = ".Change Light Model Custom",
		ActionIcon = "CommonAssets/UI/Menu/light_model.tga",
		RolloverText = function()
			-- it can get large, so for this one and this one only we stick the description first.
			return StringFormat("%s:\n%s",S[302535920000628--[["Make a custom lightmodel and save it to settings. You still need to use ""Change Light Model"" for permanent."--]]],
				ValueToLuaCode(ChoGGi.UserSettings.LightmodelCustom)
			)
		end,
		OnAction = function()
			ChoGGi.MenuFuncs.EditLightmodelCustom()
		end,
	}

	c = c + 1
	Actions[c] = {ActionName = S[302535920000629--[[UI Transparency--]]],
		ActionMenubar = "Game",
		ActionId = ".UI Transparency",
		ActionIcon = "CommonAssets/UI/Menu/set_last_texture.tga",
		RolloverText = S[302535920000630--[[Change the transparency of UI items (info panel, menu, pins).--]]],
		OnAction = ChoGGi.MenuFuncs.SetTransparencyUI,
		ActionShortcut = ChoGGi.Defaults.KeyBindings.SetTransparencyUI,
		ActionBindable = true,
	}

	c = c + 1
	Actions[c] = {ActionName = S[302535920000631--[[UI Transparency Mouseover--]]],
		ActionMenubar = "Game",
		ActionId = ".UI Transparency Mouseover",
		ActionIcon = "CommonAssets/UI/Menu/set_last_texture.tga",
		RolloverText = function()
			return ChoGGi.ComFuncs.SettingState(
				ChoGGi.UserSettings.TransparencyToggle,
				302535920000632--[[Toggle removing transparency on mouseover.--]]
			)
		end,
		OnAction = ChoGGi.MenuFuncs.TransparencyUI_Toggle,
	}

	c = c + 1
	Actions[c] = {ActionName = S[302535920000694--[[Set Opacity--]]],
		ActionMenubar = "Game",
		ActionId = ".Set Opacity",
		ActionIcon = "CommonAssets/UI/Menu/set_last_texture.tga",
		RolloverText = function()
			local sel = ChoGGi.ComFuncs.SelObject()
			if IsValid(sel) then
				return ChoGGi.ComFuncs.SettingState(
					sel:GetOpacity(),
					302535920000695--[[Change the opacity of objects.--]]
				)
			else
				return S[302535920000695--[[Change the opacity of objects.--]]]
			end
		end,
		OnAction = ChoGGi.MenuFuncs.SetObjectOpacity,
		ActionShortcut = ChoGGi.Defaults.KeyBindings.SetObjectOpacity,
		ActionBindable = true,
	}

	c = c + 1
	Actions[c] = {ActionName = S[174--[[Color Modifier--]]],
		ActionMenubar = "Game",
		ActionId = ".Color Modifier",
		ActionIcon = "CommonAssets/UI/Menu/toggle_dtm_slots.tga",
		RolloverText = S[302535920000693--[[Select/mouse over an object to change the colours
	Use Shift- or Ctrl- for random colours/reset colours.--]]],
		OnAction = function()
			ChoGGi.CodeFuncs.CreateObjectListAndAttaches()
		end,
		ActionShortcut = ChoGGi.Defaults.KeyBindings.CreateObjectListAndAttaches,
		ActionBindable = true,
	}

	c = c + 1
	Actions[c] = {ActionName = S[302535920000678--[[Change Surface Signs To Materials--]]],
		ActionMenubar = "Game",
		ActionId = ".Change Surface Signs To Materials",
		ActionIcon = "CommonAssets/UI/Menu/SelectByClassName.tga",
		RolloverText = S[302535920000679--[[Changes all the ugly immersion breaking signs to materials (reversible).--]]],
		OnAction = ChoGGi.MenuFuncs.ChangeSurfaceSignsToMaterials,
	}

	local str_Game_Camera = "Game.Camera"
	c = c + 1
	Actions[c] = {ActionName = StringFormat("%s ..",S[302535920001058--[[Camera--]]]),
		ActionMenubar = "Game",
		ActionId = ".Camera",
		ActionIcon = "CommonAssets/UI/Menu/folder.tga",
		OnActionEffect = "popup",
		ActionSortKey = "2Camera",
	}

	c = c + 1
	Actions[c] = {ActionName = S[302535920000647--[[Border Scrolling--]]],
		ActionMenubar = str_Game_Camera,
		ActionId = ".Border Scrolling",
		ActionIcon = "CommonAssets/UI/Menu/CameraToggle.tga",
		RolloverText = function()
			return ChoGGi.ComFuncs.SettingState(
				ChoGGi.UserSettings.BorderScrollingToggle,
				302535920000648--[[Set size of activation for mouse border scrolling.--]]
			)
		end,
		OnAction = ChoGGi.MenuFuncs.SetBorderScrolling,
	}

	c = c + 1
	Actions[c] = {ActionName = S[302535920000649--[[Zoom Distance--]]],
		ActionMenubar = str_Game_Camera,
		ActionId = ".Zoom Distance",
		ActionIcon = "CommonAssets/UI/Menu/MoveUpCamera.tga",
		RolloverText = function()
			return ChoGGi.ComFuncs.SettingState(
				ChoGGi.UserSettings.CameraZoomToggle,
				302535920000650--[[Further zoom distance.--]]
			)
		end,
		OnAction = ChoGGi.MenuFuncs.CameraZoom_Toggle,
	}

	c = c + 1
	Actions[c] = {ActionName = S[302535920000651--[[Toggle Free Camera--]]],
		ActionMenubar = str_Game_Camera,
		ActionId = ".Toggle Free Camera",
		ActionIcon = "CommonAssets/UI/Menu/NewCamera.tga",
		RolloverText = function()
			return ChoGGi.ComFuncs.SettingState(
				cameraFly.IsActive(),
				302535920000652--[[I believe I can fly.--]]
			)
		end,
		OnAction = ChoGGi.MenuFuncs.CameraFree_Toggle,
		ActionShortcut = ChoGGi.Defaults.KeyBindings.CameraFree_Toggle,
		ActionBindable = true,
	}

	c = c + 1
	Actions[c] = {ActionName = S[302535920000653--[[Toggle Follow Camera--]]],
		ActionMenubar = str_Game_Camera,
		ActionId = ".Toggle Follow Camera",
		ActionIcon = "CommonAssets/UI/Menu/Shot.tga",
		RolloverText = function()
			return ChoGGi.ComFuncs.SettingState(
				camera3p.IsActive(),
				302535920000654--[[Select (or mouse over) an object to follow.--]]
			)
		end,
		OnAction = ChoGGi.MenuFuncs.CameraFollow_Toggle,
		ActionShortcut = ChoGGi.Defaults.KeyBindings.CameraFollow_Toggle,
		ActionBindable = true,
	}

	c = c + 1
	Actions[c] = {ActionName = S[302535920000655--[[Toggle Cursor--]]],
		ActionMenubar = str_Game_Camera,
		ActionId = ".Toggle Cursor",
		ActionIcon = "CommonAssets/UI/Menu/select_objects.tga",
		RolloverText = S[302535920000656--[[Toggle between moving camera and selecting objects.--]]],
		OnAction = ChoGGi.MenuFuncs.CursorVisible_Toggle,
		ActionShortcut = ChoGGi.Defaults.KeyBindings.CursorVisible_Toggle,
		ActionBindable = true,
	}

	c = c + 1
	Actions[c] = {ActionName = S[302535920001084--[[Reset--]]],
		ActionMenubar = str_Game_Camera,
		ActionId = ".Toggle Cursor",
		ActionIcon = "CommonAssets/UI/Menu/default_menu.tga",
		RolloverText = S[302535920001370--[[If something makes the camera view wonky you can use this to fix it.--]]],
		OnAction = ChoGGi.MenuFuncs.ResetCamera,
	}

	local str_Game_Render = "Game.Render"
	c = c + 1
	Actions[c] = {ActionName = StringFormat("%s ..",S[302535920000845--[[Render--]]]),
		ActionMenubar = "Game",
		ActionId = ".Render",
		ActionIcon = "CommonAssets/UI/Menu/folder.tga",
		OnActionEffect = "popup",
		ActionSortKey = "2Render",
	}

	c = c + 1
	Actions[c] = {ActionName = S[302535920000633--[[Lights Radius--]]],
		ActionMenubar = str_Game_Render,
		ActionId = ".Lights Radius",
		ActionIcon = "CommonAssets/UI/Menu/LightArea.tga",
		RolloverText = function()
			return ChoGGi.ComFuncs.SettingState(
				ChoGGi.UserSettings.LightsRadius,
				302535920000634--[[Sets light radius (Menu>Options>Video>Lights), menu options max out at 100.
	Lets you see lights from further away/more bleedout?--]]
			)
		end,
		OnAction = ChoGGi.MenuFuncs.SetLightsRadius,
	}

	c = c + 1
	Actions[c] = {ActionName = S[302535920000635--[[Terrain Detail--]]],
		ActionMenubar = str_Game_Render,
		ActionId = ".Terrain Detail",
		ActionIcon = "CommonAssets/UI/Menu/selslope.tga",
		RolloverText = function()
			return ChoGGi.ComFuncs.SettingState(
				ChoGGi.UserSettings.TerrainDetail,
				302535920000636--[[Sets hr.TR_MaxChunks (Menu>Options>Video>Terrain), menu options max out at 200.
	Makes the background terrain more detailed (make sure to also stick Terrain on Ultra in the options menu).--]]
			)
		end,
		OnAction = ChoGGi.MenuFuncs.SetTerrainDetail,
	}

	c = c + 1
	Actions[c] = {ActionName = S[302535920000637--[[Video Memory--]]],
		ActionMenubar = str_Game_Render,
		ActionId = ".Video Memory",
		ActionIcon = "CommonAssets/UI/Menu/CountPointLights.tga",
		RolloverText = function()
			return ChoGGi.ComFuncs.SettingState(
				ChoGGi.UserSettings.VideoMemory,
				302535920000638--[[Sets hr.DTM_VideoMemory (Menu>Options>Video>Textures), menu options max out at 2048.--]]
			)
		end,
		OnAction = ChoGGi.MenuFuncs.SetVideoMemory,
	}

	c = c + 1
	Actions[c] = {ActionName = S[302535920000639--[[Shadow Map--]]],
		ActionMenubar = str_Game_Render,
		ActionId = ".Shadow Map",
		ActionIcon = "CommonAssets/UI/Menu/DisableEyeSpec.tga",
		RolloverText = function()
			return ChoGGi.ComFuncs.SettingState(
				ChoGGi.UserSettings.ShadowmapSize,
				302535920000640--[[Sets the shadow map size (Menu>Options>Video>Shadows), menu options max out at 4096.--]]
			)
		end,
		OnAction = ChoGGi.MenuFuncs.SetShadowmapSize,
	}

	c = c + 1
	Actions[c] = {ActionName = S[302535920000641--[[Disable Texture Compression--]]],
		ActionMenubar = str_Game_Render,
		ActionId = ".Disable Texture Compression",
		ActionIcon = "CommonAssets/UI/Menu/ExportImageSequence.tga",
		RolloverText = function()
			return ChoGGi.ComFuncs.SettingState(
				ChoGGi.UserSettings.DisableTextureCompression,
				302535920000642--[[Toggle texture compression (game defaults to on, seems to make a difference of 600MB vram).--]]
			)
		end,
		OnAction = ChoGGi.MenuFuncs.DisableTextureCompression_Toggle,
	}

	c = c + 1
	Actions[c] = {ActionName = S[302535920000643--[[Higher Render Distance--]]],
		ActionMenubar = str_Game_Render,
		ActionId = ".Higher Render Distance",
		ActionIcon = "CommonAssets/UI/Menu/CameraEditor.tga",
		RolloverText = function()
			return ChoGGi.ComFuncs.SettingState(
				ChoGGi.UserSettings.HigherRenderDist,
				302535920000644--[[Renders model from further away.
	Not noticeable unless using higher zoom.--]]
			)
		end,
		OnAction = ChoGGi.MenuFuncs.HigherRenderDist_Toggle,
	}

	c = c + 1
	Actions[c] = {ActionName = S[302535920000645--[[Higher Shadow Distance--]]],
		ActionMenubar = str_Game_Render,
		ActionId = ".Higher Shadow Distance",
		ActionIcon = "CommonAssets/UI/Menu/toggle_post.tga",
		RolloverText = function()
			return ChoGGi.ComFuncs.SettingState(
				ChoGGi.UserSettings.HigherShadowDist,
				302535920000646--[[Renders shadows from further away.
	Not noticeable unless using higher zoom.--]]
			)
		end,
		OnAction = ChoGGi.MenuFuncs.HigherShadowDist_Toggle,
	}

end
