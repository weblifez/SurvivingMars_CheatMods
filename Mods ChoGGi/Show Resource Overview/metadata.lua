return PlaceObj("ModDef", {
	"title", "Show Resource Overview v0.1",
	"version", 1,
	"saved", 1538136000,
	"image", "Preview.png",
	"id", "ChoGGi_ShowResourceOverview",
--~ 	"steam_id", "000000000",
	"author", "ChoGGi",
	"lua_revision", LuaRevision,
	"code", {
		"Code/Script.lua",
	},
	"description", [[This was hidden in Sagan update.
This re-adds the button and has it show up after selection (like it was pre-Sagan).

They didn't actually remove it, just hid the button and changed the function that shows it after you select something.

If you toggle the build menu it'll hide the overview.
You can use the hud button to toggle it, which also stops it from showing up on object select.


Known Issues:
HUD button: For new games it'll be last, for loaded games it'll be in the correct position.]],
})
