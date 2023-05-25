--Copyright (C)2014-2022 Gowin Semiconductor Corporation.
--All rights reserved.
--File Title: IP file
--GOWIN Version: V1.9.8.05
--Part Number: GW1NR-LV9QN88C6/I5
--Device: GW1NR-9C
--Created Time: Tue May  9 18:44:56 2023

library IEEE;
use IEEE.std_logic_1164.all;

entity Gowin_DPB is
    port (
        douta: out std_logic_vector(7 downto 0);
        doutb: out std_logic_vector(7 downto 0);
        clka: in std_logic;
        ocea: in std_logic;
        cea: in std_logic;
        reseta: in std_logic;
        wrea: in std_logic;
        clkb: in std_logic;
        oceb: in std_logic;
        ceb: in std_logic;
        resetb: in std_logic;
        wreb: in std_logic;
        ada: in std_logic_vector(13 downto 0);
        dina: in std_logic_vector(7 downto 0);
        adb: in std_logic_vector(13 downto 0);
        dinb: in std_logic_vector(7 downto 0)
    );
end Gowin_DPB;

architecture Behavioral of Gowin_DPB is

    signal dpb_inst_0_douta_w: std_logic_vector(14 downto 0);
    signal dpb_inst_0_doutb_w: std_logic_vector(14 downto 0);
    signal dpb_inst_1_douta_w: std_logic_vector(14 downto 0);
    signal dpb_inst_1_doutb_w: std_logic_vector(14 downto 0);
    signal dpb_inst_2_douta_w: std_logic_vector(14 downto 0);
    signal dpb_inst_2_doutb_w: std_logic_vector(14 downto 0);
    signal dpb_inst_3_douta_w: std_logic_vector(14 downto 0);
    signal dpb_inst_3_doutb_w: std_logic_vector(14 downto 0);
    signal dpb_inst_4_douta_w: std_logic_vector(14 downto 0);
    signal dpb_inst_4_doutb_w: std_logic_vector(14 downto 0);
    signal dpb_inst_5_douta_w: std_logic_vector(14 downto 0);
    signal dpb_inst_5_doutb_w: std_logic_vector(14 downto 0);
    signal dpb_inst_6_douta_w: std_logic_vector(14 downto 0);
    signal dpb_inst_6_doutb_w: std_logic_vector(14 downto 0);
    signal dpb_inst_7_douta_w: std_logic_vector(14 downto 0);
    signal dpb_inst_7_doutb_w: std_logic_vector(14 downto 0);
    signal gw_gnd: std_logic;
    signal dpb_inst_0_BLKSELA_i: std_logic_vector(2 downto 0);
    signal dpb_inst_0_BLKSELB_i: std_logic_vector(2 downto 0);
    signal dpb_inst_0_DIA_i: std_logic_vector(15 downto 0);
    signal dpb_inst_0_DIB_i: std_logic_vector(15 downto 0);
    signal dpb_inst_0_DOA_o: std_logic_vector(15 downto 0);
    signal dpb_inst_0_DOB_o: std_logic_vector(15 downto 0);
    signal dpb_inst_1_BLKSELA_i: std_logic_vector(2 downto 0);
    signal dpb_inst_1_BLKSELB_i: std_logic_vector(2 downto 0);
    signal dpb_inst_1_DIA_i: std_logic_vector(15 downto 0);
    signal dpb_inst_1_DIB_i: std_logic_vector(15 downto 0);
    signal dpb_inst_1_DOA_o: std_logic_vector(15 downto 0);
    signal dpb_inst_1_DOB_o: std_logic_vector(15 downto 0);
    signal dpb_inst_2_BLKSELA_i: std_logic_vector(2 downto 0);
    signal dpb_inst_2_BLKSELB_i: std_logic_vector(2 downto 0);
    signal dpb_inst_2_DIA_i: std_logic_vector(15 downto 0);
    signal dpb_inst_2_DIB_i: std_logic_vector(15 downto 0);
    signal dpb_inst_2_DOA_o: std_logic_vector(15 downto 0);
    signal dpb_inst_2_DOB_o: std_logic_vector(15 downto 0);
    signal dpb_inst_3_BLKSELA_i: std_logic_vector(2 downto 0);
    signal dpb_inst_3_BLKSELB_i: std_logic_vector(2 downto 0);
    signal dpb_inst_3_DIA_i: std_logic_vector(15 downto 0);
    signal dpb_inst_3_DIB_i: std_logic_vector(15 downto 0);
    signal dpb_inst_3_DOA_o: std_logic_vector(15 downto 0);
    signal dpb_inst_3_DOB_o: std_logic_vector(15 downto 0);
    signal dpb_inst_4_BLKSELA_i: std_logic_vector(2 downto 0);
    signal dpb_inst_4_BLKSELB_i: std_logic_vector(2 downto 0);
    signal dpb_inst_4_DIA_i: std_logic_vector(15 downto 0);
    signal dpb_inst_4_DIB_i: std_logic_vector(15 downto 0);
    signal dpb_inst_4_DOA_o: std_logic_vector(15 downto 0);
    signal dpb_inst_4_DOB_o: std_logic_vector(15 downto 0);
    signal dpb_inst_5_BLKSELA_i: std_logic_vector(2 downto 0);
    signal dpb_inst_5_BLKSELB_i: std_logic_vector(2 downto 0);
    signal dpb_inst_5_DIA_i: std_logic_vector(15 downto 0);
    signal dpb_inst_5_DIB_i: std_logic_vector(15 downto 0);
    signal dpb_inst_5_DOA_o: std_logic_vector(15 downto 0);
    signal dpb_inst_5_DOB_o: std_logic_vector(15 downto 0);
    signal dpb_inst_6_BLKSELA_i: std_logic_vector(2 downto 0);
    signal dpb_inst_6_BLKSELB_i: std_logic_vector(2 downto 0);
    signal dpb_inst_6_DIA_i: std_logic_vector(15 downto 0);
    signal dpb_inst_6_DIB_i: std_logic_vector(15 downto 0);
    signal dpb_inst_6_DOA_o: std_logic_vector(15 downto 0);
    signal dpb_inst_6_DOB_o: std_logic_vector(15 downto 0);
    signal dpb_inst_7_BLKSELA_i: std_logic_vector(2 downto 0);
    signal dpb_inst_7_BLKSELB_i: std_logic_vector(2 downto 0);
    signal dpb_inst_7_DIA_i: std_logic_vector(15 downto 0);
    signal dpb_inst_7_DIB_i: std_logic_vector(15 downto 0);
    signal dpb_inst_7_DOA_o: std_logic_vector(15 downto 0);
    signal dpb_inst_7_DOB_o: std_logic_vector(15 downto 0);

    --component declaration
    component DPB
        generic (
            READ_MODE0: in bit := '0';
            READ_MODE1: in bit := '0';
            WRITE_MODE0: in bit_vector := "00";
            WRITE_MODE1: in bit_vector := "00";
            BIT_WIDTH_0: in integer :=16;
            BIT_WIDTH_1: in integer :=16;
            BLK_SEL_0: in bit_vector := "000";
            BLK_SEL_1: in bit_vector := "000";
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
            DOA: out std_logic_vector(15 downto 0);
            DOB: out std_logic_vector(15 downto 0);
            CLKA: in std_logic;
            OCEA: in std_logic;
            CEA: in std_logic;
            RESETA: in std_logic;
            WREA: in std_logic;
            CLKB: in std_logic;
            OCEB: in std_logic;
            CEB: in std_logic;
            RESETB: in std_logic;
            WREB: in std_logic;
            BLKSELA: in std_logic_vector(2 downto 0);
            BLKSELB: in std_logic_vector(2 downto 0);
            ADA: in std_logic_vector(13 downto 0);
            DIA: in std_logic_vector(15 downto 0);
            ADB: in std_logic_vector(13 downto 0);
            DIB: in std_logic_vector(15 downto 0)
        );
    end component;

begin
    gw_gnd <= '0';

    dpb_inst_0_BLKSELA_i <= gw_gnd & gw_gnd & gw_gnd;
    dpb_inst_0_BLKSELB_i <= gw_gnd & gw_gnd & gw_gnd;
    dpb_inst_0_DIA_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dina(0);
    dpb_inst_0_DIB_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dinb(0);
    douta(0) <= dpb_inst_0_DOA_o(0);
    dpb_inst_0_douta_w(14 downto 0) <= dpb_inst_0_DOA_o(15 downto 1) ;
    doutb(0) <= dpb_inst_0_DOB_o(0);
    dpb_inst_0_doutb_w(14 downto 0) <= dpb_inst_0_DOB_o(15 downto 1) ;
    dpb_inst_1_BLKSELA_i <= gw_gnd & gw_gnd & gw_gnd;
    dpb_inst_1_BLKSELB_i <= gw_gnd & gw_gnd & gw_gnd;
    dpb_inst_1_DIA_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dina(1);
    dpb_inst_1_DIB_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dinb(1);
    douta(1) <= dpb_inst_1_DOA_o(0);
    dpb_inst_1_douta_w(14 downto 0) <= dpb_inst_1_DOA_o(15 downto 1) ;
    doutb(1) <= dpb_inst_1_DOB_o(0);
    dpb_inst_1_doutb_w(14 downto 0) <= dpb_inst_1_DOB_o(15 downto 1) ;
    dpb_inst_2_BLKSELA_i <= gw_gnd & gw_gnd & gw_gnd;
    dpb_inst_2_BLKSELB_i <= gw_gnd & gw_gnd & gw_gnd;
    dpb_inst_2_DIA_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dina(2);
    dpb_inst_2_DIB_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dinb(2);
    douta(2) <= dpb_inst_2_DOA_o(0);
    dpb_inst_2_douta_w(14 downto 0) <= dpb_inst_2_DOA_o(15 downto 1) ;
    doutb(2) <= dpb_inst_2_DOB_o(0);
    dpb_inst_2_doutb_w(14 downto 0) <= dpb_inst_2_DOB_o(15 downto 1) ;
    dpb_inst_3_BLKSELA_i <= gw_gnd & gw_gnd & gw_gnd;
    dpb_inst_3_BLKSELB_i <= gw_gnd & gw_gnd & gw_gnd;
    dpb_inst_3_DIA_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dina(3);
    dpb_inst_3_DIB_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dinb(3);
    douta(3) <= dpb_inst_3_DOA_o(0);
    dpb_inst_3_douta_w(14 downto 0) <= dpb_inst_3_DOA_o(15 downto 1) ;
    doutb(3) <= dpb_inst_3_DOB_o(0);
    dpb_inst_3_doutb_w(14 downto 0) <= dpb_inst_3_DOB_o(15 downto 1) ;
    dpb_inst_4_BLKSELA_i <= gw_gnd & gw_gnd & gw_gnd;
    dpb_inst_4_BLKSELB_i <= gw_gnd & gw_gnd & gw_gnd;
    dpb_inst_4_DIA_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dina(4);
    dpb_inst_4_DIB_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dinb(4);
    douta(4) <= dpb_inst_4_DOA_o(0);
    dpb_inst_4_douta_w(14 downto 0) <= dpb_inst_4_DOA_o(15 downto 1) ;
    doutb(4) <= dpb_inst_4_DOB_o(0);
    dpb_inst_4_doutb_w(14 downto 0) <= dpb_inst_4_DOB_o(15 downto 1) ;
    dpb_inst_5_BLKSELA_i <= gw_gnd & gw_gnd & gw_gnd;
    dpb_inst_5_BLKSELB_i <= gw_gnd & gw_gnd & gw_gnd;
    dpb_inst_5_DIA_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dina(5);
    dpb_inst_5_DIB_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dinb(5);
    douta(5) <= dpb_inst_5_DOA_o(0);
    dpb_inst_5_douta_w(14 downto 0) <= dpb_inst_5_DOA_o(15 downto 1) ;
    doutb(5) <= dpb_inst_5_DOB_o(0);
    dpb_inst_5_doutb_w(14 downto 0) <= dpb_inst_5_DOB_o(15 downto 1) ;
    dpb_inst_6_BLKSELA_i <= gw_gnd & gw_gnd & gw_gnd;
    dpb_inst_6_BLKSELB_i <= gw_gnd & gw_gnd & gw_gnd;
    dpb_inst_6_DIA_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dina(6);
    dpb_inst_6_DIB_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dinb(6);
    douta(6) <= dpb_inst_6_DOA_o(0);
    dpb_inst_6_douta_w(14 downto 0) <= dpb_inst_6_DOA_o(15 downto 1) ;
    doutb(6) <= dpb_inst_6_DOB_o(0);
    dpb_inst_6_doutb_w(14 downto 0) <= dpb_inst_6_DOB_o(15 downto 1) ;
    dpb_inst_7_BLKSELA_i <= gw_gnd & gw_gnd & gw_gnd;
    dpb_inst_7_BLKSELB_i <= gw_gnd & gw_gnd & gw_gnd;
    dpb_inst_7_DIA_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dina(7);
    dpb_inst_7_DIB_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dinb(7);
    douta(7) <= dpb_inst_7_DOA_o(0);
    dpb_inst_7_douta_w(14 downto 0) <= dpb_inst_7_DOA_o(15 downto 1) ;
    doutb(7) <= dpb_inst_7_DOB_o(0);
    dpb_inst_7_doutb_w(14 downto 0) <= dpb_inst_7_DOB_o(15 downto 1) ;

    dpb_inst_0: DPB
        generic map (
            READ_MODE0 => '0',
            READ_MODE1 => '0',
            WRITE_MODE0 => "00",
            WRITE_MODE1 => "00",
            BIT_WIDTH_0 => 1,
            BIT_WIDTH_1 => 1,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "000",
            BLK_SEL_1 => "000"
        )
        port map (
            DOA => dpb_inst_0_DOA_o,
            DOB => dpb_inst_0_DOB_o,
            CLKA => clka,
            OCEA => ocea,
            CEA => cea,
            RESETA => reseta,
            WREA => wrea,
            CLKB => clkb,
            OCEB => oceb,
            CEB => ceb,
            RESETB => resetb,
            WREB => wreb,
            BLKSELA => dpb_inst_0_BLKSELA_i,
            BLKSELB => dpb_inst_0_BLKSELB_i,
            ADA => ada(13 downto 0),
            DIA => dpb_inst_0_DIA_i,
            ADB => adb(13 downto 0),
            DIB => dpb_inst_0_DIB_i
        );

    dpb_inst_1: DPB
        generic map (
            READ_MODE0 => '0',
            READ_MODE1 => '0',
            WRITE_MODE0 => "00",
            WRITE_MODE1 => "00",
            BIT_WIDTH_0 => 1,
            BIT_WIDTH_1 => 1,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "000",
            BLK_SEL_1 => "000"
        )
        port map (
            DOA => dpb_inst_1_DOA_o,
            DOB => dpb_inst_1_DOB_o,
            CLKA => clka,
            OCEA => ocea,
            CEA => cea,
            RESETA => reseta,
            WREA => wrea,
            CLKB => clkb,
            OCEB => oceb,
            CEB => ceb,
            RESETB => resetb,
            WREB => wreb,
            BLKSELA => dpb_inst_1_BLKSELA_i,
            BLKSELB => dpb_inst_1_BLKSELB_i,
            ADA => ada(13 downto 0),
            DIA => dpb_inst_1_DIA_i,
            ADB => adb(13 downto 0),
            DIB => dpb_inst_1_DIB_i
        );

    dpb_inst_2: DPB
        generic map (
            READ_MODE0 => '0',
            READ_MODE1 => '0',
            WRITE_MODE0 => "00",
            WRITE_MODE1 => "00",
            BIT_WIDTH_0 => 1,
            BIT_WIDTH_1 => 1,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "000",
            BLK_SEL_1 => "000"
        )
        port map (
            DOA => dpb_inst_2_DOA_o,
            DOB => dpb_inst_2_DOB_o,
            CLKA => clka,
            OCEA => ocea,
            CEA => cea,
            RESETA => reseta,
            WREA => wrea,
            CLKB => clkb,
            OCEB => oceb,
            CEB => ceb,
            RESETB => resetb,
            WREB => wreb,
            BLKSELA => dpb_inst_2_BLKSELA_i,
            BLKSELB => dpb_inst_2_BLKSELB_i,
            ADA => ada(13 downto 0),
            DIA => dpb_inst_2_DIA_i,
            ADB => adb(13 downto 0),
            DIB => dpb_inst_2_DIB_i
        );

    dpb_inst_3: DPB
        generic map (
            READ_MODE0 => '0',
            READ_MODE1 => '0',
            WRITE_MODE0 => "00",
            WRITE_MODE1 => "00",
            BIT_WIDTH_0 => 1,
            BIT_WIDTH_1 => 1,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "000",
            BLK_SEL_1 => "000"
        )
        port map (
            DOA => dpb_inst_3_DOA_o,
            DOB => dpb_inst_3_DOB_o,
            CLKA => clka,
            OCEA => ocea,
            CEA => cea,
            RESETA => reseta,
            WREA => wrea,
            CLKB => clkb,
            OCEB => oceb,
            CEB => ceb,
            RESETB => resetb,
            WREB => wreb,
            BLKSELA => dpb_inst_3_BLKSELA_i,
            BLKSELB => dpb_inst_3_BLKSELB_i,
            ADA => ada(13 downto 0),
            DIA => dpb_inst_3_DIA_i,
            ADB => adb(13 downto 0),
            DIB => dpb_inst_3_DIB_i
        );

    dpb_inst_4: DPB
        generic map (
            READ_MODE0 => '0',
            READ_MODE1 => '0',
            WRITE_MODE0 => "00",
            WRITE_MODE1 => "00",
            BIT_WIDTH_0 => 1,
            BIT_WIDTH_1 => 1,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "000",
            BLK_SEL_1 => "000"
        )
        port map (
            DOA => dpb_inst_4_DOA_o,
            DOB => dpb_inst_4_DOB_o,
            CLKA => clka,
            OCEA => ocea,
            CEA => cea,
            RESETA => reseta,
            WREA => wrea,
            CLKB => clkb,
            OCEB => oceb,
            CEB => ceb,
            RESETB => resetb,
            WREB => wreb,
            BLKSELA => dpb_inst_4_BLKSELA_i,
            BLKSELB => dpb_inst_4_BLKSELB_i,
            ADA => ada(13 downto 0),
            DIA => dpb_inst_4_DIA_i,
            ADB => adb(13 downto 0),
            DIB => dpb_inst_4_DIB_i
        );

    dpb_inst_5: DPB
        generic map (
            READ_MODE0 => '0',
            READ_MODE1 => '0',
            WRITE_MODE0 => "00",
            WRITE_MODE1 => "00",
            BIT_WIDTH_0 => 1,
            BIT_WIDTH_1 => 1,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "000",
            BLK_SEL_1 => "000"
        )
        port map (
            DOA => dpb_inst_5_DOA_o,
            DOB => dpb_inst_5_DOB_o,
            CLKA => clka,
            OCEA => ocea,
            CEA => cea,
            RESETA => reseta,
            WREA => wrea,
            CLKB => clkb,
            OCEB => oceb,
            CEB => ceb,
            RESETB => resetb,
            WREB => wreb,
            BLKSELA => dpb_inst_5_BLKSELA_i,
            BLKSELB => dpb_inst_5_BLKSELB_i,
            ADA => ada(13 downto 0),
            DIA => dpb_inst_5_DIA_i,
            ADB => adb(13 downto 0),
            DIB => dpb_inst_5_DIB_i
        );

    dpb_inst_6: DPB
        generic map (
            READ_MODE0 => '0',
            READ_MODE1 => '0',
            WRITE_MODE0 => "00",
            WRITE_MODE1 => "00",
            BIT_WIDTH_0 => 1,
            BIT_WIDTH_1 => 1,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "000",
            BLK_SEL_1 => "000"
        )
        port map (
            DOA => dpb_inst_6_DOA_o,
            DOB => dpb_inst_6_DOB_o,
            CLKA => clka,
            OCEA => ocea,
            CEA => cea,
            RESETA => reseta,
            WREA => wrea,
            CLKB => clkb,
            OCEB => oceb,
            CEB => ceb,
            RESETB => resetb,
            WREB => wreb,
            BLKSELA => dpb_inst_6_BLKSELA_i,
            BLKSELB => dpb_inst_6_BLKSELB_i,
            ADA => ada(13 downto 0),
            DIA => dpb_inst_6_DIA_i,
            ADB => adb(13 downto 0),
            DIB => dpb_inst_6_DIB_i
        );

    dpb_inst_7: DPB
        generic map (
            READ_MODE0 => '0',
            READ_MODE1 => '0',
            WRITE_MODE0 => "00",
            WRITE_MODE1 => "00",
            BIT_WIDTH_0 => 1,
            BIT_WIDTH_1 => 1,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "000",
            BLK_SEL_1 => "000"
        )
        port map (
            DOA => dpb_inst_7_DOA_o,
            DOB => dpb_inst_7_DOB_o,
            CLKA => clka,
            OCEA => ocea,
            CEA => cea,
            RESETA => reseta,
            WREA => wrea,
            CLKB => clkb,
            OCEB => oceb,
            CEB => ceb,
            RESETB => resetb,
            WREB => wreb,
            BLKSELA => dpb_inst_7_BLKSELA_i,
            BLKSELB => dpb_inst_7_BLKSELB_i,
            ADA => ada(13 downto 0),
            DIA => dpb_inst_7_DIA_i,
            ADB => adb(13 downto 0),
            DIB => dpb_inst_7_DIB_i
        );

end Behavioral; --Gowin_DPB
