Config = {}
Config.ItemInHand = "prop_ld_case_01" --ไอเท็มมือในมือ
Config.SellDelay = 6000 --เวลาในการขาย
Config.Blips = {
    Radius = 100.0, --ขนาดของวงในแมพตอนเริ่มขาย
    Color = 1, --สีในแมพ
    Alpha = 100 --ความโปร่งใส่ของจุดในแมพ
}

Config.PoliceCount = 1 --จำนวนตำรวจ
Config.FreezeTime = 10000 --เมือขายแพ้จะเดินไม่ได้กี่วิ
Config.CancelDelay = 10000 --เมือยกเลิกการขายจะให้ติดดูลดาวหรือไม่หากไม่ต้องการปรับเป็น 0

Config.DrugsList = { --ใส่ไอเท็มที่จะให้กดใช้
    {
        Name = "katom_pooch", --ชื่อยา
        Price = {1000,1500} --เงินแดงที่จะได้
    },
}

Config.Animations = {
    Win = { --Animation ตอนชนะ
        dict = "anim@arena@celeb@flat@solo@no_props@",
        name = "flip_a_player_a"
    },
    Loss = { --Animation ตอนแพ้
        dict = "anim@heists@ornate_bank@chat_manager",
        name = "fail"
    }
}

Config.NPCSpawnPoint = { --จุดสุ่มเดินของ NPC
    {
        Model = "a_m_m_beach_01",
        Pos = vector3(247.39, -1719.44, 29.08),
        Heading = 45.0
    },
    {
        Model = "a_m_m_beach_01",
        Pos = vector3(-175.45, -1613.57, 33.69),
        Heading = 90.0
    },
    {
        Model = "a_m_m_beach_01",
        Pos = vector3(138.56, -1826.46, 27.11),
        Heading = 50.0
    },
    {
        Model = "a_m_m_beach_01",
        Pos = vector3(-826.22, -981.1, 14.22),
        Heading = 110.0
    },
    {
        Model = "a_m_m_beach_01",
        Pos = vector3(-673.15,  -227.66,  37.09),
        Heading =  88.0
    }
    ,
    {
        Model = "a_m_m_beach_01",
        Pos = vector3(155.18, -310.64, 44.56),
        Heading =   150.0
    },
    {
        Model = "a_m_m_beach_01",
        Pos = vector3( 431.2, -686.54, 29.2),
        Heading =  0.0
    }
}