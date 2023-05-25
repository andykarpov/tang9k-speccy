--Copyright (C)2014-2022 Gowin Semiconductor Corporation.
--All rights reserved.
--File Title: IP file
--GOWIN Version: V1.9.8.05
--Part Number: GW1NR-LV9QN88PC6/I5
--Device: GW1NR-9C
--Created Time: Tue May 16 20:36:46 2023

library IEEE;
use IEEE.std_logic_1164.all;

entity Gowin_DPB_osd is
    port (
        douta: out std_logic_vector(15 downto 0);
        doutb: out std_logic_vector(15 downto 0);
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
        dina: in std_logic_vector(15 downto 0);
        adb: in std_logic_vector(13 downto 0);
        dinb: in std_logic_vector(15 downto 0)
    );
end Gowin_DPB_osd;

architecture Behavioral of Gowin_DPB_osd is

    signal dpx9b_inst_0_douta_w: std_logic_vector(8 downto 0);
    signal dpx9b_inst_0_douta: std_logic_vector(8 downto 0);
    signal dpx9b_inst_0_doutb_w: std_logic_vector(8 downto 0);
    signal dpx9b_inst_0_doutb: std_logic_vector(8 downto 0);
    signal dpx9b_inst_1_douta_w: std_logic_vector(8 downto 0);
    signal dpx9b_inst_1_douta: std_logic_vector(8 downto 0);
    signal dpx9b_inst_1_doutb_w: std_logic_vector(8 downto 0);
    signal dpx9b_inst_1_doutb: std_logic_vector(8 downto 0);
    signal dpx9b_inst_2_douta_w: std_logic_vector(8 downto 0);
    signal dpx9b_inst_2_douta: std_logic_vector(8 downto 0);
    signal dpx9b_inst_2_doutb_w: std_logic_vector(8 downto 0);
    signal dpx9b_inst_2_doutb: std_logic_vector(8 downto 0);
    signal dpx9b_inst_3_douta_w: std_logic_vector(8 downto 0);
    signal dpx9b_inst_3_douta: std_logic_vector(8 downto 0);
    signal dpx9b_inst_3_doutb_w: std_logic_vector(8 downto 0);
    signal dpx9b_inst_3_doutb: std_logic_vector(8 downto 0);
    signal dpx9b_inst_4_douta_w: std_logic_vector(8 downto 0);
    signal dpx9b_inst_4_douta: std_logic_vector(8 downto 0);
    signal dpx9b_inst_4_doutb_w: std_logic_vector(8 downto 0);
    signal dpx9b_inst_4_doutb: std_logic_vector(8 downto 0);
    signal dpx9b_inst_5_douta_w: std_logic_vector(8 downto 0);
    signal dpx9b_inst_5_douta: std_logic_vector(8 downto 0);
    signal dpx9b_inst_5_doutb_w: std_logic_vector(8 downto 0);
    signal dpx9b_inst_5_doutb: std_logic_vector(8 downto 0);
    signal dpx9b_inst_6_douta_w: std_logic_vector(8 downto 0);
    signal dpx9b_inst_6_douta: std_logic_vector(8 downto 0);
    signal dpx9b_inst_6_doutb_w: std_logic_vector(8 downto 0);
    signal dpx9b_inst_6_doutb: std_logic_vector(8 downto 0);
    signal dpx9b_inst_7_douta_w: std_logic_vector(8 downto 0);
    signal dpx9b_inst_7_douta: std_logic_vector(8 downto 0);
    signal dpx9b_inst_7_doutb_w: std_logic_vector(8 downto 0);
    signal dpx9b_inst_7_doutb: std_logic_vector(8 downto 0);
    signal dpb_inst_8_douta_w: std_logic_vector(14 downto 0);
    signal dpb_inst_8_doutb_w: std_logic_vector(14 downto 0);
    signal dpb_inst_9_douta_w: std_logic_vector(14 downto 0);
    signal dpb_inst_9_doutb_w: std_logic_vector(14 downto 0);
    signal dpb_inst_10_douta_w: std_logic_vector(14 downto 0);
    signal dpb_inst_10_doutb_w: std_logic_vector(14 downto 0);
    signal dpb_inst_11_douta_w: std_logic_vector(14 downto 0);
    signal dpb_inst_11_doutb_w: std_logic_vector(14 downto 0);
    signal dpb_inst_12_douta_w: std_logic_vector(14 downto 0);
    signal dpb_inst_12_doutb_w: std_logic_vector(14 downto 0);
    signal dpb_inst_13_douta_w: std_logic_vector(14 downto 0);
    signal dpb_inst_13_doutb_w: std_logic_vector(14 downto 0);
    signal dpb_inst_14_douta_w: std_logic_vector(14 downto 0);
    signal dpb_inst_14_doutb_w: std_logic_vector(14 downto 0);
    signal dff_q_0: std_logic;
    signal dff_q_1: std_logic;
    signal dff_q_2: std_logic;
    signal dff_q_3: std_logic;
    signal dff_q_4: std_logic;
    signal dff_q_5: std_logic;
    signal dff_q_6: std_logic;
    signal dff_q_7: std_logic;
    signal dff_q_8: std_logic;
    signal mux_o_0: std_logic;
    signal mux_o_1: std_logic;
    signal mux_o_2: std_logic;
    signal mux_o_3: std_logic;
    signal mux_o_4: std_logic;
    signal mux_o_5: std_logic;
    signal mux_o_7: std_logic;
    signal mux_o_8: std_logic;
    signal mux_o_9: std_logic;
    signal mux_o_10: std_logic;
    signal mux_o_11: std_logic;
    signal mux_o_12: std_logic;
    signal mux_o_14: std_logic;
    signal mux_o_15: std_logic;
    signal mux_o_16: std_logic;
    signal mux_o_17: std_logic;
    signal mux_o_18: std_logic;
    signal mux_o_19: std_logic;
    signal mux_o_21: std_logic;
    signal mux_o_22: std_logic;
    signal mux_o_23: std_logic;
    signal mux_o_24: std_logic;
    signal mux_o_25: std_logic;
    signal mux_o_26: std_logic;
    signal mux_o_28: std_logic;
    signal mux_o_29: std_logic;
    signal mux_o_30: std_logic;
    signal mux_o_31: std_logic;
    signal mux_o_32: std_logic;
    signal mux_o_33: std_logic;
    signal mux_o_35: std_logic;
    signal mux_o_36: std_logic;
    signal mux_o_37: std_logic;
    signal mux_o_38: std_logic;
    signal mux_o_39: std_logic;
    signal mux_o_40: std_logic;
    signal mux_o_42: std_logic;
    signal mux_o_43: std_logic;
    signal mux_o_44: std_logic;
    signal mux_o_45: std_logic;
    signal mux_o_46: std_logic;
    signal mux_o_47: std_logic;
    signal mux_o_49: std_logic;
    signal mux_o_50: std_logic;
    signal mux_o_51: std_logic;
    signal mux_o_52: std_logic;
    signal mux_o_53: std_logic;
    signal mux_o_54: std_logic;
    signal mux_o_56: std_logic;
    signal mux_o_57: std_logic;
    signal mux_o_58: std_logic;
    signal mux_o_59: std_logic;
    signal mux_o_60: std_logic;
    signal mux_o_61: std_logic;
    signal mux_o_63: std_logic;
    signal mux_o_64: std_logic;
    signal mux_o_65: std_logic;
    signal mux_o_66: std_logic;
    signal mux_o_67: std_logic;
    signal mux_o_68: std_logic;
    signal mux_o_70: std_logic;
    signal mux_o_71: std_logic;
    signal mux_o_72: std_logic;
    signal mux_o_73: std_logic;
    signal mux_o_74: std_logic;
    signal mux_o_75: std_logic;
    signal mux_o_77: std_logic;
    signal mux_o_78: std_logic;
    signal mux_o_79: std_logic;
    signal mux_o_80: std_logic;
    signal mux_o_81: std_logic;
    signal mux_o_82: std_logic;
    signal mux_o_84: std_logic;
    signal mux_o_85: std_logic;
    signal mux_o_86: std_logic;
    signal mux_o_87: std_logic;
    signal mux_o_88: std_logic;
    signal mux_o_89: std_logic;
    signal mux_o_91: std_logic;
    signal mux_o_92: std_logic;
    signal mux_o_93: std_logic;
    signal mux_o_94: std_logic;
    signal mux_o_95: std_logic;
    signal mux_o_96: std_logic;
    signal mux_o_98: std_logic;
    signal mux_o_99: std_logic;
    signal mux_o_100: std_logic;
    signal mux_o_101: std_logic;
    signal mux_o_102: std_logic;
    signal mux_o_103: std_logic;
    signal mux_o_105: std_logic;
    signal mux_o_106: std_logic;
    signal mux_o_107: std_logic;
    signal mux_o_108: std_logic;
    signal mux_o_109: std_logic;
    signal mux_o_110: std_logic;
    signal mux_o_112: std_logic;
    signal mux_o_113: std_logic;
    signal mux_o_114: std_logic;
    signal mux_o_115: std_logic;
    signal mux_o_116: std_logic;
    signal mux_o_117: std_logic;
    signal mux_o_119: std_logic;
    signal mux_o_120: std_logic;
    signal mux_o_121: std_logic;
    signal mux_o_122: std_logic;
    signal mux_o_123: std_logic;
    signal mux_o_124: std_logic;
    signal cea_w: std_logic;
    signal ceb_w: std_logic;
    signal gw_gnd: std_logic;
    signal dpx9b_inst_0_BLKSELA_i: std_logic_vector(2 downto 0);
    signal dpx9b_inst_0_BLKSELB_i: std_logic_vector(2 downto 0);
    signal dpx9b_inst_0_ADA_i: std_logic_vector(13 downto 0);
    signal dpx9b_inst_0_DIA_i: std_logic_vector(17 downto 0);
    signal dpx9b_inst_0_ADB_i: std_logic_vector(13 downto 0);
    signal dpx9b_inst_0_DIB_i: std_logic_vector(17 downto 0);
    signal dpx9b_inst_0_DOA_o: std_logic_vector(17 downto 0);
    signal dpx9b_inst_0_DOB_o: std_logic_vector(17 downto 0);
    signal dpx9b_inst_1_BLKSELA_i: std_logic_vector(2 downto 0);
    signal dpx9b_inst_1_BLKSELB_i: std_logic_vector(2 downto 0);
    signal dpx9b_inst_1_ADA_i: std_logic_vector(13 downto 0);
    signal dpx9b_inst_1_DIA_i: std_logic_vector(17 downto 0);
    signal dpx9b_inst_1_ADB_i: std_logic_vector(13 downto 0);
    signal dpx9b_inst_1_DIB_i: std_logic_vector(17 downto 0);
    signal dpx9b_inst_1_DOA_o: std_logic_vector(17 downto 0);
    signal dpx9b_inst_1_DOB_o: std_logic_vector(17 downto 0);
    signal dpx9b_inst_2_BLKSELA_i: std_logic_vector(2 downto 0);
    signal dpx9b_inst_2_BLKSELB_i: std_logic_vector(2 downto 0);
    signal dpx9b_inst_2_ADA_i: std_logic_vector(13 downto 0);
    signal dpx9b_inst_2_DIA_i: std_logic_vector(17 downto 0);
    signal dpx9b_inst_2_ADB_i: std_logic_vector(13 downto 0);
    signal dpx9b_inst_2_DIB_i: std_logic_vector(17 downto 0);
    signal dpx9b_inst_2_DOA_o: std_logic_vector(17 downto 0);
    signal dpx9b_inst_2_DOB_o: std_logic_vector(17 downto 0);
    signal dpx9b_inst_3_BLKSELA_i: std_logic_vector(2 downto 0);
    signal dpx9b_inst_3_BLKSELB_i: std_logic_vector(2 downto 0);
    signal dpx9b_inst_3_ADA_i: std_logic_vector(13 downto 0);
    signal dpx9b_inst_3_DIA_i: std_logic_vector(17 downto 0);
    signal dpx9b_inst_3_ADB_i: std_logic_vector(13 downto 0);
    signal dpx9b_inst_3_DIB_i: std_logic_vector(17 downto 0);
    signal dpx9b_inst_3_DOA_o: std_logic_vector(17 downto 0);
    signal dpx9b_inst_3_DOB_o: std_logic_vector(17 downto 0);
    signal dpx9b_inst_4_BLKSELA_i: std_logic_vector(2 downto 0);
    signal dpx9b_inst_4_BLKSELB_i: std_logic_vector(2 downto 0);
    signal dpx9b_inst_4_ADA_i: std_logic_vector(13 downto 0);
    signal dpx9b_inst_4_DIA_i: std_logic_vector(17 downto 0);
    signal dpx9b_inst_4_ADB_i: std_logic_vector(13 downto 0);
    signal dpx9b_inst_4_DIB_i: std_logic_vector(17 downto 0);
    signal dpx9b_inst_4_DOA_o: std_logic_vector(17 downto 0);
    signal dpx9b_inst_4_DOB_o: std_logic_vector(17 downto 0);
    signal dpx9b_inst_5_BLKSELA_i: std_logic_vector(2 downto 0);
    signal dpx9b_inst_5_BLKSELB_i: std_logic_vector(2 downto 0);
    signal dpx9b_inst_5_ADA_i: std_logic_vector(13 downto 0);
    signal dpx9b_inst_5_DIA_i: std_logic_vector(17 downto 0);
    signal dpx9b_inst_5_ADB_i: std_logic_vector(13 downto 0);
    signal dpx9b_inst_5_DIB_i: std_logic_vector(17 downto 0);
    signal dpx9b_inst_5_DOA_o: std_logic_vector(17 downto 0);
    signal dpx9b_inst_5_DOB_o: std_logic_vector(17 downto 0);
    signal dpx9b_inst_6_BLKSELA_i: std_logic_vector(2 downto 0);
    signal dpx9b_inst_6_BLKSELB_i: std_logic_vector(2 downto 0);
    signal dpx9b_inst_6_ADA_i: std_logic_vector(13 downto 0);
    signal dpx9b_inst_6_DIA_i: std_logic_vector(17 downto 0);
    signal dpx9b_inst_6_ADB_i: std_logic_vector(13 downto 0);
    signal dpx9b_inst_6_DIB_i: std_logic_vector(17 downto 0);
    signal dpx9b_inst_6_DOA_o: std_logic_vector(17 downto 0);
    signal dpx9b_inst_6_DOB_o: std_logic_vector(17 downto 0);
    signal dpx9b_inst_7_BLKSELA_i: std_logic_vector(2 downto 0);
    signal dpx9b_inst_7_BLKSELB_i: std_logic_vector(2 downto 0);
    signal dpx9b_inst_7_ADA_i: std_logic_vector(13 downto 0);
    signal dpx9b_inst_7_DIA_i: std_logic_vector(17 downto 0);
    signal dpx9b_inst_7_ADB_i: std_logic_vector(13 downto 0);
    signal dpx9b_inst_7_DIB_i: std_logic_vector(17 downto 0);
    signal dpx9b_inst_7_DOA_o: std_logic_vector(17 downto 0);
    signal dpx9b_inst_7_DOB_o: std_logic_vector(17 downto 0);
    signal dpb_inst_8_BLKSELA_i: std_logic_vector(2 downto 0);
    signal dpb_inst_8_BLKSELB_i: std_logic_vector(2 downto 0);
    signal dpb_inst_8_DIA_i: std_logic_vector(15 downto 0);
    signal dpb_inst_8_DIB_i: std_logic_vector(15 downto 0);
    signal dpb_inst_8_DOA_o: std_logic_vector(15 downto 0);
    signal dpb_inst_8_DOB_o: std_logic_vector(15 downto 0);
    signal dpb_inst_9_BLKSELA_i: std_logic_vector(2 downto 0);
    signal dpb_inst_9_BLKSELB_i: std_logic_vector(2 downto 0);
    signal dpb_inst_9_DIA_i: std_logic_vector(15 downto 0);
    signal dpb_inst_9_DIB_i: std_logic_vector(15 downto 0);
    signal dpb_inst_9_DOA_o: std_logic_vector(15 downto 0);
    signal dpb_inst_9_DOB_o: std_logic_vector(15 downto 0);
    signal dpb_inst_10_BLKSELA_i: std_logic_vector(2 downto 0);
    signal dpb_inst_10_BLKSELB_i: std_logic_vector(2 downto 0);
    signal dpb_inst_10_DIA_i: std_logic_vector(15 downto 0);
    signal dpb_inst_10_DIB_i: std_logic_vector(15 downto 0);
    signal dpb_inst_10_DOA_o: std_logic_vector(15 downto 0);
    signal dpb_inst_10_DOB_o: std_logic_vector(15 downto 0);
    signal dpb_inst_11_BLKSELA_i: std_logic_vector(2 downto 0);
    signal dpb_inst_11_BLKSELB_i: std_logic_vector(2 downto 0);
    signal dpb_inst_11_DIA_i: std_logic_vector(15 downto 0);
    signal dpb_inst_11_DIB_i: std_logic_vector(15 downto 0);
    signal dpb_inst_11_DOA_o: std_logic_vector(15 downto 0);
    signal dpb_inst_11_DOB_o: std_logic_vector(15 downto 0);
    signal dpb_inst_12_BLKSELA_i: std_logic_vector(2 downto 0);
    signal dpb_inst_12_BLKSELB_i: std_logic_vector(2 downto 0);
    signal dpb_inst_12_DIA_i: std_logic_vector(15 downto 0);
    signal dpb_inst_12_DIB_i: std_logic_vector(15 downto 0);
    signal dpb_inst_12_DOA_o: std_logic_vector(15 downto 0);
    signal dpb_inst_12_DOB_o: std_logic_vector(15 downto 0);
    signal dpb_inst_13_BLKSELA_i: std_logic_vector(2 downto 0);
    signal dpb_inst_13_BLKSELB_i: std_logic_vector(2 downto 0);
    signal dpb_inst_13_DIA_i: std_logic_vector(15 downto 0);
    signal dpb_inst_13_DIB_i: std_logic_vector(15 downto 0);
    signal dpb_inst_13_DOA_o: std_logic_vector(15 downto 0);
    signal dpb_inst_13_DOB_o: std_logic_vector(15 downto 0);
    signal dpb_inst_14_BLKSELA_i: std_logic_vector(2 downto 0);
    signal dpb_inst_14_BLKSELB_i: std_logic_vector(2 downto 0);
    signal dpb_inst_14_DIA_i: std_logic_vector(15 downto 0);
    signal dpb_inst_14_DIB_i: std_logic_vector(15 downto 0);
    signal dpb_inst_14_DOA_o: std_logic_vector(15 downto 0);
    signal dpb_inst_14_DOB_o: std_logic_vector(15 downto 0);

    --component declaration
    component DPX9B
        generic (
            READ_MODE0: in bit := '0';
            READ_MODE1: in bit := '0';
            WRITE_MODE0: in bit_vector := "00";
            WRITE_MODE1: in bit_vector := "00";
            BIT_WIDTH_0: in integer :=18;
            BIT_WIDTH_1: in integer :=18;
            BLK_SEL_0: in bit_vector := "000";
            BLK_SEL_1: in bit_vector := "000";
            RESET_MODE: in string := "SYNC";
            INIT_RAM_00: in bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_01: in bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_02: in bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_03: in bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_04: in bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_05: in bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_06: in bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_07: in bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_08: in bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_09: in bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_0A: in bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_0B: in bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_0C: in bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_0D: in bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_0E: in bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_0F: in bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_10: in bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_11: in bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_12: in bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_13: in bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_14: in bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_15: in bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_16: in bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_17: in bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_18: in bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_19: in bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_1A: in bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_1B: in bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_1C: in bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_1D: in bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_1E: in bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_1F: in bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_20: in bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_21: in bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_22: in bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_23: in bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_24: in bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_25: in bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_26: in bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_27: in bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_28: in bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_29: in bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_2A: in bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_2B: in bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_2C: in bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_2D: in bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_2E: in bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_2F: in bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_30: in bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_31: in bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_32: in bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_33: in bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_34: in bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_35: in bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_36: in bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_37: in bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_38: in bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_39: in bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_3A: in bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_3B: in bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_3C: in bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_3D: in bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_3E: in bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_3F: in bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000"
        );
        port (
            DOA: out std_logic_vector(17 downto 0);
            DOB: out std_logic_vector(17 downto 0);
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
            DIA: in std_logic_vector(17 downto 0);
            ADB: in std_logic_vector(13 downto 0);
            DIB: in std_logic_vector(17 downto 0)
        );
    end component;

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

    -- component declaration
    component DFFE
        port (
            Q: out std_logic;
            D: in std_logic;
            CLK: in std_logic;
            CE: in std_logic
        );
    end component;

    -- component declaration
    component MUX2
        port (
            O: out std_logic;
            I0: in std_logic;
            I1: in std_logic;
            S0: in std_logic
        );
    end component;

begin
    gw_gnd <= '0';

    cea_w <= not wrea and cea;
    ceb_w <= not wreb and ceb;
    dpx9b_inst_0_BLKSELA_i <= ada(13) & ada(12) & ada(11);
    dpx9b_inst_0_BLKSELB_i <= adb(13) & adb(12) & adb(11);
    dpx9b_inst_0_ADA_i <= ada(10 downto 0) & gw_gnd & gw_gnd & gw_gnd;
    dpx9b_inst_0_DIA_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dina(8 downto 0);
    dpx9b_inst_0_ADB_i <= adb(10 downto 0) & gw_gnd & gw_gnd & gw_gnd;
    dpx9b_inst_0_DIB_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dinb(8 downto 0);
    dpx9b_inst_0_douta(8 downto 0) <= dpx9b_inst_0_DOA_o(8 downto 0) ;
    dpx9b_inst_0_douta_w(8 downto 0) <= dpx9b_inst_0_DOA_o(17 downto 9) ;
    dpx9b_inst_0_doutb(8 downto 0) <= dpx9b_inst_0_DOB_o(8 downto 0) ;
    dpx9b_inst_0_doutb_w(8 downto 0) <= dpx9b_inst_0_DOB_o(17 downto 9) ;
    dpx9b_inst_1_BLKSELA_i <= ada(13) & ada(12) & ada(11);
    dpx9b_inst_1_BLKSELB_i <= adb(13) & adb(12) & adb(11);
    dpx9b_inst_1_ADA_i <= ada(10 downto 0) & gw_gnd & gw_gnd & gw_gnd;
    dpx9b_inst_1_DIA_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dina(8 downto 0);
    dpx9b_inst_1_ADB_i <= adb(10 downto 0) & gw_gnd & gw_gnd & gw_gnd;
    dpx9b_inst_1_DIB_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dinb(8 downto 0);
    dpx9b_inst_1_douta(8 downto 0) <= dpx9b_inst_1_DOA_o(8 downto 0) ;
    dpx9b_inst_1_douta_w(8 downto 0) <= dpx9b_inst_1_DOA_o(17 downto 9) ;
    dpx9b_inst_1_doutb(8 downto 0) <= dpx9b_inst_1_DOB_o(8 downto 0) ;
    dpx9b_inst_1_doutb_w(8 downto 0) <= dpx9b_inst_1_DOB_o(17 downto 9) ;
    dpx9b_inst_2_BLKSELA_i <= ada(13) & ada(12) & ada(11);
    dpx9b_inst_2_BLKSELB_i <= adb(13) & adb(12) & adb(11);
    dpx9b_inst_2_ADA_i <= ada(10 downto 0) & gw_gnd & gw_gnd & gw_gnd;
    dpx9b_inst_2_DIA_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dina(8 downto 0);
    dpx9b_inst_2_ADB_i <= adb(10 downto 0) & gw_gnd & gw_gnd & gw_gnd;
    dpx9b_inst_2_DIB_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dinb(8 downto 0);
    dpx9b_inst_2_douta(8 downto 0) <= dpx9b_inst_2_DOA_o(8 downto 0) ;
    dpx9b_inst_2_douta_w(8 downto 0) <= dpx9b_inst_2_DOA_o(17 downto 9) ;
    dpx9b_inst_2_doutb(8 downto 0) <= dpx9b_inst_2_DOB_o(8 downto 0) ;
    dpx9b_inst_2_doutb_w(8 downto 0) <= dpx9b_inst_2_DOB_o(17 downto 9) ;
    dpx9b_inst_3_BLKSELA_i <= ada(13) & ada(12) & ada(11);
    dpx9b_inst_3_BLKSELB_i <= adb(13) & adb(12) & adb(11);
    dpx9b_inst_3_ADA_i <= ada(10 downto 0) & gw_gnd & gw_gnd & gw_gnd;
    dpx9b_inst_3_DIA_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dina(8 downto 0);
    dpx9b_inst_3_ADB_i <= adb(10 downto 0) & gw_gnd & gw_gnd & gw_gnd;
    dpx9b_inst_3_DIB_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dinb(8 downto 0);
    dpx9b_inst_3_douta(8 downto 0) <= dpx9b_inst_3_DOA_o(8 downto 0) ;
    dpx9b_inst_3_douta_w(8 downto 0) <= dpx9b_inst_3_DOA_o(17 downto 9) ;
    dpx9b_inst_3_doutb(8 downto 0) <= dpx9b_inst_3_DOB_o(8 downto 0) ;
    dpx9b_inst_3_doutb_w(8 downto 0) <= dpx9b_inst_3_DOB_o(17 downto 9) ;
    dpx9b_inst_4_BLKSELA_i <= ada(13) & ada(12) & ada(11);
    dpx9b_inst_4_BLKSELB_i <= adb(13) & adb(12) & adb(11);
    dpx9b_inst_4_ADA_i <= ada(10 downto 0) & gw_gnd & gw_gnd & gw_gnd;
    dpx9b_inst_4_DIA_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dina(8 downto 0);
    dpx9b_inst_4_ADB_i <= adb(10 downto 0) & gw_gnd & gw_gnd & gw_gnd;
    dpx9b_inst_4_DIB_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dinb(8 downto 0);
    dpx9b_inst_4_douta(8 downto 0) <= dpx9b_inst_4_DOA_o(8 downto 0) ;
    dpx9b_inst_4_douta_w(8 downto 0) <= dpx9b_inst_4_DOA_o(17 downto 9) ;
    dpx9b_inst_4_doutb(8 downto 0) <= dpx9b_inst_4_DOB_o(8 downto 0) ;
    dpx9b_inst_4_doutb_w(8 downto 0) <= dpx9b_inst_4_DOB_o(17 downto 9) ;
    dpx9b_inst_5_BLKSELA_i <= ada(13) & ada(12) & ada(11);
    dpx9b_inst_5_BLKSELB_i <= adb(13) & adb(12) & adb(11);
    dpx9b_inst_5_ADA_i <= ada(10 downto 0) & gw_gnd & gw_gnd & gw_gnd;
    dpx9b_inst_5_DIA_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dina(8 downto 0);
    dpx9b_inst_5_ADB_i <= adb(10 downto 0) & gw_gnd & gw_gnd & gw_gnd;
    dpx9b_inst_5_DIB_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dinb(8 downto 0);
    dpx9b_inst_5_douta(8 downto 0) <= dpx9b_inst_5_DOA_o(8 downto 0) ;
    dpx9b_inst_5_douta_w(8 downto 0) <= dpx9b_inst_5_DOA_o(17 downto 9) ;
    dpx9b_inst_5_doutb(8 downto 0) <= dpx9b_inst_5_DOB_o(8 downto 0) ;
    dpx9b_inst_5_doutb_w(8 downto 0) <= dpx9b_inst_5_DOB_o(17 downto 9) ;
    dpx9b_inst_6_BLKSELA_i <= ada(13) & ada(12) & ada(11);
    dpx9b_inst_6_BLKSELB_i <= adb(13) & adb(12) & adb(11);
    dpx9b_inst_6_ADA_i <= ada(10 downto 0) & gw_gnd & gw_gnd & gw_gnd;
    dpx9b_inst_6_DIA_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dina(8 downto 0);
    dpx9b_inst_6_ADB_i <= adb(10 downto 0) & gw_gnd & gw_gnd & gw_gnd;
    dpx9b_inst_6_DIB_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dinb(8 downto 0);
    dpx9b_inst_6_douta(8 downto 0) <= dpx9b_inst_6_DOA_o(8 downto 0) ;
    dpx9b_inst_6_douta_w(8 downto 0) <= dpx9b_inst_6_DOA_o(17 downto 9) ;
    dpx9b_inst_6_doutb(8 downto 0) <= dpx9b_inst_6_DOB_o(8 downto 0) ;
    dpx9b_inst_6_doutb_w(8 downto 0) <= dpx9b_inst_6_DOB_o(17 downto 9) ;
    dpx9b_inst_7_BLKSELA_i <= ada(13) & ada(12) & ada(11);
    dpx9b_inst_7_BLKSELB_i <= adb(13) & adb(12) & adb(11);
    dpx9b_inst_7_ADA_i <= ada(10 downto 0) & gw_gnd & gw_gnd & gw_gnd;
    dpx9b_inst_7_DIA_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dina(8 downto 0);
    dpx9b_inst_7_ADB_i <= adb(10 downto 0) & gw_gnd & gw_gnd & gw_gnd;
    dpx9b_inst_7_DIB_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dinb(8 downto 0);
    dpx9b_inst_7_douta(8 downto 0) <= dpx9b_inst_7_DOA_o(8 downto 0) ;
    dpx9b_inst_7_douta_w(8 downto 0) <= dpx9b_inst_7_DOA_o(17 downto 9) ;
    dpx9b_inst_7_doutb(8 downto 0) <= dpx9b_inst_7_DOB_o(8 downto 0) ;
    dpx9b_inst_7_doutb_w(8 downto 0) <= dpx9b_inst_7_DOB_o(17 downto 9) ;
    dpb_inst_8_BLKSELA_i <= gw_gnd & gw_gnd & gw_gnd;
    dpb_inst_8_BLKSELB_i <= gw_gnd & gw_gnd & gw_gnd;
    dpb_inst_8_DIA_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dina(9);
    dpb_inst_8_DIB_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dinb(9);
    douta(9) <= dpb_inst_8_DOA_o(0);
    dpb_inst_8_douta_w(14 downto 0) <= dpb_inst_8_DOA_o(15 downto 1) ;
    doutb(9) <= dpb_inst_8_DOB_o(0);
    dpb_inst_8_doutb_w(14 downto 0) <= dpb_inst_8_DOB_o(15 downto 1) ;
    dpb_inst_9_BLKSELA_i <= gw_gnd & gw_gnd & gw_gnd;
    dpb_inst_9_BLKSELB_i <= gw_gnd & gw_gnd & gw_gnd;
    dpb_inst_9_DIA_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dina(10);
    dpb_inst_9_DIB_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dinb(10);
    douta(10) <= dpb_inst_9_DOA_o(0);
    dpb_inst_9_douta_w(14 downto 0) <= dpb_inst_9_DOA_o(15 downto 1) ;
    doutb(10) <= dpb_inst_9_DOB_o(0);
    dpb_inst_9_doutb_w(14 downto 0) <= dpb_inst_9_DOB_o(15 downto 1) ;
    dpb_inst_10_BLKSELA_i <= gw_gnd & gw_gnd & gw_gnd;
    dpb_inst_10_BLKSELB_i <= gw_gnd & gw_gnd & gw_gnd;
    dpb_inst_10_DIA_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dina(11);
    dpb_inst_10_DIB_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dinb(11);
    douta(11) <= dpb_inst_10_DOA_o(0);
    dpb_inst_10_douta_w(14 downto 0) <= dpb_inst_10_DOA_o(15 downto 1) ;
    doutb(11) <= dpb_inst_10_DOB_o(0);
    dpb_inst_10_doutb_w(14 downto 0) <= dpb_inst_10_DOB_o(15 downto 1) ;
    dpb_inst_11_BLKSELA_i <= gw_gnd & gw_gnd & gw_gnd;
    dpb_inst_11_BLKSELB_i <= gw_gnd & gw_gnd & gw_gnd;
    dpb_inst_11_DIA_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dina(12);
    dpb_inst_11_DIB_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dinb(12);
    douta(12) <= dpb_inst_11_DOA_o(0);
    dpb_inst_11_douta_w(14 downto 0) <= dpb_inst_11_DOA_o(15 downto 1) ;
    doutb(12) <= dpb_inst_11_DOB_o(0);
    dpb_inst_11_doutb_w(14 downto 0) <= dpb_inst_11_DOB_o(15 downto 1) ;
    dpb_inst_12_BLKSELA_i <= gw_gnd & gw_gnd & gw_gnd;
    dpb_inst_12_BLKSELB_i <= gw_gnd & gw_gnd & gw_gnd;
    dpb_inst_12_DIA_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dina(13);
    dpb_inst_12_DIB_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dinb(13);
    douta(13) <= dpb_inst_12_DOA_o(0);
    dpb_inst_12_douta_w(14 downto 0) <= dpb_inst_12_DOA_o(15 downto 1) ;
    doutb(13) <= dpb_inst_12_DOB_o(0);
    dpb_inst_12_doutb_w(14 downto 0) <= dpb_inst_12_DOB_o(15 downto 1) ;
    dpb_inst_13_BLKSELA_i <= gw_gnd & gw_gnd & gw_gnd;
    dpb_inst_13_BLKSELB_i <= gw_gnd & gw_gnd & gw_gnd;
    dpb_inst_13_DIA_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dina(14);
    dpb_inst_13_DIB_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dinb(14);
    douta(14) <= dpb_inst_13_DOA_o(0);
    dpb_inst_13_douta_w(14 downto 0) <= dpb_inst_13_DOA_o(15 downto 1) ;
    doutb(14) <= dpb_inst_13_DOB_o(0);
    dpb_inst_13_doutb_w(14 downto 0) <= dpb_inst_13_DOB_o(15 downto 1) ;
    dpb_inst_14_BLKSELA_i <= gw_gnd & gw_gnd & gw_gnd;
    dpb_inst_14_BLKSELB_i <= gw_gnd & gw_gnd & gw_gnd;
    dpb_inst_14_DIA_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dina(15);
    dpb_inst_14_DIB_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & dinb(15);
    douta(15) <= dpb_inst_14_DOA_o(0);
    dpb_inst_14_douta_w(14 downto 0) <= dpb_inst_14_DOA_o(15 downto 1) ;
    doutb(15) <= dpb_inst_14_DOB_o(0);
    dpb_inst_14_doutb_w(14 downto 0) <= dpb_inst_14_DOB_o(15 downto 1) ;
    dpx9b_inst_0: DPX9B
        generic map (
            READ_MODE0 => '0',
            READ_MODE1 => '1',
            WRITE_MODE0 => "00",
            WRITE_MODE1 => "00",
            BIT_WIDTH_0 => 9,
            BIT_WIDTH_1 => 9,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "000",
            BLK_SEL_1 => "000"
        )
        port map (
            DOA => dpx9b_inst_0_DOA_o,
            DOB => dpx9b_inst_0_DOB_o,
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
            BLKSELA => dpx9b_inst_0_BLKSELA_i,
            BLKSELB => dpx9b_inst_0_BLKSELB_i,
            ADA => dpx9b_inst_0_ADA_i,
            DIA => dpx9b_inst_0_DIA_i,
            ADB => dpx9b_inst_0_ADB_i,
            DIB => dpx9b_inst_0_DIB_i
        );

    dpx9b_inst_1: DPX9B
        generic map (
            READ_MODE0 => '0',
            READ_MODE1 => '1',
            WRITE_MODE0 => "00",
            WRITE_MODE1 => "00",
            BIT_WIDTH_0 => 9,
            BIT_WIDTH_1 => 9,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "001",
            BLK_SEL_1 => "001"
        )
        port map (
            DOA => dpx9b_inst_1_DOA_o,
            DOB => dpx9b_inst_1_DOB_o,
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
            BLKSELA => dpx9b_inst_1_BLKSELA_i,
            BLKSELB => dpx9b_inst_1_BLKSELB_i,
            ADA => dpx9b_inst_1_ADA_i,
            DIA => dpx9b_inst_1_DIA_i,
            ADB => dpx9b_inst_1_ADB_i,
            DIB => dpx9b_inst_1_DIB_i
        );

    dpx9b_inst_2: DPX9B
        generic map (
            READ_MODE0 => '0',
            READ_MODE1 => '1',
            WRITE_MODE0 => "00",
            WRITE_MODE1 => "00",
            BIT_WIDTH_0 => 9,
            BIT_WIDTH_1 => 9,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "010",
            BLK_SEL_1 => "010"
        )
        port map (
            DOA => dpx9b_inst_2_DOA_o,
            DOB => dpx9b_inst_2_DOB_o,
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
            BLKSELA => dpx9b_inst_2_BLKSELA_i,
            BLKSELB => dpx9b_inst_2_BLKSELB_i,
            ADA => dpx9b_inst_2_ADA_i,
            DIA => dpx9b_inst_2_DIA_i,
            ADB => dpx9b_inst_2_ADB_i,
            DIB => dpx9b_inst_2_DIB_i
        );

    dpx9b_inst_3: DPX9B
        generic map (
            READ_MODE0 => '0',
            READ_MODE1 => '1',
            WRITE_MODE0 => "00",
            WRITE_MODE1 => "00",
            BIT_WIDTH_0 => 9,
            BIT_WIDTH_1 => 9,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "011",
            BLK_SEL_1 => "011"
        )
        port map (
            DOA => dpx9b_inst_3_DOA_o,
            DOB => dpx9b_inst_3_DOB_o,
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
            BLKSELA => dpx9b_inst_3_BLKSELA_i,
            BLKSELB => dpx9b_inst_3_BLKSELB_i,
            ADA => dpx9b_inst_3_ADA_i,
            DIA => dpx9b_inst_3_DIA_i,
            ADB => dpx9b_inst_3_ADB_i,
            DIB => dpx9b_inst_3_DIB_i
        );

    dpx9b_inst_4: DPX9B
        generic map (
            READ_MODE0 => '0',
            READ_MODE1 => '1',
            WRITE_MODE0 => "00",
            WRITE_MODE1 => "00",
            BIT_WIDTH_0 => 9,
            BIT_WIDTH_1 => 9,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "100",
            BLK_SEL_1 => "100"
        )
        port map (
            DOA => dpx9b_inst_4_DOA_o,
            DOB => dpx9b_inst_4_DOB_o,
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
            BLKSELA => dpx9b_inst_4_BLKSELA_i,
            BLKSELB => dpx9b_inst_4_BLKSELB_i,
            ADA => dpx9b_inst_4_ADA_i,
            DIA => dpx9b_inst_4_DIA_i,
            ADB => dpx9b_inst_4_ADB_i,
            DIB => dpx9b_inst_4_DIB_i
        );

    dpx9b_inst_5: DPX9B
        generic map (
            READ_MODE0 => '0',
            READ_MODE1 => '1',
            WRITE_MODE0 => "00",
            WRITE_MODE1 => "00",
            BIT_WIDTH_0 => 9,
            BIT_WIDTH_1 => 9,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "101",
            BLK_SEL_1 => "101"
        )
        port map (
            DOA => dpx9b_inst_5_DOA_o,
            DOB => dpx9b_inst_5_DOB_o,
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
            BLKSELA => dpx9b_inst_5_BLKSELA_i,
            BLKSELB => dpx9b_inst_5_BLKSELB_i,
            ADA => dpx9b_inst_5_ADA_i,
            DIA => dpx9b_inst_5_DIA_i,
            ADB => dpx9b_inst_5_ADB_i,
            DIB => dpx9b_inst_5_DIB_i
        );

    dpx9b_inst_6: DPX9B
        generic map (
            READ_MODE0 => '0',
            READ_MODE1 => '1',
            WRITE_MODE0 => "00",
            WRITE_MODE1 => "00",
            BIT_WIDTH_0 => 9,
            BIT_WIDTH_1 => 9,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "110",
            BLK_SEL_1 => "110"
        )
        port map (
            DOA => dpx9b_inst_6_DOA_o,
            DOB => dpx9b_inst_6_DOB_o,
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
            BLKSELA => dpx9b_inst_6_BLKSELA_i,
            BLKSELB => dpx9b_inst_6_BLKSELB_i,
            ADA => dpx9b_inst_6_ADA_i,
            DIA => dpx9b_inst_6_DIA_i,
            ADB => dpx9b_inst_6_ADB_i,
            DIB => dpx9b_inst_6_DIB_i
        );

    dpx9b_inst_7: DPX9B
        generic map (
            READ_MODE0 => '0',
            READ_MODE1 => '1',
            WRITE_MODE0 => "00",
            WRITE_MODE1 => "00",
            BIT_WIDTH_0 => 9,
            BIT_WIDTH_1 => 9,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "111",
            BLK_SEL_1 => "111"
        )
        port map (
            DOA => dpx9b_inst_7_DOA_o,
            DOB => dpx9b_inst_7_DOB_o,
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
            BLKSELA => dpx9b_inst_7_BLKSELA_i,
            BLKSELB => dpx9b_inst_7_BLKSELB_i,
            ADA => dpx9b_inst_7_ADA_i,
            DIA => dpx9b_inst_7_DIA_i,
            ADB => dpx9b_inst_7_ADB_i,
            DIB => dpx9b_inst_7_DIB_i
        );

    dpb_inst_8: DPB
        generic map (
            READ_MODE0 => '0',
            READ_MODE1 => '1',
            WRITE_MODE0 => "00",
            WRITE_MODE1 => "00",
            BIT_WIDTH_0 => 1,
            BIT_WIDTH_1 => 1,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "000",
            BLK_SEL_1 => "000"
        )
        port map (
            DOA => dpb_inst_8_DOA_o,
            DOB => dpb_inst_8_DOB_o,
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
            BLKSELA => dpb_inst_8_BLKSELA_i,
            BLKSELB => dpb_inst_8_BLKSELB_i,
            ADA => ada(13 downto 0),
            DIA => dpb_inst_8_DIA_i,
            ADB => adb(13 downto 0),
            DIB => dpb_inst_8_DIB_i
        );

    dpb_inst_9: DPB
        generic map (
            READ_MODE0 => '0',
            READ_MODE1 => '1',
            WRITE_MODE0 => "00",
            WRITE_MODE1 => "00",
            BIT_WIDTH_0 => 1,
            BIT_WIDTH_1 => 1,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "000",
            BLK_SEL_1 => "000"
        )
        port map (
            DOA => dpb_inst_9_DOA_o,
            DOB => dpb_inst_9_DOB_o,
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
            BLKSELA => dpb_inst_9_BLKSELA_i,
            BLKSELB => dpb_inst_9_BLKSELB_i,
            ADA => ada(13 downto 0),
            DIA => dpb_inst_9_DIA_i,
            ADB => adb(13 downto 0),
            DIB => dpb_inst_9_DIB_i
        );

    dpb_inst_10: DPB
        generic map (
            READ_MODE0 => '0',
            READ_MODE1 => '1',
            WRITE_MODE0 => "00",
            WRITE_MODE1 => "00",
            BIT_WIDTH_0 => 1,
            BIT_WIDTH_1 => 1,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "000",
            BLK_SEL_1 => "000"
        )
        port map (
            DOA => dpb_inst_10_DOA_o,
            DOB => dpb_inst_10_DOB_o,
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
            BLKSELA => dpb_inst_10_BLKSELA_i,
            BLKSELB => dpb_inst_10_BLKSELB_i,
            ADA => ada(13 downto 0),
            DIA => dpb_inst_10_DIA_i,
            ADB => adb(13 downto 0),
            DIB => dpb_inst_10_DIB_i
        );

    dpb_inst_11: DPB
        generic map (
            READ_MODE0 => '0',
            READ_MODE1 => '1',
            WRITE_MODE0 => "00",
            WRITE_MODE1 => "00",
            BIT_WIDTH_0 => 1,
            BIT_WIDTH_1 => 1,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "000",
            BLK_SEL_1 => "000"
        )
        port map (
            DOA => dpb_inst_11_DOA_o,
            DOB => dpb_inst_11_DOB_o,
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
            BLKSELA => dpb_inst_11_BLKSELA_i,
            BLKSELB => dpb_inst_11_BLKSELB_i,
            ADA => ada(13 downto 0),
            DIA => dpb_inst_11_DIA_i,
            ADB => adb(13 downto 0),
            DIB => dpb_inst_11_DIB_i
        );

    dpb_inst_12: DPB
        generic map (
            READ_MODE0 => '0',
            READ_MODE1 => '1',
            WRITE_MODE0 => "00",
            WRITE_MODE1 => "00",
            BIT_WIDTH_0 => 1,
            BIT_WIDTH_1 => 1,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "000",
            BLK_SEL_1 => "000"
        )
        port map (
            DOA => dpb_inst_12_DOA_o,
            DOB => dpb_inst_12_DOB_o,
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
            BLKSELA => dpb_inst_12_BLKSELA_i,
            BLKSELB => dpb_inst_12_BLKSELB_i,
            ADA => ada(13 downto 0),
            DIA => dpb_inst_12_DIA_i,
            ADB => adb(13 downto 0),
            DIB => dpb_inst_12_DIB_i
        );

    dpb_inst_13: DPB
        generic map (
            READ_MODE0 => '0',
            READ_MODE1 => '1',
            WRITE_MODE0 => "00",
            WRITE_MODE1 => "00",
            BIT_WIDTH_0 => 1,
            BIT_WIDTH_1 => 1,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "000",
            BLK_SEL_1 => "000"
        )
        port map (
            DOA => dpb_inst_13_DOA_o,
            DOB => dpb_inst_13_DOB_o,
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
            BLKSELA => dpb_inst_13_BLKSELA_i,
            BLKSELB => dpb_inst_13_BLKSELB_i,
            ADA => ada(13 downto 0),
            DIA => dpb_inst_13_DIA_i,
            ADB => adb(13 downto 0),
            DIB => dpb_inst_13_DIB_i
        );

    dpb_inst_14: DPB
        generic map (
            READ_MODE0 => '0',
            READ_MODE1 => '1',
            WRITE_MODE0 => "00",
            WRITE_MODE1 => "00",
            BIT_WIDTH_0 => 1,
            BIT_WIDTH_1 => 1,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "000",
            BLK_SEL_1 => "000"
        )
        port map (
            DOA => dpb_inst_14_DOA_o,
            DOB => dpb_inst_14_DOB_o,
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
            BLKSELA => dpb_inst_14_BLKSELA_i,
            BLKSELB => dpb_inst_14_BLKSELB_i,
            ADA => ada(13 downto 0),
            DIA => dpb_inst_14_DIA_i,
            ADB => adb(13 downto 0),
            DIB => dpb_inst_14_DIB_i
        );

    dff_inst_0: DFFE
        port map (
            Q => dff_q_0,
            D => ada(13),
            CLK => clka,
            CE => cea_w
        );

    dff_inst_1: DFFE
        port map (
            Q => dff_q_1,
            D => ada(12),
            CLK => clka,
            CE => cea_w
        );

    dff_inst_2: DFFE
        port map (
            Q => dff_q_2,
            D => ada(11),
            CLK => clka,
            CE => cea_w
        );

    dff_inst_3: DFFE
        port map (
            Q => dff_q_3,
            D => adb(13),
            CLK => clkb,
            CE => ceb_w
        );

    dff_inst_4: DFFE
        port map (
            Q => dff_q_4,
            D => dff_q_3,
            CLK => clkb,
            CE => oceb
        );

    dff_inst_5: DFFE
        port map (
            Q => dff_q_5,
            D => adb(12),
            CLK => clkb,
            CE => ceb_w
        );

    dff_inst_6: DFFE
        port map (
            Q => dff_q_6,
            D => dff_q_5,
            CLK => clkb,
            CE => oceb
        );

    dff_inst_7: DFFE
        port map (
            Q => dff_q_7,
            D => adb(11),
            CLK => clkb,
            CE => ceb_w
        );

    dff_inst_8: DFFE
        port map (
            Q => dff_q_8,
            D => dff_q_7,
            CLK => clkb,
            CE => oceb
        );

    mux_inst_0: MUX2
        port map (
            O => mux_o_0,
            I0 => dpx9b_inst_0_douta(0),
            I1 => dpx9b_inst_1_douta(0),
            S0 => dff_q_2
        );

    mux_inst_1: MUX2
        port map (
            O => mux_o_1,
            I0 => dpx9b_inst_2_douta(0),
            I1 => dpx9b_inst_3_douta(0),
            S0 => dff_q_2
        );

    mux_inst_2: MUX2
        port map (
            O => mux_o_2,
            I0 => dpx9b_inst_4_douta(0),
            I1 => dpx9b_inst_5_douta(0),
            S0 => dff_q_2
        );

    mux_inst_3: MUX2
        port map (
            O => mux_o_3,
            I0 => dpx9b_inst_6_douta(0),
            I1 => dpx9b_inst_7_douta(0),
            S0 => dff_q_2
        );

    mux_inst_4: MUX2
        port map (
            O => mux_o_4,
            I0 => mux_o_0,
            I1 => mux_o_1,
            S0 => dff_q_1
        );

    mux_inst_5: MUX2
        port map (
            O => mux_o_5,
            I0 => mux_o_2,
            I1 => mux_o_3,
            S0 => dff_q_1
        );

    mux_inst_6: MUX2
        port map (
            O => douta(0),
            I0 => mux_o_4,
            I1 => mux_o_5,
            S0 => dff_q_0
        );

    mux_inst_7: MUX2
        port map (
            O => mux_o_7,
            I0 => dpx9b_inst_0_douta(1),
            I1 => dpx9b_inst_1_douta(1),
            S0 => dff_q_2
        );

    mux_inst_8: MUX2
        port map (
            O => mux_o_8,
            I0 => dpx9b_inst_2_douta(1),
            I1 => dpx9b_inst_3_douta(1),
            S0 => dff_q_2
        );

    mux_inst_9: MUX2
        port map (
            O => mux_o_9,
            I0 => dpx9b_inst_4_douta(1),
            I1 => dpx9b_inst_5_douta(1),
            S0 => dff_q_2
        );

    mux_inst_10: MUX2
        port map (
            O => mux_o_10,
            I0 => dpx9b_inst_6_douta(1),
            I1 => dpx9b_inst_7_douta(1),
            S0 => dff_q_2
        );

    mux_inst_11: MUX2
        port map (
            O => mux_o_11,
            I0 => mux_o_7,
            I1 => mux_o_8,
            S0 => dff_q_1
        );

    mux_inst_12: MUX2
        port map (
            O => mux_o_12,
            I0 => mux_o_9,
            I1 => mux_o_10,
            S0 => dff_q_1
        );

    mux_inst_13: MUX2
        port map (
            O => douta(1),
            I0 => mux_o_11,
            I1 => mux_o_12,
            S0 => dff_q_0
        );

    mux_inst_14: MUX2
        port map (
            O => mux_o_14,
            I0 => dpx9b_inst_0_douta(2),
            I1 => dpx9b_inst_1_douta(2),
            S0 => dff_q_2
        );

    mux_inst_15: MUX2
        port map (
            O => mux_o_15,
            I0 => dpx9b_inst_2_douta(2),
            I1 => dpx9b_inst_3_douta(2),
            S0 => dff_q_2
        );

    mux_inst_16: MUX2
        port map (
            O => mux_o_16,
            I0 => dpx9b_inst_4_douta(2),
            I1 => dpx9b_inst_5_douta(2),
            S0 => dff_q_2
        );

    mux_inst_17: MUX2
        port map (
            O => mux_o_17,
            I0 => dpx9b_inst_6_douta(2),
            I1 => dpx9b_inst_7_douta(2),
            S0 => dff_q_2
        );

    mux_inst_18: MUX2
        port map (
            O => mux_o_18,
            I0 => mux_o_14,
            I1 => mux_o_15,
            S0 => dff_q_1
        );

    mux_inst_19: MUX2
        port map (
            O => mux_o_19,
            I0 => mux_o_16,
            I1 => mux_o_17,
            S0 => dff_q_1
        );

    mux_inst_20: MUX2
        port map (
            O => douta(2),
            I0 => mux_o_18,
            I1 => mux_o_19,
            S0 => dff_q_0
        );

    mux_inst_21: MUX2
        port map (
            O => mux_o_21,
            I0 => dpx9b_inst_0_douta(3),
            I1 => dpx9b_inst_1_douta(3),
            S0 => dff_q_2
        );

    mux_inst_22: MUX2
        port map (
            O => mux_o_22,
            I0 => dpx9b_inst_2_douta(3),
            I1 => dpx9b_inst_3_douta(3),
            S0 => dff_q_2
        );

    mux_inst_23: MUX2
        port map (
            O => mux_o_23,
            I0 => dpx9b_inst_4_douta(3),
            I1 => dpx9b_inst_5_douta(3),
            S0 => dff_q_2
        );

    mux_inst_24: MUX2
        port map (
            O => mux_o_24,
            I0 => dpx9b_inst_6_douta(3),
            I1 => dpx9b_inst_7_douta(3),
            S0 => dff_q_2
        );

    mux_inst_25: MUX2
        port map (
            O => mux_o_25,
            I0 => mux_o_21,
            I1 => mux_o_22,
            S0 => dff_q_1
        );

    mux_inst_26: MUX2
        port map (
            O => mux_o_26,
            I0 => mux_o_23,
            I1 => mux_o_24,
            S0 => dff_q_1
        );

    mux_inst_27: MUX2
        port map (
            O => douta(3),
            I0 => mux_o_25,
            I1 => mux_o_26,
            S0 => dff_q_0
        );

    mux_inst_28: MUX2
        port map (
            O => mux_o_28,
            I0 => dpx9b_inst_0_douta(4),
            I1 => dpx9b_inst_1_douta(4),
            S0 => dff_q_2
        );

    mux_inst_29: MUX2
        port map (
            O => mux_o_29,
            I0 => dpx9b_inst_2_douta(4),
            I1 => dpx9b_inst_3_douta(4),
            S0 => dff_q_2
        );

    mux_inst_30: MUX2
        port map (
            O => mux_o_30,
            I0 => dpx9b_inst_4_douta(4),
            I1 => dpx9b_inst_5_douta(4),
            S0 => dff_q_2
        );

    mux_inst_31: MUX2
        port map (
            O => mux_o_31,
            I0 => dpx9b_inst_6_douta(4),
            I1 => dpx9b_inst_7_douta(4),
            S0 => dff_q_2
        );

    mux_inst_32: MUX2
        port map (
            O => mux_o_32,
            I0 => mux_o_28,
            I1 => mux_o_29,
            S0 => dff_q_1
        );

    mux_inst_33: MUX2
        port map (
            O => mux_o_33,
            I0 => mux_o_30,
            I1 => mux_o_31,
            S0 => dff_q_1
        );

    mux_inst_34: MUX2
        port map (
            O => douta(4),
            I0 => mux_o_32,
            I1 => mux_o_33,
            S0 => dff_q_0
        );

    mux_inst_35: MUX2
        port map (
            O => mux_o_35,
            I0 => dpx9b_inst_0_douta(5),
            I1 => dpx9b_inst_1_douta(5),
            S0 => dff_q_2
        );

    mux_inst_36: MUX2
        port map (
            O => mux_o_36,
            I0 => dpx9b_inst_2_douta(5),
            I1 => dpx9b_inst_3_douta(5),
            S0 => dff_q_2
        );

    mux_inst_37: MUX2
        port map (
            O => mux_o_37,
            I0 => dpx9b_inst_4_douta(5),
            I1 => dpx9b_inst_5_douta(5),
            S0 => dff_q_2
        );

    mux_inst_38: MUX2
        port map (
            O => mux_o_38,
            I0 => dpx9b_inst_6_douta(5),
            I1 => dpx9b_inst_7_douta(5),
            S0 => dff_q_2
        );

    mux_inst_39: MUX2
        port map (
            O => mux_o_39,
            I0 => mux_o_35,
            I1 => mux_o_36,
            S0 => dff_q_1
        );

    mux_inst_40: MUX2
        port map (
            O => mux_o_40,
            I0 => mux_o_37,
            I1 => mux_o_38,
            S0 => dff_q_1
        );

    mux_inst_41: MUX2
        port map (
            O => douta(5),
            I0 => mux_o_39,
            I1 => mux_o_40,
            S0 => dff_q_0
        );

    mux_inst_42: MUX2
        port map (
            O => mux_o_42,
            I0 => dpx9b_inst_0_douta(6),
            I1 => dpx9b_inst_1_douta(6),
            S0 => dff_q_2
        );

    mux_inst_43: MUX2
        port map (
            O => mux_o_43,
            I0 => dpx9b_inst_2_douta(6),
            I1 => dpx9b_inst_3_douta(6),
            S0 => dff_q_2
        );

    mux_inst_44: MUX2
        port map (
            O => mux_o_44,
            I0 => dpx9b_inst_4_douta(6),
            I1 => dpx9b_inst_5_douta(6),
            S0 => dff_q_2
        );

    mux_inst_45: MUX2
        port map (
            O => mux_o_45,
            I0 => dpx9b_inst_6_douta(6),
            I1 => dpx9b_inst_7_douta(6),
            S0 => dff_q_2
        );

    mux_inst_46: MUX2
        port map (
            O => mux_o_46,
            I0 => mux_o_42,
            I1 => mux_o_43,
            S0 => dff_q_1
        );

    mux_inst_47: MUX2
        port map (
            O => mux_o_47,
            I0 => mux_o_44,
            I1 => mux_o_45,
            S0 => dff_q_1
        );

    mux_inst_48: MUX2
        port map (
            O => douta(6),
            I0 => mux_o_46,
            I1 => mux_o_47,
            S0 => dff_q_0
        );

    mux_inst_49: MUX2
        port map (
            O => mux_o_49,
            I0 => dpx9b_inst_0_douta(7),
            I1 => dpx9b_inst_1_douta(7),
            S0 => dff_q_2
        );

    mux_inst_50: MUX2
        port map (
            O => mux_o_50,
            I0 => dpx9b_inst_2_douta(7),
            I1 => dpx9b_inst_3_douta(7),
            S0 => dff_q_2
        );

    mux_inst_51: MUX2
        port map (
            O => mux_o_51,
            I0 => dpx9b_inst_4_douta(7),
            I1 => dpx9b_inst_5_douta(7),
            S0 => dff_q_2
        );

    mux_inst_52: MUX2
        port map (
            O => mux_o_52,
            I0 => dpx9b_inst_6_douta(7),
            I1 => dpx9b_inst_7_douta(7),
            S0 => dff_q_2
        );

    mux_inst_53: MUX2
        port map (
            O => mux_o_53,
            I0 => mux_o_49,
            I1 => mux_o_50,
            S0 => dff_q_1
        );

    mux_inst_54: MUX2
        port map (
            O => mux_o_54,
            I0 => mux_o_51,
            I1 => mux_o_52,
            S0 => dff_q_1
        );

    mux_inst_55: MUX2
        port map (
            O => douta(7),
            I0 => mux_o_53,
            I1 => mux_o_54,
            S0 => dff_q_0
        );

    mux_inst_56: MUX2
        port map (
            O => mux_o_56,
            I0 => dpx9b_inst_0_douta(8),
            I1 => dpx9b_inst_1_douta(8),
            S0 => dff_q_2
        );

    mux_inst_57: MUX2
        port map (
            O => mux_o_57,
            I0 => dpx9b_inst_2_douta(8),
            I1 => dpx9b_inst_3_douta(8),
            S0 => dff_q_2
        );

    mux_inst_58: MUX2
        port map (
            O => mux_o_58,
            I0 => dpx9b_inst_4_douta(8),
            I1 => dpx9b_inst_5_douta(8),
            S0 => dff_q_2
        );

    mux_inst_59: MUX2
        port map (
            O => mux_o_59,
            I0 => dpx9b_inst_6_douta(8),
            I1 => dpx9b_inst_7_douta(8),
            S0 => dff_q_2
        );

    mux_inst_60: MUX2
        port map (
            O => mux_o_60,
            I0 => mux_o_56,
            I1 => mux_o_57,
            S0 => dff_q_1
        );

    mux_inst_61: MUX2
        port map (
            O => mux_o_61,
            I0 => mux_o_58,
            I1 => mux_o_59,
            S0 => dff_q_1
        );

    mux_inst_62: MUX2
        port map (
            O => douta(8),
            I0 => mux_o_60,
            I1 => mux_o_61,
            S0 => dff_q_0
        );

    mux_inst_63: MUX2
        port map (
            O => mux_o_63,
            I0 => dpx9b_inst_0_doutb(0),
            I1 => dpx9b_inst_1_doutb(0),
            S0 => dff_q_8
        );

    mux_inst_64: MUX2
        port map (
            O => mux_o_64,
            I0 => dpx9b_inst_2_doutb(0),
            I1 => dpx9b_inst_3_doutb(0),
            S0 => dff_q_8
        );

    mux_inst_65: MUX2
        port map (
            O => mux_o_65,
            I0 => dpx9b_inst_4_doutb(0),
            I1 => dpx9b_inst_5_doutb(0),
            S0 => dff_q_8
        );

    mux_inst_66: MUX2
        port map (
            O => mux_o_66,
            I0 => dpx9b_inst_6_doutb(0),
            I1 => dpx9b_inst_7_doutb(0),
            S0 => dff_q_8
        );

    mux_inst_67: MUX2
        port map (
            O => mux_o_67,
            I0 => mux_o_63,
            I1 => mux_o_64,
            S0 => dff_q_6
        );

    mux_inst_68: MUX2
        port map (
            O => mux_o_68,
            I0 => mux_o_65,
            I1 => mux_o_66,
            S0 => dff_q_6
        );

    mux_inst_69: MUX2
        port map (
            O => doutb(0),
            I0 => mux_o_67,
            I1 => mux_o_68,
            S0 => dff_q_4
        );

    mux_inst_70: MUX2
        port map (
            O => mux_o_70,
            I0 => dpx9b_inst_0_doutb(1),
            I1 => dpx9b_inst_1_doutb(1),
            S0 => dff_q_8
        );

    mux_inst_71: MUX2
        port map (
            O => mux_o_71,
            I0 => dpx9b_inst_2_doutb(1),
            I1 => dpx9b_inst_3_doutb(1),
            S0 => dff_q_8
        );

    mux_inst_72: MUX2
        port map (
            O => mux_o_72,
            I0 => dpx9b_inst_4_doutb(1),
            I1 => dpx9b_inst_5_doutb(1),
            S0 => dff_q_8
        );

    mux_inst_73: MUX2
        port map (
            O => mux_o_73,
            I0 => dpx9b_inst_6_doutb(1),
            I1 => dpx9b_inst_7_doutb(1),
            S0 => dff_q_8
        );

    mux_inst_74: MUX2
        port map (
            O => mux_o_74,
            I0 => mux_o_70,
            I1 => mux_o_71,
            S0 => dff_q_6
        );

    mux_inst_75: MUX2
        port map (
            O => mux_o_75,
            I0 => mux_o_72,
            I1 => mux_o_73,
            S0 => dff_q_6
        );

    mux_inst_76: MUX2
        port map (
            O => doutb(1),
            I0 => mux_o_74,
            I1 => mux_o_75,
            S0 => dff_q_4
        );

    mux_inst_77: MUX2
        port map (
            O => mux_o_77,
            I0 => dpx9b_inst_0_doutb(2),
            I1 => dpx9b_inst_1_doutb(2),
            S0 => dff_q_8
        );

    mux_inst_78: MUX2
        port map (
            O => mux_o_78,
            I0 => dpx9b_inst_2_doutb(2),
            I1 => dpx9b_inst_3_doutb(2),
            S0 => dff_q_8
        );

    mux_inst_79: MUX2
        port map (
            O => mux_o_79,
            I0 => dpx9b_inst_4_doutb(2),
            I1 => dpx9b_inst_5_doutb(2),
            S0 => dff_q_8
        );

    mux_inst_80: MUX2
        port map (
            O => mux_o_80,
            I0 => dpx9b_inst_6_doutb(2),
            I1 => dpx9b_inst_7_doutb(2),
            S0 => dff_q_8
        );

    mux_inst_81: MUX2
        port map (
            O => mux_o_81,
            I0 => mux_o_77,
            I1 => mux_o_78,
            S0 => dff_q_6
        );

    mux_inst_82: MUX2
        port map (
            O => mux_o_82,
            I0 => mux_o_79,
            I1 => mux_o_80,
            S0 => dff_q_6
        );

    mux_inst_83: MUX2
        port map (
            O => doutb(2),
            I0 => mux_o_81,
            I1 => mux_o_82,
            S0 => dff_q_4
        );

    mux_inst_84: MUX2
        port map (
            O => mux_o_84,
            I0 => dpx9b_inst_0_doutb(3),
            I1 => dpx9b_inst_1_doutb(3),
            S0 => dff_q_8
        );

    mux_inst_85: MUX2
        port map (
            O => mux_o_85,
            I0 => dpx9b_inst_2_doutb(3),
            I1 => dpx9b_inst_3_doutb(3),
            S0 => dff_q_8
        );

    mux_inst_86: MUX2
        port map (
            O => mux_o_86,
            I0 => dpx9b_inst_4_doutb(3),
            I1 => dpx9b_inst_5_doutb(3),
            S0 => dff_q_8
        );

    mux_inst_87: MUX2
        port map (
            O => mux_o_87,
            I0 => dpx9b_inst_6_doutb(3),
            I1 => dpx9b_inst_7_doutb(3),
            S0 => dff_q_8
        );

    mux_inst_88: MUX2
        port map (
            O => mux_o_88,
            I0 => mux_o_84,
            I1 => mux_o_85,
            S0 => dff_q_6
        );

    mux_inst_89: MUX2
        port map (
            O => mux_o_89,
            I0 => mux_o_86,
            I1 => mux_o_87,
            S0 => dff_q_6
        );

    mux_inst_90: MUX2
        port map (
            O => doutb(3),
            I0 => mux_o_88,
            I1 => mux_o_89,
            S0 => dff_q_4
        );

    mux_inst_91: MUX2
        port map (
            O => mux_o_91,
            I0 => dpx9b_inst_0_doutb(4),
            I1 => dpx9b_inst_1_doutb(4),
            S0 => dff_q_8
        );

    mux_inst_92: MUX2
        port map (
            O => mux_o_92,
            I0 => dpx9b_inst_2_doutb(4),
            I1 => dpx9b_inst_3_doutb(4),
            S0 => dff_q_8
        );

    mux_inst_93: MUX2
        port map (
            O => mux_o_93,
            I0 => dpx9b_inst_4_doutb(4),
            I1 => dpx9b_inst_5_doutb(4),
            S0 => dff_q_8
        );

    mux_inst_94: MUX2
        port map (
            O => mux_o_94,
            I0 => dpx9b_inst_6_doutb(4),
            I1 => dpx9b_inst_7_doutb(4),
            S0 => dff_q_8
        );

    mux_inst_95: MUX2
        port map (
            O => mux_o_95,
            I0 => mux_o_91,
            I1 => mux_o_92,
            S0 => dff_q_6
        );

    mux_inst_96: MUX2
        port map (
            O => mux_o_96,
            I0 => mux_o_93,
            I1 => mux_o_94,
            S0 => dff_q_6
        );

    mux_inst_97: MUX2
        port map (
            O => doutb(4),
            I0 => mux_o_95,
            I1 => mux_o_96,
            S0 => dff_q_4
        );

    mux_inst_98: MUX2
        port map (
            O => mux_o_98,
            I0 => dpx9b_inst_0_doutb(5),
            I1 => dpx9b_inst_1_doutb(5),
            S0 => dff_q_8
        );

    mux_inst_99: MUX2
        port map (
            O => mux_o_99,
            I0 => dpx9b_inst_2_doutb(5),
            I1 => dpx9b_inst_3_doutb(5),
            S0 => dff_q_8
        );

    mux_inst_100: MUX2
        port map (
            O => mux_o_100,
            I0 => dpx9b_inst_4_doutb(5),
            I1 => dpx9b_inst_5_doutb(5),
            S0 => dff_q_8
        );

    mux_inst_101: MUX2
        port map (
            O => mux_o_101,
            I0 => dpx9b_inst_6_doutb(5),
            I1 => dpx9b_inst_7_doutb(5),
            S0 => dff_q_8
        );

    mux_inst_102: MUX2
        port map (
            O => mux_o_102,
            I0 => mux_o_98,
            I1 => mux_o_99,
            S0 => dff_q_6
        );

    mux_inst_103: MUX2
        port map (
            O => mux_o_103,
            I0 => mux_o_100,
            I1 => mux_o_101,
            S0 => dff_q_6
        );

    mux_inst_104: MUX2
        port map (
            O => doutb(5),
            I0 => mux_o_102,
            I1 => mux_o_103,
            S0 => dff_q_4
        );

    mux_inst_105: MUX2
        port map (
            O => mux_o_105,
            I0 => dpx9b_inst_0_doutb(6),
            I1 => dpx9b_inst_1_doutb(6),
            S0 => dff_q_8
        );

    mux_inst_106: MUX2
        port map (
            O => mux_o_106,
            I0 => dpx9b_inst_2_doutb(6),
            I1 => dpx9b_inst_3_doutb(6),
            S0 => dff_q_8
        );

    mux_inst_107: MUX2
        port map (
            O => mux_o_107,
            I0 => dpx9b_inst_4_doutb(6),
            I1 => dpx9b_inst_5_doutb(6),
            S0 => dff_q_8
        );

    mux_inst_108: MUX2
        port map (
            O => mux_o_108,
            I0 => dpx9b_inst_6_doutb(6),
            I1 => dpx9b_inst_7_doutb(6),
            S0 => dff_q_8
        );

    mux_inst_109: MUX2
        port map (
            O => mux_o_109,
            I0 => mux_o_105,
            I1 => mux_o_106,
            S0 => dff_q_6
        );

    mux_inst_110: MUX2
        port map (
            O => mux_o_110,
            I0 => mux_o_107,
            I1 => mux_o_108,
            S0 => dff_q_6
        );

    mux_inst_111: MUX2
        port map (
            O => doutb(6),
            I0 => mux_o_109,
            I1 => mux_o_110,
            S0 => dff_q_4
        );

    mux_inst_112: MUX2
        port map (
            O => mux_o_112,
            I0 => dpx9b_inst_0_doutb(7),
            I1 => dpx9b_inst_1_doutb(7),
            S0 => dff_q_8
        );

    mux_inst_113: MUX2
        port map (
            O => mux_o_113,
            I0 => dpx9b_inst_2_doutb(7),
            I1 => dpx9b_inst_3_doutb(7),
            S0 => dff_q_8
        );

    mux_inst_114: MUX2
        port map (
            O => mux_o_114,
            I0 => dpx9b_inst_4_doutb(7),
            I1 => dpx9b_inst_5_doutb(7),
            S0 => dff_q_8
        );

    mux_inst_115: MUX2
        port map (
            O => mux_o_115,
            I0 => dpx9b_inst_6_doutb(7),
            I1 => dpx9b_inst_7_doutb(7),
            S0 => dff_q_8
        );

    mux_inst_116: MUX2
        port map (
            O => mux_o_116,
            I0 => mux_o_112,
            I1 => mux_o_113,
            S0 => dff_q_6
        );

    mux_inst_117: MUX2
        port map (
            O => mux_o_117,
            I0 => mux_o_114,
            I1 => mux_o_115,
            S0 => dff_q_6
        );

    mux_inst_118: MUX2
        port map (
            O => doutb(7),
            I0 => mux_o_116,
            I1 => mux_o_117,
            S0 => dff_q_4
        );

    mux_inst_119: MUX2
        port map (
            O => mux_o_119,
            I0 => dpx9b_inst_0_doutb(8),
            I1 => dpx9b_inst_1_doutb(8),
            S0 => dff_q_8
        );

    mux_inst_120: MUX2
        port map (
            O => mux_o_120,
            I0 => dpx9b_inst_2_doutb(8),
            I1 => dpx9b_inst_3_doutb(8),
            S0 => dff_q_8
        );

    mux_inst_121: MUX2
        port map (
            O => mux_o_121,
            I0 => dpx9b_inst_4_doutb(8),
            I1 => dpx9b_inst_5_doutb(8),
            S0 => dff_q_8
        );

    mux_inst_122: MUX2
        port map (
            O => mux_o_122,
            I0 => dpx9b_inst_6_doutb(8),
            I1 => dpx9b_inst_7_doutb(8),
            S0 => dff_q_8
        );

    mux_inst_123: MUX2
        port map (
            O => mux_o_123,
            I0 => mux_o_119,
            I1 => mux_o_120,
            S0 => dff_q_6
        );

    mux_inst_124: MUX2
        port map (
            O => mux_o_124,
            I0 => mux_o_121,
            I1 => mux_o_122,
            S0 => dff_q_6
        );

    mux_inst_125: MUX2
        port map (
            O => doutb(8),
            I0 => mux_o_123,
            I1 => mux_o_124,
            S0 => dff_q_4
        );

end Behavioral; --Gowin_DPB_osd
