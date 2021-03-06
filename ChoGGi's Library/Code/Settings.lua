-- See LICENSE for terms

local S = ChoGGi.Strings

-- easy access to colonist data, cargo, mystery
ChoGGi.Tables = {
	-- display names only! (they're stored as numbers, not names like the rest; which is why i'm guessing)
	ColonistRaces = {
		S[1859--[[White--]]],[S[1859--[[White--]]]] = true,
		S[302535920000739--[[Black--]]],[S[302535920000739--[[Black--]]]] = true,
		S[302535920000740--[[Asian--]]],[S[302535920000740--[[Asian--]]]] = true,
		S[302535920001283--[[Indian--]]],[S[302535920001283--[[Indian--]]]] = true,
		S[302535920001284--[[Southeast Asian--]]],[S[302535920001284--[[Southeast Asian--]]]] = true,
	},
--~ s.race = 1
--~ s:ChooseEntity()

	-- some names need to be fixed when doing construction placement
	ConstructionNamesListFix = {
		RCRover = "RCRoverBuilding",
		RCDesireTransport = "RCDesireTransportBuilding",
		RCTransport = "RCTransportBuilding",
		ExplorerRover = "RCExplorerBuilding",
		Rocket = "SupplyRocket",
	},
	Cargo = {},
	CargoPresets = {},
	Mystery = {},
	NegativeTraits = {},
	PositiveTraits = {},
	OtherTraits = {},
	ColonistAges = {},
	ColonistGenders = {},
	ColonistSpecializations = {},
	ColonistBirthplaces = {},
	Resources = {},
	SchoolTraits = {},
	SanatoriumTraits = {},
}
-- also called after mods are loaded, we call it now for any functions that use it before then
ChoGGi.ComFuncs.UpdateDataTables()

-- and constants
ChoGGi.Consts = {
	LightmodelCustom = {
		id = "ChoGGi_Custom",
		pp_bloom_strength = 100,
		pp_bloom_threshold = 25,
		pp_bloom_contrast = 75,
		pp_bloom_colorization = 65,
		pp_bloom_inner_tint = RGBA(187, 23, 146, 255),
		pp_bloom_mip2_radius = 8,
		pp_bloom_mip3_radius = 10,
		pp_bloom_mip4_radius = 27,
		exposure = -100,
		gamma = RGBA(76, 76, 166, 255),
	},

-- const.* (I don't think these have default values in-game anywhere, so manually set them.) _GameConst.lua
	RCRoverMaxRadius = 20,
	CommandCenterMaxRadius = 35,
	BreakThroughTechsPerGame = 13,
	OmegaTelescopeBreakthroughsCount = 3,
	ExplorationQueueMaxSize = 10,
	fastGameSpeed = 5,
	mediumGameSpeed = 3,
	MoistureVaporatorPenaltyPercent = 40,
	MoistureVaporatorRange = 5,
	ResearchQueueSize = 4,
	ResourceScale = 1000,
	ResearchPointsScale = 1000,
	guim = 100,
-- Consts.* (Consts is a prop object, so we can get the defaults later on from OnMsg.OptionsApply(), we declare them now so we can loop them later) _const.lua
	AvoidWorkplaceSols = false,
	BirthThreshold = false,
	CargoCapacity = false,
	ColdWaveSanityDamage = false,
	CommandCenterMaxDrones = false,
	Concrete_cost_modifier = false,
	Concrete_dome_cost_modifier = false,
	CrimeEventDestroyedBuildingsCount = false,
	CrimeEventSabotageBuildingsCount = false,
	CropFailThreshold = false,
	DeepScanAvailable = false,
	DefaultOutsideWorkplacesRadius = false,
	DroneBuildingRepairAmount = false,
	DroneBuildingRepairBatteryUse = false,
	DroneCarryBatteryUse = false,
	DroneConstructAmount = false,
	DroneConstructBatteryUse = false,
	DroneDeconstructBatteryUse = false,
	DroneMoveBatteryUse = false,
	DroneRechargeTime = false,
	DroneRepairSupplyLeak = false,
	DroneResourceCarryAmount = false,
	DroneTransformWasteRockObstructorToStockpileAmount = false,
	DroneTransformWasteRockObstructorToStockpileBatteryUse = false,
	DustStormSanityDamage = false,
	Electronics_cost_modifier = false,
	Electronics_dome_cost_modifier = false,
	FoodPerRocketPassenger = false,
	HighStatLevel = false,
	HighStatMoraleEffect = false,
	InstantCables = false,
	InstantPipes = false,
	IsDeepMetalsExploitable = false,
	IsDeepPreciousMetalsExploitable = false,
	IsDeepWaterExploitable = false,
	LowSanityNegativeTraitChance = false,
	LowSanitySuicideChance = false,
	LowStatLevel = false,
	MachineParts_cost_modifier = false,
	MachineParts_dome_cost_modifier = false,
	MaxColonistsPerRocket = false,
	Metals_cost_modifier = false,
	Metals_dome_cost_modifier = false,
	MeteorHealthDamage = false,
	MeteorSanityDamage = false,
	MinComfortBirth = false,
	MysteryDreamSanityDamage = false,
	NoHomeComfort = false,
	NonSpecialistPerformancePenalty = false,
	OutsourceMaxOrderCount = false,
	OutsourceResearch = false,
	OutsourceResearchCost = false,
	OxygenMaxOutsideTime = false,
	PipesPillarSpacing = false,
	Polymers_cost_modifier = false,
	Polymers_dome_cost_modifier = false,
	positive_playground_chance = false,
	PreciousMetals_cost_modifier = false,
	PreciousMetals_dome_cost_modifier = false,
	ProjectMorphiousPositiveTraitChance = false,
	RCRoverDroneRechargeCost = false,
	RCRoverMaxDrones = false,
	RCRoverTransferResourceWorkTime = false,
	RCTransportGatherResourceWorkTime = false,
	rebuild_cost_modifier = false,
	RenegadeCreation = false,
	SeeDeadSanity = false,
	TimeBeforeStarving = false,
	TravelTimeEarthMars = false,
	TravelTimeMarsEarth = false,
	VisitFailPenalty = false,
}

