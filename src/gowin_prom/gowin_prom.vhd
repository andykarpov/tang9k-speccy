--Copyright (C)2014-2022 Gowin Semiconductor Corporation.
--All rights reserved.
--File Title: IP file
--GOWIN Version: V1.9.8.05
--Part Number: GW1NR-LV9QN88PC6/I5
--Device: GW1NR-9C
--Created Time: Mon May 15 10:32:39 2023

library IEEE;
use IEEE.std_logic_1164.all;

entity Gowin_pROM is
    port (
        dout: out std_logic_vector(7 downto 0);
        clk: in std_logic;
        oce: in std_logic;
        ce: in std_logic;
        reset: in std_logic;
        ad: in std_logic_vector(12 downto 0)
    );
end Gowin_pROM;

architecture Behavioral of Gowin_pROM is

    signal prom_inst_0_dout_w: std_logic_vector(29 downto 0);
    signal prom_inst_1_dout_w: std_logic_vector(29 downto 0);
    signal prom_inst_2_dout_w: std_logic_vector(29 downto 0);
    signal prom_inst_3_dout_w: std_logic_vector(29 downto 0);
    signal gw_gnd: std_logic;
    signal prom_inst_0_AD_i: std_logic_vector(13 downto 0);
    signal prom_inst_0_DO_o: std_logic_vector(31 downto 0);
    signal prom_inst_1_AD_i: std_logic_vector(13 downto 0);
    signal prom_inst_1_DO_o: std_logic_vector(31 downto 0);
    signal prom_inst_2_AD_i: std_logic_vector(13 downto 0);
    signal prom_inst_2_DO_o: std_logic_vector(31 downto 0);
    signal prom_inst_3_AD_i: std_logic_vector(13 downto 0);
    signal prom_inst_3_DO_o: std_logic_vector(31 downto 0);

    --component declaration
    component pROM
        generic (
            READ_MODE: in bit :='0';
            BIT_WIDTH: in integer := 9;
            RESET_MODE: in string := "SYNC";
            INIT_RAM_00: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_01: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_02: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_03: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_04: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_05: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_06: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_07: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_08: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_09: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_0A: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_0B: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_0C: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_0D: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_0E: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_0F: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_10: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_11: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_12: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_13: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_14: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_15: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_16: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_17: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_18: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_19: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_1A: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_1B: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_1C: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_1D: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_1E: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_1F: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_20: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_21: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_22: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_23: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_24: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_25: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_26: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_27: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_28: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_29: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_2A: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_2B: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_2C: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_2D: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_2E: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_2F: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_30: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_31: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_32: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_33: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_34: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_35: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_36: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_37: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_38: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_39: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_3A: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_3B: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_3C: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_3D: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_3E: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_3F: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000"
        );
        port (
            DO: out std_logic_vector(31 downto 0);
            CLK: in std_logic;
            OCE: in std_logic;
            CE: in std_logic;
            RESET: in std_logic;
            AD: in std_logic_vector(13 downto 0)
        );
    end component;

begin
    gw_gnd <= '0';

    prom_inst_0_AD_i <= ad(12 downto 0) & gw_gnd;
    dout(1 downto 0) <= prom_inst_0_DO_o(1 downto 0) ;
    prom_inst_0_dout_w(29 downto 0) <= prom_inst_0_DO_o(31 downto 2) ;
    prom_inst_1_AD_i <= ad(12 downto 0) & gw_gnd;
    dout(3 downto 2) <= prom_inst_1_DO_o(1 downto 0) ;
    prom_inst_1_dout_w(29 downto 0) <= prom_inst_1_DO_o(31 downto 2) ;
    prom_inst_2_AD_i <= ad(12 downto 0) & gw_gnd;
    dout(5 downto 4) <= prom_inst_2_DO_o(1 downto 0) ;
    prom_inst_2_dout_w(29 downto 0) <= prom_inst_2_DO_o(31 downto 2) ;
    prom_inst_3_AD_i <= ad(12 downto 0) & gw_gnd;
    dout(7 downto 6) <= prom_inst_3_DO_o(1 downto 0) ;
    prom_inst_3_dout_w(29 downto 0) <= prom_inst_3_DO_o(31 downto 2) ;

    prom_inst_0: pROM
        generic map (
            READ_MODE => '0',
            BIT_WIDTH => 2,
            RESET_MODE => "ASYNC",
            INIT_RAM_00 => X"F24BDBBCB5921EDFB9C3E3937DC6F3D0CC54F9B0F769C38631C70FCB4193D787",
            INIT_RAM_01 => X"873B8E6D8952E52D56D9054437DD62508CD77759162237DF525EE566277522E2",
            INIT_RAM_02 => X"18D3916AAE7F2888BC83964595585F4507C87B69B6FABBE0A68EE34DC400FF85",
            INIT_RAM_03 => X"5A69694DA65294B6371B8A772608D2B5288E342D4DE7D34124114A04214204EE",
            INIT_RAM_04 => X"61C0EFBF16D82A9081A9071B697C6DB554EECA65B65A55B55D71951A5B6D8761",
            INIT_RAM_05 => X"CBD7F415F67F4141435DE1C4160105FE415D8D672EAC8364FB72D53653515E73",
            INIT_RAM_06 => X"2606B555E55D77CE51D558D28E04E9EDEFB7BC145EA35EE345650371598D2717",
            INIT_RAM_07 => X"9D77707092055FC1FE001FDF7FBBFDBD6595555F453FFF1207555DE5E4670D20",
            INIT_RAM_08 => X"393888881F576356F55355CD57FF27944D4F6D673D792F57AC15495EEDF3AD35",
            INIT_RAM_09 => X"57953325CD1573146151540D2FF71000001C8E7FBF72D28E2682A02A20B4466F",
            INIT_RAM_0A => X"B04573B454DEF2B57ACB972CBFFC97CDAF2D60A555508FD9495EE495555E5E5D",
            INIT_RAM_0B => X"BB07F211DCAE7F1F21100501297545AB959B98B3D119CA32CE8DC84BD1C414C8",
            INIT_RAM_0C => X"D423F65257BB4495551429554137D5949E525551429554137D9495E525550DFC",
            INIT_RAM_0D => X"C14E4D64A858391C17F7C5BA74CF0D737BD4DCECAC6C2791EEEE16AD98392756",
            INIT_RAM_0E => X"D56F5F541F679584D5943EF7345E577E43F88915854D057FFD5CF51F5CF10494",
            INIT_RAM_0F => X"F38915FA97E60D864914095C3F1895C071D552822BCA09B880BEC22D572537C5",
            INIT_RAM_10 => X"1271271202255543255554F39CE7DCD514937900014DCE1C86881AA3F7775F83",
            INIT_RAM_11 => X"9D4EF762C85C377A28D8DDCFDCFDCFCAC806FCC9339CB90340A2989CE2624924",
            INIT_RAM_12 => X"FAAAA8AAAAAAA88CC7777777D6A730A40778D9BBA76873FA873FECDD2E8D49C5",
            INIT_RAM_13 => X"5A6B093DCA76937A9C9C7B84DD955555F5D575525FD674957E6BFFCFFFFFFFFF",
            INIT_RAM_14 => X"E9C79485AC65487F74555B569B5281853AEEE44EF96D6D692FD19550D2FE2472",
            INIT_RAM_15 => X"3889575B247EF057F6965051295751C751053D72DEEEFE1A7E77FAF7B355FB84",
            INIT_RAM_16 => X"5547CB71EE137E692D52497D557675963D6B28574356927647D55CFD7FB7D750",
            INIT_RAM_17 => X"401441FF79797F6F8CB4F9590698A1044DFFBC7E1955878DACF78DC4A5DA7549",
            INIT_RAM_18 => X"41063094284949FD15B4B2AB6B5BBD8CA0E87107E9531D9D29077B59469EC141",
            INIT_RAM_19 => X"C4A73D6948FF5BEDB5D57EEDB74624C653CCBA4F0D0C7E7AFF5FF414CECE4240",
            INIT_RAM_1A => X"F3DF2C4D9FDB19319F49C75ABD69919392939A3862A37B55D543B6FE5F487708",
            INIT_RAM_1B => X"9986967A4F2DF15C1053EB5492F241FAC5157F209207EAA44247F06B7D206EF7",
            INIT_RAM_1C => X"E0388159B630154615B1765F3232B0495B7B6B4DB89449B645FE99943FB84B67",
            INIT_RAM_1D => X"9114954D2B09AA62AA76988766359971728E8B914A882A2E622A211504145CDD",
            INIT_RAM_1E => X"544D37649937BFF495617211112A560906573737373E267D274DF505DB7E2A61",
            INIT_RAM_1F => X"59D688A91A22223115141871918625445E6D8FB738F6669E79C965C1075D6DE4",
            INIT_RAM_20 => X"895251015A58B388B2B63E82B914DCE255DC24815C905DF7D5C3B91DD0E47286",
            INIT_RAM_21 => X"3D1D199550115655193069061918194655B195B6557655B7915143931897F54F",
            INIT_RAM_22 => X"7A5579A5925C6564D79A5925C6564D55470CCD045595413B73B95513D1D54CE5",
            INIT_RAM_23 => X"1344D9C4D941D6975279A5941D6975279A5969E4965A59279549756555269655",
            INIT_RAM_24 => X"626F216C575355555D54DE5597551855951D3D2993869261929D45753413C506",
            INIT_RAM_25 => X"FA07BB3FC4521986243274C929556FDB5159C6749EE7E9837BF8F65A792414B4",
            INIT_RAM_26 => X"B826545555B55379565D7615D955744118196278385DCFFF114DEFFC86D4B22C",
            INIT_RAM_27 => X"712A70E5D383A3EE8E867B0263A34A2BB4AB5C49DE5FEDCE1897315554F47527",
            INIT_RAM_28 => X"515C514A02A5CA59555779E05A49557550F0B2AE56820EEDC55C115465D491C8",
            INIT_RAM_29 => X"5955177DE6DA6348D42510539BE546CE0A52519586D60A37D9D094058697577D",
            INIT_RAM_2A => X"B48D0EBB9DDD472279412554CD5D0434F7D7645D665F79B6925D114050D4F3E7",
            INIT_RAM_2B => X"E0C3CEBD2AF3B3B3E4A9B52523406C97E0E4DBF96245F47549869BB927106DF8",
            INIT_RAM_2C => X"10E49504625972278453655B85EC3B03FA6D488D7842F25EDAFA3A1C4066D6DE",
            INIT_RAM_2D => X"963D18715994CD75B5973504E5EFFFCDB50495A9DD0995675D9D5CC95D22D98A",
            INIT_RAM_2E => X"D497DF4A7445119363F5DAE4664185CD3106879605393CA26B0221B31B218D81",
            INIT_RAM_2F => X"74CD751053933333333CE8BFFFB13490C4B46F5B19E67699D5770D584D25F581",
            INIT_RAM_30 => X"185D7791B309A5A97564118445E505925617DB2FFFFFE92195854AD461514642",
            INIT_RAM_31 => X"90A1A5865BE13B058505503D88E53E5D17DEC13D4D4E53812D051CF414164916",
            INIT_RAM_32 => X"F9A7729D46855A1DD54D749F5F34778F71595E894E61505762796744594CA75B",
            INIT_RAM_33 => X"527D69649E585527D55925D5789E119669E7E4975AFF7B7C5277277189E45856",
            INIT_RAM_34 => X"5D651A6DA4267544187154053B81559279A5445E6D69649E585527D69649E585",
            INIT_RAM_35 => X"FD4BD689D44F5B7F52497FD4BD69790A8AB445DE57DABB56F976AD57555540A6",
            INIT_RAM_36 => X"DF6BFDF1AB7643934472CB355F2487472D01E777F52495B59A4D05A9CD4409D7",
            INIT_RAM_37 => X"4C761B131345D133CD80D90CD11F231FE5F187BCB565087BCB565444471CEEF0",
            INIT_RAM_38 => X"604841F1604844D0E0484400F048DC0232827C4CF8C07CB36341A0F34C43BAF1",
            INIT_RAM_39 => X"71194C8B0009802238DC41F4059CF213F0CC5F60C633F7833C4F4931B0484921",
            INIT_RAM_3A => X"E12726C16D62116194FFD5F65609DE20841AE5A19A8465A11D1D75A6D5A52892",
            INIT_RAM_3B => X"AE50633950165FE7C175048AD8FEA5639EA2D1961416679D1015505DC4616483",
            INIT_RAM_3C => X"1F5D27C2657DAF5850EF25E0A656A3CE8E20627CFCBC7C1FB553979797951D50",
            INIT_RAM_3D => X"73DCB7281D6747D749F09957CB558E58E9BA5F3FB8DD0F421542C60DFA0A749D",
            INIT_RAM_3E => X"7EDC86C41103CAFEBEFFBFCAEFEB7A0F45BBFAF826537B2E5C650758FCF30993",
            INIT_RAM_3F => X"725DF300000000000057D7ABFD5954C49040728FFEB92D05534E8785015137BF"
        )
        port map (
            DO => prom_inst_0_DO_o,
            CLK => clk,
            OCE => oce,
            CE => ce,
            RESET => reset,
            AD => prom_inst_0_AD_i
        );

    prom_inst_1: pROM
        generic map (
            READ_MODE => '0',
            BIT_WIDTH => 2,
            RESET_MODE => "ASYNC",
            INIT_RAM_00 => X"03D83E00DEB42E00E9A809E08E82341CD086FE36F8F92F3EBF3CD3E46FA8C0C0",
            INIT_RAM_01 => X"890ACDAC5EB3DB7F3F694200004300D00C050CF67BB10043B6493A431643433E",
            INIT_RAM_02 => X"C3CF24C2F0C3F0DCC1C3F9C27CE0DF00001EDF3CF330BEF8BC8CF7CF42008383",
            INIT_RAM_03 => X"F8D324EF403B0CDFBEC514930B00830032C4804AC42CF6F3333034C3883403C7",
            INIT_RAM_04 => X"D0AAFBF80037457A74571D00C7054B2D807241CF2D81D72D0AD06D81D3CB51F4",
            INIT_RAM_05 => X"0ECF700403F60063FA3DF0C23EB0000363E7EFC136F663C2C60148BDCBE110EB",
            INIT_RAM_06 => X"9BC1780D1D65D1E1E74346DB67C25F6E0050030D20F0C0F0CCF1220BBC0330B8",
            INIT_RAM_07 => X"861911D8F50360C3030020F8C34004C4D3880DF1FE6D55F143FD63A65AB94DBA",
            INIT_RAM_08 => X"B50CC5CC0821FAD0A33633CC510139E813652DC2C0E38059F20C135131CBF75F",
            INIT_RAM_09 => X"23E06DF3CCC174600806D7A7E0D70000002465D07FD76B2333A37237387A84CD",
            INIT_RAM_0A => X"C21B74E5187A03E81B4551747BBA582F6037A0B60C702430CFBD3E8D763DB73F",
            INIT_RAM_0B => X"FF02079BE7F2833079B201806475445657755662245266B1859C8CF100423C10",
            INIT_RAM_0C => X"2C090C33EF4F7E8D763A3A31F0A0332CF37A35E3A3A31F0A030CFB37A35E0E80",
            INIT_RAM_0D => X"C0671DC0FCBC1E4F3EE24F30624361800024E4B8B8B8B80A13133FF1611E77F6",
            INIT_RAM_0E => X"3D6B06D637F17801D70FBB4D9A04D79FA006F70BC0CCC194447E4F8ADE572842",
            INIT_RAM_0F => X"09B70874F9B127A3F70CAF6600AF706E97E323031FAC0DD478FB031169178060",
            INIT_RAM_10 => X"4BC8BD03613800C3E3755A19E88E60A92C92FE4C4F520F26EE9EB6B958CCE6E0",
            INIT_RAM_11 => X"636968F8A026AF938E7EBFBABBABBA863E9C898DF0A4D605A0E2E837F33BC8BC",
            INIT_RAM_12 => X"A888898888888B965AAAAAAA344B1099EAA89888BB50EEA10EEA63E437E623E7",
            INIT_RAM_13 => X"B4E81E93EB9D919CA5E3F4D0D6C7E33F0FF39DF8F0FAFC5DC3E0AAAAAAAAAAAA",
            INIT_RAM_14 => X"C77C76AEB42B6AC80FFDB2DEB6F6E0AD9F613D2FC7C3D3E343288D926903DC39",
            INIT_RAM_15 => X"98F7093F0FD6CC19F702FC1FA3827F7F5FC1AB9BE363C385F5755535D11E34D0",
            INIT_RAM_16 => X"8CFC0DE3D34351CF90F4E3C1DC0EDCF493D82FDF65ECF1D3E137A40003383F5C",
            INIT_RAM_17 => X"2B80C40043C07BF56E564D70C15673110D5540C0B01D696EF02D267C3FDC1ED9",
            INIT_RAM_18 => X"FCE3AB84F817500C9E9E9EB2F2FFDB4F4F85D703A513FBCBE2819530D8C0F088",
            INIT_RAM_19 => X"6AF42CE3E30DEBE32D3C41330C7934CB33D0304361601D7FE0800338A386EAEC",
            INIT_RAM_1A => X"C06B3707F02FDAAFABA37AF8DBE0DAE9FBCAFAF3EE32F836F1FAD3E140EBEF8F",
            INIT_RAM_1B => X"7553F933A034B93F00180D8E3203430363750030B80C0F6CC2DF8232C3A1C5F1",
            INIT_RAM_1C => X"619D408FDCCCC36376501E265F57512C7CECECEA2CC401746420765751457738",
            INIT_RAM_1D => X"C311C777CC8CDFF8FBCF37F5FF8E38E313827CF003CE0DFB41FF681D000C247E",
            INIT_RAM_1E => X"3CE7667C432222CC30C3173333F71EA3007EEEEEEEEDF3034E99B71C71FDF748",
            INIT_RAM_1F => X"CB7347FF0DDFF7681D000C23F003FE1C7CF32AAEEAE7CEF9E36F9E431F7DE38F",
            INIT_RAM_20 => X"CC72CB05CF60FAE0E3C90063E63C807F1F805EDC10000FF3C13BC084F2021B81",
            INIT_RAM_21 => X"C3C3D0F401C1D0D583B817D10FDB8F23E03D9633E033D6CF30C32C090FF9F7F7",
            INIT_RAM_22 => X"171DA7BE7BE8E38E3977D77E4D34D3803C8F4F60743560E39E3E003CBCB567A8",
            INIT_RAM_23 => X"012C43E27FB38E38EDEF9EFA34D34E9DF5DFBFDCF1E1CF1FF8DB283D588F7FD8",
            INIT_RAM_24 => X"3FCC8B32F2E87A038EBEB358F2E0B8180DE3D3D0FB817E10FD8B872E50030003",
            INIT_RAM_25 => X"FE024DE2E0B18963FC092C4C43C33072C79F6FFBF6BF2F22222AE7E3CF5C0C22",
            INIT_RAM_26 => X"E23CF2E80E3AFACD63CB9B0343583E5BDA43583F3E05788B82C888986298F318",
            INIT_RAM_27 => X"E03F9C0A53D9E00D0B639D47CBD9AF3C40FC32E6723AAAAA0FFEE802D72F2D3F",
            INIT_RAM_28 => X"8B9C280FD3F485EC70D58E4A05F00D580404DAE956FFFACEE034C416380CD30C",
            INIT_RAM_29 => X"AF0EB2F73F77F6CDB67FA033EF9F2767A1D1780D4173D36C74B9326C3E32D90F",
            INIT_RAM_2A => X"F65BCF79F7CC0F117F7031D8D715C30FCFC971EB3E71FF5FF7E77DC1FDBA093F",
            INIT_RAM_2B => X"F62A2FA83F081BE93EFFAFE496CA35F93670A6E7D613E603743E349FC24BE300",
            INIT_RAM_2C => X"8B024E023FC5F5FDA2D1FD9D4E359EA903EBFA5B94E3D7E35E3E9D722E738E30",
            INIT_RAM_2D => X"B3C3C2AACFAC782C00F1E1BC67000000BE124C2CB6077E32E3CB654C7ADFD77E",
            INIT_RAM_2E => X"6E7F79CF2E2F08F7F99071172BE3BC789367A136AB8BB2AF8D47DC989DDC85C1",
            INIT_RAM_2F => X"90782D8BD189DD1DDDDC4BF11233234B0C4D3104DF3D2C74B52F0C47873E5EB0",
            INIT_RAM_30 => X"7BCB1C5C90079FC81BBE3811E07E337FD579A21D999997380D4234D2D0AB1E21",
            INIT_RAM_31 => X"884F8EEE37F0B84388018CDD7327DF66B17148CB234DEBEB97030262F8CDFF9D",
            INIT_RAM_32 => X"8032C84B00680176B5422D364628E1ACB82B482388C05AAD13FF52E22F66D2EC",
            INIT_RAM_33 => X"3CE3873C7FE0C30F382F8EB5A0381C3FF78DBF7AD016A598DB2F12D44FFE02D4",
            INIT_RAM_34 => X"BD7507FD743F90880ACBF4FF9F505977C73E4D30C3A7BE77E8E38D3B7FF7BECF",
            INIT_RAM_35 => X"37E83D34B63E4F60FBE7C37E83D39409AB58C4D71ED7E6FD89F6DBF900080B5E",
            INIT_RAM_36 => X"1D9F3233FC4951E455937CBEF03E3FCE13680CF60FBE5C4EF4E701034C82E4B4",
            INIT_RAM_37 => X"0033CF30010CC3830CC2EC8C280E0068730F4EC0DFA724EC0DFA78CCCFC85336",
            INIT_RAM_38 => X"10270CC032360808F336000EF32C402F3F330A2CDCF21F303B807CF03C236FF0",
            INIT_RAM_39 => X"FFBFC4C7C0CFDC0F3C476071C0C047230014EC000303F030CC0F0030500704F0",
            INIT_RAM_3A => X"00393D48CB033370C04007EF4EC4711ADC0BCFAB3BC2CEF0B3B3CF8C3BCC9E63",
            INIT_RAM_3B => X"D7F0299FE00384F500DD00E7388F9CF93B1B7BBBA00BEDE5380CD2302E3722FA",
            INIT_RAM_3C => X"F0F73FF13E13EA64E0FA0252F3767A2D25BA5320A0A0A098CE37DDDFDDDDB782",
            INIT_RAM_3D => X"1376DC9D3F3CFC3DCFFC4FBC0FF3A7745DF77823E5334DFA2EE18FC88FE7FEF3",
            INIT_RAM_3E => X"AAA862CC00524711C0892247311C772FEFC4F70213E2223221C7D03668A29332",
            INIT_RAM_3F => X"97AA880000000000008C3DF83FE9E44EE121C9400DFC5A20717FA3C200932222"
        )
        port map (
            DO => prom_inst_1_DO_o,
            CLK => clk,
            OCE => oce,
            CE => ce,
            RESET => reset,
            AD => prom_inst_1_AD_i
        );

    prom_inst_2: pROM
        generic map (
            READ_MODE => '0',
            BIT_WIDTH => 2,
            RESET_MODE => "ASYNC",
            INIT_RAM_00 => X"93FA7BA4EFBE0739BFF592C158C1435170E9E025F2EAD596710023C41584C04F",
            INIT_RAM_01 => X"43BDDC102CE7CE3702AE2BB91144FFBFEC45100E2EEF11473E9A953916ABE92F",
            INIT_RAM_02 => X"59248E8EE7E662FCA4EBF3F8FEFFB7218A4FB71D7B625DF2B8E73304EF0026B3",
            INIT_RAM_03 => X"238E3300088320D3016AAA3A33B86A8E9DE62A742230820838829EC926920933",
            INIT_RAM_04 => X"0AB577DC08CA0A01A0A0305304C5CC30A6A7610030A100302422A1F1310C0933",
            INIT_RAM_05 => X"4D34332F934322D21751408920508B93D204C0B9B7CF90B4008C6200A0106020",
            INIT_RAM_06 => X"EB88022E308F8B930E2BBD8B2B88CE30BB96EDDA85B125B10286D98422440842",
            INIT_RAM_07 => X"A03336C8F08B09A0930009BCA7EEECC436A1A6D23D4800D2867E4BE82DF3D8B2",
            INIT_RAM_08 => X"08AEF8D01489320694814E8C83A9B3CD000882B8812BF9A379660829995BF922",
            INIT_RAM_09 => X"04C8333E80B89C0A5E4904BA39892000000702D080DB782C392BC6B8D2A9D118",
            INIT_RAM_0A => X"0F645CD2A2A393D0DF70BDB6F333BE723933F6B0E69D29968DAC8FA69C2CE32F",
            INIT_RAM_0B => X"D48B93084DE726E930818861022113221013013040404758C2D5D01100892016",
            INIT_RAM_0C => X"2B4A65A36B22BFA69CE73C9A6BC19A68D83E9A4E73C9A6BC1968DA83E9A424E4",
            INIT_RAM_0D => X"008B82B8A800AAA8041141451144142EEECB4CF8F8F8F3FC889902AEEEAAEE02",
            INIT_RAM_0E => X"309883088030C03822EC7310AD830A3736A2C221C380B83EEEB9136228C8D419",
            INIT_RAM_0F => X"524210C8F3334023C22DC00F6A3C22DDC008BC2BAC9CBCC808F363A88F3DEED8",
            INIT_RAM_10 => X"9009025852C24EC57BBC6D92C19AC19030D37C004415680FA8EF23B382EECCF5",
            INIT_RAM_11 => X"0420F10BC00722130F4C891311311305A521120A4BC70013CBCFDF6FBC100100",
            INIT_RAM_12 => X"222223222222203001111111A991883211101322100344C0344C5A84F6CF0C00",
            INIT_RAM_13 => X"238CAF440B38CA3BCDCB6AE380ABCB9F9DB9027FD9BE6C66EBFE221222222222",
            INIT_RAM_14 => X"8334B91033809108675D3D9FFCBE960233B99A97CCF6F2FFE13430F4FEAB088E",
            INIT_RAM_15 => X"A402134FA7594B53A2AC4BBD482C0DFE3DBA48030B4B4B6220A00220CAACAAE3",
            INIT_RAM_16 => X"26F64E40AB8E02CB513EFF66E5E6ECFFC48CAF5D522C71C3D04B395526CE7411",
            INIT_RAM_17 => X"AFF380AA1757EA70B38AAE2D88210E023800AAA5EDAEFCB03320E8F43D8AA4FA",
            INIT_RAM_18 => X"0A23D4E23728269BBFCEA7D0E0C9B375692BFF09C4AD7E837C1B336E05258408",
            INIT_RAM_19 => X"A7FA36FFFF9AFE73D9BEA99BD900812EAA9AEFA414D9DEFF712F9C8DEB261222",
            INIT_RAM_1A => X"48D11728FA9948659D369580B300C9C9C8D8C05967F0DC984A4DE37129FDF8CF",
            INIT_RAM_1B => X"667E111339334F11088E4C3FFF93E093384AC9327A824E230911C190E7F90DD6",
            INIT_RAM_1C => X"F62C220F03BBBB90C0303F8E3232301AB1313138F33ECECFFECC4CCDDECDDCF4",
            INIT_RAM_1D => X"DE005B5FD88FFB9BFE7DF66BF27DF7DF3A2F65A263D98FB2AABEAE6204088CF8",
            INIT_RAM_1E => X"FBC048AC9044487EFBEF3AAAAAA96E4000F4C4C4C4CAB6AFBE521FBEFBEAB688",
            INIT_RAM_1F => X"8FF3AAFA8E8ABABE62040C8BEE637C3CFFFFD444C3CBC9B6E6DB6CDC70012FBE",
            INIT_RAM_20 => X"CAB41CA00044D8FEEBE3592BC041A2B16EA340DA401014F7C40BEACD46FF3A62",
            INIT_RAM_21 => X"D2D6ECFD24662421503888D88FED50D4010ED003C103D0BEFFFF73FC8DF3BFEE",
            INIT_RAM_22 => X"3AAE114555475D75D114555475D75D1260DDDC39C90862EE3EFC198D2D690FB3",
            INIT_RAM_23 => X"2370D4E8FF3FFFFFCCF3DF73FFFFFCCF3DF7279F3CC8E39D7202A6512201B6E2",
            INIT_RAM_24 => X"37DC50508609D116416F6844F60BC8A252E2E6ECF3888E88FED8186010160103",
            INIT_RAM_25 => X"FF026628950015A37F0104CD151451D7102F0BC2F4BD2FD44483CBC3E79C02F6",
            INIT_RAM_26 => X"E9D147045905BDA113D83304D44150D2421446BC8F8E8A225411112005D0FFEC",
            INIT_RAM_27 => X"802F3D5CEACAD6563F3B0F342AEAAB8C22BD0700D41111308DF44615134B59D3",
            INIT_RAM_28 => X"5C584CAF8AFA222AB5201CCB223A52018D92CAD026B7EFACC2EC06A1B0720A2E",
            INIT_RAM_29 => X"1451C61D75D34CC33D514228EE0C6B6B9608D65288D7C8CFF4150A53714633BC",
            INIT_RAM_2A => X"72332B52DDA5F801FF612AE77F8D878B4BC3341851075D35D50DD7498C628AFD",
            INIT_RAM_2B => X"B1752B55AFB55ADAB2BF9BA88CE577F372B6A8831154A95C7171462FA61CE694",
            INIT_RAM_2C => X"5CFF400037E72476170A760F707CAED367E6E8333717DFC7D0ACAD427173EE65",
            INIT_RAM_2D => X"C3E6CF251470F6610D43DB40D0BBAABB511561041C0D60A054818CCAB8998322",
            INIT_RAM_2E => X"4160D34D05F2270D1B3CD32F351060F6542BD50D545061C31F232CD80F2CCCDD",
            INIT_RAM_2F => X"38F662642350BB3BBBB8D10BBA6E032438D5531F2F7505841461840B0D3CCFE2",
            INIT_RAM_30 => X"461834BCD00D43A69051051C1141059651439416222205765288FBBF221C4140",
            INIT_RAM_31 => X"501C50DAA2C2592A40063DB82ED0BFCDC370C0E69083489454022ACDC4565971",
            INIT_RAM_32 => X"052054416C71260D884CE02EDCA52C71CC582036A9828B512745104F988CC054",
            INIT_RAM_33 => X"D34D114551475D74D1140181012A3C22499B2496040E233B8A0490609D251521",
            INIT_RAM_34 => X"C838237838373194960BD2F4AC2A4010451434D34D010451434D34D010451434",
            INIT_RAM_35 => X"69FE764C35D3D479D1D9269FE764390446938483A68348A8C420E2A31AA08821",
            INIT_RAM_36 => X"48002560ABAB8AAEB81B6E00F93FF6F835488A439D1DA280F9001AD6C22F6C3A",
            INIT_RAM_37 => X"B09B3F3AB0B0C3E38A4B6EEE2E26E081399DB2E4E7F95A2E4E7F92AAA9E80241",
            INIT_RAM_38 => X"2BB3823C8BB3841CC9B30E9FCD932BCF148D87B0C0DF83839FFC04D0B4F037D0",
            INIT_RAM_39 => X"D050CCEA707657AE3A8BB0B2C2C808BB6C22FE2C3B0BF890CC3382900EB382F8",
            INIT_RAM_3A => X"01733CC0F69BAA79E8EAAB632708F32D401F53F5C3E970F2505043FF63FCBC83",
            INIT_RAM_3B => X"E1402735140339FFD47004C18D9F0617E845058B540B63CF8D47031A369024E4",
            INIT_RAM_3C => X"D9D93D423CE7F9CE34F930F4F140067C203243E4E4E4E4F960C1515252535C3B",
            INIT_RAM_3D => X"090F414CD87436764F508F364E58ED42CCD94927D4EE24077BB02FC89FF361D0",
            INIT_RAM_3E => X"1130054003040B82E510440B992ECB9508663BA623C4481403CF680DE4918EE2",
            INIT_RAM_3F => X"378CC600000000000026768E69FE49380033CB2AAEFE0906B3BF90C9403B4448"
        )
        port map (
            DO => prom_inst_2_DO_o,
            CLK => clk,
            OCE => oce,
            CE => ce,
            RESET => reset,
            AD => prom_inst_2_AD_i
        );

    prom_inst_3: pROM
        generic map (
            READ_MODE => '0',
            BIT_WIDTH => 2,
            RESET_MODE => "ASYNC",
            INIT_RAM_00 => X"F033D13C130C33FF13F00E7153C054553C0CC544FF33C51430CF3FC7050BC343",
            INIT_RAM_01 => X"4F24CCEC0370470321554555000000000400015540010003CCF510210CCCC0C4",
            INIT_RAM_02 => X"51450C12087E00843C33CC030C32D30003C2D31C73E1CF40B10003CFC9003E00",
            INIT_RAM_03 => X"C41003C720B82E301C4300C00C00403C00000002C02C31CB20B2100180184180",
            INIT_RAM_04 => X"CCF33D0F0071CCB01CCB3CC1CBCFCB1C808802CF1CC2CB1C82C03D32F3C73300",
            INIT_RAM_05 => X"C2FB300FF0B300F3C1EF40033C0003F0F3FC07330C0FFB307300CF1CC1C030F1",
            INIT_RAM_06 => X"F9001FFF1FF811B1F04FDC6009030C47110044C03001F001C433C003CC07103F",
            INIT_RAM_07 => X"07ECF0C0B003FF83F0003F8DFF044408300FFF73DC36AA7001DFFCCF379CC600",
            INIT_RAM_08 => X"CC06FC41033F02FD47D47B8CF303037CC7F9EF3072D4CFFC0CFFC3F11343D73C",
            INIT_RAM_09 => X"383F3C0B8033CF3037F2FC184F9C8000003CF378C074D404B40740340FDCC2C9",
            INIT_RAM_0A => X"3CCBCFF13084F0FFF0CCFF4DCCCFF7D44F04C03FFFFC0831C774C33FFF78707F",
            INIT_RAM_0B => X"1B01F0CF70C8FEBF0CF00000223330201012022155574DD373464303C0033C54",
            INIT_RAM_0C => X"DF020C71DD31533FFFBC77FFF24C371C7CCCFFFBC77FFF24C31C77CCCFFF0F7C",
            INIT_RAM_0D => X"C0F9EF300054155505500155500555C44470F39393939EA71111000555155540",
            INIT_RAM_0E => X"3FCDF2FC02DCFF0EFCC4C03C27F0FDC0F000800C3EC033E447FB3DF0F703C00E",
            INIT_RAM_0F => X"0E000F8C7C0F0302C00C03F300E400C34F7DD807F50000CD011D0BF3F5BB447F",
            INIT_RAM_10 => X"42CC2C00000FFFC343FFFC3E73DFB3CCE38E3333335545B9C10DC43C9CCCF030",
            INIT_RAM_11 => X"030490C2443D3EF4DDD0F8CCCCCCCCC1503CCCC1427C0F0E40C0CC780002C02C",
            INIT_RAM_12 => X"03333233333333201333333310230033033021110D303333033355BE0C39C74D",
            INIT_RAM_13 => X"C4100DCF73E102E0303DD440680DFFF7F77F3FCC7F8CDEFFF133000000000000",
            INIT_RAM_14 => X"4B9C7F1F00CBF1C7DDDFCDF30DCCCF1FC091103007373730C1DF1F732F01001F",
            INIT_RAM_15 => X"20000CC01DD8633D980CF337CFFCB75DB733C3D9616161F2D3DAA2D802FFD440",
            INIT_RAM_16 => X"FFDFC1CB5101A1C732CC31FFFFDDDC7E0F100DDDF3DC71D1FCFFDC03FEB7DDF0",
            INIT_RAM_17 => X"F0BEC000C1C2E1D4D7D087CC00340B0006A8C2C04CFFC8D7001D0B5F37601F33",
            INIT_RAM_18 => X"C803408030C3C8F833132423F3C78F2D0101C700F303478F4322E3CC5300B300",
            INIT_RAM_19 => X"00FC1F3131F9313CDFCCF11CDF5515455158554555C3F7DD3C40FCBCC1C001D2",
            INIT_RAM_1A => X"C0CB0408700750050F0795CB4F2CC0C0C0C0CB514413CFFCBFC0F03CCF311C1D",
            INIT_RAM_1B => X"22321C30DF07B7EC0037C1F30CF0C3F00CFCBF00CC0FC043C33CF123FCC0CCB2",
            INIT_RAM_1C => X"30E400C72D111FFC7F30133B30303003F1D1D1DF300032123103233103201300",
            INIT_RAM_1D => X"FB003FC71000C120D01C7441D01C71C730094400C3430E10321C332F0000307B",
            INIT_RAM_1E => X"71C7331C0B33331C71C730BBBB00FC0701733333333510C71F0CC71C71E510D0",
            INIT_RAM_1F => X"107008701E221C032F00001040431F5D71C7C3333031DC71F7871F831CF2C71C",
            INIT_RAM_20 => X"23F2C705557030DC434F0003431C4090FC002C003C000FF3C3C3EA4CF0A93C03",
            INIT_RAM_21 => X"0707007FF3F2F2FFC3C00B000B030BC2FFB03FB1FFB1FF1C71C71EA40C7D9744",
            INIT_RAM_22 => X"30FFC71C71F1C71C7C71C71F1C71C7FF3C0B8B0CBCBFC002E033FC30707FF80F",
            INIT_RAM_23 => X"032CCF3387C71C71F1C71C7C71C71F1C71C7C71C71F1C71C7F57F32FFF1C71FF",
            INIT_RAM_24 => X"31CBCF1C31C03FF7EF737CFC71FC303F0F0707007C00B000B007CB1F2002C000",
            INIT_RAM_25 => X"3D004593BCF057031C3D3F2C73C71C71C7C761D8761D87C3333031F5C71C0090",
            INIT_RAM_26 => X"171CF2FFDFBDCDF3F1C7C0FCCFFF3C30C00FF2B30DCF64CEF3CCCCCC157E0FF7",
            INIT_RAM_27 => X"C0CDEC07B0C2700F0707C000C0C203040034F3C3954CCCCC0C733FF0FC1C1F3F",
            INIT_RAM_28 => X"C7F037CD00DF02C3F1FDC381F2C01FDFFC0080C0FC1400033FB0003F3F3C0B0A",
            INIT_RAM_29 => X"CF1CF1C71C71F3F4FC3F0000D5350F49C1C03F0F0070023C78FC7C1F2C32FEC7",
            INIT_RAM_2A => X"204F030E47B7ED0BD7C88FF007CF001C1FCC01CF1C31C71C73F871F0307C821D",
            INIT_RAM_2B => X"003003000D3000C21034DCCD13D3007C0090D74D47CBBFCBC02C30E4C2C73702",
            INIT_RAM_2C => X"07A92F0331F1D31D01C21FC00F0027CE0137334FE0F001F00B0C24701F0B7370",
            INIT_RAM_2D => X"300701F0C70CC01C3C73030CC31100110C033C34FB032FE3C3CFF8E3FF114D47",
            INIT_RAM_2E => X"2F2C71E33F0C0CB3C1EC733C03C30CC0CB0F7CFCC3C71C33C0033003C03030C0",
            INIT_RAM_2F => X"ECC01FF0F35511311118C3B1132B0000EC051EF2CB1E3C7CFF1C008DC71F9308",
            INIT_RAM_30 => X"70C71CF007031CC20B3C3C30FF3C0071FC7EC304CCCCCB0F0F03C0B0C0CF1D50",
            INIT_RAM_31 => X"540B0F8FBA4F3C0B0013FC1804431CF8F31CC007CFC0C00FCB20007CB001C73C",
            INIT_RAM_32 => X"70D3C74F08DFF1CCFFFBF57BFB33F99643C7F5075DC0F01D31C7E3F9CBF013CF",
            INIT_RAM_33 => X"71C7C71C71F1C71C7FCF1CFFD775E771C7DE1C73F1CFF3EEC13C13D8C71FF0FC",
            INIT_RAM_34 => X"360FF2D60F2DEFC001C2709C2400FC71C71F1C71C7C71C71F1C71C7C71C71F1C",
            INIT_RAM_35 => X"E733DC74F4EDFBDF71F0FE733DC7E003330EC060FF60BF00B0D82C0CFFFFC32C",
            INIT_RAM_36 => X"515545400155515555F0C01F7F031DEC0143DFBDF71F0F1C71C700F7800904FF",
            INIT_RAM_37 => X"BFC9BCCEF8BFCB6CBE3F267726F22CB38FF72F3C1CCF02F3C1CCFEEEECCC5455",
            INIT_RAM_38 => X"0D90B20C8C91A3CFC48327CFC0832C4CC084B092C245A08B8F0C0208B34C03CC",
            INIT_RAM_39 => X"CBC372FD303133A2BBC9BCB232CBC8DFAE23FC22398FF08CEF3192CC3FB0B24C",
            INIT_RAM_3A => X"404E1CC037C0BBC000C03F0C01DC73770C040CCCB4032D00CBCF0CC37CC030F1",
            INIT_RAM_3B => X"F43030E0D404FFCCCF3F01007CFC03C2BC0C7CFC15043D330CF2F10803032111",
            INIT_RAM_3C => X"7F771C371FFCCFFC33FF0333FC7C03DC087087FC7C7C7C7F1FD51D1D1D1FCFF1",
            INIT_RAM_3D => X"00FC1F000F40DFDDC70DC7DFC1CFC87000CC7F3F0BBB03C31DD0034CFC003D03",
            INIT_RAM_3E => X"CCCC152C0B03AD1340CE33BD1134CDC0C3444D0071F3330571C73078BCF0BBB3",
            INIT_RAM_3F => X"C0FFC3000000000000FFDE23E733FC6C0010C20007480C03FC933B0140F03333"
        )
        port map (
            DO => prom_inst_3_DO_o,
            CLK => clk,
            OCE => oce,
            CE => ce,
            RESET => reset,
            AD => prom_inst_3_AD_i
        );

end Behavioral; --Gowin_pROM
