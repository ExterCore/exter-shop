Config = {}
Config.UseTextUI = true --only qb target false
Config.InventoryFolder = "nui://qb-inventory/html/images/"
Config.Text = "textui2" --textui2
--ox nui://ox_inventory/web/images/
--qs nui://qs-inventory/html/images/

Config.OldInv = "qb" --if you are using pa inventory and if you are using ox before pa write ox here if not you don't need to write anything

Config.ServerCallbacks = {}

Config.Notify = {
    ["success"] = "The purchase was successful enjoy",
    ["error"] = "You don't have enough balance"
}

Config.Shops = {
    {
        name = "Market",
        label = "7/24 Market",
        type = "normal",
        blip = true,
        blipSprite = 59,
        blipColor = 2,
        blipScale = 0.5,
        categories = {
            [1] = {
                name = "General",
                description = "Needs",
                items = {
                    {name = "water_bottle", label = "Water", perPrice = 150, description = "Drinks"},
                    {name = "sandwich", label = "Sandwich", perPrice = 150, description = "Food"},
                    {name = "snikkel_candy", label = "Snikkel Candy", perPrice = 150, description = "General"},
                    {name = "tosti", label = "Tosti", perPrice = 150, description = "General"},
                    {name = "beer", label = "Beer", perPrice = 150, description = "General"},
                    {name = "cola", label = "Cola", perPrice = 150, description = "General"},
                    {name = "twerks_candy", label = "Twerks Candy", perPrice = 150, description = "General"},
                    {name = "whiskey", label = "Whiskey", perPrice = 150, description = "General"},
                }
            },
        },
        pedHash = 'mp_m_shopkeep_01',
        scenario = 'WORLD_HUMAN_STAND_MOBILE',
        coords = {
            {ped = nil, coords = vector4(24.47, -1346.62, 29.5, 271.66)},
            {ped = nil, coords = vector4(-3039.54, 584.38, 7.91, 17.27)},
            {ped = nil, coords = vector4(-3242.97, 1000.01, 12.83, 357.57)},
            {ped = nil, coords = vector4(1728.07, 6415.63, 35.04, 242.95)},
            {ped = nil, coords = vector4(1959.82, 3740.48, 32.34, 301.57)},
            {ped = nil, coords = vector4(549.13, 2670.85, 42.16, 99.39)},
            {ped = nil, coords = vector4(2677.47, 3279.76, 55.24, 335.08)},
            {ped = nil, coords = vector4(2556.66, 380.84, 108.62, 356.67)},
            {ped = nil, coords = vector4(372.66, 326.98, 103.57, 253.73)},
        }
    },
    {
        name = "Market",
        label = "LTD Gasoline",
        type = "normal",
        blip = true,
        blipSprite = 59,
        blipColor = 2,
        blipScale = 0.5,
        categories = {
            [1] = {
                name = "General",
                description = "24/7",
                items = {
                    {name = "water_bottle", label = "Water", perPrice = 150, description = "Drinks"},
                    {name = "sandwich", label = "Sandwich", perPrice = 150, description = "Food"},
                    {name = "snikkel_candy", label = "Snikkel Candy", perPrice = 150, description = "General"},
                    {name = "tosti", label = "Tosti", perPrice = 150, description = "General"},
                    {name = "beer", label = "Beer", perPrice = 150, description = "General"},
                    {name = "cola", label = "Cola", perPrice = 150, description = "General"},
                    {name = "twerks_candy", label = "Twerks Candy", perPrice = 150, description = "General"},
                    {name = "whiskey", label = "Whiskey", perPrice = 150, description = "General"},
                }
            },
        },
        pedHash = 'mp_m_shopkeep_01',
        scenario = 'WORLD_HUMAN_STAND_MOBILE',
        coords = {
            {ped = nil, coords = vector4(-47.02, -1758.23, 29.42, 45.05)},
            {ped = nil, coords = vector4(-706.06, -913.97, 19.22, 88.04)},
            {ped = nil, coords = vector4(-1820.02, 794.03, 138.09, 135.45)},
            {ped = nil, coords = vector4(1164.71, -322.94, 69.21, 101.72)},
            {ped = nil, coords = vector4(1697.87, 4922.96, 42.06, 324.71)},
        }
    },
    {
        name = "Market",
        label = "Rob's Liqour",
        type = "normal",
        blip = true,
        blipSprite = 59,
        blipColor = 2,
        blipScale = 0.5,
        categories = {
            [1] = {
                name = "General",
                description = "24/7",
                items = {
                    {name = "water_bottle", label = "Water", perPrice = 150, description = "Drinks"},
                    {name = "sandwich", label = "Sandwich", perPrice = 150, description = "Food"},
                    {name = "snikkel_candy", label = "Snikkel Candy", perPrice = 150, description = "General"},
                    {name = "tosti", label = "Tosti", perPrice = 150, description = "General"},
                    {name = "beer", label = "Beer", perPrice = 150, description = "General"},
                    {name = "cola", label = "Cola", perPrice = 150, description = "General"},
                    {name = "twerks_candy", label = "Twerks Candy", perPrice = 150, description = "General"},
                    {name = "whiskey", label = "Whiskey", perPrice = 150, description = "General"},
                }
            },
        },
        pedHash = 'mp_m_shopkeep_01',
        scenario = 'WORLD_HUMAN_STAND_MOBILE',
        coords = {
            {ped = nil, coords = vector4(-1221.58, -908.15, 12.33, 35.49)},
            {ped = nil, coords = vector4(-1486.59, -377.68, 40.16, 139.51)},
            {ped = nil, coords = vector4(-2966.39, 391.42, 15.04, 87.48)},
            {ped = nil, coords = vector4(1165.17, 2710.88, 38.16, 179.43)},
            {ped = nil, coords = vector4(1134.2, -982.91, 46.42, 277.24)},
        }
    },
    {
        name = "Hardware Store",
        label = "Hardware",
        type = "normal",
        blip = true,
        blipSprite = 59,
        blipColor = 2,
        blipScale = 0.5,
        categories = {
            [1] = {
                name = "General",
                description = "Hardware Tools",
                items = {
                    {name = "lockpick", label = "Lockpick", perPrice = 150, description = "Drinks"},
                    {name = "weapon_wrench", label = "Wrench", perPrice = 150, description = "Food"},
                    {name = "weapon_hammer", label = "Hammer", perPrice = 150, description = "General"},
                    {name = "repairkit", label = "Repair Kit", perPrice = 150, description = "General"},
                    {name = "screwdriverset", label = "Tool Set", perPrice = 150, description = "General"},
                    {name = "phone", label = "Phone", perPrice = 150, description = "General"},
                    {name = "radio", label = "Radio", perPrice = 150, description = "General"},
                    {name = "firework1", label = "Firework XS", perPrice = 150, description = "General"},
                    {name = "firework2", label = "Firework S", perPrice = 150, description = "General"},
                    {name = "firework3", label = "Firework M", perPrice = 150, description = "General"},
                    {name = "firework4", label = "Firework L", perPrice = 150, description = "General"},
                    {name = "fitbit", label = "Fitbit", perPrice = 150, description = "General"},
                    {name = "cleaningkit", label = "Cleaning Kit", perPrice = 150, description = "General"},
                    {name = "advancedrepairkit", label = "Adv. Repair Kit", perPrice = 150, description = "General"},
                }
            },
        },
        pedHash = 'mp_m_shopkeep_01',
        scenario = 'WORLD_HUMAN_STAND_MOBILE',
        coords = {
            {ped = nil, coords = vector4(45.68, -1749.04, 29.61, 53.13)},
            {ped = nil, coords = vector4(2747.71, 3472.85, 55.67, 255.08)},
            {ped = nil, coords = vector4(-421.83, 6136.13, 31.88, 228.2)},
        }
    },
    {
        name = "Ammunation Store",
        label = "Weapons",
        type = "normal",
        blip = true,
        blipSprite = 59,
        blipColor = 2,
        blipScale = 0.5,
        categories = {
            [1] = {
                name = "General",
                description = "Ammunations",
                items = {
                    {name = "weapon_knife", label = "Knife", perPrice = 150, description = "General"},
                    {name = "weapon_bat", label = "Bat", perPrice = 150, description = "General"},
                    {name = "weapon_hatchet", label = "Hatchet", perPrice = 150, description = "General"},
                    {name = "pistol_ammo", label = "Pistol Ammo", perPrice = 150, description = "General"},
                    {name = "weapon_pistol", label = "Pistol", perPrice = 150, description = "General", requiredLicense = {'weapon'}},
                    {name = "weapon_snspistol", label = "Sns Pistol", perPrice = 150, description = "General", requiredLicense = {'weapon'}},
                    {name = "weapon_vintagepistol", label = "Vintage Pistol", perPrice = 150, description = "General", requiredLicense = {'weapon'}}
                }
            },
        },
        pedHash = 'mp_m_shopkeep_01',
        scenario = 'WORLD_HUMAN_STAND_MOBILE',
        coords = {
            {ped = nil, coords = vector4(-3173.31, 1088.85, 20.84, 244.18)},
            {ped = nil, coords = vector4(-1304.19, -395.12, 36.7, 75.03)},
            {ped = nil, coords = vector4(841.92, -1035.32, 28.19, 1.56)},
            {ped = nil, coords = vector4(-1118.59, 2700.05, 18.55, 221.89)},
            {ped = nil, coords = vector4(2567.48, 292.59, 108.73, 349.68)},
            {ped = nil, coords = vector4(23.0, -1105.67, 29.8, 162.91)},
            {ped = nil, coords = vector4(253.63, -51.02, 69.94, 72.91)},
            {ped = nil, coords = vector4(-331.23, 6085.37, 31.45, 228.02)},
            {ped = nil, coords = vector4(1692.67, 3761.38, 34.71, 227.65)},
            {ped = nil, coords = vector4(809.68, -2159.13, 29.62, 1.43)},
            {ped = nil, coords = vector4(-661.96, -933.53, 21.83, 177.05)},
        }
    },
    {
        name = "Job Market",
        label = "LSPD Ammunation",
        type = "job",
        jobName = "police",
        blip = false,
        categories = {
            [1] = {
                name = "General",
                description = "24/7",
                items = {
                    {name = "pistol_ammo", label = "Pistol Ammo", perPrice = 150, description = "PD Items"},
                    {name = "smg_ammo", label = "SMG Ammo", perPrice = 150, description = "PD Items"},
                    {name = "rifle_ammo", label = "Rifle Ammo", perPrice = 150, description = "PD Items"},
                    -- {name = "taserammo", label = "Taser Ammo", perPrice = 150, description = "PD Items"},
                    {name = "handcuffs", label = "Handcuffs", perPrice = 150, description = "PD Items"},
                    {name = "empty_evidence_bag", label = "Empty Evidence Bag", perPrice = 150, description = "PD Items"},
                    {name = "police_stormram", label = "Storm Arm", perPrice = 150, description = "PD Items"},
                    {name = "armor", label = "Armor", perPrice = 150, description = "PD Items"},
                    {name = "radio", label = "Radio", perPrice = 150, description = "PD Items"},
                    -- {name = "policespikes", label = "Spikes", perPrice = 150, description = "PD Items"},
                    -- {name = "gps", label = "GPS", perPrice = 150, description = "PD Items"},
                    {name = "body_cam", label = "Body Cam", perPrice = 150, description = "PD Items"},
                    {name = "ifaks", label = "Ifak", perPrice = 150, description = "PD Items"},
                    {name = "bandage", label = "Bandage", perPrice = 150, description = "PD Items"}
                }
            },
            [2] = {
                name = "Weapon",
                description = "Ammunations",
                items = {
                    {name = "weapon_stungun", label = "Stun Gun", perPrice = 150, description = "PD Items"},
                    {name = "weapon_glock", label = "Glock", perPrice = 150, description = "PD Items"},
                    {name = "weapon_smg", label = "SMG", perPrice = 150, description = "PD Items"},
                    {name = "weapon_combatpdw", label = "Combat PDW", perPrice = 150, description = "PD Items"},
                    {name = "weapon_m4", label = "M4", perPrice = 150, description = "PD Items"},
                    {name = "weapon_specialcarbine_mk2", label = "ScarL", perPrice = 150, description = "PD Items"},
                    {name = "weapon_nightstick", label = "Nightstick", perPrice = 150, description = "PD Items"},
                    {name = "weapon_flashlight", label = "FlashLight", perPrice = 150, description = "PD Items"},
                }
            },
        },
        pedHash = 'ig_andreas',
        scenario = 'WORLD_HUMAN_STAND_MOBILE',
        coords = {
            {ped = nil, coords = vector4(482.58, -995.36, 30.69, 180.39)}
        }
    },
}
