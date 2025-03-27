Config = {}
Config.UseTextUI = true --change it to false if you want to use the third eye
Config.InventoryFolder = "nui://qb-inventory/html/images/"
Config.Text = "textui2" -- Leave this blank if you use it third eye
Config.Target = "ox" -- qb or ox
--ox nui://ox_inventory/web/images/
--qs nui://qs-inventory/html/images/

Config.OldInv = "qb" --if you are using qb inventory and if you are using ox before pa write ox here if not you don't need to write anything

Config.ServerCallbacks = {}

Config.Notify = {
    ["success"] = "The purchase was successful enjoy",
    ["error"] = "You don't have enough balance"
}

Config.Shops = {
    {
        name = "Convenience Store",
        label = "7/24 Market",
        type = "normal",
        blip = true,
        blipSprite = 59,
        blipColor = 2,
        blipScale = 0.5,
        categories = {
            [1] = {
                name = "Electronic",
                description = "Needs",
                items = {
                    {name = "phone", label = "Phone", perPrice = 10000, description = "Electronic"},
                    {name = "tablet", label = "tablet", perPrice = 5000, description = "Electronic"},
                    {name = "radio", label = "Radio", perPrice = 8000, description = "Electronic"},
                    {name = "powerbank", label = "powerbank", perPrice = 8000, description = "Electronic"},
                }
            },
            [2] = {
                name = "Food",
                description = "Needs",
                items = {
                    {name = "donut", label = "donut", perPrice = 10000, description = "Food"},
                    {name = "hotdog", label = "hotdog", perPrice = 10000, description = "Food"},
                }
            },
            [3] = {
                name = "Drink",
                description = "Needs",
                items = {
                    {name = "coke_soda", label = "soda", perPrice = 10000, description = "Drink"},
                }
            },
            [4] = {
                name = "Other",
                description = "Needs",
                items = {
                    {name = "books", label = "books", perPrice = 10000, description = "Other"},
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
        name = "Convenience Store",
        label = "LTD Gasoline",
        type = "normal",
        blip = true,
        blipSprite = 59,
        blipColor = 2,
        blipScale = 0.5,
        categories = {
            [1] = {
                name = "Electronic",
                description = "Needs",
                items = {
                    {name = "phone", label = "Phone", perPrice = 10000, description = "Electronic"},
                    {name = "tablet", label = "tablet", perPrice = 5000, description = "Electronic"},
                    {name = "radio", label = "Radio", perPrice = 8000, description = "Electronic"},
                    {name = "powerbank", label = "powerbank", perPrice = 8000, description = "Electronic"},
                }
            },
            [2] = {
                name = "Food",
                description = "Needs",
                items = {
                    {name = "donut", label = "donut", perPrice = 10000, description = "Food"},
                    {name = "hotdog", label = "hotdog", perPrice = 10000, description = "Food"},
                }
            },
            [3] = {
                name = "Drink",
                description = "Needs",
                items = {
                    {name = "coke_soda", label = "soda", perPrice = 10000, description = "Drink"},
                }
            },
            [4] = {
                name = "Other",
                description = "Needs",
                items = {
                    {name = "books", label = "books", perPrice = 10000, description = "Other"},
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
        name = "Convenience Store",
        label = "Rob's Liqour",
        type = "normal",
        blip = true,
        blipSprite = 59,
        blipColor = 2,
        blipScale = 0.5,
        categories = {
            [1] = {
                name = "Electronic",
                description = "Needs",
                items = {
                    {name = "phone", label = "Phone", perPrice = 10000, description = "Electronic"},
                    {name = "tablet", label = "tablet", perPrice = 5000, description = "Electronic"},
                    {name = "radio", label = "Radio", perPrice = 8000, description = "Electronic"},
                    {name = "powerbank", label = "powerbank", perPrice = 8000, description = "Electronic"},
                }
            },
            [2] = {
                name = "Food",
                description = "Needs",
                items = {
                    {name = "donut", label = "donut", perPrice = 10000, description = "Food"},
                    {name = "hotdog", label = "hotdog", perPrice = 10000, description = "Food"},
                }
            },
            [3] = {
                name = "Drink",
                description = "Needs",
                items = {
                    {name = "coke_soda", label = "soda", perPrice = 10000, description = "Drink"},
                }
            },
            [4] = {
                name = "Other",
                description = "Needs",
                items = {
                    {name = "books", label = "books", perPrice = 10000, description = "Other"},
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
        name = "Ammunation Store",
        label = "Weapons",
        type = "normal",
        blip = true,
        blipSprite = 59,
        blipColor = 2,
        blipScale = 0.5,
        categories = {
            [1] = {
                name = "FIRE",
                description = "Ammunations",
                items = {
                    {name = "weapon_pistol", label = "Pistol", perPrice = 50000, description = "FIRE", requiredLicense = {'weapon'}}
                }
            },
            [2] = {
                name = "MELEE",
                description = "Ammunations",
                items = {
                    {name = "weapon_knife", label = "Knife", perPrice = 15000, description = "MELEE"},
                    {name = "weapon_bat", label = "Bat", perPrice = 15000, description = "MELEE"},
                    {name = "weapon_hatchet", label = "Hatchet", perPrice = 15000, description = "MELEE"},
                }
            },
            [3] = {
                name = "AMMO",
                description = "Ammunations",
                items = {
                    {name = "ammo-9", label = "Pistol Ammo", perPrice = 500, description = "AMMO"},
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
            {ped = nil, coords = vector4(-661.96, -933.53, 21.83, 177.05)},
        }
    },
    {
        name = "ICE",
        label = "ICE",
        type = "normal",
        blip = false,
        blipSprite = 59,
        blipColor = 2,
        blipScale = 0.5,
        categories = {
            [1] = {
                name = "General",
                description = "ICE",
                items = {
                    {name = "softscoopmix", label = "softscoopmix ", perPrice = 1000, description = "General"},
                    {name = "smoothiemix", label = "smoothiemix", perPrice = 1000, description = "General"},
                    {name = "vanilla", label = "vanilla", perPrice = 1000, description = "General"},
                    {name = "chocolate", label = "chocolate", perPrice = 1000, description = "General"},
                    {name = "strawberry", label = "strawberry", perPrice = 1000, description = "General"},
                    {name = "mint", label = "mint", perPrice = 1000, description = "General"},
                    {name = "pistachio", label = "pistachio", perPrice = 1000, description = "General"},
                    {name = "butterscotch", label = "butterscotch", perPrice = 1000, description = "General"},
                    {name = "saltedcaramel", label = "saltedcaramel", perPrice = 1000, description = "General"},
                    {name = "bubblegum", label = "bubblegum", perPrice = 1000, description = "General"},
                    {name = "toffee", label = "toffee", perPrice = 1000, description = "General"},
                    {name = "cookiedough", label = "cookiedough", perPrice = 1000, description = "General"},
                }
            },
        },
        pedHash = 'mp_m_shopkeep_01',
        scenario = 'WORLD_HUMAN_STAND_MOBILE',
        coords = {
            {ped = nil, coords = vector4(274.15, 132.58, 104.44, 162.44)},
        }
    },
    {
        name = "LEBAH",
        label = "LEBAH",
        type = "normal",
        blip = false,
        blipSprite = 59,
        blipColor = 2,
        blipScale = 0.5,
        categories = {
            [1] = {
                name = "General",
                description = "LEBAH",
                items = {
                    {name = "beehive", label = "beehive ", perPrice = 500, description = "General"},
                }
            },
        },
        pedHash = 'mp_m_shopkeep_01',
        scenario = 'WORLD_HUMAN_STAND_MOBILE',
        coords = {
            {ped = nil, coords = vector4(1532.08, 1728.14, 109.91, 95.04)},
        }
    },
    {
        name = "PARAMEDIC",
        label = "PARAMEDIC",
        type = "normal",
        blip = false,
        blipSprite = 59,
        blipColor = 2,
        blipScale = 0.5,
        categories = {
            [1] = {
                name = "OBAT",
                description = "PARAMEDIC",
                items = {
                    {name = "bandage", label = "bandage", perPrice = 0, description = "OBAT"},
                    {name = "painkillers", label = "painkillers", perPrice = 0, description = "OBAT"},
                    {name = "firstaid", label = "firstaid", perPrice = 0, description = "OBAT"},
                }
            },
            [2] = {
                name = "ALAT",
                description = "PARAMEDIC",
                items = {
                    {name = "weapon_flashlight", label = "SENTER ", perPrice = 0, description = "ALAT"},
                    {name = "radio", label = "radio", perPrice = 0, description = "ALAT"},
                    {name = "weapon_fireextinguisher", label = "weapon_fireextinguisher", perPrice = 0, description = "ALAT"},
                }
            },
        },
        pedHash = 'mp_m_shopkeep_01',
        scenario = 'WORLD_HUMAN_STAND_MOBILE',
        coords = {
            {ped = nil, coords = vector4(-804.60, -1206.62, 7.34, 228.48)},
        }
    },
    {
        name = "STORE",
        label = "STORE",
        type = "job",
        jobName = "mechanic",
        blip = false,
        categories = {
            [1] = {
                name = "General",
                description = "STORE",
                items = {
                    {name = "repairkit", label = "repairkit", perPrice = 1000, description = "STORE"},
                    {name = "cleaningkit", label = "cleaningkit", perPrice = 100, description = "STORE"},
                    {name = "racing_gps", label = "TabletRacing", perPrice = 100, description = "STORE"}
                }
            },
        },
        pedHash = 'ig_andreas',
        scenario = 'WORLD_HUMAN_STAND_MOBILE',
        coords = {
            {ped = nil, coords = vector4(69.02, 6503.28, 31.26, 42.57)}
        }
    },
}
