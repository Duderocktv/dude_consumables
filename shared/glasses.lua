Config.Glasses = {
    ["wine_glass"] = {-- item name
    uses = 0, -- Empty glass starts with 0 uses
    MaxDrinks = 3,  -- A filled glass should have 3 drinks/uses
    
    prop = { 
    -- Prop spawn data for idle & usage.
        Main = {
            Model = {full = 'prop_drink_redwine', null = 'prop_sh_wine_glass'}, -- Prop model null = prop of empty glass, full = prop of full glass
            BoneID = 28422, -- Id of the bone to which the prop is to be attached
            Offset = vector3(0.01, 0.01, -0.1),
            Rot = vector3(05.0, -10.0, 0.0),
        }
    },

    idle = {
        dict = "amb@code_human_wander_drinking@male@base",
        anim = "static",
        params = {8.0, -8, -1, 49, 0},
        time = 2000,
    },
    animation = { 
        dict = "amb@code_human_wander_drinking@male@idle_a",
        anim = "idle_c",
        params = {nil, nil, 3000, 49},
        time = 2000, 
    },
    Pour = { -- only for glasses 
    dict = "devcore_fox@pour",
    anim = "foxyando_pour_clip",
    params = {4.0, 4.0, 4000, 16, 0}
    },
    status = { -- Default status when drinking from this glass
        thirst = 5,
        alcohol = 5
    },

    AllowedItems = { -- Items that can be poured into the glass
        ["costa_del_perro"] = true,
        ["rockford_hill"] = true,
        ["vinewood_red"] = true,
        ["vinewood_blanc"] = true,
        ["bleuterd"] = true,
        ["redwinebar"] =  true,
        ["whitewinebar"] = true,
        ["yj_wine_red"] = true,
        ["yj_wine_white"] = true,
        ["yj_wine_red"] = true,
        ["housered"] = true,
        ["housewhite"] = true,
        ["houserose"] = true,
        ["rose_wine"] = true,
        ["chardonnay"] = true,
        ["rebelroyal"] = true,
        ["champagne"] = true,
    },
    },
    
    ["flute_glass"] = {-- item name
    uses = 0, -- Empty glass starts with 0 uses
    MaxDrinks = 2,  -- A filled glass should have 2 drinks/uses
    
    prop = { 
    -- Prop spawn data for idle & usage.
        Main = {
            Model = {full = 'prop_cs_champ_flute', null = 'prop_champ_flute'}, -- Prop model null = prop of empty glass, full = prop of full glass
            BoneID = 28422, -- Id of the bone to which the prop is to be attached
            Offset = vector3(0.06, 0.0, -0.18),
            Rot = vector3(05.0, -10.0, 0.0),
        }
    },

    idle = {
        dict = "amb@code_human_wander_drinking@male@base",
        anim = "static",
        params = {8.0, -8, -1, 49, 0},
        time = 2000,
    },
    animation = { 
        dict = "amb@code_human_wander_drinking@male@idle_a",
        anim = "idle_c",
        params = {nil, nil, 3000, 49},
        time = 2000, 
    },
    Pour = { -- only for glasses 
    dict = "devcore_fox@pour",
    anim = "foxyando_pour_clip",
    params = {4.0, 4.0, 4000, 16, 0}
    },
    status = { -- Default status when drinking from this glass
        thirst = 5,
        alcohol = 5
    },

    AllowedItems = { -- Items that can be poured into the glass
        ["costa_del_perro"] = true,
        ["rockford_hill"] = true,
        ["vinewood_blanc"] = true,
        ["bleuterd"] = true,
        ["whiskey"] = true,
        ["vodka"] = true,
        ["whiskey_bottle"] = true,
        ["vodka_bottle"] = true,
        ["yj_bourbon_bottle"] = true,
        ["yj_gin_bottle"] = true,
        ["yj_tequila_bottle"] = true,
        ["yj_vodka_bottle"] = true,
        ["yj_whiskey_bottle"] = true,
        ["sake"] = true,
    },
    },
    
    ["shot_glass"] = {-- item name
    uses = 0, -- Empty glass starts with 0 uses
    MaxDrinks = 1,  -- A shot glass should have 1 drink/use
    
    prop = { 
    -- Prop spawn data for idle & usage.
        Main = {
            Model = {full = 'p_cs_shot_glass_2_s', null = 'prop_sh_shot_glass'}, -- -- Prop model null = prop of empty glass, full = prop of full glass
            BoneID = 18905, -- Id of the bone to which the prop is to be attached
            Offset = vector3(0.11, 0.01, 0.03),
            Rot = vector3(-101.0, -91.0, 11.0),
        }
    },

       idle = {
        dict = "anim@heists@humane_labs@finale@keycards",
        anim = "ped_a_enter_loop",
        params = {8.0, -8, -1, 49, 0},
        time = 2000,
    },
    animation = { 
        dict = "mp_player_intdrink",
        anim = "loop_bottle",
        params = {nil, nil, 3000, 49},
        time = 2000, 
    },
    Pour = { -- only for glasses 
    dict = "devcore_fox@pour",
    anim = "foxyando_pour_clip",
    params = {4.0, 4.0, 4000, 16, 0}
    },
    status = { -- Default status when drinking from this glass
        thirst = 5,
        alcohol = 10
    },
    
    MaxDrinks = 1,  -- pouring shouldnt go over this

    AllowedItems = { -- Items that can be poured into the glass
            ["whiskey"] = true,
            ["vodka"] = true,
            ["whiskey_bottle"] = true,
            ["vodka_bottle"] = true,
            ["yj_bourbon_bottle"] = true,
            ["yj_gin_bottle"] = true,
            ["yj_tequila_bottle"] = true,
            ["yj_vodka_bottle"] = true,
            ["yj_whiskey_bottle"] = true,
            ["sake"] = true,
            ["rebelreserve"] = true,
    },
    },
    
    ["whiskey_glass"] = {-- item name
    uses = 0, -- Empty glass starts with 0 uses
    MaxDrinks = 2,  -- A filled glass should have 2 drinks/uses
    
    prop = { 
    -- Prop spawn data for idle & usage.
        Main = {
            Model = {full = 'prop_drink_whisky', null = 'prop_whiskey_01'}, -- Prop model null = prop of empty glass, full = prop of full glass
            BoneID = 28422, -- Id of the bone to which the prop is to be attached
            Offset = vector3(0.0, -0.01, -0.02),
            Rot = vector3(05.0, -10.0, 0.0),
        }
    },

    idle = {
        dict = "amb@code_human_wander_drinking@male@base",
        anim = "static",
        params = {8.0, -8, -1, 49, 0},
        time = 2000,
    },
    animation = { 
        dict = "amb@code_human_wander_drinking@male@idle_a",
        anim = "idle_c",
        params = {nil, nil, 3000, 49},
        time = 2000, 
    },
    Pour = { -- only for glasses 
    dict = "devcore_fox@pour",
    anim = "foxyando_pour_clip",
    params = {4.0, 4.0, 4000, 16, 0}
    },
    status = { -- Default status when drinking from this glass
        thirst = 5,
        alcohol = 8
    },

    MaxDrinks = 2,  -- pouring shouldnt go over this

    AllowedItems = { -- Items that can be poured into the glass
            ["whiskey"] = true,
            ["vodka"] = true,
            ["whiskey_bottle"] = true,
            ["vodka_bottle"] = true,
            ["yj_bourbon_bottle"] = true,
            ["yj_gin_bottle"] = true,
            ["yj_tequila_bottle"] = true,
            ["yj_vodka_bottle"] = true,
            ["yj_whiskey_bottle"] = true,
            ["sake"] = true,
    },
    },

    ["coffeemug"] = {-- item name
    uses = 0, -- Empty glass starts with 0 uses
    MaxDrinks = 3,  -- A filled glass should have 2 drinks/uses
    
    prop = { 
    -- Prop spawn data for idle & usage.
        Main = {
            Model = {full = 'djs_prop_coffeecup', null = 'prop_mug_02'}, -- Prop model null = prop of empty glass, full = prop of full glass
            BoneID = 28422, -- Id of the bone to which the prop is to be attached
            Offset = vector3(0.013632486140182, -0.0025500316918523, -0.046824746509959),
            Rot = vector3(0, 0, 155.57542064053),
        }
    },

    idle = {
        dict = "amb@code_human_wander_drinking@male@base",
        anim = "static",
        params = {8.0, -8, -1, 49, 0},
        time = 2000,
    },
    animation = { 
        dict = "amb@code_human_wander_drinking@male@idle_a",
        anim = "idle_c",
        params = {nil, nil, 3000, 49},
        time = 2000, 
    },
    Pour = { -- only for glasses 
    dict = "devcore_fox@pour",
    anim = "foxyando_pour_clip",
    params = {4.0, 4.0, 4000, 16, 0}
    },
    status = { -- Default status when drinking from this glass
        thirst = 5,
        sobriety = 5
    },

    MaxDrinks = 3,

    AllowedItems = { -- Items that can be poured into the glass
        ["specialitytea"] = true,
        ["specialitycoffee"] = true,
        ["hotchocolate"] = true,
        ["coffeekettle"] = true,
    },
    },
}