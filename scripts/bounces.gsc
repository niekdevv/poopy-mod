/*
==========================================

Bounce Mod

_Credits:
    JoeyB     - Author/creator/revising all bounce coords (most were raised too high).
    Avail     - Idea/Coordinates of bounces/request.
    xShadou - Coordinates.

_Adding a bounce:
        level.bounces["mapname"] = [];
        level.bounces["mapname"][bounceNum] = (X, Y, Z);

    raise/lower I according to the amount of bounces already for that map.
    I.E: adding one more bounce to afghan

        level.bounces["mp_afghan"][6] = (x, y, z);

    would be added after:
        level.bounces["mp_afghan"][5] = (-1231, 1813, 123);

_Changing a multiplier/radius
    _Multiplier:

        level.bounces["mapname"]["multiplier"][bounceNum] = bMultiplier;

    I.E.:
        level.bounces["mp_quarry"]["multiplier"][3] = -0.71;

    _Radius:

        level.bounces["mapname"]["radius"][bounceNum] = bMultiplier;

    I.E.:
        level.bounces["mp_quarry"]["radius"][3] = 20;

==========================================
*/

#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;

init()
{
    level.CurMap = getDvar("mapname");

    level thread BouncePos();

    thread doBounce();
}

BouncePos()
{
    switch(level.CurMap) // To keep from defining unused variables.
    {
        case "mp_afghan":
            level.bounces["mp_afghan"]    =    [];
            level.bounces["mp_afghan"][0] = (1285, 1042, 96);
            level.bounces["mp_afghan"][1] = (918, 1322, 184);
            level.bounces["mp_afghan"][2] = (1488, 1843, 98);
            level.bounces["mp_afghan"][3] = (1934, 2578, 85);
            level.bounces["mp_afghan"][4] = (-512, 2069, 96);
            level.bounces["mp_afghan"][5] = (-1231, 1813, 123);
            level.bounces["mp_afghan"][6] = (1275, 1045, 200);
            level.bounces["mp_afghan"][7] = (903, 1367, 260);
            level.bounces["mp_afghan"][8] = (1477, 1841, 185);
            level.bounces["mp_afghan"][9] = (1898, 1760, 215);
            level.bounces["mp_afghan"][10] = (2166, 678, 150);
            level.bounces["mp_afghan"][11] = (1921, 2571, 215);
            level.bounces["mp_afghan"][12] = (2140, 2665, 259);
            level.bounces["mp_afghan"][13] = (-499, 2067, 155);
            level.bounces["mp_afghan"][14] = (-1232, 1781, 143);
            level.bounces["mp_afghan"][15] = (2108, 894, 129);
            level.bounces["mp_afghan"][16] = (951, 1563, 546);
            level.bounces["mp_afghan"][17] = (3480, 76, 154); 
            level.bounces["mp_afghan"][18] = (1455, 89, 98);           
            level.bounces["mp_afghan"]["multiplier"][15] = -10;



        case "mp_complex":
            level.bounces["mp_complex"]    =    []; // Bailout
            level.bounces["mp_complex"][0] = (0, -3516, 694);
            level.bounces["mp_complex"][1] = (-405, -3515, 692);
            level.bounces["mp_complex"][2] = (1710, -2367, 502);
            level.bounces["mp_complex"][3] = (-23, -3520, 737);
            level.bounces["mp_complex"][4] = (-267, -2812, 758);
            level.bounces["mp_complex"][5] = (1917, -2992, 691);
        break;

        case "mp_crash":
            level.bounces["mp_crash"]        =    [];
            level.bounces["mp_crash"]        =    [];
            level.bounces["mp_crash"][0] = (448, -198, 174);
            level.bounces["mp_crash"][1] = (1207, -1257, 106);
            level.bounces["mp_crash"][2] = (-322, -876, 147);
            level.bounces["mp_crash"][3] = (-424, 1258, 283);
            level.bounces["mp_crash"][4] = (450, -185, 215);
            level.bounces["mp_crash"][5] = (1186, -1252, 151);
            level.bounces["mp_crash"][6] = (-322, -878, 196);
            level.bounces["mp_crash"][7] = (-427, 1244, 305);
            level.bounces["mp_crash"][8] = (1170, -662, 180);
        break;

        case "mp_derail":
            level.bounces["mp_derail"]    =    [];
            level.bounces["mp_derail"][0] = (17, 2229, 248);
            level.bounces["mp_derail"][1] = (37, 2020, 278);
            level.bounces["mp_derail"][2] = (-725, -724, 115);
            level.bounces["mp_derail"][3] = (-878, 1798, 90);
            level.bounces["mp_derail"][4] = (1880, 3710, 305);
            level.bounces["mp_derail"][5] = (1435, 2783, 285);
            level.bounces["mp_derail"][6] = (797, -2165, 256);
            level.bounces["mp_derail"][7] = (-1335, -2453, 210);
            level.bounces["mp_derail"][8] = (-703, 1278, 125);
            level.bounces["mp_derail"][9] = (257, -90, 245);
            level.bounces["mp_derail"][10] = (1380, 2558, 280);
            level.bounces["mp_derail"][11] = (925, -238, 125);
            level.bounces["mp_derail"][12] = (295, 2038, 264);
            level.bounces["mp_derail"][13] = (493, -132, 54);
            level.bounces["mp_derail"][14] = (469, 3331, 294);
        break;

        case "mp_estate":
            level.bounces["mp_estate"]    =    [];
            level.bounces["mp_estate"][0] = (-828, 93, -9);
            level.bounces["mp_estate"][1] = (-1219, 485, -132);
            level.bounces["mp_estate"][2] = (-607, 2687, -29);
            level.bounces["mp_estate"][3] = (1833, 3861, 33);
            level.bounces["mp_estate"][4] = (717, 4029, 93);
            level.bounces["mp_estate"][5] = (-835, 80, 30);
            level.bounces["mp_estate"][6] = (-1228, 484, -69);
            level.bounces["mp_estate"][7] = (-605, 2660, -1);
            level.bounces["mp_estate"][8] = (1821, 3860, 90);
            level.bounces["mp_estate"][9] = (709, 4030, 159);
            level.bounces["mp_estate"][10] = (-662, 942, 14);
            level.bounces["mp_estate"][11] = (-3031, 1385, -187);
            level.bounces["mp_estate"][12] = (-458, 3933, 210);
            level.bounces["mp_estate"][13] = (-2277, 951, -201);
            level.bounces["mp_estate"][14] = (1022, 582, 171);
            level.bounces["mp_estate"][15] = (-1276, 1346, -406);
        break;

        case "mp_favela":
            level.bounces["mp_favela"]    =    [];
            level.bounces["mp_favela"][0] = (-1110, 32, 45);
            level.bounces["mp_favela"][1] = (-1174, 573, 53);
            level.bounces["mp_favela"][2] = (-918, 640, 59);
            level.bounces["mp_favela"][3] = (-140, -43, 86);
            level.bounces["mp_favela"][4] = (-140, -150, 88);
            level.bounces["mp_favela"][5] = (396, -123, 85);
            level.bounces["mp_favela"][6] = (396, 17, 87);
            level.bounces["mp_favela"][7] = (249, -1179, 23);
            level.bounces["mp_favela"][8] = (1170, 1428, 223);
            level.bounces["mp_favela"][9] = (-1096, 64, 105);
            level.bounces["mp_favela"][10] = (-1177, 556, 105);
            level.bounces["mp_favela"][11] = (-918, 635, 105);
            level.bounces["mp_favela"][12] = (-163, 22, 65);
            level.bounces["mp_favela"][11] = (426, -150, 65);
            level.bounces["mp_favela"][12] = (426, 24, 65);
            level.bounces["mp_favela"][13] = (259, -1209, 92);
            level.bounces["mp_favela"][14] = (1170, 1460, 270);
            level.bounces["mp_favela"][15] = (-630, -911, 125);
            level.bounces["mp_favela"][16] = (-795, 1160, 150);
            level.bounces["mp_favela"][17] = (-1123, 1726, 280);
            level.bounces["mp_favela"][18] = (236, 2668, 375);
            level.bounces["mp_favela"][19] = (941, -584, 291);
            level.bounces["mp_favela"][20] = (965, -604, 289);
            level.bounces["mp_favela"][21] = (1170, 1428, 223);
            level.bounces["mp_favela"][22] = (-148, 663, 420);
            level.bounces["mp_favela"][23] = (-210, 967, 481);
            level.bounces["mp_favela"][24] = (-824, 1439, 302);
            level.bounces["mp_favela"][25] = (-1046, 1417, 616);
            level.bounces["mp_favela"][26] = (1106, 1116, 374);
            level.bounces["mp_favela"][27] = (-720, 1118, 463);
            level.bounces["mp_favela"][28] = (-1842, -169, 535);
            level.bounces["mp_favela"][29] = (-1597, -908, 464);
            level.bounces["mp_favela"][30] = (-1873, -1084, 212);
            level.bounces["mp_favela"][31] = (953, 1479, 537);

        break;

        case "mp_fuel2":
            level.bounces["mp_fuel2"]        =    []; // Fuel -- no bounces by JoeyB
            level.bounces["mp_fuel2"][0] = (153, 1783, -84);
            level.bounces["mp_fuel2"][1] = (-190, -2159, -158);
            level.bounces["mp_fuel2"][1] = (2541, 2440, -61);
        break;

        case "mp_highrise":
            level.bounces["mp_highrise"]    =    [];
            level.bounces["mp_highrise"][0] = (-624, 6968, 2740);
            level.bounces["mp_highrise"][1] = (-2596, 7306, 3019);
            level.bounces["mp_highrise"][2] = (-917, 5866, 2854);
            level.bounces["mp_highrise"][3] = (-2416, 6141, 2857);
            level.bounces["mp_highrise"][4] = (-1546, 6498, 2878);
            level.bounces["mp_highrise"][5] = (-620, 6975, 2790);
            level.bounces["mp_highrise"][6] = (-1896, 6928, 2860);
            level.bounces["mp_highrise"][7] = (-1283, 5265, 3035);
            level.bounces["mp_highrise"][8] = (-2596, 7305, 3025);
            level.bounces["mp_highrise"][9] = (-442, 5834, 2880);
            level.bounces["mp_highrise"][10] = (-1656, 6370, 2944);
            level.bounces["mp_highrise"][11] = (-1914, 5404, 2920);
            level.bounces["mp_highrise"][12] = (-2129, 7183, 2829);
            level.bounces["mp_highrise"][13] = (-2404, 6744, 2924);
			level.bounces["mp_highrise"][14] = (-248, 5700, 2923);

        break;

        case "mp_invasion":
            level.bounces["mp_invasion"]    =    [];
            level.bounces["mp_invasion"][0] = (-2629, -3021, 315);
            level.bounces["mp_invasion"][1] = (-3184, -2521, 315);
            level.bounces["mp_invasion"][2] = (-717, -3353, 313);
            level.bounces["mp_invasion"][3] = (823, -1359, 347);
            level.bounces["mp_invasion"][4] = (-2650, -3030, 340);
            level.bounces["mp_invasion"][5] = (-3190, -2515, 380);
            level.bounces["mp_invasion"][6] = (-3560, -2756, 360);
            level.bounces["mp_invasion"][7] = (-741, -3360, 345);
            level.bounces["mp_invasion"][8] = (-1100, -3172, 335);
            level.bounces["mp_invasion"][9] = (-1724, -2601, 356);
            level.bounces["mp_invasion"][10] = (825, -1360, 374);
            level.bounces["mp_invasion"][11] = (220, -2773, 310);
            level.bounces["mp_invasion"][12] = (-367, -455, 247);
        break;

        case "mp_checkpoint":
            level.bounces["mp_checkpoint"] =    []; // Karachi
            level.bounces["mp_checkpoint"][0] = (-830, 181, 39);
            level.bounces["mp_checkpoint"][1] = (-1288, 6, 61);
            level.bounces["mp_checkpoint"][2] = (-765, 1419, 73);
            level.bounces["mp_checkpoint"][3] = (1102, 989, 43);
            level.bounces["mp_checkpoint"][4] = (128, -338, 123);
            level.bounces["mp_checkpoint"][5] = (-900, 158, 91);
            level.bounces["mp_checkpoint"][6] = (-1311, 55, 85);
            level.bounces["mp_checkpoint"][7] = (-769, 1442, 137);
            level.bounces["mp_checkpoint"][8] = (1108, 994, 125);
            level.bounces["mp_checkpoint"][9] = (1270, 560, 180);
            level.bounces["mp_checkpoint"][10] = (-1175, -634, 222);
            level.bounces["mp_checkpoint"][11] = (-92, -207, 247);
            level.bounces["mp_checkpoint"][12] = (110, -351, 187);
            level.bounces["mp_checkpoint"][13] = (1340, -1102, 98);
            level.bounces["mp_checkpoint"][14] = (-58, -1059, 118);
        break;

        case "mp_overgrown":
            level.bounces["mp_overgrown"]    =    [];
            level.bounces["mp_overgrown"][0] = (-281, -3533, -241);
            level.bounces["mp_overgrown"][1] = (533, -1917, -251);
            level.bounces["mp_overgrown"][2] = (1066, -1392, -274);
            level.bounces["mp_overgrown"][3] = (-100, -4737, -166);
            level.bounces["mp_overgrown"][4] = (634, -1938, -232);
            level.bounces["mp_overgrown"][5] = (825, -2944, -66);
            level.bounces["mp_overgrown"][6] = (1560, -2497, -80);
        break;

        case "mp_quarry":
            level.bounces["mp_quarry"]    =    [];
            level.bounces["mp_quarry"][0] = (-3411, -553, -137);
            level.bounces["mp_quarry"][1] = (-5187, -254, -148);
            level.bounces["mp_quarry"][2] = (-3675, 437, -79);
            level.bounces["mp_quarry"][3] = (-5567, -163, -73);
            level.bounces["mp_quarry"][4] = (-3667, -402, -21);
            level.bounces["mp_quarry"][5] = (-5555, -175, -35);
            level.bounces["mp_quarry"][6] = (-5310, 153, -45);
            level.bounces["mp_quarry"][7] = (-3654, 435, -1);
            level.bounces["mp_quarry"][8] = (-4138, 478, -84);
            level.bounces["mp_quarry"][9] = (-1900, 88, 101);
            level.bounces["mp_quarry"]["multiplier"][3] = -0.71; // stops 'glitch-ability' of this bounce ;3
        break;

        case "mp_rundown":
            level.bounces["mp_rundown"]    =    [];
            level.bounces["mp_rundown"][0] = (735, -4, -75);
            level.bounces["mp_rundown"][1] = (772, -650, 67);
            level.bounces["mp_rundown"][2] = (14, -1262, 67);
            level.bounces["mp_rundown"][3] = (-484, -482, -87);
            level.bounces["mp_rundown"][4] = (735, 13, -50);
            level.bounces["mp_rundown"][5] = (380, -2340, 250);
            level.bounces["mp_rundown"][6] = (2202, -680, 165);
            level.bounces["mp_rundown"][7] = (783, -657, 123);
            level.bounces["mp_rundown"][8] = (-1010, -1229, 21);
            level.bounces["mp_rundown"][9] = (-24, 577, 121);
            level.bounces["mp_rundown"][10] = (-495, -454, -4);
            level.bounces["mp_rundown"][11] = (533, 1139, 172);
            level.bounces["mp_rundown"][12] = (1464, -2506, 307);
            level.bounces["mp_rundown"][13] = (620, 722, 97);
        break;

        case "mp_rust":
            level.bounces["mp_rust"]        =    [];
            level.bounces["mp_rust"][0] = (152, 821, -102);
            level.bounces["mp_rust"][1] = (1493, 581, -147);
            level.bounces["mp_rust"][2] = (367, 436, -166);
            level.bounces["mp_rust"][3] = (215, 874, -94);
            level.bounces["mp_rust"][4] = (958, 1599, -44);
            level.bounces["mp_rust"][5] = (1139, 816, 17);
            level.bounces["mp_rust"][6] = (1187, 451, -166);
            level.bounces["mp_rust"][7] = (-396, 1292, -154);
            level.bounces["mp_rust"][8] = (-234, 388, -172);
            level.bounces["mp_rust"]["radius"][2] = 20;
        break;

        case "mp_boneyard":
            level.bounces["mp_boneyard"]    =    []; // Scrapyard
            level.bounces["mp_boneyard"][0] = (556, 26, -73);
            level.bounces["mp_boneyard"][1] = (-800, 243, -74);
            level.bounces["mp_boneyard"][2] = (548, 930, -24);
            level.bounces["mp_boneyard"][3] = (-1713, 647, -51);
            level.bounces["mp_boneyard"][4] = (561, -4, -14);
            level.bounces["mp_boneyard"][5] = (-805, 246, -26);
            level.bounces["mp_boneyard"][6] = (-976, 573, 110);
            level.bounces["mp_boneyard"][7] = (1337, 978, -39);
            level.bounces["mp_boneyard"][8] = (545, 685, -19);
        break;

        case "mp_nightshift":
            level.bounces["mp_nightshift"] =    []; // Skidrow
            level.bounces["mp_nightshift"][0] = (-14, -99, 45);
            level.bounces["mp_nightshift"][1] = (1511, 261, 146);
            level.bounces["mp_nightshift"][2] = (1384, -725, 41);
            level.bounces["mp_nightshift"][3] = (-1948, -1400, 54);
            level.bounces["mp_nightshift"][4] = (1, -100, 80);
            level.bounces["mp_nightshift"][5] = (1637, 219, 110);
            level.bounces["mp_nightshift"][6] = (1389, -722, 94);
            level.bounces["mp_nightshift"][7] = (-1947, -1398, 66);
            level.bounces["mp_nightshift"][8] = (1177, -1367, 98);
            level.bounces["mp_nightshift"][9] = (332, -1783, 95);
            level.bounces["mp_nightshift"][10] = (-1923, -1010, 70);
            level.bounces["mp_nightshift"][11] = (1326, -1399, 99);
        break;

        case "mp_storm":
            level.bounces["mp_storm"]        =    [];
            level.bounces["mp_storm"][0] = (-1286, 1137, 52);
            level.bounces["mp_storm"][1] = (-900, -426, 39);
            level.bounces["mp_storm"][2] = (-1766, -552, 45);
            level.bounces["mp_storm"][3] = (-1380, -1311, 43);
            level.bounces["mp_storm"][4] = (2087, -1203, 84);
            level.bounces["mp_storm"][5] = (-978, -460, 98);
            level.bounces["mp_storm"][6] = (498, -1109, 89);
            level.bounces["mp_storm"][7] = (318, -2999, 721);
            level.bounces["mp_storm"][8] = (305, -2857, 723);
            level.bounces["mp_storm"][9] = (876, -3064, 723);
        break;

        case "mp_strike":
            level.bounces["mp_strike"]    =    [];
            level.bounces["mp_strike"][0] = (1484, -748, 58);
            level.bounces["mp_strike"][1] = (-464, 19, 64);
            level.bounces["mp_strike"][2] = (-465, 867, 77);
            level.bounces["mp_strike"][3] = (1482, -757, 110);
            level.bounces["mp_strike"][4] = (410, 299, 110);
            level.bounces["mp_strike"][5] = (-468, 10, 120);
        break;

        case "mp_terminal":
            level.bounces["mp_terminal"]    =    [];
            level.bounces["mp_terminal"][0] = (1542, 3676, 94);
            level.bounces["mp_terminal"][1] = (1257, 4736, 117);
            level.bounces["mp_terminal"][2] = (1075, 2649, 154);
            level.bounces["mp_terminal"][3] = (335, 3798, 106);
            level.bounces["mp_terminal"][4] = (1499, 3954, 81);
            level.bounces["mp_terminal"][5] = (1348, 2605, 158);
            level.bounces["mp_terminal"][6] = (596, 4262, 270);
            level.bounces["mp_terminal"][7] = (1546, 3678, 145);
            level.bounces["mp_terminal"][8] = (1262, 4740, 140);
            level.bounces["mp_terminal"][9] = (1073, 2655, 195);
            level.bounces["mp_terminal"][10] = (328, 3793, 195);
            level.bounces["mp_terminal"][11] = (2061, 3915, 137);
            level.bounces["mp_terminal"][12] = (2119, 3915, 137);
            level.bounces["mp_terminal"][13] = (1502, 3968, 130);
            level.bounces["mp_terminal"][14] = (1343, 2602, 220);
            level.bounces["mp_terminal"][15] = (2230, 2679, 220);
            level.bounces["mp_terminal"][16] = (594, 4270, 310);
        break;

        case "mp_underpass":
            level.bounces["mp_underpass"]    =    [];
            level.bounces["mp_underpass"][0] = (903, 2269, 221);
            level.bounces["mp_underpass"][1] = (-284, 1227, 138);
            level.bounces["mp_underpass"][2] = (-298, 2099, 39);
            level.bounces["mp_underpass"][3] = (-139, 1426, 161);
            level.bounces["mp_underpass"][4] = (560, 576, 206);
            level.bounces["mp_underpass"][5] = (2317, 2017, 383);
            level.bounces["mp_underpass"][6] = (899, 2269, 257);
            level.bounces["mp_underpass"][7] = (-288, 1224, 183);
            level.bounces["mp_underpass"][8] = (-340, 2096, 117);
            level.bounces["mp_underpass"][9] = (44, 672, 226);
            level.bounces["mp_underpass"][10] = (1726, -230, 546);
            level.bounces["mp_underpass"][11] = (1118, 1392, 486);
            level.bounces["mp_underpass"][12] = (1085, 2004, 456);
        break;

        case "mp_subbase":
            level.bounces["mp_subbase"]        =    []; 
            level.bounces["mp_subbase"][0] = (-1070, -2275, 162);
            level.bounces["mp_subbase"][1] = (541, -707, 208);
            level.bounces["mp_subbase"][2] = (1165, 411, 161);
            level.bounces["mp_subbase"][3] = (660, 623, 228);
            level.bounces["mp_subbase"][4] = (1044, 272, 269);
            level.bounces["mp_subbase"][5] = (821, 611, 142);
        break;

        case "mp_brecourt":
            level.bounces["mp_brecourt"]        =    []; 
            level.bounces["mp_brecourt"][0] = (2784, -2888, 85);
            level.bounces["mp_brecourt"][1] = (1037, -2024, 128);
            level.bounces["mp_brecourt"][2] = (-2499, 215, 139);
            level.bounces["mp_brecourt"][3] = (-2494, 455, 121);
        break;

        case "mp_abandon":
            level.bounces["mp_abandon"]        =    []; 
            level.bounces["mp_abandon"][0] = (2620, -1362, 118);
            level.bounces["mp_abandon"][1] = (1839, -1915, 141);
            level.bounces["mp_abandon"][2] = (2791, -106, 144);
            level.bounces["mp_abandon"][3] = (422, -1623, 29);
        break;

        case "mp_compact":
            level.bounces["mp_compact"]        =    []; 
            level.bounces["mp_compact"][0] = (2413, 2164, 130);
            level.bounces["mp_compact"][1] = (2031, 2671, 131);
            level.bounces["mp_compact"][2] = (2030, 1172, 119);
            level.bounces["mp_compact"][3] = (1839, 1856, 147);
        break;

        case "mp_vacant":
            level.bounces["mp_vacant"]        =    []; 
            level.bounces["mp_vacant"][0] = (-1050, 436, -10);
            level.bounces["mp_vacant"][1] = (-636, 1287, 75);
        break;

        case "mp_trailerpark":
            level.bounces["mp_trailerpark"]        =    []; 
            level.bounces["mp_trailerpark"][0] = (1317, 825, 97);
            level.bounces["mp_trailerpark"][1] = (-1109, -171, 97);
            level.bounces["mp_trailerpark"][2] = (2716, -210, 230);
            level.bounces["mp_trailerpark"][3] = (2246, 768, 240);   
            level.bounces["mp_trailerpark"][4] = (2693, 1102, 212);  
            level.bounces["mp_trailerpark"][5] = (1076, 1591, 226);  
            level.bounces["mp_trailerpark"][6] = (1509, 1290, 314);  
            level.bounces["mp_trailerpark"][7] = (2442, 1268, 160);   

            //level.bounces["mp_trailerpark"]["radius"][5] = 20;
            level.bounces["mp_trailerpark"]["multiplier"][5] = -1.9;  
        break;

        case "oilrig":
            level.bounces["oilrig"]        =    []; 
            level.bounces["oilrig"][0] = (1279, -111, -180);
            level.bounces["oilrig"][1] = (1321, 1757, -147);
        break;

        case "invasion":
            level.bounces["invasion"]        =    []; 
            level.bounces["invasion"][0] = (-2240, -3938, 2483);
            level.bounces["invasion"][1] = (1363, -5058, 2427);
            level.bounces["invasion"][2] = (-345, -5605, 2398);
	        level.bounces["invasion"][3] = (-2910, -5348, 2434);
        break;

        case "gulag":
            level.bounces["gulag"]        =    []; 
            level.bounces["gulag"][0] = (-1117, -326, 1969);
            level.bounces["gulag"][1] = (-3618, -2161, 2180);
            level.bounces["gulag"][2] = (-4146, -1880, 2308);
            level.bounces["gulag"][3] = (-4146, -1880, 2308);
            level.bounces["gulag"][4] = (-984, 488, 2150);
        break;

        case "so_ghillies":
            level.bounces["so_ghillies"]        =    []; 
            level.bounces["so_ghillies"][0] = (-16963, 3272, 328);
        break; 

        case "mp_nuked":
            level.bounces["mp_nuked"]        =    []; 
            level.bounces["mp_nuked"][0] = (-642, 0, 36);
            level.bounces["mp_nuked"][1] = (-292, 482, 126);
            level.bounces["mp_nuked"][2] = (-1350, 1011, 56);
        break;
 
        //custom maps
        case "mp_bo2turbine":
            level.bounces["mp_bo2turbine"]        =    [];
            level.bounces["mp_bo2turbine"][0] = (1052, 2432, 163);
            level.bounces["mp_bo2turbine"][1] = (1379, 2015, 123);
            level.bounces["mp_bo2turbine"][2] = (-1160, 3177, 402);
            level.bounces["mp_bo2turbine"][3] = (-607, 2892, 361);
            level.bounces["mp_bo2turbine"][4] = (-379, -836, 431);
            level.bounces["mp_bo2turbine"][5] = (215, -1303, 338);
        break;
        case "mp_storm_spring":
            level.bounces["mp_storm_spring"]        =    [];
            level.bounces["mp_storm_spring"][0] = (-1286, 1137, 52);
            level.bounces["mp_storm_spring"][1] = (-900, -426, 39);
            level.bounces["mp_storm_spring"][2] = (-1766, -552, 45);
            level.bounces["mp_storm_spring"][3] = (-1380, -1311, 43);
            level.bounces["mp_storm_spring"][4] = (2087, -1203, 84);
            level.bounces["mp_storm_spring"][5] = (-978, -460, 98);
            level.bounces["mp_storm_spring"][6] = (498, -1109, 89);
            level.bounces["mp_storm_spring"][7] = (318, -2999, 721);
            level.bounces["mp_storm_spring"][8] = (305, -2857, 723);
            level.bounces["mp_storm_spring"][9] = (876, -3064, 723);
        break;
        case "mp_toybox4_b2":
            level.bounces["mp_toybox4_b2"]    =    [];
            level.bounces["mp_toybox4_b2"][0] = (1466, -450, 413);
            level.bounces["mp_toybox4_b2"][1] = (1264, 902, 382);
            break;
        case "mp_fav_tropical":
            level.bounces["mp_fav_tropical"]    =    [];
            level.bounces["mp_fav_tropical"][0] = (-1110, 32, 45);
            level.bounces["mp_fav_tropical"][1] = (-1174, 573, 53);
            level.bounces["mp_fav_tropical"][2] = (-918, 640, 59);
            level.bounces["mp_fav_tropical"][3] = (-140, -43, 86);
            level.bounces["mp_fav_tropical"][4] = (-140, -150, 88);
            level.bounces["mp_fav_tropical"][5] = (396, -123, 85);
            level.bounces["mp_fav_tropical"][6] = (396, 17, 87);
            level.bounces["mp_fav_tropical"][7] = (249, -1179, 23);
            level.bounces["mp_fav_tropical"][8] = (1170, 1428, 223);
            level.bounces["mp_fav_tropical"][9] = (-1096, 64, 105);
            level.bounces["mp_fav_tropical"][10] = (-1177, 556, 105);
            level.bounces["mp_fav_tropical"][11] = (-918, 635, 105);
            level.bounces["mp_fav_tropical"][12] = (-163, 22, 65);
            level.bounces["mp_fav_tropical"][11] = (426, -150, 65);
            level.bounces["mp_fav_tropical"][12] = (426, 24, 65);
            level.bounces["mp_fav_tropical"][13] = (259, -1209, 92);
            level.bounces["mp_fav_tropical"][14] = (1170, 1460, 270);
            level.bounces["mp_fav_tropical"][15] = (-630, -911, 125);
            level.bounces["mp_fav_tropical"][16] = (-795, 1160, 150);
            level.bounces["mp_fav_tropical"][17] = (-1123, 1726, 280);
            level.bounces["mp_fav_tropical"][18] = (236, 2668, 375);
            level.bounces["mp_fav_tropical"][19] = (941, -584, 291);
            level.bounces["mp_fav_tropical"][20] = (965, -604, 289);
            level.bounces["mp_fav_tropical"][21] = (1170, 1428, 223);
            level.bounces["mp_fav_tropical"][22] = (-148, 663, 420);
            level.bounces["mp_fav_tropical"][23] = (-210, 967, 481);
            level.bounces["mp_fav_tropical"][24] = (-824, 1439, 302);
            level.bounces["mp_fav_tropical"][25] = (-1046, 1417, 616);
            level.bounces["mp_fav_tropical"][26] = (1106, 1116, 374);
            level.bounces["mp_fav_tropical"][27] = (-720, 1118, 463);
            level.bounces["mp_fav_tropical"][28] = (-1842, -169, 535);
            level.bounces["mp_fav_tropical"][29] = (-1597, -908, 464);
            level.bounces["mp_fav_tropical"][30] = (-1873, -1084, 212);
            level.bounces["mp_fav_tropical"][31] = (953, 1479, 537);
            break;
        case "mp_c4s_minecraft": 
            level.bounces["mp_c4s_minecraft"] = []; 
            level.bounces["mp_c4s_minecraft"][0] = (-831, -1848, 420);
            level.bounces["mp_c4s_minecraft"][1] = (-1518, -1904, 420);
            level.bounces["mp_c4s_minecraft"][2] = (-1803, -1445, 312);
            level.bounces["mp_c4s_minecraft"][3] = (435, -1305, 388);
            level.bounces["mp_c4s_minecraft"][4] = (287, -2059, 388);
            level.bounces["mp_c4s_minecraft"][5] = (148, -1120, 240);
            level.bounces["mp_c4s_minecraft"][6] = (-660, -402, 96);
            //level.bounces["mp_c4s_minecraft"]["radius"][0] = 20;
            level.bounces["mp_c4s_minecraft"]["multiplier"][3] = -1.8;
            level.bounces["mp_c4s_minecraft"]["multiplier"][4] = -1.8;
            level.bounces["mp_c4s_minecraft"]["multiplier"][6] = -2;
            break;
	case "mp_waw_castle":
	   level.bounces["mp_waw_castle"][0] = (3401, -1108, -319);
	    level.bounces["mp_waw_castle"]["multiplier"][0] = -1.8;
	    break;
	case "mp_family_beta":
	    level.bounces["mp_family_beta"][0] = (293, -3682, 436);
	    level.bounces["mp_family_beta"][1] = (713, -3646, 408);
	    level.bounces["mp_family_beta"][2] = (-266, -4480, 436);
	    level.bounces["mp_family_beta"][3] = (867, -1967, 173);
	    level.bounces["mp_family_beta"][4] = (58, -4239, 407);
	    break;
	case "mp_poolday":
	    level.bounces["mp_poolday"][0] = (1, -180, 70);
	    break;
    case "mp_shipment_long":
        level.bounces["mp_shipment_long"][0] = (337, 332, 298);
        level.bounces["mp_shipment_long"]["multiplier"][0] = -2.0;
        break;
    case "mp_blackrock":
        level.bounces["mp_blackrock"][0] = (573, -2555, 115);
        level.bounces["mp_blackrock"][1] = (567, -2626, 413);
        break;     
    case "airport":
        level.bounces["airport"][0] = (1759, 2222, 82);
        level.bounces["airport"][1] = (1595, 2471, 144);
        level.bounces["airport"][2] = (-351, 3188, 209);
        level.bounces["airport"][3] = (-1432, 3763, 214);
        level.bounces["airport"][4] = (-428, 3889, 114);
        break;
    case "dcburning":
        level.bounces["dcburning"][0] = (-17724, 6563, 604);
        break;    
    }
}

doBounce()
{
    level endon("game_ended");
    level waittill("prematch_over");

    while(isDefined(level.bounces[level.CurMap]))
    {
        wait 0.01;

        foreach(player in level.players)
        {
            player.vel = player getVelocity();

            if(!isDefined(player.CanBounce)) // Ehh; works for now anyways. -- removed ->  || player.vel[2] >= -10 && player.vel[2] <= 10
                player.CanBounce = 1;

            if( player isOnGround() || player isOnLadder() || !isAlive( player ) || player.vel[2] > 0) // bounces won't affect people walking, climbing a ladder, dead, or people jumping UP instead of DOWN
                continue;

            for( bCount = 0; bCount < level.bounces[level.CurMap].size; bCount++ )
            {
                if(!isDefined(level.bounces[level.CurMap][bCount])) // incase you forgot to change the array's number when removing a bounce, this will stop various errors/bugs.
                    continue; // You /should/ up the digit though; there will be errors still (I.E. some bounces won't be counted)

                if(isDefined(level.bounces[level.CurMap]["radius"][bCount])) // check for custom radius
                {
                    player.bRadius = level.bounces[level.CurMap]["radius"][bCount];
                } else { // if error or no custom radius then we assign the 'default'.
                    level.bounces[level.CurMap]["radius"][bCount] = 80;
                    player.bRadius = level.bounces[level.CurMap]["radius"][bCount];
                }

                if(distance(player.origin, level.bounces[level.CurMap][bCount]) <= player.bRadius && player.canBounce == 1 && player.origin[2] - level.bounces[level.CurMap][bCount][2] <= 25) {

                    if(isDefined(level.bounces[level.CurMap]["multiplier"][bCount])) // check for custom multiplier
                    {
                        player.bMultiplier = level.bounces[level.CurMap]["multiplier"][bCount];
                    } else { // if error or no custom multiplier we assign default
                        level.bounces[level.CurMap]["multiplier"][bCount] = -1.215; //Standard: -1.215
                        player.bMultiplier = level.bounces[level.CurMap]["multiplier"][bCount];
                    }

                    player setVelocity( ( player.vel[0], player.vel[1], player.vel[2] * player.bMultiplier ) ); // -1.215 is the 'multiplier' of the bounce; lower number (remember its negative) = higher bounce
                    player.CanBounce = 0;
                    player thread resetBounce();
                }
            }
        }
    }
}


resetBounce() // mere work around for player.canBounce -- works slightly better for now anyways
{
    self endon("disconnect");
    self endon("finishReset");
    wait 1;
    self.canBounce = 1;
    self notify("finishReset");
}