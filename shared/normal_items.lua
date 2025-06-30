Config.Normal_Items = {
    -------------------------------------------------------------
                -----------      POLICE      -----------
    -------------------------------------------------------------
	["breathalyzer"] = {
		uses = 25,  -- Number of uses before the item is consumed
		prop = { 
			Main = {
				Model = 'prop_cs_walkie_talkie',  -- Using walkie talkie as a stand-in for breathalyzer
				BoneID = 28422,
				Offset = vector3(0.0, 0.0, 0.0),
				Rot = vector3(0.0, 0.0, 0.0),
			}
		},
		animation = { 
			dict = "cellphone@",
			anim = "cellphone_text_read_base",
			params = {nil, nil, 2000, 49},
			time = 5000,  -- Longer time for breathalyzer test
		},
		-- No status effects for this item
	},
    -------------------------------------------------------------
                -----------      LC FOODS     -----------
    -------------------------------------------------------------
    -------------------------------------------------------------
    ------------------    Let's Cook! Items   -------------------
    ------------------       FOOD / DRINK     -------------------
    -------------------------------------------------------------
    ["lclemonlobster"] = {-- item name
        uses = 3,
        prop = { 
            -- Prop spawn data for idle & usage.
            Main = { 
                Model = 'djs_plate_lobster',
                BoneID = 18905,
                Offset = vector3(0.15678725526845, -0.0050334861860832, 0.031357341928032),
                Rot = vector3(-24.266444142288, 1.6600095970159, 5.6079281029707),
            },
            Second = { --https://forum.cfx.re/t/free-animation-eat-with-fork/5068991
                Model = 'alcaprop_fork',
                BoneID = 28422,
                Offset = vector3(0.010853324810796, 0.029339193596366, -0.019795742184349),
                Rot = vector3(0.0, 0.0, 96.560120437708),
            },
        },
        idle = {
            dict = "anim@eat@fork",
            anim = "fork_clip",
            params = {8.0, -8, -1, 49, 0},
            time = 2000, 
        },
        animation = { 
            dict = "anim@eat@fork",
            anim = "fork_clip",
            params = {8.0, -8, -1, 49, 0},
            time = 2000, 
        },
        status = { -- Per use. This is default without metadata intervention
    hunger  = 12
}
},

["lccheeseburger"] = {-- item name
    uses = 3,
    prop = { 
    -- Prop spawn data for idle & usage.
			Main = {
				Model = 'djs_cheeseburger_double',
				BoneID = 18905,
				Offset = vector3(0.10438038205677, 0.008898016732886, 0.071785853766024),
				Rot = vector3(-147.52278234617, 1.8944813834135, -68.818607273731),
			}
		},

		-- idle = {
		--     dict = "mp_suicide",
		--     anim = "static",
		--     params = {8.0, -8, -1, 49, 0},
		--     time = 2000, 
		-- },
		animation = { 
			dict = "mp_player_inteat@burger",
			anim = "mp_player_int_eat_burger_fp",
			params = {nil, nil, 1200, 49},
			time = 2000, 
		},

    status = { -- Per use. This is default without metadata intervention
        hunger  = 20
    }
},

["lcsausagedog"] = {-- item name
    uses = 3,
    prop = { 
    -- Prop spawn data for idle & usage.
        Main = { 
            Model = 'prop_cs_hotdog_01',
            BoneID = 18905,
            Offset = vector3(0.13, 0.05, 0.02),
            Rot = vector3(0.0, -140.0, -140.0),
        }
    },

    --idle = {},
    animation = { 
        dict = "mp_player_inteat@burger",
        anim = "mp_player_int_eat_burger_fp",
        params = {nil, nil, 1200, 49},
        time = 2000, 
    },

    status = { -- Per use. This is default without metadata intervention
        hunger  = 20
    }
},

["lcoxtails"] = {-- item name
    uses = 3,
    prop = { 
    -- Prop spawn data for idle & usage.
        Main = { 
            Model = 'plate_rackoflamb', 
            BoneID = 18905,
            Offset = vector3(0.1907507113068, 0.024559100551246, 0.069575185172031),
            Rot = vector3(-58.697119578141, -25.686824382993, 12.438901622251),
        },
        Second = { --https://forum.cfx.re/t/free-animation-eat-with-fork/5068991
        Model = 'alcaprop_fork',
        BoneID = 28422,
        Offset = vector3(0.0, 0.0, 0.0),
        Rot = vector3(0.0, 0.0, 0.0),
    },
},

    idle = {
        dict = "anim@scripted@island@special_peds@pavel@hs4_pavel_ig5_caviar_p1",
        anim = "base_idle",
        params = {8.0, -8, -1, 49, 0},
        time = 2000, 
    },
    animation = { 
        dict = "anim@scripted@island@special_peds@pavel@hs4_pavel_ig5_caviar_p1",
        anim = "base_idle",
        params = {8.0, -8, -1, 49, 0},
        time = 2000, 
    },

    status = { -- Per use. This is default without metadata intervention
        hunger  = 20
    }
},

["lcmaccheesy"] = {-- item name
    uses = 3,
    prop = { 
    -- Prop spawn data for idle & usage.
        Main = { 
            Model = 'bowl_fivecheeseziti',
            BoneID = 18905,
            Offset = vector3(0.1907507113068, 0.024559100551246, 0.069575185172031),
            Rot = vector3(-58.697119578141, -25.686824382993, 12.438901622251),
        },
        Second = { --https://forum.cfx.re/t/free-animation-eat-with-fork/5068991
            Model = 'alcaprop_fork',
            BoneID = 28422,
            Offset = vector3(0.0, 0.0, 0.0),
            Rot = vector3(0.0, 0.0, 0.0),
      },
},

    idle = {
        dict = "anim@scripted@island@special_peds@pavel@hs4_pavel_ig5_caviar_p1",
        anim = "base_idle",
        params = {8.0, -8, -1, 49, 0},
        time = 2000, 
    },
    animation = { 
        dict = "anim@scripted@island@special_peds@pavel@hs4_pavel_ig5_caviar_p1",
        anim = "base_idle",
        params = {8.0, -8, -1, 49, 0},
        time = 2000, 
    },

    status = { -- Per use. This is default without metadata intervention
        hunger  = 20
    }
},
["lchotcakes"] = {-- item name
uses = 3,
prop = { 
    -- Prop spawn data for idle & usage.
    Main = { 
        Model = 'djs_plate_cinammonpancakes',
        BoneID = 18905,
        Offset = vector3(0.1907507113068, 0.024559100551246, 0.069575185172031),
        Rot = vector3(-58.697119578141, -25.686824382993, 12.438901622251),
    },
    Second = { --https://forum.cfx.re/t/free-animation-eat-with-fork/5068991
        Model = 'alcaprop_fork',
        BoneID = 28422,
        Offset = vector3(0.0, 0.0, 0.0),
        Rot = vector3(0.0, 0.0, 0.0),
    },
},
idle = {
    dict = "anim@scripted@island@special_peds@pavel@hs4_pavel_ig5_caviar_p1",
    anim = "base_idle",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},
animation = { 
    dict = "anim@scripted@island@special_peds@pavel@hs4_pavel_ig5_caviar_p1",
    anim = "base_idle",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},
status = { -- Per use. This is default without metadata intervention
    hunger  = 20
}
},
    ["lcricebowl"] = {-- item name
    uses = 3,
    prop = { 
        -- Prop spawn data for idle & usage.
        Main = {
            Model = 'black_ricebowl',
            BoneID = 18905,
            Offset = vector3(0.13953280028795, -0.024008528173895, 0.025093021603604),
            Rot = vector3( -28.747094709914, 0, 0),
        },
        Second = {
            Model = 'djs_chopstick',
            BoneID = 57005,
            Offset = vector3(0.10706410191858, 0.035042152657793, 0),
            Rot = vector3(104.87149632836, -37.083979569574, 179.28614600207),
        },
        },
        idle = {
            dict = "anim@eat@fork",
            anim = "fork_clip",
            params = {8.0, -8, -1, 49, 0},
            time = 2000, 
        },
        animation = { 
            dict = "anim@eat@fork",
            anim = "fork_clip",
            params = {8.0, -8, -1, 49, 0},
            time = 2000, 
        },
    status = { -- Per use. This is default without metadata intervention
        hunger  = 5
    }
},

["lcramennoodle"] = {-- item name
    uses = 3,
    prop = { 
            -- Prop spawn data for idle & usage.
                Main = { 
                    Model = 'cup_noodles',
                    BoneID = 18905,
                    Offset = vector3(0.16, 0.01, 0.02),
                    Rot = vector3(326.0, 22.0, 46.0),
                },
                Second = {
                    Model = 'djs_chopstick',
                    BoneID = 57005,
                    Offset = vector3(0.10706410191858, 0.035042152657793, 0),
                    Rot = vector3(104.87149632836, -37.083979569574, 179.28614600207),
                }   
            },
            idle = {
                dict = "anim@eat@fork",
                anim = "fork_clip",
                params = {8.0, -8, -1, 49, 0},
                time = 2000, 
            },
            animation = { 
                dict = "anim@eat@fork",
                anim = "fork_clip",
                params = {8.0, -8, -1, 49, 0},
                time = 2000, 
            },
            status = { -- Per use. This is default without metadata intervention
                hunger  = 3,
            }
    },

        ["lcquickpizza"] = {-- item name
            uses = 3,
            prop = {
            Main = {
                Model = 'djs_slice_pepperoni',
                BoneID = 18905,
                Offset = vector3(0.12, 0.06, 0.08),
                Rot = vector3(154.0 , -32.0, 0.0),
            },
        },
        --         idle = nil,
        animation = { 
            dict = "mp_player_inteat@burger",
            anim = "mp_player_int_eat_burger_fp",
            params = {nil, nil, 1200, 49},
            time = 1200, 
        },
            status = { -- Per use. This is default without metadata intervention
                hunger  = 20
            }
        },
        ["lcribs"] = {-- item name
    uses = 3,
    prop = {
        -- Prop spawn data for idle & usage.
        Main = { 
            Model = 'plate_ribscornmac', --evo_matcha_food2_n',
            BoneID = 18905,
            Offset = vector3(0.1907507113068, 0.024559100551246, 0.069575185172031),
            Rot = vector3(-58.697119578141, -25.686824382993, 12.438901622251),
        },
        Second = { --https://forum.cfx.re/t/free-animation-eat-with-fork/5068991
            Model = 'alcaprop_fork',
            BoneID = 28422,
            Offset = vector3(0.0, 0.0, 0.0),
            Rot = vector3(0.0, 0.0, 0.0),
        }
    },
    idle = {
        dict = "anim@scripted@island@special_peds@pavel@hs4_pavel_ig5_caviar_p1",
        anim = "base_idle",
        params = {8.0, -8, -1, 49, 0},
        time = 2000,
    },
    animation = {
        dict = "anim@scripted@island@special_peds@pavel@hs4_pavel_ig5_caviar_p1",
        anim = "base_idle",
        params = {8.0, -8, -1, 49, 0},
        time = 2000,
    },
    status = { -- Per use. This is default without metadata intervention
        hunger  = 20
    }
},

    ["lclegquarter"] = {-- item name
        uses = 3,
        prop = {
            -- Prop spawn data for idle & usage.
            Main = { 
                Model = 'plate_chickenparm', --evo_matcha_food2_n',
                BoneID = 18905,
                Offset = vector3(0.1907507113068, 0.024559100551246, 0.069575185172031),
                Rot = vector3(-58.697119578141, -25.686824382993, 12.438901622251),
            },
            Second = { --https://forum.cfx.re/t/free-animation-eat-with-fork/5068991
                Model = 'alcaprop_fork',
                BoneID = 28422,
                Offset = vector3(0.0, 0.0, 0.0),
                Rot = vector3(0.0, 0.0, 0.0),
            }
        },
        idle = {
            dict = "anim@scripted@island@special_peds@pavel@hs4_pavel_ig5_caviar_p1",
            anim = "base_idle",
            params = {8.0, -8, -1, 49, 0},
            time = 2000,
        },
        animation = {
            dict = "anim@scripted@island@special_peds@pavel@hs4_pavel_ig5_caviar_p1",
            anim = "base_idle",
            params = {8.0, -8, -1, 49, 0},
            time = 2000,
        },
        status = { -- Per use. This is default without metadata intervention
            hunger  = 20
        }
    },

    ["lcsteak"] = {-- item name
        uses = 3,
        prop = {
            -- Prop spawn data for idle & usage.
            Main = { 
                Model = 'plate_ribeyesteak', --evo_matcha_food2_n',
                BoneID = 18905,
                Offset = vector3(0.14494561824779, 0.024112685966408, 0.0166432765929),
                Rot = vector3( -27.48742080795, 0, 0),
            },
            Second = { --https://forum.cfx.re/t/free-animation-eat-with-fork/5068991
                Model = 'alcaprop_fork',
                BoneID = 28422,
                Offset = vector3(0.0, 0.0, 0.0),
                Rot = vector3(0.0, 0.0, 0.0),
            }
        },
        idle = {
            dict = "anim@eat@fork",
            anim = "fork_clip",
            params = {8.0, -8, -1, 49, 0},
            time = 2000, 
        },
        animation = { 
            dict = "anim@eat@fork",
            anim = "fork_clip",
            params = {8.0, -8, -1, 49, 0},
            time = 2000, 
        },
        status = { -- Per use. This is default without metadata intervention
            hunger  = 20
        }
    },
    ["lctoast"] = {-- item name
        uses = 3,
        prop = {
    Main = {
        Model = 'djs_prop_toast',
        BoneID = 18905,
        Offset = vector3(0.13, 0.05, 0.02), 
        Rot = vector3(0.0, -140.0, -140.0),
    },
},

        animation = {
            dict = "mp_player_inteat@burger",
            anim = "mp_player_int_eat_burger_fp",
            params = {nil, nil, 1200, 49},
            time = 1200,
        },
        status = { -- Per use. This is default without metadata intervention
            hunger  = 6
        }
    },

    ["lcpoptart"] = {-- item name
        uses = 3,
        prop = {
            Main = {
                Model = 'poptart_carmelcookie',
                BoneID = 18905,
                Offset = vector3(0.14070526514001, 0.034133531085036, 0.02619237719607),
                Rot = vector3(-32.594300776346, -11.109056463731, -8.1032231096811),
            },
        },
        --         idle = nil,
        animation = {
            dict = "mp_player_inteat@burger",
            anim = "mp_player_int_eat_burger_fp",
            params = {nil, nil, 1200, 49},
            time = 1200,
        },
        status = { -- Per use. This is default without metadata intervention
            hunger  = 5
        }
    },

    ["lctoasti"] = {-- item name
        uses = 3,
        prop = {
            Main = {
                Model = 'turkey_halfsandwich',
                BoneID = 18905,
                Offset = vector3(0.10170257568916, 0, -0.0079558996093022),
                Rot = vector3( 0, 0, 57.546401996128),
            },
        },
        --         idle = nil,
        animation = {
            dict = "mp_player_inteat@burger",
            anim = "mp_player_int_eat_burger_fp",
            params = {nil, nil, 1200, 49},
            time = 1200,
        },
        status = { -- Per use. This is default without metadata intervention
            hunger  = 6
        }
    },

    ["lchamtoastie"] = {-- item name
        uses = 3,
        prop = {
            Main = {
                Model = 'turkey_halfsandwich',
                BoneID = 18905,
                Offset = vector3(0.10170257568916, 0, -0.0079558996093022),
                Rot = vector3( 0, 0, 57.546401996128),
            },
        },
        --         idle = nil,
        animation = {
            dict = "mp_player_inteat@burger",
            anim = "mp_player_int_eat_burger_fp",
            params = {nil, nil, 1200, 49},
            time = 1200,
        },
        status = { -- Per use. This is default without metadata intervention
            hunger  = 6
        }
    },

    ["lcfriedchicken"] = {-- item name
        uses = 3,
        prop = {
            Main = { 
                Model = 'box_wings_hickorysmokedbbq',
                BoneID = 18905,
                Offset = vector3(0.13895907509038, 0.02523307091407, -0.00024440441186642), 
                Rot = vector3(-15.343184382347, -13.256785603274, -32.335878980356),
            },
            Second = {
                Model = 'prop_chickenwing_hickorysmokedbbq',
                BoneID = 28422,
                Offset = vector3(0.056637835361016, 0.023687603069486, -0.030054515100592),
                Rot = vector3(57.235175873964, -5.8659799095806, 9.4840812493706),
            }   
        },
        
        idle = {
            dict = "anim@eat@fork",
            anim = "fork_clip",
            params = {8.0, -8, -1, 49, 0},
            time = 2000, 
        },
        animation = { 
            dict = "anim@eat@fork",
            anim = "fork_clip",
            params = {8.0, -8, -1, 49, 0},
            time = 2000, 
        },
        
        status = { -- Per use. This is default without metadata intervention
            hunger  = 6,
        }
    },
    ["lccheesesticks"] = {-- item name FIXME
    uses = 3,
    prop = {
        Main = {
            Model = 'food_piecefriedmozzarella',
            BoneID = 18905,
            Offset = vector3(0.13933256734038, 0.041636790279195, 0.022509821218241),
            Rot = vector3(0,0,0),
        }
    },
    
    -- idle = {
    --     dict = "mp_suicide",
    --     anim = "static",
    --     params = {8.0, -8, -1, 49, 0},
    --     time = 2000, 
    -- },
    animation = { 
        dict = "mp_player_inteat@burger",
        anim = "mp_player_int_eat_burger_fp",
        params = {nil, nil, 1200, 49},
        time = 2000, 
    },
    
    status = { -- Per use. This is default without metadata intervention
        hunger  = 5
    }
},

["lcfrenchfries"] = {-- item name
    uses = 3,
    prop = {
        Main = {
            Model = 'djs_burgershot_fries',
            BoneID = 57005,
            Offset = vector3(0.094000, 0.092000, 0.000000),
            Rot = vec3(-57.000198, 0.000000, -75.750389),
        },
        Second = {
            Model = 'djs_prop_bsfries', 
            BoneID = 18905,
            Offset = vec3(0.107000, 0.072000, 0.000000), 
            Rot = vec3(100.799866, 0.000000, 29.999975),
        }
    },
--         idle = nil,
    animation = {
        dict = "anim@djs@food@chips",
        anim = "djs_food_chips_bite_loop",
        params = {nil, nil, 1200, 49},
        time = 2500,
    },
    status = { -- Per use. This is default without metadata intervention
        hunger  = 5
    }
},

["lclambchops"] = {-- item name
    uses = 3,
    prop = {
        Main = { -- Prop spawn data for idle & usage.
            Model = 'plate_rackoflamb', --evo_matcha_food2_n',
            BoneID = 18905,
            Offset = vector3(0.1907507113068, 0.024559100551246, 0.069575185172031),
            Rot = vector3(-58.697119578141, -25.686824382993, 12.438901622251),
        },
        Second = { --https://forum.cfx.re/t/free-animation-eat-with-fork/5068991
            Model = 'alcaprop_fork',
            BoneID = 28422,
            Offset = vector3(0.0, 0.0, 0.0),
            Rot = vector3(0.0, 0.0, 0.0),
        }
    },
    idle = {
        dict = "anim@scripted@island@special_peds@pavel@hs4_pavel_ig5_caviar_p1",
        anim = "base_idle",
        params = {8.0, -8, -1, 49, 0},
        time = 2000, 
    },
    animation = { 
        dict = "anim@scripted@island@special_peds@pavel@hs4_pavel_ig5_caviar_p1",
        anim = "base_idle",
        params = {8.0, -8, -1, 49, 0},
        time = 2000, 
    },
    status = { -- Per use. This is default without metadata intervention
        hunger  = 20
    }
},

["lcfriedfish"] = {-- item name 
uses = 3,
prop = { 
    -- Prop spawn data for idle & usage.
    Main = { 
        Model = 'djs_plate_fishandchips',
        BoneID = 18905,
        Offset = vector3(0.15678725526845, -0.0050334861860832, 0.031357341928032),
        Rot = vector3(-24.266444142288, 1.6600095970159, 5.6079281029707),
    },
    Second = { --https://forum.cfx.re/t/free-animation-eat-with-fork/5068991
        Model = 'alcaprop_fork',
        BoneID = 28422,
        Offset = vector3(0.010853324810796, 0.029339193596366, -0.019795742184349),
        Rot = vector3(0.0, 0.0, 96.560120437708),
    },
},
idle = {
    dict = "anim@eat@fork",
    anim = "fork_clip",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},
animation = { 
    dict = "anim@eat@fork",
    anim = "fork_clip",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},
status = { -- Per use. This is default without metadata intervention
    hunger  = 12
}
},

["lcsalmon"] = {-- item name 
uses = 3,
prop = { 
    -- Prop spawn data for idle & usage.
    Main = { 
        Model = 'djs_plate_fishandchips',
        BoneID = 18905,
        Offset = vector3(0.15678725526845, -0.0050334861860832, 0.031357341928032),
        Rot = vector3(-24.266444142288, 1.6600095970159, 5.6079281029707),
    },
    Second = { --https://forum.cfx.re/t/free-animation-eat-with-fork/5068991
        Model = 'alcaprop_fork',
        BoneID = 28422,
        Offset = vector3(0.010853324810796, 0.029339193596366, -0.019795742184349),
        Rot = vector3(0.0, 0.0, 96.560120437708),
    },
},
idle = {
    dict = "anim@eat@fork",
    anim = "fork_clip",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},
animation = { 
    dict = "anim@eat@fork",
    anim = "fork_clip",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},
status = { -- Per use. This is default without metadata intervention
    hunger  = 12
}
},
["lcbstirfry"] = { -- item name 
    uses = 3,
    prop = { 
        -- Prop spawn data for idle & usage.
        Main = {
            Model = 'black_ricebowl',
            BoneID = 18905,
            Offset = vector3(0.13953280028795, -0.024008528173895, 0.025093021603604),
            Rot = vector3( -28.747094709914, 0, 0),
        },
        Second = {
            Model = 'djs_chopstick',
            BoneID = 57005,
            Offset = vector3(0.10706410191858, 0.035042152657793, 0),
            Rot = vector3(104.87149632836, -37.083979569574, 179.28614600207),
        },
        },
        idle = {
            dict = "anim@eat@fork",
            anim = "fork_clip",
            params = {8.0, -8, -1, 49, 0},
            time = 2000, 
        },
        animation = { 
            dict = "anim@eat@fork",
            anim = "fork_clip",
            params = {8.0, -8, -1, 49, 0},
            time = 2000, 
        },
    status = { -- Per use. This is default without metadata intervention
        hunger  = 5
    }
},

    ["lcchickensand"] = { -- item name 
        uses = 3,
        prop = {
            Main = {
                Model = 'turkey_halfsandwich',
                BoneID = 18905,
                Offset = vector3(0.10170257568916, 0, -0.0079558996093022),
                Rot = vector3( 0, 0, 57.546401996128),
            },
        },
        --         idle = nil,
        animation = {
            dict = "mp_player_inteat@burger",
            anim = "mp_player_int_eat_burger_fp",
            params = {nil, nil, 1200, 49},
            time = 1200,
        },
        status = { -- Per use. This is default without metadata intervention
            hunger  = 6
        }
    },

    ["lcbffriedrice"] = { -- item name 
    uses = 3,
    prop = { 
        -- Prop spawn data for idle & usage.
        Main = {
            Model = 'black_ricebowl',
            BoneID = 18905,
            Offset = vector3(0.13953280028795, -0.024008528173895, 0.025093021603604),
            Rot = vector3( -28.747094709914, 0, 0),
        },
        Second = {
            Model = 'djs_chopstick',
            BoneID = 57005,
            Offset = vector3(0.10706410191858, 0.035042152657793, 0),
            Rot = vector3(104.87149632836, -37.083979569574, 179.28614600207),
        },
        },
        idle = {
            dict = "anim@eat@fork",
            anim = "fork_clip",
            params = {8.0, -8, -1, 49, 0},
            time = 2000, 
        },
        animation = { 
            dict = "anim@eat@fork",
            anim = "fork_clip",
            params = {8.0, -8, -1, 49, 0},
            time = 2000, 
        },
    status = { -- Per use. This is default without metadata intervention
        hunger  = 5
    }
    },

    ["lcckfriedrice"] = { -- item name
    uses = 3,
    prop = { 
        -- Prop spawn data for idle & usage.
        Main = {
            Model = 'black_ricebowl',
            BoneID = 18905,
            Offset = vector3(0.13953280028795, -0.024008528173895, 0.025093021603604),
            Rot = vector3( -28.747094709914, 0, 0),
        },
        Second = {
            Model = 'djs_chopstick',
            BoneID = 57005,
            Offset = vector3(0.10706410191858, 0.035042152657793, 0),
            Rot = vector3(104.87149632836, -37.083979569574, 179.28614600207),
        },
        },
        idle = {
            dict = "anim@eat@fork",
            anim = "fork_clip",
            params = {8.0, -8, -1, 49, 0},
            time = 2000, 
        },
        animation = { 
            dict = "anim@eat@fork",
            anim = "fork_clip",
            params = {8.0, -8, -1, 49, 0},
            time = 2000, 
        },
    status = { -- Per use. This is default without metadata intervention
        hunger  = 5
    }
    },

    ["lcapplesauce"] = { -- item name 
    uses = 3,
    prop = {
        Main = {
            Model = 'juice_juicy',
            BoneID = 28422,
            Offset = vector3(0.0046061327977895, -0.010749240867084, -0.16534273478831),
            Rot = vector3(0.0, 0.0, 0.0),
        },
    },
    idle = {
        dict = "amb@code_human_wander_drinking@male@base",
        anim = "static",
        params = {8.0, -8, -1, 49, 0},
        time = 2000,
    },
    animation = {
        dict = "amb@code_human_wander_drinking_fat@male@idle_a",
        anim = "idle_c",
        params = {nil, nil, 2000, 49},
        time = 2000,
    },
    status = {
        thirst = 10
    }
    },

    ["lcnanacream"] = { -- item name 
        uses = 3,
        prop = { -- Prop spawn data for idle & usage.
        Main = {
            Model = 'djs_icecreamcone_whiteandyellow',
            BoneID = 28422,
            Offset = vector3(0.058054242272988, -0.0013077690604389, -0.047089471666982),
            Rot = vector3(-59.816203035454, 1.6105281512174, -11.046773484257),
        }
    },
    
    idle = {
        dict = "anim@djs@food@cone",
        anim = "djs_food_cone_idle",
        params = {8.0, -8, -1, 49, 0},
        time = 2000, 
    },
    animation = { 
        dict = "anim@djs@food@cone",
        anim = "djs_food_cone_lick_single",
        params = {nil, nil, 1200, 49},
        time = 2000, 
    },
    
    status = { -- Per use. This is default without metadata intervention
        hunger  = 7
    }
    },
    ["lcberrycream"] = {
        uses = 3,
        prop = {
            Main = {
                Model = 'djs_icecreamcone_pinkberrys',
                BoneID = 28422,
                Offset = vector3(0.058054242272988, -0.0013077690604389, -0.047089471666982),
                Rot = vector3(-59.816203035454, 1.6105281512174, -11.046773484257),
            }
        },
        
        idle = {
            dict = "anim@djs@food@cone",
            anim = "djs_food_cone_idle",
            params = {8.0, -8, -1, 49, 0},
            time = 2000, 
        },
        animation = { 
            dict = "anim@djs@food@cone",
            anim = "djs_food_cone_lick_single",
            params = {nil, nil, 1200, 49},
            time = 2000, 
        },
        
        status = { -- Per use. This is default without metadata intervention
            hunger  = 7
        }
    },
    
    ["lcchoccream"] = {
        uses = 3,
        prop = {
            Main = {
                Model = 'djs_icecreamcone_brown',
                BoneID = 28422,
                Offset = vector3(0.058054242272988, -0.0013077690604389, -0.047089471666982),
                Rot = vector3(-59.816203035454, 1.6105281512174, -11.046773484257),
            }
        },
        
        idle = {
            dict = "anim@djs@food@cone",
            anim = "djs_food_cone_idle",
            params = {8.0, -8, -1, 49, 0},
            time = 2000, 
        },
        animation = { 
            dict = "anim@djs@food@cone",
            anim = "djs_food_cone_lick_single",
            params = {nil, nil, 1200, 49},
            time = 2000, 
        },
        
        status = { -- Per use. This is default without metadata intervention
            hunger  = 7
        }
    },
    
    ["lcbpudding"] = {
        uses = 3,
        prop = {
    Main = { 
        Model = 'plate_moltenlavacake',
        BoneID = 18905,
        Offset = vector3(0.15678725526845, -0.0050334861860832, 0.031357341928032),
        Rot = vector3(-24.266444142288, 1.6600095970159, 5.6079281029707),
    },
    Second = { --https://forum.cfx.re/t/free-animation-eat-with-fork/5068991
        Model = 'alcaprop_fork',
        BoneID = 28422,
        Offset = vector3(0.010853324810796, 0.029339193596366, -0.019795742184349),
        Rot = vector3(0.0, 0.0, 96.560120437708),
    },
},
idle = {
    dict = "anim@eat@fork",
    anim = "fork_clip",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},
animation = { 
    dict = "anim@eat@fork",
    anim = "fork_clip",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},
status = { -- Per use. This is default without metadata intervention
    hunger  = 12
}
    },
    
    ["lcpepshrimp"] = {
        uses = 3,
        prop = {
            Main = {
                Model = 'plate_grilledshrimp',
                BoneID = 18905,
                Offset = vector3(0.1907507113068, 0.024559100551246, 0.069575185172031),
                Rot = vector3(-58.697119578141, -25.686824382993, 12.438901622251),
            },
            Second = {
                Model = 'alcaprop_fork',
                BoneID = 28422,
                Offset = vector3(0.0, 0.0, 0.0),
                Rot = vector3(0.0, 0.0, 0.0),
            }
        },
        idle = {
            dict = "anim@scripted@island@special_peds@pavel@hs4_pavel_ig5_caviar_p1",
            anim = "base_idle",
            params = {8.0, -8, -1, 49, 0},
            time = 2000, 
        },
        animation = { 
            dict = "anim@scripted@island@special_peds@pavel@hs4_pavel_ig5_caviar_p1",
            anim = "base_idle",
            params = {8.0, -8, -1, 49, 0},
            time = 2000, 
        },
        status = {
            hunger  = 20
        }
    },
    
    ["lccurrygoat"] = {
    uses = 3,
    prop = { 
        -- Prop spawn data for idle & usage.
        Main = {
            Model = 'black_ricebowl',
            BoneID = 18905,
            Offset = vector3(0.13953280028795, -0.024008528173895, 0.025093021603604),
            Rot = vector3( -28.747094709914, 0, 0),
        },
        Second = {
            Model = 'djs_chopstick',
            BoneID = 57005,
            Offset = vector3(0.10706410191858, 0.035042152657793, 0),
            Rot = vector3(104.87149632836, -37.083979569574, 179.28614600207),
        },
        },
        idle = {
            dict = "anim@eat@fork",
            anim = "fork_clip",
            params = {8.0, -8, -1, 49, 0},
            time = 2000, 
        },
        animation = { 
            dict = "anim@eat@fork",
            anim = "fork_clip",
            params = {8.0, -8, -1, 49, 0},
            time = 2000, 
        },
    status = { -- Per use. This is default without metadata intervention
        hunger  = 5
    }
    },
    
    ["lcricepeas"] = {
    uses = 3,
    prop = { 
        -- Prop spawn data for idle & usage.
        Main = {
            Model = 'black_ricebowl',
            BoneID = 18905,
            Offset = vector3(0.13953280028795, -0.024008528173895, 0.025093021603604),
            Rot = vector3( -28.747094709914, 0, 0),
        },
        Second = {
            Model = 'djs_chopstick',
            BoneID = 57005,
            Offset = vector3(0.10706410191858, 0.035042152657793, 0),
            Rot = vector3(104.87149632836, -37.083979569574, 179.28614600207),
        },
        },
        idle = {
            dict = "anim@eat@fork",
            anim = "fork_clip",
            params = {8.0, -8, -1, 49, 0},
            time = 2000, 
        },
        animation = { 
            dict = "anim@eat@fork",
            anim = "fork_clip",
            params = {8.0, -8, -1, 49, 0},
            time = 2000, 
        },
    status = { -- Per use. This is default without metadata intervention
        hunger  = 5
    }
    },
    
    ["lcyellrice"] = {
    uses = 3,
    prop = { 
        -- Prop spawn data for idle & usage.
        Main = {
            Model = 'black_ricebowl',
            BoneID = 18905,
            Offset = vector3(0.13953280028795, -0.024008528173895, 0.025093021603604),
            Rot = vector3( -28.747094709914, 0, 0),
        },
        Second = {
            Model = 'djs_chopstick',
            BoneID = 57005,
            Offset = vector3(0.10706410191858, 0.035042152657793, 0),
            Rot = vector3(104.87149632836, -37.083979569574, 179.28614600207),
        },
        },
        idle = {
            dict = "anim@eat@fork",
            anim = "fork_clip",
            params = {8.0, -8, -1, 49, 0},
            time = 2000, 
        },
        animation = { 
            dict = "anim@eat@fork",
            anim = "fork_clip",
            params = {8.0, -8, -1, 49, 0},
            time = 2000, 
        },
    status = { -- Per use. This is default without metadata intervention
        hunger  = 5
    }
    },
    
    ["lceggsandwich"] = {
        uses = 3,
        prop = {
            Main = {
                Model = 'sandwich_roastbeef',
                BoneID = 18905,
                Offset = vector3(0.12, 0.06, 0.08),
                Rot = vector3(154.0 , -32.0, 0.0),
            },
        },
--         idle = nil,
        animation = {
            dict = "mp_player_inteat@burger",
            anim = "mp_player_int_eat_burger_fp",
            params = {nil, nil, 1200, 49},
            time = 1200,
        },
        status = {
            hunger  = 20
        }
    },
    
    ["lcbakedbeans"] = {
uses = 3,
prop = { 
    -- Prop spawn data for idle & usage.
    Main = { 
        Model = 'bowl_chickpeesoup',
        BoneID = 18905,
        Offset = vector3(0.15678725526845, -0.0050334861860832, 0.031357341928032),
        Rot = vector3(-24.266444142288, 1.6600095970159, 5.6079281029707),
    },
    Second = { --https://forum.cfx.re/t/free-animation-eat-with-fork/5068991
        Model = 'alcaprop_fork',
        BoneID = 28422,
        Offset = vector3(0.010853324810796, 0.029339193596366, -0.019795742184349),
        Rot = vector3(0.0, 0.0, 96.560120437708),
    },
},
idle = {
    dict = "anim@eat@fork",
    anim = "fork_clip",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},
animation = { 
    dict = "anim@eat@fork",
    anim = "fork_clip",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},
status = { -- Per use. This is default without metadata intervention
    hunger  = 12
}
},
    
    ["lcsoupbowl"] = {
        uses = 3,
        prop = {
            Main = {
                Model = 'bowl_chickpeesoup',
                BoneID = 18905,
                Offset = vector3(0.1907507113068, 0.024559100551246, 0.069575185172031),
                Rot = vector3(-58.697119578141, -25.686824382993, 12.438901622251),
            },
            Second = {
                Model = 'collection_spoon',
                BoneID = 28422,
                Offset = vector3(0.0, 0.0, 0.0),
                Rot = vector3(0.0, 0.0, 0.0),
            }
        },
        idle = {
            dict = "anim@scripted@island@special_peds@pavel@hs4_pavel_ig5_caviar_p1",
            anim = "base_idle",
            params = {8.0, -8, -1, 49, 0},
            time = 2000, 
        },
        animation = { 
            dict = "anim@scripted@island@special_peds@pavel@hs4_pavel_ig5_caviar_p1",
            anim = "base_idle",
            params = {8.0, -8, -1, 49, 0},
            time = 2000, 
        },
        status = {
            hunger  = 20,
            thirst = 10
        }
    },
    ["lcapplejuice"] = {
    uses = 3,
    prop = {
        Main = {
            Model = 'juice_juicy',
            BoneID = 28422,
            Offset = vector3(0.0046061327977895, -0.010749240867084, -0.16534273478831),
            Rot = vector3(0.0, 0.0, 0.0),
        },
    },
    idle = {
        dict = "amb@code_human_wander_drinking@male@base",
        anim = "static",
        params = {8.0, -8, -1, 49, 0},
        time = 2000,
    },
    animation = {
        dict = "amb@code_human_wander_drinking_fat@male@idle_a",
        anim = "idle_c",
        params = {nil, nil, 2000, 49},
        time = 2000,
    },
    status = {
        thirst = 10
    }
    },
    -------------------------------------------------------------
                -----------      TO GO BOX     -----------
    -------------------------------------------------------------
    ["togoboxfull"] = {-- item name
    uses = 3,
    prop = { 
        -- Prop spawn data for idle & usage.
        Main = { 
            Model = 'djs_togo_kungpaochicken',
            BoneID = 18905,
            Offset = vector3(0.15678725526845, -0.0050334861860832, 0.031357341928032),
            Rot = vector3(-24.266444142288, 1.6600095970159, 5.6079281029707),
        },
        Second = { --https://forum.cfx.re/t/free-animation-eat-with-fork/5068991
            Model = 'alcaprop_fork',
            BoneID = 28422,
            Offset = vector3(0.010853324810796, 0.029339193596366, -0.019795742184349),
            Rot = vector3(0.0, 0.0, 96.560120437708),
        },
    },
    idle = {
        dict = "anim@eat@fork",
        anim = "fork_clip",
        params = {8.0, -8, -1, 49, 0},
        time = 2000, 
    },
    animation = { 
        dict = "anim@eat@fork",
        anim = "fork_clip",
        params = {8.0, -8, -1, 49, 0},
        time = 2000, 
    },
    status = { -- Per use. This is default without metadata intervention
        hunger  = 12
    }
    },
    ["bentobox"] = {-- item name
    uses = 4,
    prop = { 
        -- Prop spawn data for idle & usage.
        Main = { 
            Model = 'djs_togopremade_box',
            BoneID = 18905,
            Offset = vector3(0.15678725526845, -0.0050334861860832, 0.031357341928032),
            Rot = vector3(-24.266444142288, 1.6600095970159, 5.6079281029707),
        },
        Second = { --https://forum.cfx.re/t/free-animation-eat-with-fork/5068991
        Model = 'djs_chopstick',
        BoneID = 57005,
        Offset = vector3(0.10706410191858, 0.035042152657793, 0),
        Rot = vector3(104.87149632836, -37.083979569574, 179.28614600207),
    }   
    },
    idle = {
        dict = "anim@eat@fork",
        anim = "fork_clip",
        params = {8.0, -8, -1, 49, 0},
        time = 2000, 
    },
    animation = { 
        dict = "anim@eat@fork",
        anim = "fork_clip",
        params = {8.0, -8, -1, 49, 0},
        time = 2000, 
    },
    status = { -- Per use. This is default without metadata intervention
        hunger  = 12
    }
    },

    -------------------------------------------------------------
                -----------      24/7     -----------
    -------------------------------------------------------------
    ["box_wings"] = {-- item name
        uses = 6,
        prop = { 
        -- Prop spawn data for idle & usage.
            Main = { 
                Model = 'box_wings_louisianarub',
                BoneID = 18905,
                Offset = vector3(0.13895907509038, 0.02523307091407, -0.00024440441186642), 
                Rot = vector3(-15.343184382347, -13.256785603274, -32.335878980356),
            },
            Second = {
                Model = 'prop_chickenwing_louisianarub',
                BoneID = 28422,
                Offset = vector3(0.056637835361016, 0.023687603069486, -0.030054515100592),
                Rot = vector3(57.235175873964, -5.8659799095806, 9.4840812493706),
            }   
        },

        idle = {
            dict = "anim@eat@fork",
            anim = "fork_clip",
            params = {8.0, -8, -1, 49, 0},
            time = 2000, 
        },
        animation = { 
            dict = "anim@eat@fork",
            anim = "fork_clip",
            params = {8.0, -8, -1, 49, 0},
            time = 2000, 
        },

        status = { -- Per use. This is default without metadata intervention
            hunger  = 5,
        }
    },
    ["chips_nacho"] = {-- item name
        uses = 4,
        prop = { 
        -- Prop spawn data for idle & usage.
            Main = { 
                Model = 'chips_nacho',
                BoneID = 28422,
                Offset = vector3(0.041256084178599, -0.1037408706998, -0.10406530387078), 
                Rot = vector3( -86.537636935917, 77.32491394116, 9.1735732919098),
            },
        },

        idle = {
            dict = "anim@djs@food@chips",
            anim = "djs_food_chips_idle",
            params = {8.0, -8, -1, 49, 0},
            time = 2000, 
        },
        animation = { 
            dict = "anim@djs@food@chips",
            anim = "djs_food_chips_bite_single",
            params = {8.0, -8, -1, 49, 0},
            time = 2000, 
        },

        status = { -- Per use. This is default without metadata intervention
            hunger  = 7,
        }
    },
    ["chips_original"] = {-- item name
    uses = 5,
    prop = { 
    -- Prop spawn data for idle & usage.
        Main = { 
            Model = 'chips_original',
            BoneID = 28422,
            Offset = vector3(0.041256084178599, -0.1037408706998, -0.10406530387078), 
            Rot = vector3( -86.537636935917, 77.32491394116, 9.1735732919098),
        },
    },

    idle = {
        dict = "anim@djs@food@chips",
        anim = "djs_food_chips_idle",
        params = {8.0, -8, -1, 49, 0},
        time = 2000, 
    },
    animation = { 
        dict = "anim@djs@food@chips",
        anim = "djs_food_chips_bite_single",
        params = {8.0, -8, -1, 49, 0},
        time = 2000, 
    },

    status = { -- Per use. This is default without metadata intervention
        hunger  = 3,
    }
},
["coffeecup_blackwhite"] = {
    uses = 3,
    prop = { 
        Main = {
            Model = 'coffeecup_blackwhite',
            BoneID = 57005,
            Offset = vector3(0.052608283129189, -0.043068652880828, -0.04990939976107),
            Rot = vector3( 84.850341955668, -28.428830395779, 169.46349427528),
        }
    },
    idle = {
        dict = "anim@djs@drink@coffee",
        anim = "djs_drink_coffee_idle",
        params = {8.0, -8, -1, 49, 0},
        time = 2000, 
    },
    animation = { 
        dict = "anim@djs@drink@coffee",
        anim = "djs_drink_coffee_sip_long",
        params = {nil, nil, 2000, 49},
        time = 2000, 
    },
    status = {
        thirst = 4,
        sobriety = 5  -- Reduce alcohol level by 5 per use (stronger than water)
    }
},
["coffeecup_brownwhite"] = {
    uses = 3,
    prop = { 
        Main = {
            Model = 'coffeecup_brownwhite',
            BoneID = 57005,
            Offset = vector3(0.052608283129189, -0.043068652880828, -0.04990939976107),
            Rot = vector3( 84.850341955668, -28.428830395779, 169.46349427528),
        }
    },
    idle = {
        dict = "anim@djs@drink@coffee",
        anim = "djs_drink_coffee_idle",
        params = {8.0, -8, -1, 49, 0},
        time = 2000, 
    },
    animation = { 
        dict = "anim@djs@drink@coffee",
        anim = "djs_drink_coffee_sip_long",
        params = {nil, nil, 2000, 49},
        time = 2000, 
    },
    status = {
        thirst = 4,
        sobriety = 5  -- Reduce alcohol level by 5 per use (stronger than water)
    }
},
["cup_noodles"] = {-- item name
uses = 5,
prop = { 
-- Prop spawn data for idle & usage.
    Main = { 
        Model = 'cup_noodles',
        BoneID = 18905,
        Offset = vector3(0.16, 0.01, 0.02),
        Rot = vector3(326.0, 22.0, 46.0),
    },
    Second = {
        Model = 'djs_chopstick',
        BoneID = 57005,
        Offset = vector3(0.10706410191858, 0.035042152657793, 0),
        Rot = vector3(104.87149632836, -37.083979569574, 179.28614600207),
    }   
},
idle = {
    dict = "anim@eat@fork",
    anim = "fork_clip",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},
animation = { 
    dict = "anim@eat@fork",
    anim = "fork_clip",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},
status = { -- Per use. This is default without metadata intervention
    hunger  = 3,
}
},
["cup_rednoodles"] = {-- item name
uses = 5,
prop = { 
-- Prop spawn data for idle & usage.
    Main = { 
        Model = 'cup_noodles',
        BoneID = 18905,
        Offset = vector3(0.16, 0.01, 0.02),
        Rot = vector3(326.0, 22.0, 46.0),
    },
    Second = {
        Model = 'djs_chopstick',
        BoneID = 57005,
        Offset = vector3(0.10706410191858, 0.035042152657793, 0),
        Rot = vector3(104.87149632836, -37.083979569574, 179.28614600207),
    }   
},
idle = {
    dict = "anim@eat@fork",
    anim = "fork_clip",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},
animation = { 
    dict = "anim@eat@fork",
    anim = "fork_clip",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},
status = { -- Per use. This is default without metadata intervention
    hunger  = 3,
}
},
["glass_lemonade"] = {
    uses = 3,
    prop = {
        Main = {
            Model = 'glass_lemonade',
            BoneID = 28422,
            Offset = vector3(0.0046061327977895, -0.010749240867084, -0.16534273478831),
            Rot = vector3(0.0, 0.0, 0.0),
        },
    },
    idle = {
        dict = "amb@code_human_wander_drinking@male@base",
        anim = "static",
        params = {8.0, -8, -1, 49, 0},
        time = 2000,
    },
    animation = {
        dict = "amb@code_human_wander_drinking_fat@male@idle_a",
        anim = "idle_c",
        params = {nil, nil, 2000, 49},
        time = 2000,
    },
    status = {
        thirst = 10
    }
},
["glass_orangejuice"] = {
    uses = 3,
    prop = {
        Main = {
            Model = 'glass_orangejuice',
            BoneID = 28422,
            Offset = vector3(0.0046061327977895, -0.010749240867084, -0.16534273478831),
            Rot = vector3(0.0, 0.0, 0.0),
        },
    },
    idle = {
        dict = "amb@code_human_wander_drinking@male@base",
        anim = "static",
        params = {8.0, -8, -1, 49, 0},
        time = 2000,
    },
    animation = {
        dict = "amb@code_human_wander_drinking_fat@male@idle_a",
        anim = "idle_c",
        params = {nil, nil, 2000, 49},
        time = 2000,
    },
    status = {
        thirst = 10
    }
},
["glass_strawberryjuice"] = {
    uses = 3,
    prop = {
        Main = {
            Model = 'glass_strawberryjuice',
            BoneID = 28422,
            Offset = vector3(0.0046061327977895, -0.010749240867084, -0.16534273478831),
            Rot = vector3(0.0, 0.0, 0.0),
        },
    },
    idle = {
        dict = "amb@code_human_wander_drinking@male@base",
        anim = "static",
        params = {8.0, -8, -1, 49, 0},
        time = 2000,
    },
    animation = {
        dict = "amb@code_human_wander_drinking_fat@male@idle_a",
        anim = "idle_c",
        params = {nil, nil, 2000, 49},
        time = 2000,
    },
    status = {
        thirst = 10
    }
},
["glass_usvanillaalmondmilk"] = {
    uses = 3,
    prop = {
        Main = {
            Model = 'glass_usvanillaalmondmilk',
            BoneID = 28422,
            Offset = vector3(0.0046061327977895, -0.010749240867084, -0.16534273478831),
            Rot = vector3(0.0, 0.0, 0.0),
        },
    },
    idle = {
        dict = "amb@code_human_wander_drinking@male@base",
        anim = "static",
        params = {8.0, -8, -1, 49, 0},
        time = 2000,
    },
    animation = {
        dict = "amb@code_human_wander_drinking_fat@male@idle_a",
        anim = "idle_c",
        params = {nil, nil, 2000, 49},
        time = 2000,
    },
    status = {
        thirst = 7
    }
},
["ham_sandwich"] = {-- item name
uses = 4,
prop = { 
-- Prop spawn data for idle & usage.
    Main = {
        Model = 'ham_sandwich',
        BoneID = 18905,
        Offset = vector3(0.10438038205677, 0.008898016732886, 0.071785853766024),
        Rot = vector3(-147.52278234617, 1.8944813834135, -68.818607273731),
    }
},

-- idle = {
--     dict = "mp_suicide",
--     anim = "static",
--     params = {8.0, -8, -1, 49, 0},
--     time = 2000, 
-- },
animation = { 
    dict = "mp_player_inteat@burger",
    anim = "mp_player_int_eat_burger_fp",
    params = {nil, nil, 1200, 49},
    time = 2000, 
},

status = { -- Per use. This is default without metadata intervention
    hunger  = 6
}
},
["hotdog_mustard"] = {-- item name
uses = 3,
prop = { 
-- Prop spawn data for idle & usage.
    Main = {
        Model = 'hotdog_mustard',
        BoneID = 18905,
        Offset = vector3(0.086648570290436, 0.041258393792684, 0.038854693623486),
        Rot = vector3( 111.97980867102, -2.9260890193985, 79.896167083604),
    }
},

-- idle = {
--     dict = "mp_suicide",
--     anim = "static",
--     params = {8.0, -8, -1, 49, 0},
--     time = 2000, 
-- },
animation = { 
    dict = "mp_player_inteat@burger",
    anim = "mp_player_int_eat_burger_fp",
    params = {nil, nil, 1200, 49},
    time = 2000, 
},

status = { -- Per use. This is default without metadata intervention
    hunger  = 4
}
},
["icecreambar_chocolate"] = {-- item name
uses = 2,
prop = { 
-- Prop spawn data for idle & usage.
    Main = {
        Model = 'icecreambar_chocolate',
        BoneID = 28422,
        Offset = vector3(0.058054242272988, -0.0013077690604389, -0.047089471666982),
        Rot = vector3(-59.816203035454, 1.6105281512174, -11.046773484257),
    }
},

idle = {
    dict = "anim@djs@food@cone",
    anim = "djs_food_cone_idle",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},
animation = { 
    dict = "anim@djs@food@cone",
    anim = "djs_food_cone_lick_single",
    params = {nil, nil, 1200, 49},
    time = 2000, 
},

status = { -- Per use. This is default without metadata intervention
    hunger  = 7
}
},
["icecreamcone_strawberry"] = {-- item name
uses = 2,
prop = { 
-- Prop spawn data for idle & usage.
    Main = {
        Model = 'icecreamcone_strawberry',
        BoneID = 28422,
        Offset = vector3(0.058054242272988, -0.0013077690604389, -0.047089471666982),
        Rot = vector3(-59.816203035454, 1.6105281512174, -11.046773484257),
    }
},

idle = {
    dict = "anim@djs@food@cone",
    anim = "djs_food_cone_idle",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},
animation = { 
    dict = "anim@djs@food@cone",
    anim = "djs_food_cone_lick_single",
    params = {nil, nil, 1200, 49},
    time = 2000, 
},

status = { -- Per use. This is default without metadata intervention
    hunger  = 7
}
},
["icecreamcone_vanilla"] = {-- item name
uses = 2,
prop = { 
-- Prop spawn data for idle & usage.
    Main = {
        Model = 'icecreamcone_vanilla',
        BoneID = 28422,
        Offset = vector3(0.058054242272988, -0.0013077690604389, -0.047089471666982),
        Rot = vector3(-59.816203035454, 1.6105281512174, -11.046773484257),
    }
},

idle = {
    dict = "anim@djs@food@cone",
    anim = "djs_food_cone_idle",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},
animation = { 
    dict = "anim@djs@food@cone",
    anim = "djs_food_cone_lick_single",
    params = {nil, nil, 1200, 49},
    time = 2000, 
},

status = { -- Per use. This is default without metadata intervention
    hunger  = 7
}
},
["juice_juicy"] = {
    uses = 3,
    prop = {
        Main = {
            Model = 'juice_juicy',
            BoneID = 28422,
            Offset = vector3(0.0046061327977895, -0.010749240867084, -0.16534273478831),
            Rot = vector3(0.0, 0.0, 0.0),
        },
    },
    idle = {
        dict = "amb@code_human_wander_drinking@male@base",
        anim = "static",
        params = {8.0, -8, -1, 49, 0},
        time = 2000,
    },
    animation = {
        dict = "amb@code_human_wander_drinking_fat@male@idle_a",
        anim = "idle_c",
        params = {nil, nil, 2000, 49},
        time = 2000,
    },
    status = {
        thirst = 10
    }
},
["sprunklight"] = {
    uses = 3,
    prop = {
        Main = {
            Model = 'smallsoda',
            BoneID = 28422,
            Offset = vector3(0.0176, -0.0149, -0.049),
            Rot = vector3(05.0, -10.0, 0.0),
        },
    },
    idle = {
        dict = "amb@code_human_wander_drinking@male@base",
        anim = "static",
        params = {8.0, -8, -1, 49, 0},
        time = 2000,
    },
    animation = {
        dict = "amb@code_human_wander_drinking_fat@male@idle_a",
        anim = "idle_c",
        params = {nil, nil, 2000, 49},
        time = 2000,
    },
    status = {
        thirst = 10
    }
},
["sprunk"] = {
    uses = 3,
    prop = {
        Main = {
            Model = 'smallsoda',
            BoneID = 28422,
            Offset = vector3(0.0176, -0.0149, -0.049),
            Rot = vector3(05.0, -10.0, 0.0),
        },
    },
    idle = {
        dict = "amb@code_human_wander_drinking@male@base",
        anim = "static",
        params = {8.0, -8, -1, 49, 0},
        time = 2000,
    },
    animation = {
        dict = "amb@code_human_wander_drinking_fat@male@idle_a",
        anim = "idle_c",
        params = {nil, nil, 2000, 49},
        time = 2000,
    },
    status = {
        thirst = 10
    }
},
["sodajuicy"] = {
    uses = 3,
    prop = {
        Main = {
            Model = 'juice_juicy',
            BoneID = 28422,
            Offset = vector3(0.0046061327977895, -0.010749240867084, -0.16534273478831),
            Rot = vector3(0.0, 0.0, 0.0),
        },
    },
    idle = {
        dict = "amb@code_human_wander_drinking@male@base",
        anim = "static",
        params = {8.0, -8, -1, 49, 0},
        time = 2000,
    },
    animation = {
        dict = "amb@code_human_wander_drinking_fat@male@idle_a",
        anim = "idle_c",
        params = {nil, nil, 2000, 49},
        time = 2000,
    },
    status = {
        thirst = 10
    }
},
["poptart_carmelcookie"] = {-- item name
uses = 3,
prop = {
    Main = {
        Model = 'poptart_carmelcookie',
        BoneID = 18905,
        Offset = vector3(0.14070526514001, 0.034133531085036, 0.02619237719607),
        Rot = vector3(-32.594300776346, -11.109056463731, -8.1032231096811),
    },
},
--         idle = nil,
animation = {
    dict = "mp_player_inteat@burger",
    anim = "mp_player_int_eat_burger_fp",
    params = {nil, nil, 1200, 49},
    time = 1200,
},
status = { -- Per use. This is default without metadata intervention
    hunger  = 5
}
},
["poptart_cottoncandy"] = {-- item name
uses = 3,
prop = {
    Main = {
        Model = 'poptart_cottoncandy',
        BoneID = 18905,
        Offset = vector3(0.14070526514001, 0.034133531085036, 0.02619237719607),
        Rot = vector3(-32.594300776346, -11.109056463731, -8.1032231096811),
    },
},
--         idle = nil,
animation = {
    dict = "mp_player_inteat@burger",
    anim = "mp_player_int_eat_burger_fp",
    params = {nil, nil, 1200, 49},
    time = 1200,
},
status = { -- Per use. This is default without metadata intervention
    hunger  = 5
}
},
["poptart_redvelvet"] = {-- item name
uses = 3,
prop = {
    Main = {
        Model = 'poptart_redvelvet',
        BoneID = 18905,
        Offset = vector3(0.14070526514001, 0.034133531085036, 0.02619237719607),
        Rot = vector3(-32.594300776346, -11.109056463731, -8.1032231096811),
    },
},
--         idle = nil,
animation = {
    dict = "mp_player_inteat@burger",
    anim = "mp_player_int_eat_burger_fp",
    params = {nil, nil, 1200, 49},
    time = 1200,
},
status = { -- Per use. This is default without metadata intervention
    hunger  = 5
}
},
["poptart_sprinkles"] = {-- item name
uses = 3,
prop = {
    Main = {
        Model = 'poptart_sprinkles',
        BoneID = 18905,
        Offset = vector3(0.14070526514001, 0.034133531085036, 0.02619237719607),
        Rot = vector3(-32.594300776346, -11.109056463731, -8.1032231096811),
    },
},
--         idle = nil,
animation = {
    dict = "mp_player_inteat@burger",
    anim = "mp_player_int_eat_burger_fp",
    params = {nil, nil, 1200, 49},
    time = 1200,
},
status = { -- Per use. This is default without metadata intervention
    hunger  = 5
}
},
["poptart_strawberry"] = {-- item name
uses = 3,
prop = {
    Main = {
        Model = 'poptart_strawberry',
        BoneID = 18905,
        Offset = vector3(0.14070526514001, 0.034133531085036, 0.02619237719607),
        Rot = vector3(-32.594300776346, -11.109056463731, -8.1032231096811),
    },
},
--         idle = nil,
animation = {
    dict = "mp_player_inteat@burger",
    anim = "mp_player_int_eat_burger_fp",
    params = {nil, nil, 1200, 49},
    time = 1200,
},
status = { -- Per use. This is default without metadata intervention
    hunger  = 5
}
},
["poptart_strawberrymilkshake"] = {-- item name
uses = 3,
prop = {
    Main = {
        Model = 'poptart_strawberrymilkshake',
        BoneID = 18905,
        Offset = vector3(0.14070526514001, 0.034133531085036, 0.02619237719607),
        Rot = vector3(-32.594300776346, -11.109056463731, -8.1032231096811),
    },
},
--         idle = nil,
animation = {
    dict = "mp_player_inteat@burger",
    anim = "mp_player_int_eat_burger_fp",
    params = {nil, nil, 1200, 49},
    time = 1200,
},
status = { -- Per use. This is default without metadata intervention
    hunger  = 5
}
},
["snackwrap_chicken"] = { -- item name 
uses = 3,
prop = {
    Main = {
        Model = 'snackwrap_chicken',
        BoneID = 18905,
        Offset = vector3(0.10170257568916, 0, -0.0079558996093022),
        Rot = vector3( 0, 0, 57.546401996128),
    },
},
--         idle = nil,
animation = {
    dict = "mp_player_inteat@burger",
    anim = "mp_player_int_eat_burger_fp",
    params = {nil, nil, 1200, 49},
    time = 1200,
},
status = { -- Per use. This is default without metadata intervention
    hunger  = 6
}
},
["turkey_halfsandwich"] = { -- item name 
uses = 3,
prop = {
    Main = {
        Model = 'turkey_halfsandwich',
        BoneID = 18905,
        Offset = vector3(0.10170257568916, 0, -0.0079558996093022),
        Rot = vector3( 0, 0, 57.546401996128),
    },
},
--         idle = nil,
animation = {
    dict = "mp_player_inteat@burger",
    anim = "mp_player_int_eat_burger_fp",
    params = {nil, nil, 1200, 49},
    time = 1200,
},
status = { -- Per use. This is default without metadata intervention
    hunger  = 6
}
},
["water"] = {-- item name
uses = 4,
prop = { 
-- Prop spawn data for idle & usage.
    Main = {
        Model = 'ba_prop_club_water_bottle',
        BoneID = 18905,
        Offset = vector3(0.093624152124789, -0.11251250630125, 0.036004965702174),
        Rot = vector3( 98.721686091906, -15.111545424567, 168.63459786415),
    }
},

-- idle = {
--     dict = "mp_suicide",
--     anim = "static",
--     params = {8.0, -8, -1, 49, 0},
--     time = 2000, 
-- },
animation = { 
    dict = "mp_player_intdrink",
    anim = "loop_bottle",
    params = {nil, nil, 2000, 49},
    time = 2000, 
},

status = { -- Per use. This is default without metadata intervention
    thirst  = 7
}
},
["ecola"] = {
    uses = 3,
    prop = {
        Main = {
            Model = 'smallsoda',
            BoneID = 28422,
            Offset = vector3(0.0176, -0.0149, -0.049),
            Rot = vector3(05.0, -10.0, 0.0),
        },
    },
    idle = {
        dict = "amb@code_human_wander_drinking@male@base",
        anim = "static",
        params = {8.0, -8, -1, 49},
        time = 2000
    },
    animation = {
        dict = "amb@code_human_wander_drinking_fat@male@idle_a",
        anim = "idle_c",
        params = {nil, nil, 2000, 49},
        time = 2000
    },
    status = {
        thirst = 4
    }
},
["ecola_light"] = {
    uses = 3,
    prop = {
        Main = {
            Model = 'smallsoda',
            BoneID = 28422,
            Offset = vector3(0.0176, -0.0149, -0.049),
            Rot = vector3(05.0, -10.0, 0.0),
        },
    },
    idle = {
        dict = "amb@code_human_wander_drinking@male@base",
        anim = "static",
        params = {8.0, -8, -1, 49},
        time = 2000
    },
    animation = {
        dict = "amb@code_human_wander_drinking_fat@male@idle_a",
        anim = "idle_c",
        params = {nil, nil, 2000, 49},
        time = 2000
    },
    status = {
        thirst = 4
    }
},
["ecolalight"] = {
    uses = 3,
    prop = {
        Main = {
            Model = 'smallsoda',
            BoneID = 28422,
            Offset = vector3(0.0176, -0.0149, -0.049),
            Rot = vector3(05.0, -10.0, 0.0),
        },
    },
    idle = {
        dict = "amb@code_human_wander_drinking@male@base",
        anim = "static",
        params = {8.0, -8, -1, 49},
        time = 2000
    },
    animation = {
        dict = "amb@code_human_wander_drinking_fat@male@idle_a",
        anim = "idle_c",
        params = {nil, nil, 2000, 49},
        time = 2000
    },
    status = {
        thirst = 4
    }
},
["sandwich"] = {-- item name
uses = 4,
prop = { 
-- Prop spawn data for idle & usage.
    Main = {
        Model = 'ham_sandwich',
        BoneID = 18905,
        Offset = vector3(0.10438038205677, 0.008898016732886, 0.071785853766024),
        Rot = vector3(-147.52278234617, 1.8944813834135, -68.818607273731),
    }
},

-- idle = {
--     dict = "mp_suicide",
--     anim = "static",
--     params = {8.0, -8, -1, 49, 0},
--     time = 2000, 
-- },
animation = { 
    dict = "mp_player_inteat@burger",
    anim = "mp_player_int_eat_burger_fp",
    params = {nil, nil, 1200, 49},
    time = 2000, 
},

status = { -- Per use. This is default without metadata intervention
    hunger  = 5
}
},

    -------------------------------------------------------------
                -----------      ROBS LIQOUR     -----------
    -------------------------------------------------------------

["water_bottle"] = {-- item name
uses = 4,
prop = { 
-- Prop spawn data for idle & usage.
    Main = {
        Model = 'ba_prop_club_water_bottle',
        BoneID = 18905,
        Offset = vector3(0.093624152124789, -0.11251250630125, 0.036004965702174),
        Rot = vector3( 98.721686091906, -15.111545424567, 168.63459786415),
    }
},

-- idle = {
--     dict = "mp_suicide",
--     anim = "static",
--     params = {8.0, -8, -1, 49, 0},
--     time = 2000, 
-- },
animation = { 
    dict = "mp_player_intdrink",
    anim = "loop_bottle",
    params = {nil, nil, 2000, 49},
    time = 2000, 
},

status = { -- Per use. This is default without metadata intervention
    thirst  = 7
},
},

["beer"] = {-- item name
uses = 5,
prop = { 
-- Prop spawn data for idle & usage.
Main = {
    Model = 'prop_amb_beer_bottle',
    BoneID = 18905,
    Offset = vector3(0.10263894723641, 0.018932450277598, 0.019752450685277),
    Rot = vector3(105.25226135252, -46.218309225213, -164.56969022428),
},
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
params = {nil, nil, 2000, 49},
time = 2000
},
effect = { name = "drunk", time = 20000, intensity = 1.0 },

status = { -- Per use. This is default without metadata intervention
    thirst  = 3,
    alcohol = 5
}
},
    
["whiskey"] = {-- item name
uses = 5,
prop = { 
-- Prop spawn data for idle & usage.
    Main = {
        Model = 'prop_whiskey_bottle',
        BoneID = 28422,
        Offset = vector3(-0.00012680798079145, -0.03040646158728, -0.23966783930739),
        Rot = vector3(0, 0, 0),
    }
},

idle = {
    dict = "amb@code_human_wander_drinking@male@base",
    anim = "static",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},
animation = { 
    dict = "amb@code_human_wander_drinking_fat@male@idle_a",
    anim = "idle_c",
    params = {nil, nil, 2000, 49},
    time = 2000, 
},
effect = { name = "drunk", time = 20000, intensity = 1.0 },

status = { -- Per use. This is default without metadata intervention
    thirst  = 1,
    alcohol = 10
}
},
["vodka"] = {-- item name
uses = 5,
prop = { 
-- Prop spawn data for idle & usage.
    Main = {
        Model = 'prop_vodka_bottle',
        BoneID = 28422,
        Offset = vector3(-0.00012680798079145, -0.03040646158728, -0.23966783930739),
        Rot = vector3(0, 0, 0),
    }
},

idle = {
    dict = "amb@code_human_wander_drinking@male@base",
    anim = "static",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},
animation = { 
    dict = "amb@code_human_wander_drinking_fat@male@idle_a",
    anim = "idle_c",
    params = {nil, nil, 2000, 49},
    time = 2000, 
},
effect = { name = "drunk", time = 20000, intensity = 1.0 },

status = { -- Per use. This is default without metadata intervention
    thirst  = 1,
    alcohol = 10
}
},
	-------------
	------------- RESTAURANT GENERAL / EDIBLE -------------------------------------------------------------
	-------------
   -- TBA

    ["pisswasser"] = {-- item name
    uses = 5,
    prop = { 
    -- Prop spawn data for idle & usage.
    Main = {
        Model = 'prop_amb_beer_bottle',
        BoneID = 18905,
        Offset = vector3(0.10263894723641, 0.018932450277598, 0.019752450685277),
        Rot = vector3(105.25226135252, -46.218309225213, -164.56969022428),
    },
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
    params = {nil, nil, 2000, 49},
    time = 2000
    },
    effect = { name = "drunk", time = 20000, intensity = 1.0 },
    
    status = { -- Per use. This is default without metadata intervention
        thirst  = 3,
        alcohol = 5
    }
    },
    ["pisswasser2"] = {-- item name
    uses = 5,
    prop = { 
    -- Prop spawn data for idle & usage.
    Main = {
        Model = 'prop_amb_beer_bottle',
        BoneID = 18905,
        Offset = vector3(0.10263894723641, 0.018932450277598, 0.019752450685277),
        Rot = vector3(105.25226135252, -46.218309225213, -164.56969022428),
    },
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
    params = {nil, nil, 2000, 49},
    time = 2000
    },
    effect = { name = "drunk", time = 20000, intensity = 1.0 },
    
    status = { -- Per use. This is default without metadata intervention
        thirst  = 3,
        alcohol = 5
    }
    },
    ["pisswasser3"] = {-- item name
    uses = 5,
    prop = { 
    -- Prop spawn data for idle & usage.
    Main = {
        Model = 'prop_amb_beer_bottle',
        BoneID = 18905,
        Offset = vector3(0.10263894723641, 0.018932450277598, 0.019752450685277),
        Rot = vector3(105.25226135252, -46.218309225213, -164.56969022428),
    },
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
    params = {nil, nil, 2000, 49},
    time = 2000
    },
    effect = { name = "drunk", time = 20000, intensity = 1.0 },
    
    status = { -- Per use. This is default without metadata intervention
        thirst  = 3,
        alcohol = 5
    }
    },
    ["scotch"] = {-- item name
    uses = 5,
    prop = { 
    -- Prop spawn data for idle & usage.
        Main = {
            Model = 'prop_whiskey_bottle',
            BoneID = 28422,
            Offset = vector3(-0.00012680798079145, -0.03040646158728, -0.23966783930739),
            Rot = vector3(0, 0, 0),
        }
    },
    
    idle = {
        dict = "amb@code_human_wander_drinking@male@base",
        anim = "static",
        params = {8.0, -8, -1, 49, 0},
        time = 2000, 
    },
    animation = { 
        dict = "amb@code_human_wander_drinking_fat@male@idle_a",
        anim = "idle_c",
        params = {nil, nil, 2000, 49},
        time = 2000, 
    },
    effect = { name = "drunk", time = 20000, intensity = 1.0 },
    
    status = { -- Per use. This is default without metadata intervention
        thirst  = 2,
        alcohol = 10
    }
    },
   	-------------
	------------- YELLOW JACK ITEMS -------------------------------------------------------------
	-------------
    ["fries"] = {-- item name FIXME
    uses = 3,
    prop = {
        Main = {
            Model = 'djs_burgershot_fries',
            BoneID = 57005,
            Offset = vector3(0.094000, 0.092000, 0.000000),
            Rot = vec3(-57.000198, 0.000000, -75.750389),
        },
        Second = {
            Model = 'djs_prop_bsfries', 
            BoneID = 18905,
            Offset = vec3(0.107000, 0.072000, 0.000000), 
            Rot = vec3(100.799866, 0.000000, 29.999975),
        }
    },
--         idle = nil,
    animation = {
        dict = "anim@djs@food@chips",
        anim = "djs_food_chips_bite_loop",
        params = {nil, nil, 1200, 49},
        time = 2500,
    },
    status = { -- Per use. This is default without metadata intervention
        hunger  = 5
    }
},

["jack_burger"] = {-- item name
uses = 4,
prop = { 
-- Prop spawn data for idle & usage.
    Main = {
        Model = 'djs_cheeseburger_double',
        BoneID = 18905,
        Offset = vector3(0.10438038205677, 0.008898016732886, 0.071785853766024),
        Rot = vector3(-147.52278234617, 1.8944813834135, -68.818607273731),
    }
},

-- idle = {
--     dict = "mp_suicide",
--     anim = "static",
--     params = {8.0, -8, -1, 49, 0},
--     time = 2000, 
-- },
animation = { 
    dict = "mp_player_inteat@burger",
    anim = "mp_player_int_eat_burger_fp",
    params = {nil, nil, 1200, 49},
    time = 2000, 
},
status = { -- Per use. This is default without metadata intervention
hunger  = 10
}
},
["chickentenders"] = {-- item name
uses = 6,
prop = { 
    Main = { 
        Model = 'box_wings_louisianarub',
        BoneID = 18905,
        Offset = vector3(0.13895907509038, 0.02523307091407, -0.00024440441186642), 
        Rot = vector3(-15.343184382347, -13.256785603274, -32.335878980356),
    },
    Second = {
        Model = 'prop_chickenwing_louisianarub',
        BoneID = 28422,
        Offset = vector3(0.056637835361016, 0.023687603069486, -0.030054515100592),
        Rot = vector3(57.235175873964, -5.8659799095806, 9.4840812493706),
    }   
},
idle = {
    dict = "anim@eat@fork",
    anim = "fork_clip",
    params = {8.0, -8, -1, 49, 0},
    time = 2500, 
},
animation = { 
    dict = "anim@eat@fork",
    anim = "fork_clip",
    params = {8.0, -8, -1, 49, 0},
    time = 2500, 
},
status = { -- Per use. This is default without metadata intervention
    hunger  = 6,
}
},

["friedpickles"] = {-- item name
uses = 6,
prop = { 
-- Prop spawn data for idle & usage.
    Main = { 
        Model = 'box_wings_louisianarub',
        BoneID = 18905,
        Offset = vector3(0.13895907509038, 0.02523307091407, -0.00024440441186642), 
        Rot = vector3(-15.343184382347, -13.256785603274, -32.335878980356),
    },
    Second = {
        Model = 'prop_chickenwing_louisianarub',
        BoneID = 28422,
        Offset = vector3(0.056637835361016, 0.023687603069486, -0.030054515100592),
        Rot = vector3(57.235175873964, -5.8659799095806, 9.4840812493706),
    }   
},

idle = {
    dict = "anim@eat@fork",
    anim = "fork_clip",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},
animation = { 
    dict = "anim@eat@fork",
    anim = "fork_clip",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},

status = { -- Per use. This is default without metadata intervention
    hunger  = 6,
}
},
["desert_shooter"] = {-- item name
    uses = 5,
    prop = { 
    -- Prop spawn data for idle & usage.
        Main = {
            Model = 'djs_glass_whisky',
            BoneID = 28422,
            Offset = vector3(-0.0039579965108487, -0.0074137874142527, -0.042196966746394),
            Rot = vector3(0, 0, 0),
        }
    },

    idle = {
        dict = "amb@code_human_wander_drinking@male@base",
        anim = "static",
        params = {8.0, -8, -1, 49, 0},
        time = 2000, 
    },
    animation = { 
        dict = "amb@code_human_wander_drinking_fat@male@idle_a",
        anim = "idle_c",
        params = {nil, nil, 2000, 49},
        time = 2000, 
    },
    effect = { name = "drunk", time = 20000, intensity = 1.0 },

    status = { -- Per use. This is default without metadata intervention
        thirst  = 3,
        alcohol = 10
    }
},
["gin_tonic"] = {-- item name
    uses = 5,
    prop = { 
    -- Prop spawn data for idle & usage.
        Main = {
            Model = 'djs_glass_whisky',
            BoneID = 28422,
            Offset = vector3(-0.0039579965108487, -0.0074137874142527, -0.042196966746394),
            Rot = vector3(0, 0, 0),
        }
    },

    idle = {
        dict = "amb@code_human_wander_drinking@male@base",
        anim = "static",
        params = {8.0, -8, -1, 49, 0},
        time = 2000, 
    },
    animation = { 
        dict = "amb@code_human_wander_drinking_fat@male@idle_a",
        anim = "idle_c",
        params = {nil, nil, 2000, 49},
        time = 2000, 
    },
    effect = { name = "drunk", time = 20000, intensity = 1.0 },

    status = { -- Per use. This is default without metadata intervention
        thirst  = 3,
        alcohol = 10
    }
},
["rum_cola"] = {-- item name
    uses = 5,
    prop = { 
    -- Prop spawn data for idle & usage.
        Main = {
            Model = 'djs_glass_whisky',
            BoneID = 28422,
            Offset = vector3(-0.0039579965108487, -0.0074137874142527, -0.042196966746394),
            Rot = vector3(0, 0, 0),
        }
    },

    idle = {
        dict = "amb@code_human_wander_drinking@male@base",
        anim = "static",
        params = {8.0, -8, -1, 49, 0},
        time = 2000, 
    },
    animation = { 
        dict = "amb@code_human_wander_drinking_fat@male@idle_a",
        anim = "idle_c",
        params = {nil, nil, 2000, 49},
        time = 2000, 
    },
    effect = { name = "drunk", time = 20000, intensity = 1.0 },

    status = { -- Per use. This is default without metadata intervention
        thirst  = 3,
        alcohol = 10
    }
},
------------------------------------------------------------
---- PIZZA THIS
------------------------------------------------------------
["housewhite"] = {-- item name
uses = 5,
prop = { 
-- Prop spawn data for idle & usage.
    Main = {
        Model = 'prop_wine_bot_02',
        BoneID = 28422,
        Offset = vector3(-0.0047675442316404, -0.027305838605626, -0.19300346012185),
        Rot = vector3(0,0,0),
    }
},

idle = {
    dict = "amb@code_human_wander_drinking@male@base",
    anim = "static",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
    },
    animation = { 
    dict = "amb@code_human_wander_drinking_fat@male@idle_a",
    anim = "idle_c",
    params = {nil, nil, 2000, 49},
    time = 2000, 
    },
effect = { name = "drunk", time = 20000, intensity = 1.0 },
status = { -- Per use. This is default without metadata intervention
    thirst  = 3,
    alcohol = 10
}
},
["housered"] = {-- item name
uses = 5,
prop = { 
-- Prop spawn data for idle & usage.
    Main = {
        Model = 'prop_wine_bot_02',
        BoneID = 28422,
        Offset = vector3(-0.0047675442316404, -0.027305838605626, -0.19300346012185),
        Rot = vector3(0,0,0),
    }
},

idle = {
    dict = "amb@code_human_wander_drinking@male@base",
    anim = "static",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
    },
    animation = { 
    dict = "amb@code_human_wander_drinking_fat@male@idle_a",
    anim = "idle_c",
    params = {nil, nil, 2000, 49},
    time = 2000, 
    },
effect = { name = "drunk", time = 20000, intensity = 1.0 },
status = { -- Per use. This is default without metadata intervention
    thirst  = 3,
    alcohol = 10
}
},
["houserose"] = {-- item name
uses = 5,
prop = { 
-- Prop spawn data for idle & usage.
    Main = {
        Model = 'prop_wine_bot_02',
        BoneID = 28422,
        Offset = vector3(-0.0047675442316404, -0.027305838605626, -0.19300346012185),
        Rot = vector3(0,0,0),
    }
},

idle = {
    dict = "amb@code_human_wander_drinking@male@base",
    anim = "static",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
    },
    animation = { 
    dict = "amb@code_human_wander_drinking_fat@male@idle_a",
    anim = "idle_c",
    params = {nil, nil, 2000, 49},
    time = 2000, 
    },
effect = { name = "drunk", time = 20000, intensity = 1.0 },
status = { -- Per use. This is default without metadata intervention
    thirst  = 3,
    alcohol = 10
}
},
["pizza_seafood_slice"] = {-- item name
uses = 3,
prop = {
    Main = {
        Model = 'djs_slice_supreme',
        BoneID = 18905,
        Offset = vector3(0.12, 0.06, 0.08),
        Rot = vector3(154.0 , -32.0, 0.0),
    },
},
--         idle = nil,
animation = { 
    dict = "mp_player_inteat@burger",
    anim = "mp_player_int_eat_burger_fp",
    params = {nil, nil, 1200, 49},
    time = 1200, 
},
status = { -- Per use. This is default without metadata intervention
    hunger  = 12
}
},
["pizza_poiveron_slice"] = {-- item name
uses = 3,
prop = {
    Main = {
        Model = 'djs_slice_veggie',
        BoneID = 18905,
        Offset = vector3(0.12, 0.06, 0.08),
        Rot = vector3(154.0 , -32.0, 0.0),
    },
},
--         idle = nil,
animation = { 
    dict = "mp_player_inteat@burger",
    anim = "mp_player_int_eat_burger_fp",
    params = {nil, nil, 1200, 49},
    time = 1200, 
},
status = { -- Per use. This is default without metadata intervention
    hunger  = 12
}
},
["pizza_pineapple_slice"] = {-- item name
uses = 3,
prop = {
    Main = {
        Model = 'djs_slice_hawaiian',
        BoneID = 18905,
        Offset = vector3(0.12, 0.06, 0.08),
        Rot = vector3(154.0 , -32.0, 0.0),
    },
},
--         idle = nil,
animation = { 
    dict = "mp_player_inteat@burger",
    anim = "mp_player_int_eat_burger_fp",
    params = {nil, nil, 1200, 49},
    time = 1200, 
},
status = { -- Per use. This is default without metadata intervention
    hunger  = 12
}
},
["pizza_peperonni_slice"] = {-- item name
uses = 3,
prop = {
    Main = {
        Model = 'djs_slice_pepperoni',
        BoneID = 18905,
        Offset = vector3(0.12, 0.06, 0.08),
        Rot = vector3(154.0 , -32.0, 0.0),
    },
},
--         idle = nil,
animation = { 
    dict = "mp_player_inteat@burger",
    anim = "mp_player_int_eat_burger_fp",
    params = {nil, nil, 1200, 49},
    time = 1200, 
},
status = { -- Per use. This is default without metadata intervention
    hunger  = 12
}
},
["pizza_mozza_slice"] = {-- item name
uses = 3,
prop = {
    Main = {
        Model = 'djs_slice_cheese',
        BoneID = 18905,
        Offset = vector3(0.12, 0.06, 0.08),
        Rot = vector3(154.0 , -32.0, 0.0),
    },
},
--         idle = nil,
animation = { 
    dict = "mp_player_inteat@burger",
    anim = "mp_player_int_eat_burger_fp",
    params = {nil, nil, 1200, 49},
    time = 1200, 
},
status = { -- Per use. This is default without metadata intervention
    hunger  = 12
}
},
["pizza_ham_slice"] = {-- item name
uses = 3,
prop = {
    Main = {
        Model = 'djs_slice_meatlovers',
        BoneID = 18905,
        Offset = vector3(0.12, 0.06, 0.08),
        Rot = vector3(154.0 , -32.0, 0.0),
    },
},
--         idle = nil,
animation = { 
    dict = "mp_player_inteat@burger",
    anim = "mp_player_int_eat_burger_fp",
    params = {nil, nil, 1200, 49},
    time = 1200, 
},
status = { -- Per use. This is default without metadata intervention
    hunger  = 12
}
},
["pizza_cheese_slice"] = {-- item name
uses = 3,
prop = {
    Main = {
        Model = 'djs_slice_cheese',
        BoneID = 18905,
        Offset = vector3(0.12, 0.06, 0.08),
        Rot = vector3(154.0 , -32.0, 0.0),
    },
},
--         idle = nil,
animation = { 
    dict = "mp_player_inteat@burger",
    anim = "mp_player_int_eat_burger_fp",
    params = {nil, nil, 1200, 49},
    time = 1200, 
},
status = { -- Per use. This is default without metadata intervention
    hunger  = 12
}
},
["pizza_mushroom_slice"] = {-- item name
uses = 3,
prop = {
    Main = {
        Model = 'djs_slice_cheese',
        BoneID = 18905,
        Offset = vector3(0.12, 0.06, 0.08),
        Rot = vector3(154.0 , -32.0, 0.0),
    },
},
--         idle = nil,
animation = { 
    dict = "mp_player_inteat@burger",
    anim = "mp_player_int_eat_burger_fp",
    params = {nil, nil, 1200, 49},
    time = 1200, 
},
status = { -- Per use. This is default without metadata intervention
    hunger  = 12
}
},
	-------------------------------------------------------------
                -----------      REX'S DINER      -----------
    -------------------------------------------------------------
	
	["rex_2cheeseburger"] = {-- item name
		uses = 4,
		prop = { 
		-- Prop spawn data for idle & usage.
			Main = {
				Model = 'djs_cheeseburger_double',
				BoneID = 18905,
				Offset = vector3(0.10438038205677, 0.008898016732886, 0.071785853766024),
				Rot = vector3(-147.52278234617, 1.8944813834135, -68.818607273731),
			}
		},

		-- idle = {
		--     dict = "mp_suicide",
		--     anim = "static",
		--     params = {8.0, -8, -1, 49, 0},
		--     time = 2000, 
		-- },
		animation = { 
			dict = "mp_player_inteat@burger",
			anim = "mp_player_int_eat_burger_fp",
			params = {nil, nil, 1200, 49},
			time = 2000, 
		},
	status = { -- Per use. This is default without metadata intervention
		hunger  = 10
	}
	},
	["rex_2chickenburger"] = {-- item name
		uses = 4,
		prop = { 
		-- Prop spawn data for idle & usage.
			Main = {
				Model = 'djs_melt_baconcheese',
				BoneID = 18905,
				Offset = vector3(0.10438038205677, 0.008898016732886, 0.071785853766024),
				Rot = vector3(-147.52278234617, 1.8944813834135, -68.818607273731),
			}
		},

		-- idle = {
		--     dict = "mp_suicide",
		--     anim = "static",
		--     params = {8.0, -8, -1, 49, 0},
		--     time = 2000, 
		-- },
		animation = { 
			dict = "mp_player_inteat@burger",
			anim = "mp_player_int_eat_burger_fp",
			params = {nil, nil, 1200, 49},
			time = 2000, 
		},
		status = { -- Per use. This is default without metadata intervention
		hunger  = 10
	}
	},
	["rex_2fishburger"] = {-- item name
		uses = 4,
		prop = { 
		-- Prop spawn data for idle & usage.
			Main = {
				Model = 'djs_melt_classic',
				BoneID = 18905,
				Offset = vector3(0.10438038205677, 0.008898016732886, 0.071785853766024),
				Rot = vector3(-147.52278234617, 1.8944813834135, -68.818607273731),
			}
		},

		-- idle = {
		--     dict = "mp_suicide",
		--     anim = "static",
		--     params = {8.0, -8, -1, 49, 0},
		--     time = 2000, 
		-- },
		animation = { 
			dict = "mp_player_inteat@burger",
			anim = "mp_player_int_eat_burger_fp",
			params = {nil, nil, 1200, 49},
			time = 2000, 
		},
		status = { -- Per use. This is default without metadata intervention
		hunger  = 10
	}
	},
	["rex_3cheeseburger"] = {-- item name
		uses = 4,
		prop = { 
		-- Prop spawn data for idle & usage.
			Main = {
				Model = 'djs_cheeseburger_doublebacon',
				BoneID = 18905,
				Offset = vector3(0.10438038205677, 0.008898016732886, 0.071785853766024),
				Rot = vector3(-147.52278234617, 1.8944813834135, -68.818607273731),
			}
		},

		-- idle = {
		--     dict = "mp_suicide",
		--     anim = "static",
		--     params = {8.0, -8, -1, 49, 0},
		--     time = 2000, 
		-- },
		animation = { 
			dict = "mp_player_inteat@burger",
			anim = "mp_player_int_eat_burger_fp",
			params = {nil, nil, 1200, 49},
			time = 2000, 
		},
		status = { -- Per use. This is default without metadata intervention
		hunger  = 10
	}
	},
	["rex_baconlover"] = {-- item name
		uses = 4,
		prop = { 
		-- Prop spawn data for idle & usage.
			Main = {
				Model = 'djs_cheeseburger_doublebacon',
				BoneID = 18905,
				Offset = vector3(0.10438038205677, 0.008898016732886, 0.071785853766024),
				Rot = vector3(-147.52278234617, 1.8944813834135, -68.818607273731),
			}
		},

		-- idle = {
		--     dict = "mp_suicide",
		--     anim = "static",
		--     params = {8.0, -8, -1, 49, 0},
		--     time = 2000, 
		-- },
		animation = { 
			dict = "mp_player_inteat@burger",
			anim = "mp_player_int_eat_burger_fp",
			params = {nil, nil, 1200, 49},
			time = 2000, 
		},
		status = { -- Per use. This is default without metadata intervention
		hunger  = 10
	}
	},
	["rex_bleeder"] = {-- item name
		uses = 4,
		prop = { 
		-- Prop spawn data for idle & usage.
			Main = {
				Model = 'djs_cheeseburger_double',
				BoneID = 18905,
				Offset = vector3(0.10438038205677, 0.008898016732886, 0.071785853766024),
				Rot = vector3(-147.52278234617, 1.8944813834135, -68.818607273731),
			}
		},

		-- idle = {
		--     dict = "mp_suicide",
		--     anim = "static",
		--     params = {8.0, -8, -1, 49, 0},
		--     time = 2000, 
		-- },
		animation = { 
			dict = "mp_player_inteat@burger",
			anim = "mp_player_int_eat_burger_fp",
			params = {nil, nil, 1200, 49},
			time = 2000, 
		},
		status = { -- Per use. This is default without metadata intervention
		hunger  = 10
	}
	},
	["rex_burrito"] = {-- item name
		uses = 4,
		prop = { 
		-- Prop spawn data for idle & usage.
			Main = {
				Model = 'snackwrap_chicken',
				BoneID = 18905,
				Offset = vector3(0.10170257568916, 0, -0.0079558996093022),
				Rot = vector3( 0, 0, 57.546401996128),
			}
		},

		-- idle = {
		--     dict = "mp_suicide",
		--     anim = "static",
		--     params = {8.0, -8, -1, 49, 0},
		--     time = 2000, 
		-- },
		animation = { 
			dict = "mp_player_inteat@burger",
			anim = "mp_player_int_eat_burger_fp",
			params = {nil, nil, 1200, 49},
			time = 2000, 
		},
		status = { -- Per use. This is default without metadata intervention
		hunger  = 8
	}
	},
	["rex_cheeseburger"] = {-- item name
		uses = 4,
		prop = { 
		-- Prop spawn data for idle & usage.
			Main = {
				Model = 'djs_cheeseburger_singlenormal',
				BoneID = 18905,
				Offset = vector3(0.10438038205677, 0.008898016732886, 0.071785853766024),
				Rot = vector3(-147.52278234617, 1.8944813834135, -68.818607273731),
			}
		},

		-- idle = {
		--     dict = "mp_suicide",
		--     anim = "static",
		--     params = {8.0, -8, -1, 49, 0},
		--     time = 2000, 
		-- },
		animation = { 
			dict = "mp_player_inteat@burger",
			anim = "mp_player_int_eat_burger_fp",
			params = {nil, nil, 1200, 49},
			time = 2000, 
		},
		status = { -- Per use. This is default without metadata intervention
		hunger  = 10
	}
	},
	["rex_chicken_burrito"] = {-- item name
		uses = 4,
		prop = { 
		-- Prop spawn data for idle & usage.
			Main = {
				Model = 'snackwrap_chicken',
				BoneID = 18905,
				Offset = vector3(0.10170257568916, 0, -0.0079558996093022),
				Rot = vector3( 0, 0, 57.546401996128),
			}
		},

		-- idle = {
		--     dict = "mp_suicide",
		--     anim = "static",
		--     params = {8.0, -8, -1, 49, 0},
		--     time = 2000, 
		-- },
		animation = { 
			dict = "mp_player_inteat@burger",
			anim = "mp_player_int_eat_burger_fp",
			params = {nil, nil, 1200, 49},
			time = 2000, 
		},
		status = { -- Per use. This is default without metadata intervention
		hunger  = 7
	}
	},
	["rex_chickenburger"] = {-- item name
		uses = 4,
		prop = { 
		-- Prop spawn data for idle & usage.
			Main = {
				Model = 'djs_melt_baconcheese',
				BoneID = 18905,
				Offset = vector3(0.10438038205677, 0.008898016732886, 0.071785853766024),
				Rot = vector3(-147.52278234617, 1.8944813834135, -68.818607273731),
			}
		},

		-- idle = {
		--     dict = "mp_suicide",
		--     anim = "static",
		--     params = {8.0, -8, -1, 49, 0},
		--     time = 2000, 
		-- },
		animation = { 
			dict = "mp_player_inteat@burger",
			anim = "mp_player_int_eat_burger_fp",
			params = {nil, nil, 1200, 49},
			time = 2000, 
		},
		status = { -- Per use. This is default without metadata intervention
		hunger  = 9
	}
	},
	["rex_fishburger"] = {-- item name
		uses = 4,
		prop = { 
		-- Prop spawn data for idle & usage.
			Main = {
				Model = 'djs_melt_classic',
				BoneID = 18905,
				Offset = vector3(0.10438038205677, 0.008898016732886, 0.071785853766024),
				Rot = vector3(-147.52278234617, 1.8944813834135, -68.818607273731),
			}
		},

		-- idle = {
		--     dict = "mp_suicide",
		--     anim = "static",
		--     params = {8.0, -8, -1, 49, 0},
		--     time = 2000, 
		-- },
		animation = { 
			dict = "mp_player_inteat@burger",
			anim = "mp_player_int_eat_burger_fp",
			params = {nil, nil, 1200, 49},
			time = 2000, 
		},
		status = { -- Per use. This is default without metadata intervention
		hunger  = 6
	}
	},
	["rex_chilidog"] = {-- item name
		uses = 3,
		prop = { 
		-- Prop spawn data for idle & usage.
			Main = {
				Model = 'hotdog_mustard',
				BoneID = 18905,
				Offset = vector3(0.086648570290436, 0.041258393792684, 0.038854693623486),
				Rot = vector3( 111.97980867102, -2.9260890193985, 79.896167083604),
			}
		},

		-- idle = {
		--     dict = "mp_suicide",
		--     anim = "static",
		--     params = {8.0, -8, -1, 49, 0},
		--     time = 2000, 
		-- },
		animation = { 
			dict = "mp_player_inteat@burger",
			anim = "mp_player_int_eat_burger_fp",
			params = {nil, nil, 1200, 49},
			time = 2000, 
		},

		status = { -- Per use. This is default without metadata intervention
			hunger  = 5
		}
	},
	["rex_french_burrito"] = {-- item name
		uses = 4,
		prop = { 
		-- Prop spawn data for idle & usage.
			Main = {
				Model = 'snackwrap_chicken',
				BoneID = 18905,
				Offset = vector3(0.10170257568916, 0, -0.0079558996093022),
				Rot = vector3( 0, 0, 57.546401996128),
			}
		},

		-- idle = {
		--     dict = "mp_suicide",
		--     anim = "static",
		--     params = {8.0, -8, -1, 49, 0},
		--     time = 2000, 
		-- },
		animation = { 
			dict = "mp_player_inteat@burger",
			anim = "mp_player_int_eat_burger_fp",
			params = {nil, nil, 1200, 49},
			time = 2000, 
		},
		status = { -- Per use. This is default without metadata intervention
		hunger  = 7
	}
	},
	["rex_hammozsand"] = {-- item name
		uses = 4,
		prop = { 
		-- Prop spawn data for idle & usage.
			Main = {
				Model = 'ham_sandwich',
				BoneID = 18905,
				Offset = vector3(0.10438038205677, 0.008898016732886, 0.071785853766024),
				Rot = vector3(-147.52278234617, 1.8944813834135, -68.818607273731),
			}
		},

		-- idle = {
		--     dict = "mp_suicide",
		--     anim = "static",
		--     params = {8.0, -8, -1, 49, 0},
		--     time = 2000, 
		-- },
		animation = { 
			dict = "mp_player_inteat@burger",
			anim = "mp_player_int_eat_burger_fp",
			params = {nil, nil, 1200, 49},
			time = 2000, 
		},

		status = { -- Per use. This is default without metadata intervention
			hunger  = 8
		}
	},
	["rex_hamsand"] = {-- item name
		uses = 4,
		prop = { 
		-- Prop spawn data for idle & usage.
			Main = {
				Model = 'ham_sandwich',
				BoneID = 18905,
				Offset = vector3(0.10438038205677, 0.008898016732886, 0.071785853766024),
				Rot = vector3(-147.52278234617, 1.8944813834135, -68.818607273731),
			}
		},

		-- idle = {
		--     dict = "mp_suicide",
		--     anim = "static",
		--     params = {8.0, -8, -1, 49, 0},
		--     time = 2000, 
		-- },
		animation = { 
			dict = "mp_player_inteat@burger",
			anim = "mp_player_int_eat_burger_fp",
			params = {nil, nil, 1200, 49},
			time = 2000, 
		},

		status = { -- Per use. This is default without metadata intervention
			hunger  = 8
		}
	},
	["rex_heartstopper"] = {-- item name
		uses = 4,
		prop = { 
		-- Prop spawn data for idle & usage.
			Main = {
				Model = 'djs_cheeseburger_double',
				BoneID = 18905,
				Offset = vector3(0.10438038205677, 0.008898016732886, 0.071785853766024),
				Rot = vector3(-147.52278234617, 1.8944813834135, -68.818607273731),
			}
		},

		-- idle = {
		--     dict = "mp_suicide",
		--     anim = "static",
		--     params = {8.0, -8, -1, 49, 0},
		--     time = 2000, 
		-- },
		animation = { 
			dict = "mp_player_inteat@burger",
			anim = "mp_player_int_eat_burger_fp",
			params = {nil, nil, 1200, 49},
			time = 2000, 
		},

		status = { -- Per use. This is default without metadata intervention
			hunger  = 10
		}
	},
	["rex_hotdog"] = {-- item name
		uses = 3,
		prop = { 
		-- Prop spawn data for idle & usage.
			Main = {
				Model = 'hotdog_mustard',
				BoneID = 18905,
				Offset = vector3(0.086648570290436, 0.041258393792684, 0.038854693623486),
				Rot = vector3( 111.97980867102, -2.9260890193985, 79.896167083604),
			}
		},

		-- idle = {
		--     dict = "mp_suicide",
		--     anim = "static",
		--     params = {8.0, -8, -1, 49, 0},
		--     time = 2000, 
		-- },
		animation = { 
			dict = "mp_player_inteat@burger",
			anim = "mp_player_int_eat_burger_fp",
			params = {nil, nil, 1200, 49},
			time = 2000, 
		},

		status = { -- Per use. This is default without metadata intervention
			hunger  = 5
		}
	},
	["rex_loadedfries"] = {-- item name
        uses = 3,
        prop = { 
        -- Prop spawn data for idle & usage.
            Main = { 
                Model = 'fries_voodoo',
                BoneID = 18905,
                Offset = vector3(0.13895907509038, 0.02523307091407, -0.00024440441186642), 
                Rot = vector3(-15.343184382347, -13.256785603274, -32.335878980356),
            },
            Second = {
                Model = 'djs_prop_bsfries',
                BoneID = 28422,
                Offset = vector3(0.056637835361016, 0.023687603069486, -0.030054515100592),
                Rot = vector3(57.235175873964, -5.8659799095806, 9.4840812493706),
            }   
        },

        idle = {
            dict = "anim@eat@fork",
            anim = "fork_clip",
            params = {8.0, -8, -1, 49, 0},
            time = 2000, 
        },
        animation = { 
            dict = "anim@eat@fork",
            anim = "fork_clip",
            params = {8.0, -8, -1, 49, 0},
            time = 2000, 
        },

        status = { -- Per use. This is default without metadata intervention
            hunger  = 10,
        }
    },
	["rex_meatsaver"] = {-- item name
		uses = 4,
		prop = { 
		-- Prop spawn data for idle & usage.
			Main = {
				Model = 'djs_cheeseburger_double',
				BoneID = 18905,
				Offset = vector3(0.10438038205677, 0.008898016732886, 0.071785853766024),
				Rot = vector3(-147.52278234617, 1.8944813834135, -68.818607273731),
			}
		},

		-- idle = {
		--     dict = "mp_suicide",
		--     anim = "static",
		--     params = {8.0, -8, -1, 49, 0},
		--     time = 2000, 
		-- },
		animation = { 
			dict = "mp_player_inteat@burger",
			anim = "mp_player_int_eat_burger_fp",
			params = {nil, nil, 1200, 49},
			time = 2000, 
		},

		status = { -- Per use. This is default without metadata intervention
			hunger  = 7
		}
	},
	["rex_nachos"] = {-- item name
        uses = 4,
        prop = { 
        -- Prop spawn data for idle & usage.
            Main = { 
                Model = 'djs_basket_nachos',
                BoneID = 18905,
                Offset = vector3(0.13895907509038, 0.02523307091407, -0.00024440441186642), 
                Rot = vector3(-15.343184382347, -13.256785603274, -32.335878980356),
            },
            Second = {
                Model = 'djs_prop_nachochip',
                BoneID = 28422,
                Offset = vector3(0.056637835361016, 0.023687603069486, -0.030054515100592),
                Rot = vector3(57.235175873964, -5.8659799095806, 9.4840812493706),
            }   
        },

        idle = {
            dict = "anim@eat@fork",
            anim = "fork_clip",
            params = {8.0, -8, -1, 49, 0},
            time = 2000, 
        },
        animation = { 
            dict = "anim@eat@fork",
            anim = "fork_clip",
            params = {8.0, -8, -1, 49, 0},
            time = 2000, 
        },

        status = { -- Per use. This is default without metadata intervention
            hunger  = 6,
        }
    },
	["rex_nuggets"] = {-- item name
        uses = 6,
        prop = { 
        -- Prop spawn data for idle & usage.
            Main = { 
                Model = 'plate_chickentendersandfries',
                BoneID = 18905,
                Offset = vector3(0.13895907509038, 0.02523307091407, -0.00024440441186642), 
                Rot = vector3(-15.343184382347, -13.256785603274, -32.335878980356),
            },
            Second = {
                Model = 'prop_chickentender',
                BoneID = 28422,
                Offset = vector3(0.056637835361016, 0.023687603069486, -0.030054515100592),
                Rot = vector3(57.235175873964, -5.8659799095806, 9.4840812493706),
            }   
        },

        idle = {
            dict = "anim@eat@fork",
            anim = "fork_clip",
            params = {8.0, -8, -1, 49, 0},
            time = 2000, 
        },
        animation = { 
            dict = "anim@eat@fork",
            anim = "fork_clip",
            params = {8.0, -8, -1, 49, 0},
            time = 2000, 
        },

        status = { -- Per use. This is default without metadata intervention
            hunger  = 4,
        }
    },
	["rex_porkhole"] = {-- item name
		uses = 4,
		prop = { 
		-- Prop spawn data for idle & usage.
			Main = {
				Model = 'djs_hamburger_singlenormal',
				BoneID = 18905,
				Offset = vector3(0.10438038205677, 0.008898016732886, 0.071785853766024),
				Rot = vector3(-147.52278234617, 1.8944813834135, -68.818607273731),
			}
		},

		-- idle = {
		--     dict = "mp_suicide",
		--     anim = "static",
		--     params = {8.0, -8, -1, 49, 0},
		--     time = 2000, 
		-- },
		animation = { 
			dict = "mp_player_inteat@burger",
			anim = "mp_player_int_eat_burger_fp",
			params = {nil, nil, 1200, 49},
			time = 2000, 
		},

		status = { -- Per use. This is default without metadata intervention
			hunger  = 6
		}
	},
	["rex_veganburger"] = {-- item name
		uses = 4,
		prop = { 
		-- Prop spawn data for idle & usage.
			Main = {
				Model = 'djs_hamburger_singlenormal',
				BoneID = 18905,
				Offset = vector3(0.10438038205677, 0.008898016732886, 0.071785853766024),
				Rot = vector3(-147.52278234617, 1.8944813834135, -68.818607273731),
			}
		},

		-- idle = {
		--     dict = "mp_suicide",
		--     anim = "static",
		--     params = {8.0, -8, -1, 49, 0},
		--     time = 2000, 
		-- },
		animation = { 
			dict = "mp_player_inteat@burger",
			anim = "mp_player_int_eat_burger_fp",
			params = {nil, nil, 1200, 49},
			time = 2000, 
		},

		status = { -- Per use. This is default without metadata intervention
			hunger  = 3
		}
	},
--------------------------------------------------------------------
------------ ANGEL ARCADE -----------------------
---------------------------------------------------------------------
["ac_angels_glitch"] = {-- item name
    uses = 3,
    prop = { 
    -- Prop spawn data for idle & usage.
        Main = {
            Model = 'djs_glass_bluecosmopolitan',
            BoneID = 28422,
            Offset = vector3(-0.0039579965108487, -0.0074137874142527, -0.042196966746394),
            Rot = vector3(0, 0, 0),
        }
    },

    idle = {
        dict = "amb@code_human_wander_drinking@male@base",
        anim = "static",
        params = {8.0, -8, -1, 49, 0},
        time = 2000, 
    },
    animation = { 
        dict = "amb@code_human_wander_drinking_fat@male@idle_a",
        anim = "idle_c",
        params = {nil, nil, 2000, 49},
        time = 2000, 
    },
    effect = { name = "drunk", time = 20000, intensity = 1.0 },

    status = { -- Per use. This is default without metadata intervention
        thirst  = 4,
        alcohol = 10
    }
},
["ac_serenas_powerup"] = {-- item name
    uses = 3,
    prop = { 
    -- Prop spawn data for idle & usage.
        Main = {
            Model = 'djs_glass_redcosmopolitan',
            BoneID = 28422,
            Offset = vector3(-0.0039579965108487, -0.0074137874142527, -0.042196966746394),
            Rot = vector3(0, 0, 0),
        }
    },

    idle = {
        dict = "amb@code_human_wander_drinking@male@base",
        anim = "static",
        params = {8.0, -8, -1, 49, 0},
        time = 2000, 
    },
    animation = { 
        dict = "amb@code_human_wander_drinking_fat@male@idle_a",
        anim = "idle_c",
        params = {nil, nil, 2000, 49},
        time = 2000, 
    },
    effect = { name = "drunk", time = 20000, intensity = 1.0 },

    status = { -- Per use. This is default without metadata intervention
        thirst  = 4,
        alcohol = 10
    }
},
["ac_azaleas_fatality"] = {-- item name
    uses = 3,
    prop = { 
    -- Prop spawn data for idle & usage.
        Main = {
            Model = 'djs_cocktail_purple2',
            BoneID = 28422,
            Offset = vector3(-0.014873540860776, -0.016440867168978, -0.098777372914467),
            Rot = vector3(0, 0, 0),
        }
    },

    idle = {
        dict = "amb@code_human_wander_drinking@male@base",
        anim = "static",
        params = {8.0, -8, -1, 49, 0},
        time = 2000, 
    },
    animation = { 
        dict = "amb@code_human_wander_drinking_fat@male@idle_a",
        anim = "idle_c",
        params = {nil, nil, 2000, 49},
        time = 2000, 
    },
    effect = { name = "drunk", time = 20000, intensity = 1.0 },

    status = { -- Per use. This is default without metadata intervention
        thirst  = 4,
        alcohol = 12
    }
},
["ac_maxines_boost"] = {-- item name
    uses = 3,
    prop = { 
    -- Prop spawn data for idle & usage.
        Main = {
            Model = 'djs_cocktail_orange2',
            BoneID = 28422,
            Offset = vector3(-0.014873540860776, -0.016440867168978, -0.098777372914467),
            Rot = vector3(0, 0, 0),
        }
    },

    idle = {
        dict = "amb@code_human_wander_drinking@male@base",
        anim = "static",
        params = {8.0, -8, -1, 49, 0},
        time = 2000, 
    },
    animation = { 
        dict = "amb@code_human_wander_drinking_fat@male@idle_a",
        anim = "idle_c",
        params = {nil, nil, 2000, 49},
        time = 2000, 
    },
    effect = { name = "drunk", time = 20000, intensity = 1.0 },

    status = { -- Per use. This is default without metadata intervention
        thirst  = 4,
        alcohol = 10
    }
},
---------------------------------------------------
--------------- VANILLA UNICORN
---------------------------------------------------
["amarettosour"] = {-- item name
    uses = 3,
    prop = { 
    -- Prop spawn data for idle & usage.
        Main = {
            Model = 'djs_cocktail_orange2',
            BoneID = 28422,
            Offset = vector3(-0.014873540860776, -0.016440867168978, -0.098777372914467),
            Rot = vector3(0, 0, 0),
        }
    },

    idle = {
        dict = "amb@code_human_wander_drinking@male@base",
        anim = "static",
        params = {8.0, -8, -1, 49, 0},
        time = 2000, 
    },
    animation = { 
        dict = "amb@code_human_wander_drinking_fat@male@idle_a",
        anim = "idle_c",
        params = {nil, nil, 2000, 49},
        time = 2000, 
    },
    effect = { name = "drunk", time = 20000, intensity = 1.0 },

    status = { -- Per use. This is default without metadata intervention
        thirst  = 4,
        alcohol = 13
    }
},
["cosmopolitan"] = {-- item name
    uses = 3,
    prop = { 
    -- Prop spawn data for idle & usage.
        Main = {
            Model = 'djs_glass_redcosmopolitan',
            BoneID = 28422,
            Offset = vector3(-0.014873540860776, -0.016440867168978, -0.098777372914467),
            Rot = vector3(0, 0, 0),
        }
    },

    idle = {
        dict = "amb@code_human_wander_drinking@male@base",
        anim = "static",
        params = {8.0, -8, -1, 49, 0},
        time = 2000, 
    },
    animation = { 
        dict = "amb@code_human_wander_drinking_fat@male@idle_a",
        anim = "idle_c",
        params = {nil, nil, 2000, 49},
        time = 2000, 
    },
    effect = { name = "drunk", time = 20000, intensity = 1.0 },

    status = { -- Per use. This is default without metadata intervention
        thirst  = 4,
        alcohol = 12
    }
},
["longisland"] = {-- item name
    uses = 3,
    prop = { 
    -- Prop spawn data for idle & usage.
        Main = {
            Model = 'djs_glass_seabreeze',
            BoneID = 28422,
            Offset = vector3(-0.014873540860776, -0.016440867168978, -0.098777372914467),
            Rot = vector3(0, 0, 0),
        }
    },

    idle = {
        dict = "amb@code_human_wander_drinking@male@base",
        anim = "static",
        params = {8.0, -8, -1, 49, 0},
        time = 2000, 
    },
    animation = { 
        dict = "amb@code_human_wander_drinking_fat@male@idle_a",
        anim = "idle_c",
        params = {nil, nil, 2000, 49},
        time = 2000, 
    },
    effect = { name = "drunk", time = 20000, intensity = 1.0 },

    status = { -- Per use. This is default without metadata intervention
        thirst  = 4,
        alcohol = 11
    }
},
["margarita"] = {-- item name
    uses = 3,
    prop = { 
    -- Prop spawn data for idle & usage.
        Main = {
            Model = 'djs_glass_pinkmaitai',
            BoneID = 28422,
            Offset = vector3(-0.0039579965108487, -0.0074137874142527, -0.042196966746394),
            Rot = vector3(0, 0, 0),
        }
    },

    idle = {
        dict = "amb@code_human_wander_drinking@male@base",
        anim = "static",
        params = {8.0, -8, -1, 49, 0},
        time = 2000, 
    },
    animation = { 
        dict = "amb@code_human_wander_drinking_fat@male@idle_a",
        anim = "idle_c",
        params = {nil, nil, 2000, 49},
        time = 2000, 
    },
    effect = { name = "drunk", time = 20000, intensity = 1.0 },

    status = { -- Per use. This is default without metadata intervention
        thirst  = 4,
        alcohol = 9
    }
},
["nplate"] = {-- item name
uses = 4,
prop = { 
-- Prop spawn data for idle & usage.
    Main = { 
        Model = 'djs_basket_nachos',
        BoneID = 18905,
        Offset = vector3(0.13895907509038, 0.02523307091407, -0.00024440441186642), 
        Rot = vector3(-15.343184382347, -13.256785603274, -32.335878980356),
    },
    Second = {
        Model = 'djs_prop_nachochip',
        BoneID = 28422,
        Offset = vector3(0.056637835361016, 0.023687603069486, -0.030054515100592),
        Rot = vector3(57.235175873964, -5.8659799095806, 9.4840812493706),
    }   
},

idle = {
    dict = "anim@eat@fork",
    anim = "fork_clip",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},
animation = { 
    dict = "anim@eat@fork",
    anim = "fork_clip",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},

status = { -- Per use. This is default without metadata intervention
    hunger  = 7,
}
},
["pinacolada"] = {-- item name
    uses = 3,
    prop = { 
    -- Prop spawn data for idle & usage.
        Main = {
            Model = 'djs_glass_pinacolada',
            BoneID = 28422,
            Offset = vector3(-0.0039579965108487, -0.0074137874142527, -0.042196966746394),
            Rot = vector3(0, 0, 0),
        }
    },

    idle = {
        dict = "amb@code_human_wander_drinking@male@base",
        anim = "static",
        params = {8.0, -8, -1, 49, 0},
        time = 2000, 
    },
    animation = { 
        dict = "amb@code_human_wander_drinking_fat@male@idle_a",
        anim = "idle_c",
        params = {nil, nil, 2000, 49},
        time = 2000, 
    },
    effect = { name = "drunk", time = 20000, intensity = 1.0 },

    status = { -- Per use. This is default without metadata intervention
        thirst  = 4,
        alcohol = 10
    }
},
["screwdriver"] = {-- item name
    uses = 3,
    prop = { 
    -- Prop spawn data for idle & usage.
        Main = {
            Model = 'djs_cocktail_orange6',
            BoneID = 28422,
            Offset = vector3(-0.0039579965108487, -0.0074137874142527, -0.042196966746394),
            Rot = vector3(0, 0, 0),
        }
    },

    idle = {
        dict = "amb@code_human_wander_drinking@male@base",
        anim = "static",
        params = {8.0, -8, -1, 49, 0},
        time = 2000, 
    },
    animation = { 
        dict = "amb@code_human_wander_drinking_fat@male@idle_a",
        anim = "idle_c",
        params = {nil, nil, 2000, 49},
        time = 2000, 
    },
    effect = { name = "drunk", time = 20000, intensity = 1.0 },

    status = { -- Per use. This is default without metadata intervention
        thirst  = 4,
        alcohol = 10
    }
},
["tots"] = {-- item name
uses = 5,
prop = { 
-- Prop spawn data for idle & usage.
    Main = { 
        Model = 'plate_chickentendersandfries',
        BoneID = 18905,
        Offset = vector3(0.13895907509038, 0.02523307091407, -0.00024440441186642), 
        Rot = vector3(-15.343184382347, -13.256785603274, -32.335878980356),
    },
    Second = {
        Model = 'prop_chickentender',
        BoneID = 28422,
        Offset = vector3(0.056637835361016, 0.023687603069486, -0.030054515100592),
        Rot = vector3(57.235175873964, -5.8659799095806, 9.4840812493706),
    }   
},

idle = {
    dict = "anim@eat@fork",
    anim = "fork_clip",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},
animation = { 
    dict = "anim@eat@fork",
    anim = "fork_clip",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},

status = { -- Per use. This is default without metadata intervention
    hunger  = 5,
}
},
["vutacos"] = {-- item name
uses = 3,
prop = { 
-- Prop spawn data for idle & usage.
    Main = {
        Model = 'prop_taco_01',
        BoneID = 18905,
        Offset = vector3(0.13, 0.05, 0.02), 
        Rot = vector3(0.0, -140.0, -140.0),
    }
},

-- idle = {
--     dict = "mp_suicide",
--     anim = "static",
--     params = {8.0, -8, -1, 49, 0},
--     time = 2000, 
-- },
animation = { 
    dict = "mp_player_inteat@burger",
    anim = "mp_player_int_eat_burger_fp",
    params = {nil, nil, 1200, 49},
    time = 2000, 
},

status = { -- Per use. This is default without metadata intervention
    hunger  = 12
}
},
["vusliders"] = {-- item name
uses = 4,
prop = { 
-- Prop spawn data for idle & usage.
    Main = {
        Model = 'djs_cheeseburger_double',
        BoneID = 18905,
        Offset = vector3(0.10438038205677, 0.008898016732886, 0.071785853766024),
        Rot = vector3(-147.52278234617, 1.8944813834135, -68.818607273731),
    }
},

-- idle = {
--     dict = "mp_suicide",
--     anim = "static",
--     params = {8.0, -8, -1, 49, 0},
--     time = 2000, 
-- },
animation = { 
    dict = "mp_player_inteat@burger",
    anim = "mp_player_int_eat_burger_fp",
    params = {nil, nil, 1200, 49},
    time = 2000, 
},
status = { -- Per use. This is default without metadata intervention
		hunger  = 10
	}
},
["strawdaquiri"] = {-- item name
    uses = 3,
    prop = { 
    -- Prop spawn data for idle & usage.
        Main = {
            Model = 'djs_cocktail_red',
            BoneID = 28422,
            Offset = vector3(-0.0039579965108487, -0.0074137874142527, -0.042196966746394),
            Rot = vector3(0, 0, 0),
        }
    },

    idle = {
        dict = "amb@code_human_wander_drinking@male@base",
        anim = "static",
        params = {8.0, -8, -1, 49, 0},
        time = 2000, 
    },
    animation = { 
        dict = "amb@code_human_wander_drinking_fat@male@idle_a",
        anim = "idle_c",
        params = {nil, nil, 2000, 49},
        time = 2000, 
    },
    effect = { name = "drunk", time = 20000, intensity = 1.0 },

    status = { -- Per use. This is default without metadata intervention
        thirst  = 4,
        alcohol = 10
    }
},
["strawmargarita"] = {-- item name
    uses = 3,
    prop = { 
    -- Prop spawn data for idle & usage.
        Main = {
            Model = 'djs_cocktail_red3',
            BoneID = 28422,
            Offset = vector3(-0.0039579965108487, -0.0074137874142527, -0.042196966746394),
            Rot = vector3(0, 0, 0),
        }
    },

    idle = {
        dict = "amb@code_human_wander_drinking@male@base",
        anim = "static",
        params = {8.0, -8, -1, 49, 0},
        time = 2000, 
    },
    animation = { 
        dict = "amb@code_human_wander_drinking_fat@male@idle_a",
        anim = "idle_c",
        params = {nil, nil, 2000, 49},
        time = 2000, 
    },
    effect = { name = "drunk", time = 20000, intensity = 1.0 },

    status = { -- Per use. This is default without metadata intervention
        thirst  = 4,
        alcohol = 10
    }
},

---------------------------------------------------------------------
--------------- CASEYS DINER
---------------------------------------------------------------------
["sandandresburrito"] = {-- item name
uses = 4,
prop = { 
-- Prop spawn data for idle & usage.
    Main = {
        Model = 'snackwrap_chicken',
        BoneID = 18905,
        Offset = vector3(0.10170257568916, 0, -0.0079558996093022),
        Rot = vector3( 0, 0, 57.546401996128),
    }
},

-- idle = {
--     dict = "mp_suicide",
--     anim = "static",
--     params = {8.0, -8, -1, 49, 0},
--     time = 2000, 
-- },
animation = { 
    dict = "mp_player_inteat@burger",
    anim = "mp_player_int_eat_burger_fp",
    params = {nil, nil, 1200, 49},
    time = 2000, 
},
status = { -- Per use. This is default without metadata intervention
hunger  = 8
}
},
["thecaseyburger"] = {-- item name
uses = 4,
prop = { 
-- Prop spawn data for idle & usage.
    Main = {
        Model = 'djs_cheeseburger_double',
        BoneID = 18905,
        Offset = vector3(0.10438038205677, 0.008898016732886, 0.071785853766024),
        Rot = vector3(-147.52278234617, 1.8944813834135, -68.818607273731),
    }
},

-- idle = {
--     dict = "mp_suicide",
--     anim = "static",
--     params = {8.0, -8, -1, 49, 0},
--     time = 2000, 
-- },
animation = { 
    dict = "mp_player_inteat@burger",
    anim = "mp_player_int_eat_burger_fp",
    params = {nil, nil, 1200, 49},
    time = 2000, 
},
status = { -- Per use. This is default without metadata intervention
		hunger  = 10
	}
},
["pancakesneggs"] = {-- item name
uses = 3,
prop = { 
    -- Prop spawn data for idle & usage.
    Main = { 
        Model = 'djs_plate_cinammonpancakes',
        BoneID = 18905,
        Offset = vector3(0.15678725526845, -0.0050334861860832, 0.031357341928032),
        Rot = vector3(-24.266444142288, 1.6600095970159, 5.6079281029707),
    },
    Second = { --https://forum.cfx.re/t/free-animation-eat-with-fork/5068991
        Model = 'alcaprop_fork',
        BoneID = 28422,
        Offset = vector3(0.010853324810796, 0.029339193596366, -0.019795742184349),
        Rot = vector3(0.0, 0.0, 96.560120437708),
    },
},
idle = {
    dict = "anim@eat@fork",
    anim = "fork_clip",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},
animation = { 
    dict = "anim@eat@fork",
    anim = "fork_clip",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},
},
["steaknfries"] = {-- item name
uses = 3,
prop = { 
    -- Prop spawn data for idle & usage.
    Main = { 
        Model = 'djs_plate_cinammonpancakes',
        BoneID = 18905,
        Offset = vector3(0.15678725526845, -0.0050334861860832, 0.031357341928032),
        Rot = vector3(-24.266444142288, 1.6600095970159, 5.6079281029707),
    },
    Second = { --https://forum.cfx.re/t/free-animation-eat-with-fork/5068991
        Model = 'alcaprop_fork',
        BoneID = 28422,
        Offset = vector3(0.010853324810796, 0.029339193596366, -0.019795742184349),
        Rot = vector3(0.0, 0.0, 96.560120437708),
    },
},
idle = {
    dict = "anim@eat@fork",
    anim = "fork_clip",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},
animation = { 
    dict = "anim@eat@fork",
    anim = "fork_clip",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},
},
["famousbrekkieplatter"] = {-- item name
uses = 3,
prop = { 
    -- Prop spawn data for idle & usage.
    Main = { 
        Model = 'djs_bigplate_baconeggtoast',
        BoneID = 18905,
        Offset = vector3(0.15678725526845, -0.0050334861860832, 0.031357341928032),
        Rot = vector3(-24.266444142288, 1.6600095970159, 5.6079281029707),
    },
    Second = { --https://forum.cfx.re/t/free-animation-eat-with-fork/5068991
        Model = 'alcaprop_fork',
        BoneID = 28422,
        Offset = vector3(0.010853324810796, 0.029339193596366, -0.019795742184349),
        Rot = vector3(0.0, 0.0, 96.560120437708),
    },
},
idle = {
    dict = "anim@eat@fork",
    anim = "fork_clip",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},
animation = { 
    dict = "anim@eat@fork",
    anim = "fork_clip",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},
status = { -- Per use. This is default without metadata intervention
    hunger  = 12
}
},

["biscuitsngravy"] = {-- item name
uses = 3,
prop = { 
    -- Prop spawn data for idle & usage.
    Main = { 
        Model = 'djs_bigplate_baconeggtoast',
        BoneID = 18905,
        Offset = vector3(0.15678725526845, -0.0050334861860832, 0.031357341928032),
        Rot = vector3(-24.266444142288, 1.6600095970159, 5.6079281029707),
    },
    Second = { --https://forum.cfx.re/t/free-animation-eat-with-fork/5068991
        Model = 'alcaprop_fork',
        BoneID = 28422,
        Offset = vector3(0.010853324810796, 0.029339193596366, -0.019795742184349),
        Rot = vector3(0.0, 0.0, 96.560120437708),
    },
},
idle = {
    dict = "anim@eat@fork",
    anim = "fork_clip",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},
animation = { 
    dict = "anim@eat@fork",
    anim = "fork_clip",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},
status = { -- Per use. This is default without metadata intervention
    hunger  = 12
}
},
["fruitmedleybowl"] = {-- item name
uses = 3,
prop = { 
    -- Prop spawn data for idle & usage.
    Main = { 
        Model = 'bowl_housesalad',
        BoneID = 18905,
        Offset = vector3(0.15678725526845, -0.0050334861860832, 0.031357341928032),
        Rot = vector3(-24.266444142288, 1.6600095970159, 5.6079281029707),
    },
    Second = { --https://forum.cfx.re/t/free-animation-eat-with-fork/5068991
        Model = 'alcaprop_fork',
        BoneID = 28422,
        Offset = vector3(0.010853324810796, 0.029339193596366, -0.019795742184349),
        Rot = vector3(0.0, 0.0, 96.560120437708),
    },
},
idle = {
    dict = "anim@eat@fork",
    anim = "fork_clip",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},
animation = { 
    dict = "anim@eat@fork",
    anim = "fork_clip",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},
status = { -- Per use. This is default without metadata intervention
    hunger  = 12
}
},
["specialitypieslice"] = {-- item name
uses = 3,
prop = { 
    -- Prop spawn data for idle & usage.
    Main = { 
        Model = 'plate_strawberrycake',
        BoneID = 18905,
        Offset = vector3(0.15678725526845, -0.0050334861860832, 0.031357341928032),
        Rot = vector3(-24.266444142288, 1.6600095970159, 5.6079281029707),
    },
    Second = { --https://forum.cfx.re/t/free-animation-eat-with-fork/5068991
        Model = 'alcaprop_fork',
        BoneID = 28422,
        Offset = vector3(0.010853324810796, 0.029339193596366, -0.019795742184349),
        Rot = vector3(0.0, 0.0, 96.560120437708),
    },
},
idle = {
    dict = "anim@eat@fork",
    anim = "fork_clip",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},
animation = { 
    dict = "anim@eat@fork",
    anim = "fork_clip",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},
status = { -- Per use. This is default without metadata intervention
    hunger  = 12
}
},
["specialitycheesecakeslice"] = {-- item name
uses = 3,
prop = { 
    -- Prop spawn data for idle & usage.
    Main = { 
        Model = 'plate_moltenlavacake',
        BoneID = 18905,
        Offset = vector3(0.15678725526845, -0.0050334861860832, 0.031357341928032),
        Rot = vector3(-24.266444142288, 1.6600095970159, 5.6079281029707),
    },
    Second = { --https://forum.cfx.re/t/free-animation-eat-with-fork/5068991
        Model = 'alcaprop_fork',
        BoneID = 28422,
        Offset = vector3(0.010853324810796, 0.029339193596366, -0.019795742184349),
        Rot = vector3(0.0, 0.0, 96.560120437708),
    },
},
idle = {
    dict = "anim@eat@fork",
    anim = "fork_clip",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},
animation = { 
    dict = "anim@eat@fork",
    anim = "fork_clip",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},
status = { -- Per use. This is default without metadata intervention
    hunger  = 12
}
},
["tunamelt"] = {-- item name
uses = 4,
prop = { 
-- Prop spawn data for idle & usage.
    Main = {
        Model = 'ham_sandwich',
        BoneID = 18905,
        Offset = vector3(0.10438038205677, 0.008898016732886, 0.071785853766024),
        Rot = vector3(-147.52278234617, 1.8944813834135, -68.818607273731),
    }
},

-- idle = {
--     dict = "mp_suicide",
--     anim = "static",
--     params = {8.0, -8, -1, 49, 0},
--     time = 2000, 
-- },
animation = { 
    dict = "mp_player_inteat@burger",
    anim = "mp_player_int_eat_burger_fp",
    params = {nil, nil, 1200, 49},
    time = 2000, 
},

status = { -- Per use. This is default without metadata intervention
    hunger  = 7
}
},
["slushies"] = {-- item name
uses = 5,
prop = { 
-- Prop spawn data for idle & usage.
Main = {
    Model = 'djs_shavedice3',
    BoneID = 28422,
    Offset = vector3(-0.020913791474754, -0.0030494253160415, -0.04124343052088),
    Rot = vector3(0, 0, 0),
}
},

idle = {
dict = "amb@code_human_wander_drinking@male@base",
anim = "static",
params = {8.0, -8, -1, 49, 0},
time = 2000, 
},
animation = { 
dict = "amb@code_human_wander_drinking_fat@male@idle_a",
anim = "idle_c",
params = {nil, nil, 2000, 49},
time = 2000, 
},

status = { -- Per use. This is default without metadata intervention
    thirst  = 3,
}
},
["steaknfries"] = {-- item name
uses = 3,
prop = { 
    -- Prop spawn data for idle & usage.
    Main = { 
        Model = 'plate_tbone',
        BoneID = 18905,
        Offset = vector3(0.15678725526845, -0.0050334861860832, 0.031357341928032),
        Rot = vector3(-24.266444142288, 1.6600095970159, 5.6079281029707),
    },
    Second = { --https://forum.cfx.re/t/free-animation-eat-with-fork/5068991
        Model = 'alcaprop_fork',
        BoneID = 28422,
        Offset = vector3(0.010853324810796, 0.029339193596366, -0.019795742184349),
        Rot = vector3(0.0, 0.0, 96.560120437708),
    },
},
idle = {
    dict = "anim@eat@fork",
    anim = "fork_clip",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},
animation = { 
    dict = "anim@eat@fork",
    anim = "fork_clip",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},
status = { -- Per use. This is default without metadata intervention
    hunger  = 12
}
},
["hotchocolate"] = {-- item name
uses = 5,
prop = { 
-- Prop spawn data for idle & usage.
Main = {
    Model = 'djs_prop_coffeecup',
    BoneID = 28422,
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
dict = "amb@code_human_wander_drinking_fat@male@idle_a",
anim = "idle_c",
params = {nil, nil, 2000, 49},
time = 2000, 
},

status = { -- Per use. This is default without metadata intervention
    thirst  = 3,
}
},
["lemonsweettea"] = {-- item name
uses = 5,
prop = { 
-- Prop spawn data for idle & usage.
Main = {
    Model = 'djs_glass_icetea',
    BoneID = 28422,
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
dict = "amb@code_human_wander_drinking_fat@male@idle_a",
anim = "idle_c",
params = {nil, nil, 2000, 49},
time = 2000, 
},

status = { -- Per use. This is default without metadata intervention
    thirst  = 3,
}
},
["specialitycoffee"] = {-- item name
uses = 5,
prop = { 
-- Prop spawn data for idle & usage.
Main = {
    Model = 'djs_prop_coffeecup',
    BoneID = 28422,
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
dict = "amb@code_human_wander_drinking_fat@male@idle_a",
anim = "idle_c",
params = {nil, nil, 2000, 49},
time = 2000, 
},

status = { -- Per use. This is default without metadata intervention
    thirst  = 3,
    sobriety = 5
}
},
["specialitytea"] = {-- item name
uses = 5,
prop = { 
-- Prop spawn data for idle & usage.
Main = {
    Model = 'djs_prop_coffeecup',
    BoneID = 28422,
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
dict = "amb@code_human_wander_drinking_fat@male@idle_a",
anim = "idle_c",
params = {nil, nil, 2000, 49},
time = 2000, 
},

status = { -- Per use. This is default without metadata intervention
    thirst  = 3,
    
}
},
["drplum"] = {-- item name
uses = 5,
prop = { 
-- Prop spawn data for idle & usage.
Main = {
    Model = 'djs_soda_pink',
    BoneID = 28422,
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
dict = "amb@code_human_wander_drinking_fat@male@idle_a",
anim = "idle_c",
params = {nil, nil, 2000, 49},
time = 2000, 
},

status = { -- Per use. This is default without metadata intervention
    thirst  = 3,
}
},
["icecreamsoda"] = {-- item name
uses = 5,
prop = { 
-- Prop spawn data for idle & usage.
Main = {
    Model = 'frap_toffee',
    BoneID = 28422,
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
dict = "amb@code_human_wander_drinking_fat@male@idle_a",
anim = "idle_c",
params = {nil, nil, 2000, 49},
time = 2000, 
},

status = { -- Per use. This is default without metadata intervention
    thirst  = 3,
}
},
---------- POURING KETTLES --------------
["coffeekettle"] = {-- item name
uses = 4,
prop = { 
-- Prop spawn data for idle & usage.
    Main = {
        Model = 'prop_cs_kettle_01',
        BoneID = 18905,
        Offset = vector3(0.15, -0.20, 0.10),
        Rot = vector3(105.33382420145, -32.614849062837, -168.39726692548),
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
    params = {nil, nil, 2000, 49},
    time = 2000
    },
status = { -- Per use. This is default without metadata intervention
    thirst  = 4,
    sobriety = 7
}
},
["hckettle"] = {-- item name
uses = 4,
prop = { 
-- Prop spawn data for idle & usage.
    Main = {
        Model = 'prop_cs_kettle_01',
        BoneID = 18905,
        Offset = vector3(0.15, -0.20, 0.10),
        Rot = vector3(105.33382420145, -32.614849062837, -168.39726692548),
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
    params = {nil, nil, 2000, 49},
    time = 2000
    },
status = { -- Per use. This is default without metadata intervention
    thirst  = 4,
    sobriety = 7
}
},
["teakettle"] = {-- item name
uses = 4,
prop = { 
-- Prop spawn data for idle & usage.
    Main = {
        Model = 'prop_cs_kettle_01',
        BoneID = 18905,
        Offset = vector3(0.15, -0.20, 0.10),
        Rot = vector3(105.33382420145, -32.614849062837, -168.39726692548),
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
    params = {nil, nil, 2000, 49},
    time = 2000
    },
status = { -- Per use. This is default without metadata intervention
    thirst  = 4,
    sobriety = 7
}
},
---------------------------------------------------------------------
--------------- S.Ho Noodles
---------------------------------------------------------------------
["onigiri"] = {-- item name
uses = 4,
prop = { 
-- Prop spawn data for idle & usage.
    Main = {
        Model = 'prop_yellowtailroll',
        BoneID = 18905,
        Offset = vector3(0.1508104382898, 0.039092563349746, 0.0083432488638079),
        Rot = vector3( 170.71663408367, -53.643545243148, 0 ),
    }
},

-- idle = {
--     dict = "mp_suicide",
--     anim = "static",
--     params = {8.0, -8, -1, 49, 0},
--     time = 2000, 
-- },
animation = { 
    dict = "mp_player_inteat@burger",
    anim = "mp_player_int_eat_burger_fp",
    params = {nil, nil, 1200, 49},
    time = 2000, 
},

status = { -- Per use. This is default without metadata intervention
    hunger  = 7
}
},
["ramen"] = {
    uses = 3,
    prop = {
        Main = {
            Model = 'djs_bowl_beefbibimbap',
            BoneID = 18905,
            Offset = vector3(0.13953280028795, -0.024008528173895, 0.025093021603604),
            Rot = vector3( -28.747094709914, 0, 0),
        },
        Second = {
            Model = 'djs_chopstick',
            BoneID = 57005,
            Offset = vector3(0.10706410191858, 0.035042152657793, 0),
            Rot = vector3(104.87149632836, -37.083979569574, 179.28614600207),
        }   
    },
    idle = {
        dict = "anim@eat@fork",
        anim = "fork_clip",
        params = {8.0, -8, -1, 49, 0},
        time = 2000, 
    },
    animation = { 
        dict = "anim@eat@fork",
        anim = "fork_clip",
        params = {8.0, -8, -1, 49, 0},
        time = 2000, 
    },
    status = {
        hunger  = 10,
        thirst = 10
    }
},

["misosoup"] = {
    uses = 3,
    prop = {
        Main = {
            Model = 'bowl_unagi',
            BoneID = 18905,
            Offset = vector3(0.13953280028795, -0.024008528173895, 0.025093021603604),
            Rot = vector3( -28.747094709914, 0, 0),
        },
        Second = {
            Model = 'djs_chopstick',
            BoneID = 57005,
            Offset = vector3(0.10706410191858, 0.035042152657793, 0),
            Rot = vector3(104.87149632836, -37.083979569574, 179.28614600207),
        }   
    },
    idle = {
        dict = "anim@eat@fork",
        anim = "fork_clip",
        params = {8.0, -8, -1, 49, 0},
        time = 2000, 
    },
    animation = { 
        dict = "anim@eat@fork",
        anim = "fork_clip",
        params = {8.0, -8, -1, 49, 0},
        time = 2000, 
    },
    status = {
        hunger  = 10,
        thirst = 10
    }
},
["tempura"] = {
    uses = 3,
    prop = {
        Main = {
            Model = 'plate_tempurashirmp',
            BoneID = 18905,
            Offset = vector3(0.13953280028795, -0.024008528173895, 0.025093021603604),
            Rot = vector3( -28.747094709914, 0, 0),
        },
        Second = {
            Model = 'djs_chopstick',
            BoneID = 57005,
            Offset = vector3(0.10706410191858, 0.035042152657793, 0),
            Rot = vector3(104.87149632836, -37.083979569574, 179.28614600207),
        }   
    },
    idle = {
        dict = "anim@eat@fork",
        anim = "fork_clip",
        params = {8.0, -8, -1, 49, 0},
        time = 2000, 
    },
    animation = { 
        dict = "anim@eat@fork",
        anim = "fork_clip",
        params = {8.0, -8, -1, 49, 0},
        time = 2000, 
    },
    status = {
        hunger  = 7,
    }
},
["mochi"] = {
    uses = 4,
    prop = {
        Main = {
            Model = 'mochiplate',
            BoneID = 18905,
            Offset = vector3(0.13953280028795, -0.024008528173895, 0.025093021603604),
            Rot = vector3( -28.747094709914, 0, 0),
        },
        Second = {
            Model = 'djs_chopstick',
            BoneID = 57005,
            Offset = vector3(0.10706410191858, 0.035042152657793, 0),
            Rot = vector3(104.87149632836, -37.083979569574, 179.28614600207),
        }   
    },
    idle = {
        dict = "anim@eat@fork",
        anim = "fork_clip",
        params = {8.0, -8, -1, 49, 0},
        time = 2000, 
    },
    animation = { 
        dict = "anim@eat@fork",
        anim = "fork_clip",
        params = {8.0, -8, -1, 49, 0},
        time = 2000, 
    },
    status = {
        hunger  = 8,
    }
},
["fluffypancakes"] = {
    uses = 3,
    prop = {
        Main = { 
            Model = 'djs_plate_cinammonpancakes',
            BoneID = 18905,
            Offset = vector3(0.15678725526845, -0.0050334861860832, 0.031357341928032),
            Rot = vector3(-24.266444142288, 1.6600095970159, 5.6079281029707),
        },
        Second = { --https://forum.cfx.re/t/free-animation-eat-with-fork/5068991
            Model = 'alcaprop_fork',
            BoneID = 28422,
            Offset = vector3(0.010853324810796, 0.029339193596366, -0.019795742184349),
            Rot = vector3(0.0, 0.0, 96.560120437708),
        },
    },
    idle = {
        dict = "anim@eat@fork",
        anim = "fork_clip",
        params = {8.0, -8, -1, 49, 0},
        time = 2000, 
    },
    animation = { 
        dict = "anim@eat@fork",
        anim = "fork_clip",
        params = {8.0, -8, -1, 49, 0},
        time = 2000, 
    },
    status = { -- Per use. This is default without metadata intervention
        hunger  = 10
    }
    },
["sushi"] = {
    uses = 4,
    prop = {
        Main = {
            Model = 'sushi_multi',
            BoneID = 18905,
            Offset = vector3(0.13953280028795, -0.024008528173895, 0.025093021603604),
            Rot = vector3( -28.747094709914, 0, 0),
        },
        Second = {
            Model = 'djs_chopstick',
            BoneID = 57005,
            Offset = vector3(0.10706410191858, 0.035042152657793, 0),
            Rot = vector3(104.87149632836, -37.083979569574, 179.28614600207),
        }   
    },
    idle = {
        dict = "anim@eat@fork",
        anim = "fork_clip",
        params = {8.0, -8, -1, 49, 0},
        time = 2000, 
    },
    animation = { 
        dict = "anim@eat@fork",
        anim = "fork_clip",
        params = {8.0, -8, -1, 49, 0},
        time = 2000, 
    },
    status = {
        hunger  = 10,
    }
},
["dumplings"] = {
    uses = 4,
    prop = {
        Main = {
            Model = 'plate_tempurashirmp',
            BoneID = 18905,
            Offset = vector3(0.13953280028795, -0.024008528173895, 0.025093021603604),
            Rot = vector3( -28.747094709914, 0, 0),
        },
        Second = {
            Model = 'djs_chopstick',
            BoneID = 57005,
            Offset = vector3(0.10706410191858, 0.035042152657793, 0),
            Rot = vector3(104.87149632836, -37.083979569574, 179.28614600207),
        }   
    },
    idle = {
        dict = "anim@eat@fork",
        anim = "fork_clip",
        params = {8.0, -8, -1, 49, 0},
        time = 2000, 
    },
    animation = { 
        dict = "anim@eat@fork",
        anim = "fork_clip",
        params = {8.0, -8, -1, 49, 0},
        time = 2000, 
    },
    status = {
        hunger  = 10,
    }
},
["matcha"] = {-- item name
uses = 4,
prop = { 
-- Prop spawn data for idle & usage.
    Main = { 
        Model = 'djs_glass_greentea',
        BoneID = 28422,
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
    dict = "amb@code_human_wander_drinking_fat@male@idle_a",
    anim = "idle_c",
    params = {nil, nil, 2000, 49},
    time = 2000, 
},

status = { -- Per use. This is default without metadata intervention
    thirst  = 10,
	sobriety = 7
}
},  
["sake"] = {-- item name
uses = 4,
prop = { 
-- Prop spawn data for idle & usage.
    Main = {
        Model = 'prop_wine_bot_02',
        BoneID = 28422,
        Offset = vector3(-0.0047675442316404, -0.027305838605626, -0.19300346012185),
        Rot = vector3(0,0,0),
    }
},

idle = {
    dict = "amb@code_human_wander_drinking@male@base",
    anim = "static",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
    },
    animation = { 
    dict = "amb@code_human_wander_drinking_fat@male@idle_a",
    anim = "idle_c",
    params = {nil, nil, 2000, 49},
    time = 2000, 
    },
effect = { name = "drunk", time = 20000, intensity = 1.0 },
status = { -- Per use. This is default without metadata intervention
    thirst  = 4,
    alcohol = 10
}
},
----------------------------------------------------------
--------------- Rusty Nail ------------
----------------------------------------------------------
["ambeer"] = {-- item name
uses = 5,
prop = { 
-- Prop spawn data for idle & usage.
Main = {
    Model = 'prop_amb_beer_bottle',
    BoneID = 18905,
    Offset = vector3(0.10263894723641, 0.018932450277598, 0.019752450685277),
    Rot = vector3(105.25226135252, -46.218309225213, -164.56969022428),
},
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
params = {nil, nil, 2000, 49},
time = 2000
},
effect = { name = "drunk", time = 20000, intensity = 1.0 },

status = { -- Per use. This is default without metadata intervention
    thirst  = 3,
    alcohol = 5
}
},
["dusche"] = {-- item name
uses = 5,
prop = { 
-- Prop spawn data for idle & usage.
Main = {
    Model = 'prop_amb_beer_bottle',
    BoneID = 18905,
    Offset = vector3(0.10263894723641, 0.018932450277598, 0.019752450685277),
    Rot = vector3(105.25226135252, -46.218309225213, -164.56969022428),
},
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
params = {nil, nil, 2000, 49},
time = 2000
},
effect = { name = "drunk", time = 20000, intensity = 1.0 },

status = { -- Per use. This is default without metadata intervention
    thirst  = 3,
    alcohol = 5
}
},
["logger"] = {-- item name
uses = 5,
prop = { 
-- Prop spawn data for idle & usage.
Main = {
    Model = 'prop_amb_beer_bottle',
    BoneID = 18905,
    Offset = vector3(0.10263894723641, 0.018932450277598, 0.019752450685277),
    Rot = vector3(105.25226135252, -46.218309225213, -164.56969022428),
},
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
params = {nil, nil, 2000, 49},
time = 2000
},
effect = { name = "drunk", time = 20000, intensity = 1.0 },

status = { -- Per use. This is default without metadata intervention
    thirst  = 3,
    alcohol = 5
}
},
------------------------------------------------
------------ Playhouse
--------------------------------------------------
["pinacolada"] = {-- item name
    uses = 3,
    prop = { 
    -- Prop spawn data for idle & usage.
        Main = {
            Model = 'djs_glass_pinacolada',
            BoneID = 28422,
            Offset = vector3(-0.014873540860776, -0.016440867168978, -0.098777372914467),
            Rot = vector3(0, 0, 0),
        }
    },

    idle = {
        dict = "amb@code_human_wander_drinking@male@base",
        anim = "static",
        params = {8.0, -8, -1, 49, 0},
        time = 2000, 
    },
    animation = { 
        dict = "amb@code_human_wander_drinking_fat@male@idle_a",
        anim = "idle_c",
        params = {nil, nil, 2000, 49},
        time = 2000, 
    },
    effect = { name = "drunk", time = 20000, intensity = 1.0 },

    status = { -- Per use. This is default without metadata intervention
        thirst  = 4,
        alcohol = 10
    }
},
["sanfrancisco"] = {-- item name
    uses = 3,
    prop = { 
    -- Prop spawn data for idle & usage.
        Main = {
            Model = 'djs_glass_seabreeze',
            BoneID = 28422,
            Offset = vector3(-0.014873540860776, -0.016440867168978, -0.098777372914467),
            Rot = vector3(0, 0, 0),
        }
    },

    idle = {
        dict = "amb@code_human_wander_drinking@male@base",
        anim = "static",
        params = {8.0, -8, -1, 49, 0},
        time = 2000, 
    },
    animation = { 
        dict = "amb@code_human_wander_drinking_fat@male@idle_a",
        anim = "idle_c",
        params = {nil, nil, 2000, 49},
        time = 2000, 
    },
    effect = { name = "drunk", time = 20000, intensity = 1.0 },

    status = { -- Per use. This is default without metadata intervention
        thirst  = 4,
        alcohol = 10
    }
},
["caipirinha"] = {-- item name
    uses = 3,
    prop = { 
    -- Prop spawn data for idle & usage.
        Main = {
            Model = 'djs_pineappledrink',
            BoneID = 28422,
            Offset = vector3(-0.014873540860776, -0.016440867168978, -0.098777372914467),
            Rot = vector3(0, 0, 0),
        }
    },

    idle = {
        dict = "amb@code_human_wander_drinking@male@base",
        anim = "static",
        params = {8.0, -8, -1, 49, 0},
        time = 2000, 
    },
    animation = { 
        dict = "amb@code_human_wander_drinking_fat@male@idle_a",
        anim = "idle_c",
        params = {nil, nil, 2000, 49},
        time = 2000, 
    },
    effect = { name = "drunk", time = 20000, intensity = 1.0 },

    status = { -- Per use. This is default without metadata intervention
        thirst  = 4,
        alcohol = 10
    }
},
["mojito"] = {-- item name
    uses = 3,
    prop = { 
    -- Prop spawn data for idle & usage.
        Main = {
            Model = 'djs_glass_mojito',
            BoneID = 28422,
            Offset = vector3(-0.014873540860776, -0.016440867168978, -0.098777372914467),
            Rot = vector3(0, 0, 0),
        }
    },

    idle = {
        dict = "amb@code_human_wander_drinking@male@base",
        anim = "static",
        params = {8.0, -8, -1, 49, 0},
        time = 2000, 
    },
    animation = { 
        dict = "amb@code_human_wander_drinking_fat@male@idle_a",
        anim = "idle_c",
        params = {nil, nil, 2000, 49},
        time = 2000, 
    },
    effect = { name = "drunk", time = 20000, intensity = 1.0 },

    status = { -- Per use. This is default without metadata intervention
        thirst  = 4,
        alcohol = 10
    }
},
["maitai"] = {-- item name
    uses = 3,
    prop = { 
    -- Prop spawn data for idle & usage.
        Main = {
            Model = 'djs_glass_pinkmaitai',
            BoneID = 28422,
            Offset = vector3(-0.014873540860776, -0.016440867168978, -0.098777372914467),
            Rot = vector3(0, 0, 0),
        }
    },

    idle = {
        dict = "amb@code_human_wander_drinking@male@base",
        anim = "static",
        params = {8.0, -8, -1, 49, 0},
        time = 2000, 
    },
    animation = { 
        dict = "amb@code_human_wander_drinking_fat@male@idle_a",
        anim = "idle_c",
        params = {nil, nil, 2000, 49},
        time = 2000, 
    },
    effect = { name = "drunk", time = 20000, intensity = 1.0 },

    status = { -- Per use. This is default without metadata intervention
        thirst  = 4,
        alcohol = 10
    }
},
---------------------------------------------------------------------
--------------- Taco Farmer
---------------------------------------------------------------------
["horchata"] = {-- item name
    uses = 3,
    prop = { 
    -- Prop spawn data for idle & usage.
        Main = {
            Model = 'djs_glass_baileys',
            BoneID = 28422,
            Offset = vector3(-0.014873540860776, -0.016440867168978, -0.098777372914467),
            Rot = vector3(0, 0, 0),
        }
    },

    idle = {
        dict = "amb@code_human_wander_drinking@male@base",
        anim = "static",
        params = {8.0, -8, -1, 49, 0},
        time = 2000, 
    },
    animation = { 
        dict = "amb@code_human_wander_drinking_fat@male@idle_a",
        anim = "idle_c",
        params = {nil, nil, 2000, 49},
        time = 2000, 
    },
    status = { -- Per use. This is default without metadata intervention
        thirst  = 5
    }
},
["agua_fresca"] = {-- item name
    uses = 3,
    prop = { 
    -- Prop spawn data for idle & usage.
        Main = {
            Model = 'djs_glass_icetea',
            BoneID = 28422,
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
        dict = "amb@code_human_wander_drinking_fat@male@idle_a",
        anim = "idle_c",
        params = {nil, nil, 2000, 49},
        time = 2000, 
    },
    status = { -- Per use. This is default without metadata intervention
        thirst  = 6
    }
},
["birria_tacos"] = {-- item name
uses = 3,
prop = { 
		-- Prop spawn data for idle & usage.
			Main = {
                Model = 'prop_taco_01',
                BoneID = 18905,
                Offset = vector3(0.13, 0.05, 0.02), 
                Rot = vector3(0.0, -140.0, -140.0),
			}
		},

		-- idle = {
		--     dict = "mp_suicide",
		--     anim = "static",
		--     params = {8.0, -8, -1, 49, 0},
		--     time = 2000, 
		-- },
		animation = { 
			dict = "mp_player_inteat@burger",
			anim = "mp_player_int_eat_burger_fp",
			params = {nil, nil, 1200, 49},
			time = 2000, 
		},

		status = { -- Per use. This is default without metadata intervention
			hunger  = 5
		}
	},
["carneasada_tacos"] = {-- item name
uses = 3,
prop = { 
    -- Prop spawn data for idle & usage.
    Main = {
        Model = 'prop_taco_01',
        BoneID = 18905,
        Offset = vector3(0.13, 0.05, 0.02), 
        Rot = vector3(0.0, -140.0, -140.0),
    }
},

-- idle = {
--     dict = "mp_suicide",
--     anim = "static",
--     params = {8.0, -8, -1, 49, 0},
--     time = 2000, 
-- },
animation = { 
    dict = "mp_player_inteat@burger",
    anim = "mp_player_int_eat_burger_fp",
    params = {nil, nil, 1200, 49},
    time = 2000, 
},

status = { -- Per use. This is default without metadata intervention
    hunger  = 5
}
},
["enchiladas"] = {-- item name
uses = 3,
prop = { 
        -- Prop spawn data for idle & usage.
        Main = { 
            Model = 'plate_friedplantains',
            BoneID = 18905,
            Offset = vector3(0.15678725526845, -0.0050334861860832, 0.031357341928032),
            Rot = vector3(-24.266444142288, 1.6600095970159, 5.6079281029707),
        },
        Second = { --https://forum.cfx.re/t/free-animation-eat-with-fork/5068991
            Model = 'alcaprop_fork',
            BoneID = 28422,
            Offset = vector3(0.010853324810796, 0.029339193596366, -0.019795742184349),
            Rot = vector3(0.0, 0.0, 96.560120437708),
        },
    },
    idle = {
        dict = "anim@eat@fork",
        anim = "fork_clip",
        params = {8.0, -8, -1, 49, 0},
        time = 2000, 
    },
    animation = { 
        dict = "anim@eat@fork",
        anim = "fork_clip",
        params = {8.0, -8, -1, 49, 0},
        time = 2000, 
    },
    status = { -- Per use. This is default without metadata intervention
        hunger  = 12
    }
},
["tamales"] = {-- item name
uses = 3,
prop = { 
    -- Prop spawn data for idle & usage.
    Main = {
        Model = 'prop_cocobeefbread',
        BoneID = 18905,
        Offset = vector3(0.13, 0.05, 0.02), 
        Rot = vector3(0.0, -140.0, -140.0),
    }
},

-- idle = {
--     dict = "mp_suicide",
--     anim = "static",
--     params = {8.0, -8, -1, 49, 0},
--     time = 2000, 
-- },
animation = { 
    dict = "mp_player_inteat@burger",
    anim = "mp_player_int_eat_burger_fp",
    params = {nil, nil, 1200, 49},
    time = 2000, 
},

status = { -- Per use. This is default without metadata intervention
    hunger  = 5
}
},
["chips_salsa"] = {-- item name
uses = 4,
prop = { 
-- Prop spawn data for idle & usage.
    Main = { 
        Model = 'djs_basket_nachos',
        BoneID = 18905,
        Offset = vector3(0.13895907509038, 0.02523307091407, -0.00024440441186642), 
        Rot = vector3(-15.343184382347, -13.256785603274, -32.335878980356),
    },
    Second = {
        Model = 'djs_prop_nachochip',
        BoneID = 28422,
        Offset = vector3(0.056637835361016, 0.023687603069486, -0.030054515100592),
        Rot = vector3(57.235175873964, -5.8659799095806, 9.4840812493706),
    }   
},

idle = {
    dict = "anim@eat@fork",
    anim = "fork_clip",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},
animation = { 
    dict = "anim@eat@fork",
    anim = "fork_clip",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},

status = { -- Per use. This is default without metadata intervention
    hunger  = 6,
}
},
["elote"] = {-- item name
uses = 3,
prop = { 
    -- Prop spawn data for idle & usage.
    Main = {
        Model = 'food_piecefriedmozzarella',
        BoneID = 18905,
        Offset = vector3(0.13933256734038, 0.041636790279195, 0.022509821218241),
        Rot = vector3(0,0,0),
    }
},

-- idle = {
--     dict = "mp_suicide",
--     anim = "static",
--     params = {8.0, -8, -1, 49, 0},
--     time = 2000, 
-- },
animation = { 
    dict = "mp_player_inteat@burger",
    anim = "mp_player_int_eat_burger_fp",
    params = {nil, nil, 1200, 49},
    time = 2000, 
},

status = { -- Per use. This is default without metadata intervention
    hunger  = 5
}
},
["michelada"] = {-- item name
    uses = 3,
    prop = { 
    -- Prop spawn data for idle & usage.
        Main = {
            Model = 'djs_cocktail_red6',
            BoneID = 28422,
            Offset = vector3(-0.0039579965108487, -0.0074137874142527, -0.042196966746394),
            Rot = vector3(0, 0, 0),
        }
    },

    idle = {
        dict = "amb@code_human_wander_drinking@male@base",
        anim = "static",
        params = {8.0, -8, -1, 49, 0},
        time = 2000, 
    },
    animation = { 
        dict = "amb@code_human_wander_drinking_fat@male@idle_a",
        anim = "idle_c",
        params = {nil, nil, 2000, 49},
        time = 2000, 
    },
    effect = { name = "drunk", time = 20000, intensity = 1.0 },

    status = { -- Per use. This is default without metadata intervention
        thirst  = 4,
        alcohol = 10
    }
},
---------------------------------------------------------------------
--------------- Tequila la
---------------------------------------------------------------------
["whiskey_rocks"] = {-- item name
    uses = 5,
    prop = { 
    -- Prop spawn data for idle & usage.
        Main = {
            Model = 'djs_glass_whisky',
            BoneID = 28422,
            Offset = vector3(-0.0039579965108487, -0.0074137874142527, -0.042196966746394),
            Rot = vector3(0, 0, 0),
        }
    },

    idle = {
        dict = "amb@code_human_wander_drinking@male@base",
        anim = "static",
        params = {8.0, -8, -1, 49, 0},
        time = 2000, 
    },
    animation = { 
        dict = "amb@code_human_wander_drinking_fat@male@idle_a",
        anim = "idle_c",
        params = {nil, nil, 2000, 49},
        time = 2000, 
    },
    effect = { name = "drunk", time = 20000, intensity = 1.0 },

    status = { -- Per use. This is default without metadata intervention
        thirst  = 3,
        alcohol = 10
    }
},
["old_fashioned"] = {-- item name
    uses = 5,
    prop = { 
    -- Prop spawn data for idle & usage.
        Main = {
            Model = 'djs_glass_whisky',
            BoneID = 28422,
            Offset = vector3(-0.0039579965108487, -0.0074137874142527, -0.042196966746394),
            Rot = vector3(0, 0, 0),
        }
    },

    idle = {
        dict = "amb@code_human_wander_drinking@male@base",
        anim = "static",
        params = {8.0, -8, -1, 49, 0},
        time = 2000, 
    },
    animation = { 
        dict = "amb@code_human_wander_drinking_fat@male@idle_a",
        anim = "idle_c",
        params = {nil, nil, 2000, 49},
        time = 2000, 
    },
    effect = { name = "drunk", time = 20000, intensity = 1.0 },

    status = { -- Per use. This is default without metadata intervention
        thirst  = 3,
        alcohol = 10
    }
},
["southern_wings"] = {-- item name
uses = 6,
prop = { 
-- Prop spawn data for idle & usage.
    Main = { 
        Model = 'box_wings_hickorysmokedbbq',
        BoneID = 18905,
        Offset = vector3(0.13895907509038, 0.02523307091407, -0.00024440441186642), 
        Rot = vector3(-15.343184382347, -13.256785603274, -32.335878980356),
    },
    Second = {
        Model = 'prop_chickenwing_hickorysmokedbbq',
        BoneID = 28422,
        Offset = vector3(0.056637835361016, 0.023687603069486, -0.030054515100592),
        Rot = vector3(57.235175873964, -5.8659799095806, 9.4840812493706),
    }   
},

idle = {
    dict = "anim@eat@fork",
    anim = "fork_clip",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},
animation = { 
    dict = "anim@eat@fork",
    anim = "fork_clip",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},

status = { -- Per use. This is default without metadata intervention
    hunger  = 6,
}
},
["loaded_nachos"] = {-- item name
uses = 4,
prop = { 
-- Prop spawn data for idle & usage.
    Main = { 
        Model = 'djs_basket_nachos',
        BoneID = 18905,
        Offset = vector3(0.13895907509038, 0.02523307091407, -0.00024440441186642), 
        Rot = vector3(-15.343184382347, -13.256785603274, -32.335878980356),
    },
    Second = {
        Model = 'djs_prop_nachochip',
        BoneID = 28422,
        Offset = vector3(0.056637835361016, 0.023687603069486, -0.030054515100592),
        Rot = vector3(57.235175873964, -5.8659799095806, 9.4840812493706),
    }   
},

idle = {
    dict = "anim@eat@fork",
    anim = "fork_clip",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},
animation = { 
    dict = "anim@eat@fork",
    anim = "fork_clip",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},

status = { -- Per use. This is default without metadata intervention
    hunger  = 6,
}
},
["chicken_parma"] = {-- item name
uses = 3,
prop = { 
    -- Prop spawn data for idle & usage.
    Main = { 
        Model = 'plate_chickenparm',
        BoneID = 18905,
        Offset = vector3(0.15678725526845, -0.0050334861860832, 0.031357341928032),
        Rot = vector3(-24.266444142288, 1.6600095970159, 5.6079281029707),
    },
    Second = { --https://forum.cfx.re/t/free-animation-eat-with-fork/5068991
        Model = 'alcaprop_fork',
        BoneID = 28422,
        Offset = vector3(0.010853324810796, 0.029339193596366, -0.019795742184349),
        Rot = vector3(0.0, 0.0, 96.560120437708),
    },
},
idle = {
    dict = "anim@eat@fork",
    anim = "fork_clip",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},
animation = { 
    dict = "anim@eat@fork",
    anim = "fork_clip",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},
status = { -- Per use. This is default without metadata intervention
    hunger  = 9,
}
},
["friedonionflower"] = {-- item name
uses = 3,
prop = { 
        -- Prop spawn data for idle & usage.
        Main = { 
            Model = 'plate_friedplantains',
            BoneID = 18905,
            Offset = vector3(0.15678725526845, -0.0050334861860832, 0.031357341928032),
            Rot = vector3(-24.266444142288, 1.6600095970159, 5.6079281029707),
        },
        Second = { --https://forum.cfx.re/t/free-animation-eat-with-fork/5068991
            Model = 'alcaprop_fork',
            BoneID = 28422,
            Offset = vector3(0.010853324810796, 0.029339193596366, -0.019795742184349),
            Rot = vector3(0.0, 0.0, 96.560120437708),
        },
    },
    idle = {
        dict = "anim@eat@fork",
        anim = "fork_clip",
        params = {8.0, -8, -1, 49, 0},
        time = 2000, 
    },
    animation = { 
        dict = "anim@eat@fork",
        anim = "fork_clip",
        params = {8.0, -8, -1, 49, 0},
        time = 2000, 
    },
    status = { -- Per use. This is default without metadata intervention
        hunger  = 12
    }
},
---------------------------------------------------------------------
--------------- FOOD TRUCK FOODS
---------------------------------------------------------------------
["donutsundae"] = {-- item name
uses = 3,
prop = { 
        -- Prop spawn data for idle & usage.
        Main = { 
            Model = 'djs_donut_icecream5',
            BoneID = 18905,
            Offset = vector3(0.15678725526845, -0.0050334861860832, 0.031357341928032),
            Rot = vector3(-24.266444142288, 1.6600095970159, 5.6079281029707),
        },
        Second = { --https://forum.cfx.re/t/free-animation-eat-with-fork/5068991
            Model = 'alcaprop_fork',
            BoneID = 28422,
            Offset = vector3(0.010853324810796, 0.029339193596366, -0.019795742184349),
            Rot = vector3(0.0, 0.0, 96.560120437708),
        },
    },
    idle = {
        dict = "anim@eat@fork",
        anim = "fork_clip",
        params = {8.0, -8, -1, 49, 0},
        time = 2000, 
    },
    animation = { 
        dict = "anim@eat@fork",
        anim = "fork_clip",
        params = {8.0, -8, -1, 49, 0},
        time = 2000, 
    },
    status = { -- Per use. This is default without metadata intervention
        hunger  = 12
    }
},
["sundae"] = {-- item name
uses = 3,
prop = { 
        -- Prop spawn data for idle & usage.
        Main = { 
            Model = 'djs_icecreamcup_pinkwhite',
            BoneID = 18905,
            Offset = vector3(0.15678725526845, -0.0050334861860832, 0.031357341928032),
            Rot = vector3(-24.266444142288, 1.6600095970159, 5.6079281029707),
        },
        Second = { --https://forum.cfx.re/t/free-animation-eat-with-fork/5068991
            Model = 'alcaprop_fork',
            BoneID = 28422,
            Offset = vector3(0.010853324810796, 0.029339193596366, -0.019795742184349),
            Rot = vector3(0.0, 0.0, 96.560120437708),
        },
    },
    idle = {
        dict = "anim@eat@fork",
        anim = "fork_clip",
        params = {8.0, -8, -1, 49, 0},
        time = 2000, 
    },
    animation = { 
        dict = "anim@eat@fork",
        anim = "fork_clip",
        params = {8.0, -8, -1, 49, 0},
        time = 2000, 
    },
    status = { -- Per use. This is default without metadata intervention
        hunger  = 12
    }
},
["donutbites"] = {-- item name
uses = 4,
prop = { 
-- Prop spawn data for idle & usage.
    Main = {
        Model = 'donut_origglaze',
        BoneID = 18905,
        Offset = vector3(0.10150358993621, 0.030495477148097, -0.013561427328407),
        Rot = vector3(0,0,0),
    }
},

-- idle = {
--     dict = "mp_suicide",
--     anim = "static",
--     params = {8.0, -8, -1, 49, 0},
--     time = 2000, 
-- },
animation = { 
    dict = "mp_player_inteat@burger",
    anim = "mp_player_int_eat_burger_fp",
    params = {nil, nil, 1200, 49},
    time = 2000, 
},
status = { -- Per use. This is default without metadata intervention
		hunger  = 10
	}
},
["cinnamondonut"] = {-- item name
uses = 4,
prop = { 
-- Prop spawn data for idle & usage.
    Main = {
        Model = 'donut_origglaze',
        BoneID = 18905,
        Offset = vector3(0.10150358993621, 0.030495477148097, -0.013561427328407),
        Rot = vector3(0,0,0),
    }
},

-- idle = {
--     dict = "mp_suicide",
--     anim = "static",
--     params = {8.0, -8, -1, 49, 0},
--     time = 2000, 
-- },
animation = { 
    dict = "mp_player_inteat@burger",
    anim = "mp_player_int_eat_burger_fp",
    params = {nil, nil, 1200, 49},
    time = 2000, 
},
status = { -- Per use. This is default without metadata intervention
		hunger  = 10
	}
},
["donut"] = {-- item name
uses = 4,
prop = { 
-- Prop spawn data for idle & usage.
    Main = {
        Model = 'donut_origglaze',
        BoneID = 18905,
        Offset = vector3(0.10150358993621, 0.030495477148097, -0.013561427328407),
        Rot = vector3(0,0,0),
    }
},

-- idle = {
--     dict = "mp_suicide",
--     anim = "static",
--     params = {8.0, -8, -1, 49, 0},
--     time = 2000, 
-- },
animation = { 
    dict = "mp_player_inteat@burger",
    anim = "mp_player_int_eat_burger_fp",
    params = {nil, nil, 1200, 49},
    time = 2000, 
},
status = { -- Per use. This is default without metadata intervention
		hunger  = 10
	}
},
["classicfishnchips"] = {-- item name
uses = 3,
prop = { 
    -- Prop spawn data for idle & usage.
    Main = { 
        Model = 'djs_plate_fishandchips',
        BoneID = 18905,
        Offset = vector3(0.15678725526845, -0.0050334861860832, 0.031357341928032),
        Rot = vector3(-24.266444142288, 1.6600095970159, 5.6079281029707),
    },
    Second = { --https://forum.cfx.re/t/free-animation-eat-with-fork/5068991
        Model = 'alcaprop_fork',
        BoneID = 28422,
        Offset = vector3(0.010853324810796, 0.029339193596366, -0.019795742184349),
        Rot = vector3(0.0, 0.0, 96.560120437708),
    },
},
idle = {
    dict = "anim@eat@fork",
    anim = "fork_clip",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},
animation = { 
    dict = "anim@eat@fork",
    anim = "fork_clip",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},
status = { -- Per use. This is default without metadata intervention
    hunger  = 12
}
},
["shrimpbasket"] = {-- item name
uses = 3,
prop = { 
    -- Prop spawn data for idle & usage.
    Main = { 
        Model = 'djs_newspaper_shrimppotatoes',
        BoneID = 18905,
        Offset = vector3(0.15678725526845, -0.0050334861860832, 0.031357341928032),
        Rot = vector3(-24.266444142288, 1.6600095970159, 5.6079281029707),
    },
    Second = { --https://forum.cfx.re/t/free-animation-eat-with-fork/5068991
        Model = 'alcaprop_fork',
        BoneID = 28422,
        Offset = vector3(0.010853324810796, 0.029339193596366, -0.019795742184349),
        Rot = vector3(0.0, 0.0, 96.560120437708),
    },
},
idle = {
    dict = "anim@eat@fork",
    anim = "fork_clip",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},
animation = { 
    dict = "anim@eat@fork",
    anim = "fork_clip",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},
status = { -- Per use. This is default without metadata intervention
    hunger  = 12
}
},
["calamaribasket"] = {-- item name
uses = 3,
prop = { 
    -- Prop spawn data for idle & usage.
    Main = { 
        Model = 'djs_plate_calimari',
        BoneID = 18905,
        Offset = vector3(0.15678725526845, -0.0050334861860832, 0.031357341928032),
        Rot = vector3(-24.266444142288, 1.6600095970159, 5.6079281029707),
    },
    Second = { --https://forum.cfx.re/t/free-animation-eat-with-fork/5068991
        Model = 'alcaprop_fork',
        BoneID = 28422,
        Offset = vector3(0.010853324810796, 0.029339193596366, -0.019795742184349),
        Rot = vector3(0.0, 0.0, 96.560120437708),
    },
},
idle = {
    dict = "anim@eat@fork",
    anim = "fork_clip",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},
animation = { 
    dict = "anim@eat@fork",
    anim = "fork_clip",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},
status = { -- Per use. This is default without metadata intervention
    hunger  = 12
}
},
----------------------------------
        -- Vineyard --
----------------------------------
["rose_wine"] = {-- item name
uses = 5,
prop = { 
-- Prop spawn data for idle & usage.
    Main = {
        Model = 'prop_wine_bot_02',
        BoneID = 28422,
        Offset = vector3(-0.0047675442316404, -0.027305838605626, -0.19300346012185),
        Rot = vector3(0,0,0),
    }
},

idle = {
    dict = "amb@code_human_wander_drinking@male@base",
    anim = "static",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
    },
    animation = { 
    dict = "amb@code_human_wander_drinking_fat@male@idle_a",
    anim = "idle_c",
    params = {nil, nil, 2000, 49},
    time = 2000, 
    },
effect = { name = "drunk", time = 20000, intensity = 1.0 },
status = { -- Per use. This is default without metadata intervention
    thirst  = 3,
    alcohol = 10
}
},
["sangria"] = {-- item name
    uses = 3,
    prop = { 
    -- Prop spawn data for idle & usage.
        Main = {
            Model = 'djs_cocktail_red6',
            BoneID = 28422,
            Offset = vector3(-0.0039579965108487, -0.0074137874142527, -0.042196966746394),
            Rot = vector3(0, 0, 0),
        }
    },

    idle = {
        dict = "amb@code_human_wander_drinking@male@base",
        anim = "static",
        params = {8.0, -8, -1, 49, 0},
        time = 2000, 
    },
    animation = { 
        dict = "amb@code_human_wander_drinking_fat@male@idle_a",
        anim = "idle_c",
        params = {nil, nil, 2000, 49},
        time = 2000, 
    },
    effect = { name = "drunk", time = 20000, intensity = 1.0 },

    status = { -- Per use. This is default without metadata intervention
        thirst  = 4,
        alcohol = 5
    }
},
["bellini"] = {-- item name
    uses = 3,
    prop = { 
    -- Prop spawn data for idle & usage.
        Main = {
            Model = 'djs_glass_pinacolada',
            BoneID = 28422,
            Offset = vector3(-0.014873540860776, -0.016440867168978, -0.098777372914467),
            Rot = vector3(0, 0, 0),
        }
    },

    idle = {
        dict = "amb@code_human_wander_drinking@male@base",
        anim = "static",
        params = {8.0, -8, -1, 49, 0},
        time = 2000, 
    },
    animation = { 
        dict = "amb@code_human_wander_drinking_fat@male@idle_a",
        anim = "idle_c",
        params = {nil, nil, 2000, 49},
        time = 2000, 
    },
    effect = { name = "drunk", time = 20000, intensity = 1.0 },

    status = { -- Per use. This is default without metadata intervention
        thirst  = 4,
        alcohol = 5
    }
},
["chardonnay"] = {-- item name
uses = 5,
prop = { 
-- Prop spawn data for idle & usage.
    Main = {
        Model = 'prop_wine_bot_02',
        BoneID = 28422,
        Offset = vector3(-0.0047675442316404, -0.027305838605626, -0.19300346012185),
        Rot = vector3(0,0,0),
    }
},

idle = {
    dict = "amb@code_human_wander_drinking@male@base",
    anim = "static",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
    },
    animation = { 
    dict = "amb@code_human_wander_drinking_fat@male@idle_a",
    anim = "idle_c",
    params = {nil, nil, 2000, 49},
    time = 2000, 
    },
effect = { name = "drunk", time = 20000, intensity = 1.0 },
status = { -- Per use. This is default without metadata intervention
    thirst  = 3,
    alcohol = 10
}
},
["champagne"] = {-- item name
uses = 5,
prop = { 
-- Prop spawn data for idle & usage.
    Main = {
        Model = 'prop_wine_bot_02',
        BoneID = 28422,
        Offset = vector3(-0.0047675442316404, -0.027305838605626, -0.19300346012185),
        Rot = vector3(0,0,0),
    }
},

idle = {
    dict = "amb@code_human_wander_drinking@male@base",
    anim = "static",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
    },
    animation = { 
    dict = "amb@code_human_wander_drinking_fat@male@idle_a",
    anim = "idle_c",
    params = {nil, nil, 2000, 49},
    time = 2000, 
    },
effect = { name = "drunk", time = 20000, intensity = 1.0 },
status = { -- Per use. This is default without metadata intervention
    thirst  = 3,
    alcohol = 10
}
},
---------------------------
    ----- Food --------
---------------------------
["lobstermeal"] = {-- item name
uses = 3,
prop = { 
    -- Prop spawn data for idle & usage.
    Main = { 
        Model = 'djs_plate_lobster',
        BoneID = 18905,
        Offset = vector3(0.15678725526845, -0.0050334861860832, 0.031357341928032),
        Rot = vector3(-24.266444142288, 1.6600095970159, 5.6079281029707),
    },
    Second = { --https://forum.cfx.re/t/free-animation-eat-with-fork/5068991
        Model = 'alcaprop_fork',
        BoneID = 28422,
        Offset = vector3(0.010853324810796, 0.029339193596366, -0.019795742184349),
        Rot = vector3(0.0, 0.0, 96.560120437708),
    },
},
idle = {
    dict = "anim@eat@fork",
    anim = "fork_clip",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},
animation = { 
    dict = "anim@eat@fork",
    anim = "fork_clip",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},
status = { -- Per use. This is default without metadata intervention
    hunger  = 12
}
},
["hummus"] = {-- item name
uses = 3,
prop = { 
    -- Prop spawn data for idle & usage.
    Main = { 
        Model = 'plate_spinachdip',
        BoneID = 18905,
        Offset = vector3(0.15678725526845, -0.0050334861860832, 0.031357341928032),
        Rot = vector3(-24.266444142288, 1.6600095970159, 5.6079281029707),
    },
    Second = { --https://forum.cfx.re/t/free-animation-eat-with-fork/5068991
        Model = 'alcaprop_fork',
        BoneID = 28422,
        Offset = vector3(0.010853324810796, 0.029339193596366, -0.019795742184349),
        Rot = vector3(0.0, 0.0, 96.560120437708),
    },
},
idle = {
    dict = "anim@eat@fork",
    anim = "fork_clip",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},
animation = { 
    dict = "anim@eat@fork",
    anim = "fork_clip",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},
status = { -- Per use. This is default without metadata intervention
    hunger  = 12
}
},
["steak"] = {-- item name
uses = 3,
prop = { 
    -- Prop spawn data for idle & usage.
    Main = { 
        Model = 'plate_ribeyesteak',
        BoneID = 18905,
        Offset = vector3(0.15678725526845, -0.0050334861860832, 0.031357341928032),
        Rot = vector3(-24.266444142288, 1.6600095970159, 5.6079281029707),
    },
    Second = { --https://forum.cfx.re/t/free-animation-eat-with-fork/5068991
        Model = 'alcaprop_fork',
        BoneID = 28422,
        Offset = vector3(0.010853324810796, 0.029339193596366, -0.019795742184349),
        Rot = vector3(0.0, 0.0, 96.560120437708),
    },
},
idle = {
    dict = "anim@eat@fork",
    anim = "fork_clip",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},
animation = { 
    dict = "anim@eat@fork",
    anim = "fork_clip",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},
status = { -- Per use. This is default without metadata intervention
    hunger  = 12
}
},
["salad"] = {-- item name
uses = 3,
prop = { 
    -- Prop spawn data for idle & usage.
    Main = { 
        Model = 'bowl_housesalad',
        BoneID = 18905,
        Offset = vector3(0.15678725526845, -0.0050334861860832, 0.031357341928032),
        Rot = vector3(-24.266444142288, 1.6600095970159, 5.6079281029707),
    },
    Second = { --https://forum.cfx.re/t/free-animation-eat-with-fork/5068991
        Model = 'alcaprop_fork',
        BoneID = 28422,
        Offset = vector3(0.010853324810796, 0.029339193596366, -0.019795742184349),
        Rot = vector3(0.0, 0.0, 96.560120437708),
    },
},
idle = {
    dict = "anim@eat@fork",
    anim = "fork_clip",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},
animation = { 
    dict = "anim@eat@fork",
    anim = "fork_clip",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},
status = { -- Per use. This is default without metadata intervention
    hunger  = 12
}
},
["charcuterie"] = {-- item name
uses = 3,
prop = { 
    -- Prop spawn data for idle & usage.
    Main = { 
        Model = 'plate_spinachdip',
        BoneID = 18905,
        Offset = vector3(0.15678725526845, -0.0050334861860832, 0.031357341928032),
        Rot = vector3(-24.266444142288, 1.6600095970159, 5.6079281029707),
    },
    Second = { --https://forum.cfx.re/t/free-animation-eat-with-fork/5068991
        Model = 'alcaprop_fork',
        BoneID = 28422,
        Offset = vector3(0.010853324810796, 0.029339193596366, -0.019795742184349),
        Rot = vector3(0.0, 0.0, 96.560120437708),
    },
},
idle = {
    dict = "anim@eat@fork",
    anim = "fork_clip",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},
animation = { 
    dict = "anim@eat@fork",
    anim = "fork_clip",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},
status = { -- Per use. This is default without metadata intervention
    hunger  = 12
}
},
----------------------------------
        -- Rebel Records --
----------------------------------
["lobsterbites"] = {-- item name
uses = 3,
prop = { 
    -- Prop spawn data for idle & usage.
    Main = { 
        Model = 'djs_plate_lobster',
        BoneID = 18905,
        Offset = vector3(0.15678725526845, -0.0050334861860832, 0.031357341928032),
        Rot = vector3(-24.266444142288, 1.6600095970159, 5.6079281029707),
    },
    Second = { --https://forum.cfx.re/t/free-animation-eat-with-fork/5068991
        Model = 'alcaprop_fork',
        BoneID = 28422,
        Offset = vector3(0.010853324810796, 0.029339193596366, -0.019795742184349),
        Rot = vector3(0.0, 0.0, 96.560120437708),
    },
},
idle = {
    dict = "anim@eat@fork",
    anim = "fork_clip",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},
animation = { 
    dict = "anim@eat@fork",
    anim = "fork_clip",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},
status = { -- Per use. This is default without metadata intervention
    hunger  = 12
}
},
["cobbsalad"] = {-- item name
uses = 3,
prop = { 
    -- Prop spawn data for idle & usage.
    Main = { 
        Model = 'djs_bowl_clamchowder',
        BoneID = 18905,
        Offset = vector3(0.15678725526845, -0.0050334861860832, 0.031357341928032),
        Rot = vector3(-24.266444142288, 1.6600095970159, 5.6079281029707),
    },
    Second = { --https://forum.cfx.re/t/free-animation-eat-with-fork/5068991
        Model = 'alcaprop_fork',
        BoneID = 28422,
        Offset = vector3(0.010853324810796, 0.029339193596366, -0.019795742184349),
        Rot = vector3(0.0, 0.0, 96.560120437708),
    },
},
idle = {
    dict = "anim@eat@fork",
    anim = "fork_clip",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},
animation = { 
    dict = "anim@eat@fork",
    anim = "fork_clip",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},
status = { -- Per use. This is default without metadata intervention
    hunger  = 12
}
},
["shrimpcocktails"] = {-- item name
uses = 3,
prop = { 
    -- Prop spawn data for idle & usage.
    Main = { 
        Model = 'djs_plate_coconutshrimp',
        BoneID = 18905,
        Offset = vector3(0.15678725526845, -0.0050334861860832, 0.031357341928032),
        Rot = vector3(-24.266444142288, 1.6600095970159, 5.6079281029707),
    },
    Second = { --https://forum.cfx.re/t/free-animation-eat-with-fork/5068991
        Model = 'alcaprop_fork',
        BoneID = 28422,
        Offset = vector3(0.010853324810796, 0.029339193596366, -0.019795742184349),
        Rot = vector3(0.0, 0.0, 96.560120437708),
    },
},
idle = {
    dict = "anim@eat@fork",
    anim = "fork_clip",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},
animation = { 
    dict = "anim@eat@fork",
    anim = "fork_clip",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},
status = { -- Per use. This is default without metadata intervention
    hunger  = 12
}
},
["edamame"] = { -- item name 
        uses = 3,
        prop = { -- Prop spawn data for idle & usage.
        Main = {
            Model = 'bowl_unagi',
            BoneID = 18905,
            Offset = vector3(0.15678725526845, -0.0050334861860832, 0.031357341928032),
            Rot = vector3(-24.266444142288, 1.6600095970159, 5.6079281029707),
        },
        Second = { --https://forum.cfx.re/t/free-animation-eat-with-fork/5068991
            Model = 'djs_chopstick',
            BoneID = 57005,
            Offset = vector3(0.10706410191858, 0.035042152657793, 0),
            Rot = vector3(104.87149632836, -37.083979569574, 179.28614600207),
        }
        },
        idle = {
            dict = "anim@eat@fork",
            anim = "fork_clip",
            params = {8.0, -8, -1, 49, 0},
            time = 2000, 
        },
        animation = { 
            dict = "anim@eat@fork",
            anim = "fork_clip",
            params = {8.0, -8, -1, 49, 0},
            time = 2000, 
        },
        status = { -- Per use. This is default without metadata intervention
        hunger  = 20
        }
    },

    ---------- Drinks --------
    ["rebelreserve"] = {-- item name
    uses = 5,
    prop = { 
    -- Prop spawn data for idle & usage.
        Main = {
            Model = 'djs_glass_whisky',
            BoneID = 28422,
            Offset = vector3(-0.0039579965108487, -0.0074137874142527, -0.042196966746394),
            Rot = vector3(0, 0, 0),
        }
    },

    idle = {
        dict = "amb@code_human_wander_drinking@male@base",
        anim = "static",
        params = {8.0, -8, -1, 49, 0},
        time = 2000, 
    },
    animation = { 
        dict = "amb@code_human_wander_drinking_fat@male@idle_a",
        anim = "idle_c",
        params = {nil, nil, 2000, 49},
        time = 2000, 
    },
    effect = { name = "drunk", time = 20000, intensity = 1.0 },

    status = { -- Per use. This is default without metadata intervention
        thirst  = 3,
        alcohol = 10
    }
},
    ["ampd"] = {-- item name
    uses = 5,
    prop = { 
    -- Prop spawn data for idle & usage.
        Main = {
            Model = 'djs_glass_vodkapeachbeachpunch',
            BoneID = 28422,
            Offset = vector3(-0.0039579965108487, -0.0074137874142527, -0.042196966746394),
            Rot = vector3(0, 0, 0),
        }
    },

    idle = {
        dict = "amb@code_human_wander_drinking@male@base",
        anim = "static",
        params = {8.0, -8, -1, 49, 0},
        time = 2000, 
    },
    animation = { 
        dict = "amb@code_human_wander_drinking_fat@male@idle_a",
        anim = "idle_c",
        params = {nil, nil, 2000, 49},
        time = 2000, 
    },

    status = { -- Per use. This is default without metadata intervention
        thirst  = 3,
    }
},
    ["fizznfader"] = {-- item name
    uses = 5,
    prop = { 
    -- Prop spawn data for idle & usage.
        Main = {
            Model = 'djs_glass_seabreeze',
            BoneID = 28422,
            Offset = vector3(-0.0039579965108487, -0.0074137874142527, -0.042196966746394),
            Rot = vector3(0, 0, 0),
        }
    },

    idle = {
        dict = "amb@code_human_wander_drinking@male@base",
        anim = "static",
        params = {8.0, -8, -1, 49, 0},
        time = 2000, 
    },
    animation = { 
        dict = "amb@code_human_wander_drinking_fat@male@idle_a",
        anim = "idle_c",
        params = {nil, nil, 2000, 49},
        time = 2000, 
    },

    status = { -- Per use. This is default without metadata intervention
        thirst  = 3,
    }
},
    ["groovygatorade"] = {-- item name
    uses = 5,
    prop = { 
    -- Prop spawn data for idle & usage.
        Main = {
            Model = 'djs_glass_vodkanightlava',
            BoneID = 28422,
            Offset = vector3(-0.0039579965108487, -0.0074137874142527, -0.042196966746394),
            Rot = vector3(0, 0, 0),
        }
    },

    idle = {
        dict = "amb@code_human_wander_drinking@male@base",
        anim = "static",
        params = {8.0, -8, -1, 49, 0},
        time = 2000, 
    },
    animation = { 
        dict = "amb@code_human_wander_drinking_fat@male@idle_a",
        anim = "idle_c",
        params = {nil, nil, 2000, 49},
        time = 2000, 
    },

    status = { -- Per use. This is default without metadata intervention
        thirst  = 3,
    }
},
["rebelroyal"] = {-- item name
uses = 5,
prop = { 
-- Prop spawn data for idle & usage.
    Main = {
        Model = 'prop_wine_bot_02',
        BoneID = 28422,
        Offset = vector3(-0.0047675442316404, -0.027305838605626, -0.19300346012185),
        Rot = vector3(0,0,0),
    }
},

idle = {
    dict = "amb@code_human_wander_drinking@male@base",
    anim = "static",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
    },
    animation = { 
    dict = "amb@code_human_wander_drinking_fat@male@idle_a",
    anim = "idle_c",
    params = {nil, nil, 2000, 49},
    time = 2000, 
    },
effect = { name = "drunk", time = 20000, intensity = 1.0 },
status = { -- Per use. This is default without metadata intervention
    thirst  = 3,
    alcohol = 10
}
},
----------------------------------
        -- Mayfield Club --
----------------------------------
    ["longislandicetea"] = {-- item name
        uses = 5,
        prop = { 
        -- Prop spawn data for idle & usage.
        Main = {
            Model = 'djs_glass_icetea',
            BoneID = 28422,
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
        dict = "amb@code_human_wander_drinking_fat@male@idle_a",
        anim = "idle_c",
        params = {nil, nil, 2000, 49},
        time = 2000, 
        },

        status = { -- Per use. This is default without metadata intervention
            thirst  = 3,
        }
},
    ["pornstarmartini"] = {-- item name
    uses = 5,
    prop = { 
    -- Prop spawn data for idle & usage.
        Main = {
            Model = 'djs_cocktail_orange7',
            BoneID = 28422,
            Offset = vector3(-0.0039579965108487, -0.0074137874142527, -0.042196966746394),
            Rot = vector3(0, 0, 0),
        }
    },

    idle = {
        dict = "amb@code_human_wander_drinking@male@base",
        anim = "static",
        params = {8.0, -8, -1, 49, 0},
        time = 2000, 
    },
    animation = { 
        dict = "amb@code_human_wander_drinking_fat@male@idle_a",
        anim = "idle_c",
        params = {nil, nil, 2000, 49},
        time = 2000, 
    },
    effect = { name = "drunk", time = 20000, intensity = 1.0 },

    status = { -- Per use. This is default without metadata intervention
        thirst  = 3,
        alcohol = 10
    }
},
    ["greektragedy"] = {-- item name
    uses = 5,
    prop = { 
    -- Prop spawn data for idle & usage.
        Main = {
            Model = 'djs_cocktail_orange2',
            BoneID = 28422,
            Offset = vector3(-0.0039579965108487, -0.0074137874142527, -0.042196966746394),
            Rot = vector3(0, 0, 0),
        }
    },

    idle = {
        dict = "amb@code_human_wander_drinking@male@base",
        anim = "static",
        params = {8.0, -8, -1, 49, 0},
        time = 2000, 
    },
    animation = { 
        dict = "amb@code_human_wander_drinking_fat@male@idle_a",
        anim = "idle_c",
        params = {nil, nil, 2000, 49},
        time = 2000, 
    },
    effect = { name = "drunk", time = 20000, intensity = 1.0 },

    status = { -- Per use. This is default without metadata intervention
        thirst  = 3,
        alcohol = 10
    }
},
---------------------------------
---- Boxing
---------------------------------
    ["proteinpackbox"] = {-- item name
    uses = 3,
    prop = { 
        -- Prop spawn data for idle & usage.
        Main = { 
            Model = 'djs_togo_kungpaochicken',
            BoneID = 18905,
            Offset = vector3(0.15678725526845, -0.0050334861860832, 0.031357341928032),
            Rot = vector3(-24.266444142288, 1.6600095970159, 5.6079281029707),
        },
        Second = { --https://forum.cfx.re/t/free-animation-eat-with-fork/5068991
            Model = 'alcaprop_fork',
            BoneID = 28422,
            Offset = vector3(0.010853324810796, 0.029339193596366, -0.019795742184349),
            Rot = vector3(0.0, 0.0, 96.560120437708),
        },
    },
    idle = {
        dict = "anim@eat@fork",
        anim = "fork_clip",
        params = {8.0, -8, -1, 49, 0},
        time = 2000, 
    },
    animation = { 
        dict = "anim@eat@fork",
        anim = "fork_clip",
        params = {8.0, -8, -1, 49, 0},
        time = 2000, 
    },
    status = { -- Per use. This is default without metadata intervention
        hunger  = 12
    }
    },
    ["bskbreakfastwrap"] = { -- item name 
        uses = 3,
        prop = {
            Main = {
                Model = 'snackwrap_chicken',
                BoneID = 18905,
                Offset = vector3(0.10170257568916, 0, -0.0079558996093022),
                Rot = vector3( 0, 0, 57.546401996128),
            },
        },
        --         idle = nil,
        animation = {
            dict = "mp_player_inteat@burger",
            anim = "mp_player_int_eat_burger_fp",
            params = {nil, nil, 1200, 49},
            time = 1200,
        },
        status = { -- Per use. This is default without metadata intervention
            hunger  = 6
        }
},
["haymakerbowl"] = {-- item name
uses = 3,
prop = { 
    -- Prop spawn data for idle & usage.
    Main = { 
        Model = 'djs_bowl_clamchowder',
        BoneID = 18905,
        Offset = vector3(0.15678725526845, -0.0050334861860832, 0.031357341928032),
        Rot = vector3(-24.266444142288, 1.6600095970159, 5.6079281029707),
    },
    Second = { --https://forum.cfx.re/t/free-animation-eat-with-fork/5068991
        Model = 'alcaprop_fork',
        BoneID = 28422,
        Offset = vector3(0.010853324810796, 0.029339193596366, -0.019795742184349),
        Rot = vector3(0.0, 0.0, 96.560120437708),
    },
},
idle = {
    dict = "anim@eat@fork",
    anim = "fork_clip",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},
animation = { 
    dict = "anim@eat@fork",
    anim = "fork_clip",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},
status = { -- Per use. This is default without metadata intervention
    hunger  = 12
}
},
["cheatdaysandwich"] = { -- item name 
uses = 3,
prop = {
    Main = {
        Model = 'turkey_halfsandwich',
        BoneID = 18905,
        Offset = vector3(0.10170257568916, 0, -0.0079558996093022),
        Rot = vector3( 0, 0, 57.546401996128),
    },
},
--         idle = nil,
animation = {
    dict = "mp_player_inteat@burger",
    anim = "mp_player_int_eat_burger_fp",
    params = {nil, nil, 1200, 49},
    time = 1200,
},
status = { -- Per use. This is default without metadata intervention
    hunger  = 6
}
},
["knockoutshake"] = {-- item name
uses = 5,
prop = { 
-- Prop spawn data for idle & usage.
Main = {
    Model = 'frap_chocolatemocha',
    BoneID = 28422,
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
dict = "amb@code_human_wander_drinking_fat@male@idle_a",
anim = "idle_c",
params = {nil, nil, 2000, 49},
time = 2000, 
},

status = { -- Per use. This is default without metadata intervention
    thirst  = 3,
}
},
["knockoutshake"] = {-- item name
uses = 5,
prop = { 
-- Prop spawn data for idle & usage.
Main = {
    Model = 'frap_chocolatemocha',
    BoneID = 28422,
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
dict = "amb@code_human_wander_drinking_fat@male@idle_a",
anim = "idle_c",
params = {nil, nil, 2000, 49},
time = 2000, 
},

status = { -- Per use. This is default without metadata intervention
    thirst  = 3,
}
},
["fightfuel"] = {-- item name
uses = 5,
prop = { 
-- Prop spawn data for idle & usage.
Main = {
    Model = 'sf_prop_sf_can_01a',
    BoneID = 28422,
    Offset = vector3(0.0,0.0,0.0),
    Rot = vector3(0, 0, -110.0),
}
},

idle = {
dict = "amb@code_human_wander_drinking@male@base",
anim = "static",
params = {8.0, -8, -1, 49, 0},
time = 2000, 
},
animation = { 
dict = "amb@code_human_wander_drinking_fat@male@idle_a",
anim = "idle_c",
params = {nil, nil, 2000, 49},
time = 2000, 
},

status = { -- Per use. This is default without metadata intervention
    thirst  = 6,
}
},
["jabjuice"] = {-- item name
uses = 5,
prop = { 
        Main = {
            Model = 'juice_juicy',
            BoneID = 28422,
            Offset = vector3(0.0046061327977895, -0.010749240867084, -0.16534273478831),
            Rot = vector3(0.0, 0.0, 0.0),
        },
    },

idle = {
dict = "amb@code_human_wander_drinking@male@base",
anim = "static",
params = {8.0, -8, -1, 49, 0},
time = 2000, 
},
animation = { 
dict = "amb@code_human_wander_drinking_fat@male@idle_a",
anim = "idle_c",
params = {nil, nil, 2000, 49},
time = 2000, 
},

status = { -- Per use. This is default without metadata intervention
    thirst  = 6,
},
},
["recoverywater"] = {-- item name
uses = 4,
prop = { 
-- Prop spawn data for idle & usage.
    Main = {
        Model = 'ba_prop_club_water_bottle',
        BoneID = 18905,
        Offset = vector3(0.093624152124789, -0.11251250630125, 0.036004965702174),
        Rot = vector3( 98.721686091906, -15.111545424567, 168.63459786415),
    }
},

-- idle = {
--     dict = "mp_suicide",
--     anim = "static",
--     params = {8.0, -8, -1, 49, 0},
--     time = 2000, 
-- },
animation = { 
    dict = "mp_player_intdrink",
    anim = "loop_bottle",
    params = {nil, nil, 2000, 49},
    time = 2000, 
},

status = { -- Per use. This is default without metadata intervention
    thirst  = 7
},
},
["southpawsoda"] = {
    uses = 3,
    prop = {
        Main = {
            Model = 'smallsoda',
            BoneID = 28422,
            Offset = vector3(0.0176, -0.0149, -0.049),
            Rot = vector3(05.0, -10.0, 0.0),
        },
    },
    idle = {
        dict = "amb@code_human_wander_drinking@male@base",
        anim = "static",
        params = {8.0, -8, -1, 49, 0},
        time = 2000,
    },
    animation = {
        dict = "amb@code_human_wander_drinking_fat@male@idle_a",
        anim = "idle_c",
        params = {nil, nil, 2000, 49},
        time = 2000,
    },
    status = {
        thirst = 10
    }
},
-------------------------------------------
-------------- VALLONES -------------------
-------------------------------------------
["carbonara"] = {-- item name
uses = 3,
prop = { 
    -- Prop spawn data for idle & usage.
    Main = { 
        Model = 'bowl_pastafagioli',
        BoneID = 18905,
        Offset = vector3(0.15678725526845, -0.0050334861860832, 0.031357341928032),
        Rot = vector3(-24.266444142288, 1.6600095970159, 5.6079281029707),
    },
    Second = { --https://forum.cfx.re/t/free-animation-eat-with-fork/5068991
        Model = 'alcaprop_fork',
        BoneID = 28422,
        Offset = vector3(0.010853324810796, 0.029339193596366, -0.019795742184349),
        Rot = vector3(0.0, 0.0, 96.560120437708),
    },
},
idle = {
    dict = "anim@eat@fork",
    anim = "fork_clip",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},
animation = { 
    dict = "anim@eat@fork",
    anim = "fork_clip",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},
status = { -- Per use. This is default without metadata intervention
    hunger  = 12
}
},
["alfredo"] = {-- item name
uses = 3,
prop = { 
    -- Prop spawn data for idle & usage.
    Main = { 
        Model = 'bowl_shrimpalfredo',
        BoneID = 18905,
        Offset = vector3(0.15678725526845, -0.0050334861860832, 0.031357341928032),
        Rot = vector3(-24.266444142288, 1.6600095970159, 5.6079281029707),
    },
    Second = { --https://forum.cfx.re/t/free-animation-eat-with-fork/5068991
        Model = 'alcaprop_fork',
        BoneID = 28422,
        Offset = vector3(0.010853324810796, 0.029339193596366, -0.019795742184349),
        Rot = vector3(0.0, 0.0, 96.560120437708),
    },
},
idle = {
    dict = "anim@eat@fork",
    anim = "fork_clip",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},
animation = { 
    dict = "anim@eat@fork",
    anim = "fork_clip",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},
status = { -- Per use. This is default without metadata intervention
    hunger  = 12
}
},
["spaghetti"] = {-- item name
uses = 3,
prop = { 
    -- Prop spawn data for idle & usage.
    Main = { 
        Model = 'plate_spaghettiandmeatballs',
        BoneID = 18905,
        Offset = vector3(0.15678725526845, -0.0050334861860832, 0.031357341928032),
        Rot = vector3(-24.266444142288, 1.6600095970159, 5.6079281029707),
    },
    Second = { --https://forum.cfx.re/t/free-animation-eat-with-fork/5068991
        Model = 'alcaprop_fork',
        BoneID = 28422,
        Offset = vector3(0.010853324810796, 0.029339193596366, -0.019795742184349),
        Rot = vector3(0.0, 0.0, 96.560120437708),
    },
},
idle = {
    dict = "anim@eat@fork",
    anim = "fork_clip",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},
animation = { 
    dict = "anim@eat@fork",
    anim = "fork_clip",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},
status = { -- Per use. This is default without metadata intervention
    hunger  = 12
}
},
["lobsterlinguini"] = {-- item name
uses = 3,
prop = { 
    -- Prop spawn data for idle & usage.
    Main = { 
        Model = 'plate_lobsterlinguini',
        BoneID = 18905,
        Offset = vector3(0.15678725526845, -0.0050334861860832, 0.031357341928032),
        Rot = vector3(-24.266444142288, 1.6600095970159, 5.6079281029707),
    },
    Second = { --https://forum.cfx.re/t/free-animation-eat-with-fork/5068991
        Model = 'alcaprop_fork',
        BoneID = 28422,
        Offset = vector3(0.010853324810796, 0.029339193596366, -0.019795742184349),
        Rot = vector3(0.0, 0.0, 96.560120437708),
    },
},
idle = {
    dict = "anim@eat@fork",
    anim = "fork_clip",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},
animation = { 
    dict = "anim@eat@fork",
    anim = "fork_clip",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},
status = { -- Per use. This is default without metadata intervention
    hunger  = 12
}
},
["tiramisu"] = {-- item name
uses = 3,
prop = { 
    -- Prop spawn data for idle & usage.
    Main = { 
        Model = 'plate_tiramisu',
        BoneID = 18905,
        Offset = vector3(0.15678725526845, -0.0050334861860832, 0.031357341928032),
        Rot = vector3(-24.266444142288, 1.6600095970159, 5.6079281029707),
    },
    Second = { --https://forum.cfx.re/t/free-animation-eat-with-fork/5068991
        Model = 'alcaprop_fork',
        BoneID = 28422,
        Offset = vector3(0.010853324810796, 0.029339193596366, -0.019795742184349),
        Rot = vector3(0.0, 0.0, 96.560120437708),
    },
},
idle = {
    dict = "anim@eat@fork",
    anim = "fork_clip",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},
animation = { 
    dict = "anim@eat@fork",
    anim = "fork_clip",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},
status = { -- Per use. This is default without metadata intervention
    hunger  = 12
}
},
["italiancheesecake"] = {-- item name
uses = 3,
prop = { 
    -- Prop spawn data for idle & usage.
    Main = { 
        Model = 'cake_blacktiemouse',
        BoneID = 18905,
        Offset = vector3(0.15678725526845, -0.0050334861860832, 0.031357341928032),
        Rot = vector3(-24.266444142288, 1.6600095970159, 5.6079281029707),
    },
    Second = { --https://forum.cfx.re/t/free-animation-eat-with-fork/5068991
        Model = 'alcaprop_fork',
        BoneID = 28422,
        Offset = vector3(0.010853324810796, 0.029339193596366, -0.019795742184349),
        Rot = vector3(0.0, 0.0, 96.560120437708),
    },
},
idle = {
    dict = "anim@eat@fork",
    anim = "fork_clip",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},
animation = { 
    dict = "anim@eat@fork",
    anim = "fork_clip",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},
status = { -- Per use. This is default without metadata intervention
    hunger  = 12
}
},
["breadsticks"] = {-- item name
uses = 3,
prop = { 
    -- Prop spawn data for idle & usage.
    Main = {
        Model = 'djs_prop_toast',
        BoneID = 18905,
        Offset = vector3(0.13, 0.05, 0.02), 
        Rot = vector3(0.0, -140.0, -140.0),
    }
},

-- idle = {
--     dict = "mp_suicide",
--     anim = "static",
--     params = {8.0, -8, -1, 49, 0},
--     time = 2000, 
-- },
animation = { 
    dict = "mp_player_inteat@burger",
    anim = "mp_player_int_eat_burger_fp",
    params = {nil, nil, 1200, 49},
    time = 2000, 
},

status = { -- Per use. This is default without metadata intervention
    hunger  = 5
}
},
["steakdish"] = {-- item name
uses = 3,
prop = { 
    -- Prop spawn data for idle & usage.
    Main = { 
        Model = 'plate_tbone',
        BoneID = 18905,
        Offset = vector3(0.15678725526845, -0.0050334861860832, 0.031357341928032),
        Rot = vector3(-24.266444142288, 1.6600095970159, 5.6079281029707),
    },
    Second = { --https://forum.cfx.re/t/free-animation-eat-with-fork/5068991
        Model = 'alcaprop_fork',
        BoneID = 28422,
        Offset = vector3(0.010853324810796, 0.029339193596366, -0.019795742184349),
        Rot = vector3(0.0, 0.0, 96.560120437708),
    },
},
idle = {
    dict = "anim@eat@fork",
    anim = "fork_clip",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},
animation = { 
    dict = "anim@eat@fork",
    anim = "fork_clip",
    params = {8.0, -8, -1, 49, 0},
    time = 2000, 
},
status = { -- Per use. This is default without metadata intervention
    hunger  = 12
}
},
-- Lets Cook
["lccupcoffee"] = {
    uses = 3,
    prop = { 
        Main = {
            Model = 'coffeecup_blackwhite',
            BoneID = 57005,
            Offset = vector3(0.052608283129189, -0.043068652880828, -0.04990939976107),
            Rot = vector3( 84.850341955668, -28.428830395779, 169.46349427528),
        }
    },
    idle = {
        dict = "anim@djs@drink@coffee",
        anim = "djs_drink_coffee_idle",
        params = {8.0, -8, -1, 49, 0},
        time = 2000, 
    },
    animation = { 
        dict = "anim@djs@drink@coffee",
        anim = "djs_drink_coffee_sip_long",
        params = {nil, nil, 2000, 49},
        time = 2000, 
    },
    status = {
        thirst = 4,
        sobriety = 5  -- Reduce alcohol level by 5 per use (stronger than water)
    }
},
["lchotcocoa"] = {-- item name
uses = 5,
prop = { 
-- Prop spawn data for idle & usage.
Main = {
    Model = 'djs_prop_coffeecup',
    BoneID = 28422,
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
dict = "amb@code_human_wander_drinking_fat@male@idle_a",
anim = "idle_c",
params = {nil, nil, 2000, 49},
time = 2000, 
},

status = { -- Per use. This is default without metadata intervention
    thirst  = 3,
}
},
}