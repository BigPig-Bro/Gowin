
-- ===========Oooo==========================================Oooo========
-- =  Copyright (C) 2014-2023 Gowin Semiconductor Technology Co.,Ltd.
-- =                     All rights reserved.
-- =====================================================================
--
--  __      __      __
--  \ \    /  \    / /   [File name   ] prim_syn.vhd
--   \ \  / /\ \  / /    [Description ] GW5AT VHDL functional synthesis library
--    \ \/ /  \ \/ /     [Timestamp   ] Sun April 24 11:00:30 2022
--     \  /    \  /      [version     ] 1.9.5
--      \/      \/       
--
-- ===========Oooo==========================================Oooo========


---------------------------package global------------------------------

LIBRARY ieee; 
USE ieee.std_logic_1164.all; 
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

PACKAGE components IS 
   attribute syn_black_box: boolean ;
   attribute syn_black_box of Components : package is true;
   attribute black_box_pad_pin: string;
   attribute syn_noprune : boolean;
   attribute xc_map: string;
   attribute xc_map of Components : package is "lut"; 	
------------------------------GSR---------------------------------------

COMPONENT GSR 
    PORT (
        GSRI : in std_logic
    );
end COMPONENT;

	attribute syn_black_box of GSR : Component is true;
    attribute syn_noprune of GSR : Component is true;

--------------------------LUT1------------------------------
COMPONENT LUT1 
    GENERIC ( INIT : bit_vector := X"0" );
    PORT (
        F : out std_logic;
        I0 : in std_logic
    );
end COMPONENT;

    attribute syn_black_box of LUT1 : Component is true;
    attribute xc_map of LUT1 : component is "lut";
	
--------------------------LUT2 -----------------------------
COMPONENT LUT2 
    GENERIC ( 
        INIT : bit_vector := X"0" 
    );
    PORT (
   	    F : out std_logic;
   	    I0 : in std_logic;
   	    I1 : in std_logic
    );
end COMPONENT;

	attribute syn_black_box of LUT2 : Component is true;
	attribute xc_map of LUT2 : component is "lut";

--------------------------LUT3------------------------------
COMPONENT LUT3 
    GENERIC ( 
        INIT : bit_vector := X"00" 
    );
    PORT (
   	    F : out std_logic;
   	    I0 : in std_logic;
   	    I1 : in std_logic;
   	    I2 : in std_logic
    );
end COMPONENT;
	attribute syn_black_box of LUT3 : Component is true;
	attribute xc_map of LUT3 : component is "lut";

--------------------------LUT4 -----------------------------
COMPONENT LUT4 
    GENERIC ( 
        INIT : bit_vector := X"0000" 
    );
    PORT (
   	    F : out std_logic;
   	    I0 : in std_logic;
   	    I1 : in std_logic;
   	    I2 : in std_logic;
   	    I3 : in std_logic
    );
end COMPONENT;
	attribute syn_black_box of LUT4 : Component is true;
	attribute xc_map of LUT4 : component is "lut";
    
--------------------------LUT5 -----------------------------
COMPONENT LUT5 
    GENERIC ( 
        INIT : bit_vector := X"00000000" 
    );
    PORT (
   	    F : out std_logic;
   	    I0 : in std_logic;
   	    I1 : in std_logic;
   	    I2 : in std_logic;
   	    I3 : in std_logic;
   	    I4 : in std_logic
    );
end COMPONENT;
	attribute syn_black_box of LUT5 : Component is true;
	attribute xc_map of LUT5 : component is "lut";
    
--------------------------LUT6 -----------------------------
COMPONENT LUT6 
    GENERIC ( 
        INIT : bit_vector := X"0000000000000000" 
    );
    PORT (
   	    F : out std_logic;
   	    I0 : in std_logic;
   	    I1 : in std_logic;
   	    I2 : in std_logic;
   	    I3 : in std_logic;
   	    I4 : in std_logic;
   	    I5 : in std_logic
    );
end COMPONENT;
	attribute syn_black_box of LUT6 : Component is true;
	attribute xc_map of LUT6 : component is "lut";

--------------------------LUT7 -----------------------------

COMPONENT LUT7 
    GENERIC ( 
        INIT : bit_vector := X"00000000000000000000000000000000" 
    );
    PORT (
   	    F : out std_logic;
   	    I0 : in std_logic;
   	    I1 : in std_logic;
   	    I2 : in std_logic;
   	    I3 : in std_logic;
   	    I4 : in std_logic;
    	I5 : in std_logic;
   	    I6 : in std_logic
    );
end COMPONENT;
	attribute syn_black_box of LUT7 : Component is true;
	attribute xc_map of LUT7 : component is "lut";

--------------------------LUT8 -----------------------------
COMPONENT LUT8 
    GENERIC ( 
        INIT : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000" 
    );
    PORT (
   	    F : out std_logic;
   	    I0 : in std_logic;
   	    I1 : in std_logic;
   	    I2 : in std_logic;
   	    I3 : in std_logic;
   	    I4 : in std_logic;
   	    I5 : in std_logic;
   	    I6 : in std_logic;
   	    I7 : in std_logic
    );
end COMPONENT;
	attribute syn_black_box of LUT8 : Component is true;
	attribute xc_map of LUT8 : component is "lut";

--------------------------MUX2------------------------------
COMPONENT MUX2 
    PORT (
	    I0 : in std_logic;
	    I1 : in std_logic;
	    S0 : in std_logic;
	    O : out std_logic
    );
end COMPONENT;
	attribute syn_black_box of MUX2 : Component is true;

--------------------------MUX2_LUT5------------------------------
COMPONENT MUX2_LUT5 
    PORT (
	    I0 : in std_logic;
	    I1 : in std_logic;
	    S0 : in std_logic;
	    O : out std_logic
    );
end COMPONENT;
	attribute syn_black_box of MUX2_LUT5 : Component is true;

--------------------------MUX2_LUT6------------------------------
COMPONENT MUX2_LUT6 
    PORT (
	    I0 : in std_logic;
	    I1 : in std_logic;
	    S0 : in std_logic;
	    O : out std_logic
    );
end COMPONENT;
	attribute syn_black_box of MUX2_LUT6 : Component is true;

--------------------------MUX2_LUT7------------------------------
COMPONENT MUX2_LUT7 
    PORT (
	    I0 : in std_logic;
	    I1 : in std_logic;
	    S0 : in std_logic;
	    O : out std_logic
    );
end COMPONENT;
	attribute syn_black_box of MUX2_LUT7 : Component is true;

--------------------------MUX2_LUT8------------------------------
COMPONENT MUX2_LUT8 
    PORT (
	    I0 : in std_logic;
	    I1 : in std_logic;
	    S0 : in std_logic;
	    O : out std_logic
    );
end COMPONENT;
	attribute syn_black_box of MUX2_LUT8 : Component is true;

--------------------------MUX2_MUX8------------------------------
COMPONENT MUX2_MUX8 
    PORT (
	    I0 : in std_logic;
	    I1 : in std_logic;
	    S0 : in std_logic;
	    O : out std_logic
    );
end COMPONENT;
	attribute syn_black_box of MUX2_MUX8 : Component is true;

--------------------------MUX2_MUX16------------------------------
COMPONENT MUX2_MUX16 
    PORT (
	    I0 : in std_logic;
	    I1 : in std_logic;
	    S0 : in std_logic;
	    O : out std_logic
    );
end COMPONENT;
	attribute syn_black_box of MUX2_MUX16 : Component is true;

--------------------------MUX2_MUX32------------------------------
COMPONENT MUX2_MUX32 
    PORT (
	    I0 : in std_logic;
	    I1 : in std_logic;
	    S0 : in std_logic;
	    O : out std_logic
    );
end COMPONENT;
	attribute syn_black_box of MUX2_MUX32 : Component is true;
    
--------------------------MUX4------------------------------
COMPONENT MUX4 
    PORT (
	    I0 : in std_logic;
	    I1 : in std_logic;
	    I2 : in std_logic; 
	    I3 : in std_logic;
	    S0 : in std_logic;
	    S1 : in std_logic;
	    O : out std_logic
    );
end COMPONENT;
	attribute syn_black_box of MUX4 : Component is true;

--------------------------MUX8------------------------------
COMPONENT MUX8 
    PORT (
	    I0 : in std_logic;
	    I1 : in std_logic;
	    I2 : in std_logic; 
	    I3 : in std_logic;
	    I4 : in std_logic;
	    I5 : in std_logic;
	    I6 : in std_logic;
	    I7 : in std_logic;
	    S0 : in std_logic;
	    S1 : in std_logic;
	    S2 : in std_logic;
	    O : out std_logic
    );
end COMPONENT;
	attribute syn_black_box of MUX8 : Component is true;

--------------------------MUX16-----------------------------
COMPONENT MUX16  
    PORT (
	    I0 : in std_logic;
	    I1 : in std_logic;
	    I2 : in std_logic; 
	    I3 : in std_logic;
	    I4 : in std_logic;
	    I5 : in std_logic;
	    I6 : in std_logic;
	    I7 : in std_logic;
	    I8 : in std_logic;
	    I9 : in std_logic;
	    I10 : in std_logic;
	    I11 : in std_logic;
	    I12 : in std_logic;
	    I13 : in std_logic;
	    I14 : in std_logic;
	    I15 : in std_logic;
	    S0 : in std_logic;
	    S1 : in std_logic;
	    S2 : in std_logic;
	    S3 : in std_logic;
	    O : out std_logic
    );
end COMPONENT;
	attribute syn_black_box of MUX16 : Component is true;

--------------------------MUX32-----------------------------
COMPONENT MUX32  
    PORT (
	    I0 : in std_logic;
	    I1 : in std_logic;
	    I2 : in std_logic; 
	    I3 : in std_logic;
	    I4 : in std_logic;
	    I5 : in std_logic;
	    I6 : in std_logic;
	    I7 : in std_logic;
	    I8 : in std_logic;
	    I9 : in std_logic;
	    I10 : in std_logic;
	    I11 : in std_logic;
	    I12 : in std_logic;
	    I13 : in std_logic;
	    I14 : in std_logic;
	    I15 : in std_logic;
	    I16 : in std_logic;
	    I17 : in std_logic;
	    I18 : in std_logic;
	    I19 : in std_logic;
	    I20 : in std_logic;
	    I21 : in std_logic;
	    I22 : in std_logic;
	    I23:  in std_logic;
	    I24 : in std_logic;
	    I25 : in std_logic;
	    I26 : in std_logic;
	    I27 : in std_logic;
	    I28 : in std_logic;
	    I29 : in std_logic;
	    I30 : in std_logic;
	    I31 : in std_logic; 
	    S0 : in std_logic;
	    S1 : in std_logic;
	    S2 : in std_logic;
	    S3 : in std_logic;
	    S4 : in std_logic;
	    O : out std_logic
    );
end COMPONENT;
	attribute syn_black_box of MUX32 : Component is true;

--------------------------ALU-------------------------------
COMPONENT ALU 
    GENERIC (  
	    ALU_MODE : INTEGER := 0;
        ADD : INTEGER := 0 ;
       	SUB : INTEGER := 1 ;
        ADDSUB : INTEGER := 2 ;
       	NE : INTEGER := 3 ;
       	GE : INTEGER := 4 ;
	    LE : INTEGER := 5;
       	CUP : INTEGER := 6 ;
        CDN : INTEGER := 7 ;
        CUPCDN : INTEGER := 8
    );	
    PORT (
	    SUM : OUT std_logic;
	    COUT : OUT std_logic;	
	    I0 : IN std_logic;
	    I1: IN std_logic;
	    I3: IN std_logic;
	    CIN: IN std_logic
    );	
end COMPONENT;
	attribute syn_black_box of ALU : Component is true;

----------------------------DFFSE--------------------------------------
COMPONENT DFFSE 
    GENERIC ( 
        INIT : bit := '1'
    );	
    PORT (
	    Q : OUT std_logic;
	    D : IN std_logic;
	    SET : IN std_logic;
	    CE: IN std_logic;
	    CLK : IN std_logic
    );	
end COMPONENT;
	attribute syn_black_box of DFFSE : Component is true;

---------------------------DFFRE -------------------------------------

COMPONENT DFFRE 
    GENERIC ( 
        INIT : bit := '0' 
    );	
    PORT (
	    Q : OUT std_logic;	
	    D : IN std_logic;
	    RESET : IN std_logic;
	    CE: IN std_logic;	
	    CLK : IN std_logic
    );	
end COMPONENT;
	attribute syn_black_box of DFFRE : Component is true;

--------------------------DFFPE ---------------------------------------------
COMPONENT DFFPE 
    GENERIC ( 
        INIT : bit := '1' 
    );	
    PORT (
	    Q : OUT std_logic;	
	    D : IN std_logic;
	    PRESET : IN std_logic;
	    CE: IN std_logic;	
	    CLK : IN std_logic
    );	
end COMPONENT;
	attribute syn_black_box of DFFPE : Component is true;

   
-----------------------------DFFCE -------------------------------------------
COMPONENT DFFCE 
    GENERIC ( 
        INIT : bit := '0' 
    );	
    PORT (
	    Q : OUT std_logic;
	    D : IN std_logic;
	    CLEAR : IN std_logic;
	    CE: IN std_logic;	
	    CLK : IN std_logic
    );
end COMPONENT;
	attribute syn_black_box of DFFCE : Component is true;

-----------------------------DLCE ------------------------------------
COMPONENT DLCE 
    GENERIC ( 
        INIT : bit := '0' 
    );	
    PORT (
	    Q : OUT std_logic;	
	    D : IN std_logic;
	    CLEAR : IN std_logic;	
	    G : IN std_logic;
	    GE: IN std_logic
    );	
end COMPONENT;
	attribute syn_black_box of DLCE : Component is true;

-----------------------------DLPE ------------------------------------
COMPONENT DLPE 
    GENERIC ( 
        INIT : bit := '1' 
    );	
    PORT (
	    Q : OUT std_logic;	
	    D : IN std_logic;
	    PRESET : IN std_logic;	
	    G : IN std_logic;
	    GE: IN std_logic
    );	
end COMPONENT;
	attribute syn_black_box of DLPE : Component is true;

--------------------------------RAM16S1--------------------------
COMPONENT RAM16S1 
    GENERIC ( 
        INIT_0 : bit_vector(15 downto 0) := X"0000" 
    );
    PORT (
		DO : out std_logic;
		CLK : in std_logic;
		WRE : in std_logic;
		AD : in std_logic_vector(3 downto 0);
		DI : in std_logic
    );
end COMPONENT;
	attribute syn_black_box of RAM16S1 : Component is true;

--------------------------------RAM16S2--------------------------
COMPONENT RAM16S2 
    GENERIC ( 
        INIT_0 : bit_vector(15 downto 0) := X"0000";
        INIT_1 : bit_vector(15 downto 0) := X"0000" 
    );
    PORT (
		DO : out std_logic_vector(1 downto 0);
		CLK : in std_logic;
		WRE : in std_logic;
		AD : in std_logic_vector(3 downto 0);
		DI : in std_logic_vector(1 downto 0)
    );
end COMPONENT;
	attribute syn_black_box of RAM16S2 : Component is true;
    
--------------------------------RAM16S4--------------------------
COMPONENT RAM16S4 
    GENERIC( 
        INIT_0 : bit_vector(15 downto 0) := X"0000";
        INIT_1 : bit_vector(15 downto 0) := X"0000";
        INIT_2 : bit_vector(15 downto 0) := X"0000";
        INIT_3 : bit_vector(15 downto 0) := X"0000"
    );
    PORT (
		DO : out std_logic_vector(3 downto 0); 
		CLK : in std_logic;
		WRE : in std_logic;
		AD : in std_logic_vector(3 downto 0);
		DI : in std_logic_vector(3 downto 0)
    );
end COMPONENT;
	attribute syn_black_box of RAM16S4 : Component is true;
    
--------------------------------RAM16SDP1--------------------------
COMPONENT RAM16SDP1 
    GENERIC( 
        INIT_0 : bit_vector(15 downto 0) := X"0000" 
    );
    PORT (
		DO : out std_logic;
		CLK : in std_logic;
		WRE : in std_logic;
		WAD : in std_logic_vector(3 downto 0);
		RAD : in std_logic_vector(3 downto 0);
		DI : in std_logic
    );
end COMPONENT;
	attribute syn_black_box of RAM16SDP1 : Component is true;

--------------------------------RAM16SDP2--------------------------
COMPONENT RAM16SDP2 
    GENERIC ( 
        INIT_0 : bit_vector(15 downto 0) := X"0000";
        INIT_1 : bit_vector(15 downto 0) := X"0000"
    );
    PORT (
	    DO : out std_logic_vector(1 downto 0);
	    CLK : in std_logic;
	    WRE : in std_logic;
	    WAD : in std_logic_vector(3 downto 0);
	    RAD : in std_logic_vector(3 downto 0);
	    DI : in std_logic_vector(1 downto 0)
    );
end COMPONENT;
	attribute syn_black_box of RAM16SDP2 : Component is true;

--------------------------------RAM16SDP4--------------------------
COMPONENT RAM16SDP4 
    GENERIC ( 
        INIT_0 : bit_vector(15 downto 0) := X"0000";
        INIT_1 : bit_vector(15 downto 0) := X"0000";
        INIT_2 : bit_vector(15 downto 0) := X"0000";
        INIT_3 : bit_vector(15 downto 0) := X"0000"
    );
    PORT (
		DO : out std_logic_vector(3 downto 0);
		CLK : in std_logic;
		WRE : in std_logic;
		WAD : in std_logic_vector(3 downto 0);
		RAD : in std_logic_vector(3 downto 0);
		DI : in std_logic_vector(3 downto 0)
    );
end COMPONENT;
	attribute syn_black_box of RAM16SDP4 : Component is true;

--------------------------------ROM16-----------------------------
COMPONENT ROM16 
    GENERIC ( 
        INIT_0 : bit_vector(15 downto 0) := X"0000" 
    );
    PORT (
 	    DO : out std_logic;
	    AD : in std_logic_vector(3 downto 0)
    );
end COMPONENT;
	attribute syn_black_box of ROM16 : Component is true;

-----------------INV---------------------------------
COMPONENT INV 
    PORT (
    	O : OUT std_logic;
    	I : IN std_logic
    );
end COMPONENT;
	attribute syn_black_box of INV : Component is true;

---------------------BUFG---------------------------
COMPONENT BUFG 
    PORT(
    	O : out std_logic;
    	I : in std_logic
    );
end COMPONENT;
	attribute syn_black_box of BUFG : Component is true;

-----------------BUFS--------------------
COMPONENT BUFS 
    PORT (
        O : out std_logic;
        I : in std_logic
    );
end COMPONENT;
	attribute syn_black_box of BUFS : Component is true;

----------------------GND-----------------
COMPONENT GND 
    PORT (
    	G : out std_logic
    );
end COMPONENT;
	attribute syn_black_box of GND : Component is true;

---------------------VCC------------------------
COMPONENT VCC 
    PORT (
    	V : out std_logic
    );
end COMPONENT;
	attribute syn_black_box of VCC : Component is true;

----------------------IBUF-------------------------------------
COMPONENT IBUF 
    PORT (
    	O : OUT std_logic;
    	I : IN std_logic
    );
end COMPONENT;
	attribute syn_black_box of IBUF : Component is true;

------------------------------OBUF---------------------------------------
COMPONENT OBUF 
    PORT (
    	O : OUT std_logic;
    	I : IN std_logic
    );
end COMPONENT;
	attribute syn_black_box of OBUF : Component is true;

------------------------------------TBUF---------------------------
COMPONENT TBUF 
    PORT (
    	O : OUT std_logic;
    	I : IN std_logic;
    	OEN : IN std_logic
    );
end COMPONENT;
	attribute syn_black_box of TBUF : Component is true;
    attribute black_box_pad_pin of TBUF : Component is "O";

----------------------------IOBUF--------------------------------
COMPONENT IOBUF
    PORT (
    	O  : OUT   std_logic;
    	IO : INOUT std_logic;
     	I  : IN    std_logic;
	    OEN : IN    std_logic
    );
end COMPONENT;
	attribute syn_black_box of IOBUF : Component is true;

-----------------TLVDS_IBUF---------------------------------
COMPONENT TLVDS_IBUF
    PORT(
        O : OUT std_logic;
        I : IN std_logic;
        IB : IN std_logic
    );
end COMPONENT;
    attribute syn_black_box of TLVDS_IBUF : Component is true;
    attribute black_box_pad_pin of TLVDS_IBUF : Component is "I, IB";

-----------------TLVDS_OBUF---------------------------------
COMPONENT TLVDS_OBUF
    PORT(
        O : OUT std_logic;
        OB : OUT std_logic;
        I : IN std_logic
    );
end COMPONENT;
    attribute syn_black_box of TLVDS_OBUF : Component is true;
    attribute black_box_pad_pin of TLVDS_OBUF : Component is "O, OB";

-----------------TLVDS_TBUF---------------------------------
COMPONENT TLVDS_TBUF
    PORT (
    	O  : OUT  std_logic;
    	OB : OUT  std_logic;
     	I  : IN   std_logic;
	    OEN : IN  std_logic
    );
end COMPONENT;
    attribute syn_black_box of TLVDS_TBUF : Component is true;
    attribute black_box_pad_pin of TLVDS_TBUF : Component is "O, OB";

-----------------TLVDS_IOBUF---------------------------------
COMPONENT TLVDS_IOBUF
    PORT (
    	O  : OUT  std_logic;
    	IOB : INOUT std_logic;
        IO : INOUT std_logic;
     	I  : IN std_logic;
	    OEN : IN std_logic
    );
end COMPONENT;
    attribute syn_black_box of TLVDS_IOBUF : Component is true;
    attribute black_box_pad_pin of TLVDS_IOBUF : Component is "IO, IOB";

-----------------ELVDS_OBUF---------------------------------
COMPONENT ELVDS_OBUF
    PORT(
        O : OUT std_logic;
        OB : OUT std_logic;
        I : IN std_logic
    );
end COMPONENT;
    attribute syn_black_box of ELVDS_OBUF : Component is true;
    attribute black_box_pad_pin of ELVDS_OBUF : Component is "O, OB";

-----------------ELVDS_TBUF---------------------------------
COMPONENT ELVDS_TBUF
    PORT (
    	O  : OUT std_logic;
    	OB : OUT std_logic;
     	I  : IN std_logic;
	    OEN : IN std_logic
    );
end COMPONENT;
    attribute syn_black_box of ELVDS_TBUF : Component is true;
    attribute black_box_pad_pin of ELVDS_TBUF : Component is "O, OB";

-----------------ELVDS_IOBUF---------------------------------
COMPONENT ELVDS_IOBUF
    PORT (
    	 O  : OUT std_logic;
    	 IOB : INOUT std_logic;
         IO : INOUT std_logic;
     	 I  : IN std_logic;
	     OEN : IN std_logic
    );
end COMPONENT;
    attribute syn_black_box of ELVDS_IOBUF : Component is true;
    attribute black_box_pad_pin of ELVDS_IOBUF : Component is "IO, IOB";


------------------------MIPI_IBUF------------------------------------
COMPONENT MIPI_IBUF
    PORT (
         OH, OL, OB : OUT std_logic;
         IO, IOB : INOUT std_logic;
         I, IB : IN std_logic;
         OEN, OENB, HSREN : IN std_logic
    );
end COMPONENT;
    attribute syn_black_box of MIPI_IBUF : Component is true;
    attribute black_box_pad_pin of MIPI_IBUF : Component is "IO, IOB";


----------------------------I3C_IOBUF--------------------------------

COMPONENT I3C_IOBUF 
    PORT (
    	O  : OUT   std_logic;
    	IO : INOUT std_logic;
     	I  : IN    std_logic;
	    MODESEL : IN    std_logic
    );
end COMPONENT;
	attribute syn_black_box of I3C_IOBUF : Component is true;
    attribute black_box_pad_pin of I3C_IOBUF : Component is "IO";


-------------------SP---------------------------------------
COMPONENT SP 
    GENERIC (
	 BIT_WIDTH : integer :=32; -- 1, 2, 4, 8, 16, 32
	 READ_MODE : bit := '0'; -- 0: bypass mode; 1: pipeline mode
	 WRITE_MODE : bit_vector := "00"; -- 00: normal mode; 01: write-through mode; 10: read-before-write mode
     BLK_SEL : bit_vector := "000";
     RESET_MODE : string := "SYNC"; --SYNC, ASYNC
	 INIT_RAM_00 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_01 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_02 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_03 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_04 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_05 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_06 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_07 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_08 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_09 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_0A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_0B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_0C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_0D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_0E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_0F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_10 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_11 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_12 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_13 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_14 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_15 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_16 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_17 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_18 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_19 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_1A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_1B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_1C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_1D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_1E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_1F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_20 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_21 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_22 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_23 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_24 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_25 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_26 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_27 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_28 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_29 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_2A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_2B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_2C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_2D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_2E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_2F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_30 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_31 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_32 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_33 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_34 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_35 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_36 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_37 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_38 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_39 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_3A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_3B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_3C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_3D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_3E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_3F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000"    
    );
    PORT (
	 DO : out std_logic_vector(31 downto 0):=conv_std_logic_vector(0,32);
	 CLK, CE,OCE,RESET,WRE : in std_logic;
	 AD : in std_logic_vector(13 downto 0);
     BLKSEL : in std_logic_vector(2 downto 0);
	 DI : in std_logic_vector(31 downto 0)
    );
end COMPONENT;
	attribute syn_black_box of SP : Component is true;

----------------------------SPX9---------------------------------------
COMPONENT SPX9 
    GENERIC ( 
	 BIT_WIDTH : integer :=9;
	 READ_MODE : bit := '0'; -- 0: bypass mode; 1: pipeline mode
	 WRITE_MODE : bit_vector :="00"; -- 00: normal mode; 01: write-through mode; 10: read-before-write mode
     BLK_SEL : bit_vector := "000";
     RESET_MODE : string := "SYNC"; --SYNC, ASYNC
	 INIT_RAM_00 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_01 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_02 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_03 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_04 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_05 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_06 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_07 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_08 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_09 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_0A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_0B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_0C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_0D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_0E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_0F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_10 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_11 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_12 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_13 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_14 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_15 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_16 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_17 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_18 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_19 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_1A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_1B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_1C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_1D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_1E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_1F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_20 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_21 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_22 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_23 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_24 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_25 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_26 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_27 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_28 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_29 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_2A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_2B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_2C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_2D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_2E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_2F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_30 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_31 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_32 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_33 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_34 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_35 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_36 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_37 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_38 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_39 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_3A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_3B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_3C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_3D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_3E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	 INIT_RAM_3F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000"    
    );
    PORT (
	 DO : out std_logic_vector(35 downto 0):=conv_std_logic_vector(0,36);
	 CLK, CE,OCE,RESET,WRE : in std_logic;
	 AD : in std_logic_vector(13 downto 0);
	 DI : in std_logic_vector(35 downto 0);
     BLKSEL : in std_logic_vector(2 downto 0)

    );
end COMPONENT;
	attribute syn_black_box of SPX9 : Component is true;


----------------------------------SDPB---------------------------------------
COMPONENT SDPB 
    GENERIC ( 
	    BIT_WIDTH_0 : integer :=16; -- 1, 2, 4, 8, 16, 32
	    BIT_WIDTH_1 : integer :=16; -- 1, 2, 4, 8, 16, 32
	    READ_MODE : bit := '0'; -- 0: bypass mode; 1: pipeline mode
        BLK_SEL_0 : bit_vector := "000";
        BLK_SEL_1 : bit_vector := "000";
        RESET_MODE : string := "SYNC"; --SYNC, ASYNC
	    INIT_RAM_00 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_01 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_02 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_03 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_04 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_05 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_06 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_07 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_08 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_09 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_10 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_11 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_12 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_13 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_14 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_15 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_16 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_17 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_18 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_19 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_20 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_21 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_22 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_23 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_24 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_25 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_26 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_27 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_28 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_29 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_30 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_31 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_32 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_33 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_34 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_35 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_36 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_37 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_38 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_39 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000"    
    );
    PORT (
	    DO : out std_logic_vector(31 downto 0):=conv_std_logic_vector(0,32);
	    CLKA,CLKB, CEA,CEB,OCE,RESET : in std_logic;
	    ADA,ADB : in std_logic_vector(13 downto 0);
        BLKSELA,BLKSELB : in std_logic_vector(2 downto 0);
	    DI : in std_logic_vector(31 downto 0)
    );
end COMPONENT;
	attribute syn_black_box of SDPB : Component is true;

----------------------------------SDPX9B---------------------------------------
COMPONENT SDPX9B 
    GENERIC ( 
	    BIT_WIDTH_0 : integer :=18; -- 9, 18, 36
	    BIT_WIDTH_1 : integer :=18; -- 9, 18, 36
	    READ_MODE : bit := '0'; -- 0: bypass mode; 1: pipeline mode
	    BLK_SEL_0 : bit_vector := "000";
	    BLK_SEL_1 : bit_vector := "000";
        RESET_MODE : string := "SYNC"; --SYNC, ASYNC
	    INIT_RAM_00 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_01 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_02 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_03 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_04 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_05 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_06 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_07 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_08 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_09 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_10 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_11 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_12 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_13 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_14 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_15 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_16 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_17 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_18 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_19 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_20 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_21 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_22 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_23 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_24 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_25 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_26 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_27 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_28 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_29 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_30 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_31 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_32 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_33 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_34 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_35 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_36 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_37 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_38 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_39 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000"      
    );
    PORT (
	    DO : out std_logic_vector(35 downto 0):=conv_std_logic_vector(0,36);
	    CLKA,CLKB, CEA,CEB,OCE,RESET : in std_logic;
	    ADA,ADB : in std_logic_vector(13 downto 0);
        BLKSELA,BLKSELB : in std_logic_vector(2 downto 0);
	    DI : in std_logic_vector(35 downto 0)
    );
end COMPONENT;
	attribute syn_black_box of SDPX9B : Component is true;

----------------------------DPB---------------------------------------

COMPONENT DPB 
    GENERIC (
		 BIT_WIDTH_0 : integer :=16; 
		 BIT_WIDTH_1 : integer :=16; 
		 READ_MODE0 : bit := '0'; -- 0: bypass mode; 1: pipeline mode
		 READ_MODE1 : bit := '0'; -- 0: bypass mode; 1: pipeline mode
		 WRITE_MODE0 : bit_vector := "00"; -- 00: normal mode; 01: write-through mode; 10: read-before-write mode
		 WRITE_MODE1 : bit_vector := "00"; -- 00: normal mode; 01: write-through mode; 10: read-before-write mode
    	 BLK_SEL_0 : bit_vector := "000";
    	 BLK_SEL_1 : bit_vector := "000";
         RESET_MODE : string := "SYNC"; --SYNC, ASYNC
		 INIT_RAM_00 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		 INIT_RAM_01 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		 INIT_RAM_02 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		 INIT_RAM_03 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		 INIT_RAM_04 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		 INIT_RAM_05 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		 INIT_RAM_06 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		 INIT_RAM_07 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		 INIT_RAM_08 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		 INIT_RAM_09 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		 INIT_RAM_0A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		 INIT_RAM_0B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		 INIT_RAM_0C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		 INIT_RAM_0D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		 INIT_RAM_0E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		 INIT_RAM_0F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		 INIT_RAM_10 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		 INIT_RAM_11 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		 INIT_RAM_12 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		 INIT_RAM_13 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		 INIT_RAM_14 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		 INIT_RAM_15 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		 INIT_RAM_16 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		 INIT_RAM_17 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		 INIT_RAM_18 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		 INIT_RAM_19 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		 INIT_RAM_1A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		 INIT_RAM_1B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		 INIT_RAM_1C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		 INIT_RAM_1D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		 INIT_RAM_1E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		 INIT_RAM_1F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		 INIT_RAM_20 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		 INIT_RAM_21 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		 INIT_RAM_22 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		 INIT_RAM_23 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		 INIT_RAM_24 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		 INIT_RAM_25 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		 INIT_RAM_26 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		 INIT_RAM_27 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		 INIT_RAM_28 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		 INIT_RAM_29 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		 INIT_RAM_2A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		 INIT_RAM_2B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		 INIT_RAM_2C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		 INIT_RAM_2D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		 INIT_RAM_2E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		 INIT_RAM_2F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		 INIT_RAM_30 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		 INIT_RAM_31 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		 INIT_RAM_32 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		 INIT_RAM_33 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		 INIT_RAM_34 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		 INIT_RAM_35 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		 INIT_RAM_36 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		 INIT_RAM_37 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		 INIT_RAM_38 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		 INIT_RAM_39 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		 INIT_RAM_3A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		 INIT_RAM_3B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		 INIT_RAM_3C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		 INIT_RAM_3D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		 INIT_RAM_3E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
		 INIT_RAM_3F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000"
    );
    PORT (
		 DOA,DOB : out std_logic_vector(15 downto 0):=conv_std_logic_vector(0,16);
		 CLKA,CLKB, CEA,CEB,OCEA,OCEB,RESETA,RESETB,WREA,WREB : in std_logic;
		 ADA,ADB : in std_logic_vector(13 downto 0);
    	 BLKSELA,BLKSELB : in std_logic_vector(2 downto 0);
		 DIA,DIB : in std_logic_vector(15 downto 0)
    );
end COMPONENT;
	attribute syn_black_box of DPB : Component is true;

----------------------------DPX9B---------------------------------------
COMPONENT DPX9B 
    GENERIC ( 
	    BIT_WIDTH_0 : integer :=18; -- 9, 18
	    BIT_WIDTH_1 : integer :=18; -- 9, 18
	    READ_MODE0 : bit := '0'; -- 0: bypass mode; 1: pipeline mode
	    READ_MODE1 : bit := '0'; -- 0: bypass mode; 1: pipeline mode
	    WRITE_MODE0 : bit_vector := "00"; -- 00: normal mode; 01: write-through mode; 10: read-before-write mode
	    WRITE_MODE1 : bit_vector := "00"; -- 00: normal mode; 01: write-through mode; 10: read-before-write mode
        BLK_SEL_0 : bit_vector := "000";
        BLK_SEL_1 : bit_vector := "000";
        RESET_MODE : string := "SYNC"; --SYNC, ASYNC
	    INIT_RAM_00 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_01 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_02 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_03 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_04 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_05 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_06 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_07 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_08 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_09 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_10 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_11 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_12 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_13 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_14 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_15 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_16 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_17 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_18 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_19 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_20 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_21 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_22 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_23 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_24 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_25 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_26 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_27 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_28 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_29 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_30 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_31 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_32 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_33 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_34 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_35 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_36 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_37 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_38 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_39 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000"     
    );
    PORT (
	    DOA,DOB : out std_logic_vector(17 downto 0) := conv_std_logic_vector(0,18);
	    CLKA,CLKB, CEA,CEB,OCEA,OCEB,RESETA,RESETB,WREA,WREB : in std_logic;
	    ADA,ADB : in std_logic_vector(13 downto 0);
	    DIA : in std_logic_vector(17 downto 0);
        BLKSELA,BLKSELB : in std_logic_vector(2 downto 0);
	    DIB : in std_logic_vector(17 downto 0)
    );
end COMPONENT;
	attribute syn_black_box of DPX9B : Component is true;

-----------------------pROM----------------------------
COMPONENT pROM 
    GENERIC ( 
	    BIT_WIDTH : integer :=1;	
	    READ_MODE : bit := '0';
        RESET_MODE : string := "SYNC"; --SYNC, ASYNC
	    INIT_RAM_00 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_01 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_02 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_03 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_04 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_05 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_06 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_07 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_08 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_09 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_10 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_11 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_12 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_13 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_14 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_15 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_16 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_17 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_18 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_19 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_20 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_21 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_22 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_23 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_24 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_25 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_26 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_27 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_28 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_29 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_30 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_31 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_32 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_33 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_34 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_35 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_36 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_37 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_38 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_39 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000"        
    );
    PORT (
	    DO : out std_logic_vector(31 downto 0):=conv_std_logic_vector(0,32);
	    CLK, CE, OCE, RESET : in std_logic;
	    AD : in std_logic_vector(13 downto 0)
    );
end COMPONENT;
	attribute syn_black_box of pROM : Component is true;

------------------------------pROMX9 ---------------------------------------------
COMPONENT pROMX9 
    GENERIC ( 
        BIT_WIDTH : integer :=9;
        READ_MODE : bit :='0';
        RESET_MODE : string := "SYNC"; --SYNC, ASYNC
        INIT_RAM_00 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_01 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_02 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_03 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_04 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_05 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_06 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_07 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_08 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_09 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_0F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_10 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_11 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_12 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_13 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_14 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_15 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_16 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_17 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_18 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_19 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_1F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_20 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_21 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_22 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_23 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_24 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_25 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_26 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_27 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_28 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_29 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_2F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_30 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_31 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_32 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_33 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_34 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_35 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_36 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_37 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_38 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_39 : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3A : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3B : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3C : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3D : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3E : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_3F : bit_vector := X"000000000000000000000000000000000000000000000000000000000000000000000000"     

    );
    PORT (
	    DO : out std_logic_vector(35 downto 0):=conv_std_logic_vector(0,36);
	    CLK, CE, OCE, RESET : in std_logic;
	    AD : in std_logic_vector(13 downto 0)
    );
end COMPONENT;
	attribute syn_black_box of pROMX9 : Component is true;


----------------------------MULTADDALU12X12---------------------------------------
COMPONENT MULTADDALU12X12
    generic(
		A0REG_CLK : string := "BYPASS"; -- "BYPASS","CLK0","CLK1"
        A0REG_CE : string := "CE0"; -- "CE0","CE1"
        A0REG_RESET : string := "RESET0"; --"RESET0", "RESET1"

        A1REG_CLK : string := "BYPASS"; -- "BYPASS","CLK0","CLK1"
        A1REG_CE : string := "CE0"; -- "CE0","CE1"
        A1REG_RESET : string := "RESET0"; --"RESET0", "RESET1"

        B0REG_CLK : string := "BYPASS"; -- "BYPASS","CLK0","CLK1"
        B0REG_CE : string := "CE0"; -- "CE0","CE1"
        B0REG_RESET : string := "RESET0"; --"RESET0", "RESET1"

        B1REG_CLK : string := "BYPASS"; -- "BYPASS","CLK0","CLK1"
        B1REG_CE : string := "CE0"; -- "CE0","CE1"
        B1REG_RESET : string := "RESET0"; --"RESET0", "RESET1"

        ACCSEL_IREG_CLK : string := "BYPASS"; -- "BYPASS","CLK0","CLK1"
        ACCSEL_IREG_CE : string := "CE0"; -- "CE0","CE1"
        ACCSEL_IREG_RESET : string := "RESET0"; --"RESET0", "RESET1"

        CASISEL_IREG_CLK : string := "BYPASS"; -- "BYPASS","CLK0","CLK1"
        CASISEL_IREG_CE : string := "CE0"; -- "CE0","CE1"
        CASISEL_IREG_RESET : string := "RESET0"; --"RESET0", "RESET1"

        ADDSUB0_IREG_CLK : string := "BYPASS"; -- "BYPASS","CLK0","CLK1"
        ADDSUB0_IREG_CE : string := "CE0"; -- "CE0","CE1"
        ADDSUB0_IREG_RESET : string := "RESET0"; --"RESET0", "RESET1"

        ADDSUB1_IREG_CLK : string := "BYPASS"; -- "BYPASS","CLK0","CLK1"
        ADDSUB1_IREG_CE : string := "CE0"; -- "CE0","CE1"
        ADDSUB1_IREG_RESET : string := "RESET0"; --"RESET0", "RESET1"

        PREG0_CLK : string := "BYPASS"; -- "BYPASS","CLK0","CLK1"     --mult0 pipeline register
        PREG0_CE : string := "CE0"; -- "CE0","CE1"
        PREG0_RESET : string := "RESET0"; --"RESET0", "RESET1"

        PREG1_CLK : string := "BYPASS"; -- "BYPASS","CLK0","CLK1"     --mult1 pipeline register
        PREG1_CE : string := "CE0"; -- "CE0","CE1"
        PREG1_RESET : string := "RESET0"; --"RESET0", "RESET1"

        FB_PREG_EN : string := "FALSE"; -- "FALSE";"TRUE"   --feedback acc pipeline register,same clk/ce/reset as OREG

        ACCSEL_PREG_CLK : string := "BYPASS"; -- "BYPASS","CLK0","CLK1"
        ACCSEL_PREG_CE : string := "CE0"; -- "CE0","CE1"
        ACCSEL_PREG_RESET : string := "RESET0"; --"RESET0", "RESET1"

        CASISEL_PREG_CLK : string := "BYPASS"; -- "BYPASS","CLK0","CLK1"
        CASISEL_PREG_CE : string := "CE0"; -- "CE0","CE1"
        CASISEL_PREG_RESET : string := "RESET0"; --"RESET0", "RESET1"

        ADDSUB0_PREG_CLK : string := "BYPASS"; -- "BYPASS","CLK0","CLK1"
        ADDSUB0_PREG_CE : string := "CE0"; -- "CE0","CE1"
        ADDSUB0_PREG_RESET : string := "RESET0"; --"RESET0", "RESET1"

        ADDSUB1_PREG_CLK : string := "BYPASS"; -- "BYPASS","CLK0","CLK1"
        ADDSUB1_PREG_CE : string := "CE0"; -- "CE0","CE1"
        ADDSUB1_PREG_RESET : string := "RESET0"; --"RESET0", "RESET1"

        OREG_CLK : string := "BYPASS"; -- "BYPASS","CLK0","CLK1"
        OREG_CE : string := "CE0"; -- "CE0","CE1"
        OREG_RESET : string := "RESET0"; --"RESET0", "RESET1"

        MULT_RESET_MODE : string := "SYNC";-- SYNC,ASYNC
        PRE_LOAD : bit_vector := X"000000000000";
        DYN_ADD_SUB_0 : string := "FALSE"; --"TRUE","FALSE"
        ADD_SUB_0 : bit := '0'; --'0':'+'; '1':'-'
        DYN_ADD_SUB_1 : string := "FALSE"; --"TRUE","FALSE"
        ADD_SUB_1 : bit := '0'; --'0':'+'; '1':'-'
        DYN_CASI_SEL : string := "FALSE"; --"TRUE","FALSE"
        CASI_SEL : bit := '0'; --'0': select 0; '1': select casi
        DYN_ACC_SEL : string := "FALSE"; --"TRUE","FALSE"
        ACC_SEL : bit := '0'  --'0': PRE_LOAD;'1': DOUT feedback

	);
    
	port (
		A0,B0 : in std_logic_vector(11 downto 0);
		A1,B1 : in std_logic_vector(11 downto 0);
		CASI : in std_logic_vector(47 downto 0);
		ACCSEL,CASISEL : in std_logic;
		ADDSUB : in std_logic_vector(1 downto 0);
		CE : in std_logic_vector(1 downto 0);
		CLK : in std_logic_vector(1 downto 0);
		RESET : in std_logic_vector(1 downto 0);
		DOUT : out std_logic_vector(47 downto 0);
		CASO : out std_logic_vector(47 downto 0)
	);
end COMPONENT;
	attribute syn_black_box of MULTADDALU12X12 : Component is true;

----------------------------MULTALU27X18---------------------------------------
COMPONENT MULTALU27X18
    generic(
		AREG_CLK : string := "BYPASS"; -- "BYPASS","CLK0","CLK1"
        AREG_CE : string := "CE0"; -- "CE0","CE1"
        AREG_RESET : string := "RESET0"; --"RESET0", "RESET1"

        BREG_CLK : string := "BYPASS"; -- "BYPASS","CLK0","CLK1"
        BREG_CE : string := "CE0"; -- "CE0","CE1"
        BREG_RESET : string := "RESET0"; --"RESET0", "RESET1"

        C_IREG_CLK : string := "BYPASS"; -- "BYPASS","CLK0","CLK1"
        C_IREG_CE : string := "CE0"; -- "CE0","CE1"
        C_IREG_RESET : string := "RESET0"; --"RESET0", "RESET1"

        DREG_CLK : string := "BYPASS"; -- "BYPASS","CLK0","CLK1"
        DREG_CE : string := "CE0"; -- "CE0","CE1"
        DREG_RESET : string := "RESET0"; --"RESET0", "RESET1"

        PSEL_IREG_CLK : string := "BYPASS"; -- "BYPASS","CLK0","CLK1"
        PSEL_IREG_CE : string := "CE0"; -- "CE0","CE1"
        PSEL_IREG_RESET : string := "RESET0"; --"RESET0", "RESET1"

        PADDSUB_IREG_CLK : string := "BYPASS"; -- "BYPASS","CLK0","CLK1"
        PADDSUB_IREG_CE : string := "CE0"; -- "CE0","CE1"
        PADDSUB_IREG_RESET : string := "RESET0"; --"RESET0", "RESET1"

        ACCSEL_IREG_CLK : string := "BYPASS"; -- "BYPASS","CLK0","CLK1"
        ACCSEL_IREG_CE : string := "CE0"; -- "CE0","CE1"
        ACCSEL_IREG_RESET : string := "RESET0"; --"RESET0", "RESET1"

        ADDSUB0_IREG_CLK : string := "BYPASS"; -- "BYPASS","CLK0","CLK1"
        ADDSUB0_IREG_CE : string := "CE0"; -- "CE0","CE1"
        ADDSUB0_IREG_RESET : string := "RESET0"; --"RESET0", "RESET1"

        ADDSUB1_IREG_CLK : string := "BYPASS"; -- "BYPASS","CLK0","CLK1"
        ADDSUB1_IREG_CE : string := "CE0"; -- "CE0","CE1"
        ADDSUB1_IREG_RESET : string := "RESET0"; --"RESET0", "RESET1"

        CSEL_IREG_CLK : string := "BYPASS"; -- "BYPASS","CLK0","CLK1"
        CSEL_IREG_CE : string := "CE0"; -- "CE0","CE1"
        CSEL_IREG_RESET : string := "RESET0"; --"RESET0", "RESET1"

        CASISEL_IREG_CLK : string := "BYPASS"; -- "BYPASS","CLK0","CLK1"
        CASISEL_IREG_CE : string := "CE0"; -- "CE0","CE1"
        CASISEL_IREG_RESET : string := "RESET0"; --"RESET0", "RESET1"

        PREG_CLK : string := "BYPASS"; -- "BYPASS","CLK0","CLK1" 
        PREG_CE : string := "CE0"; -- "CE0","CE1"
        PREG_RESET : string := "RESET0"; --"RESET0", "RESET1"

        C_PREG_CLK : string := "BYPASS"; -- "BYPASS","CLK0","CLK1"
        C_PREG_CE : string := "CE0"; -- "CE0","CE1"
        C_PREG_RESET : string := "RESET0"; --"RESET0", "RESET1"

        FB_PREG_EN : string := "FALSE"; --"TRUE","FALSE"   --feedback acc pipeline register,same clk/ce/reset as OREG
        SOA_PREG_EN : string := "FALSE"; --"TRUE","FALSE"  --soa pipeline register,same clk/ce/reset as AREG

        ACCSEL_PREG_CLK : string := "BYPASS"; -- "BYPASS","CLK0","CLK1"
        ACCSEL_PREG_CE : string := "CE0"; -- "CE0","CE1"
        ACCSEL_PREG_RESET : string := "RESET0"; --"RESET0", "RESET1"

        ADDSUB0_PREG_CLK : string := "BYPASS"; -- "BYPASS","CLK0","CLK1"
        ADDSUB0_PREG_CE : string := "CE0"; -- "CE0","CE1"
        ADDSUB0_PREG_RESET : string := "RESET0"; --"RESET0", "RESET1"

        ADDSUB1_PREG_CLK : string := "BYPASS"; -- "BYPASS","CLK0","CLK1"
        ADDSUB1_PREG_CE : string := "CE0"; -- "CE0","CE1"
        ADDSUB1_PREG_RESET : string := "RESET0"; --"RESET0", "RESET1"

        CSEL_PREG_CLK : string := "BYPASS"; -- "BYPASS","CLK0","CLK1"
        CSEL_PREG_CE : string := "CE0"; -- "CE0","CE1"
        CSEL_PREG_RESET : string := "RESET0"; --"RESET0", "RESET1"

        CASISEL_PREG_CLK : string := "BYPASS"; -- "BYPASS","CLK0","CLK1"
        CASISEL_PREG_CE : string := "CE0"; -- "CE0","CE1"
        CASISEL_PREG_RESET : string := "RESET0"; --"RESET0", "RESET1"

        OREG_CLK : string := "BYPASS"; -- "BYPASS","CLK0","CLK1"
        OREG_CE : string := "CE0"; -- "CE0","CE1"
        OREG_RESET : string := "RESET0"; --"RESET0", "RESET1"

        MULT_RESET_MODE : string := "SYNC";-- SYNC,ASYNC
        PRE_LOAD : bit_vector := X"000000000000";
        DYN_P_SEL : string := "FALSE"; --"TRUE","FALSE"
        P_SEL : bit := '0'; -- '0':select direct INA; '1': select preadder
        DYN_P_ADDSUB : string := "FALSE"; --"TRUE","FALSE"
        P_ADDSUB : bit := '0'; --'0':'+'; '1':'-'
        DYN_A_SEL : string := "FALSE"; --"TRUE","FALSE"
        A_SEL : bit := '0'; --'0':select A; '1':select SIA
        DYN_ADD_SUB_0 : string := "FALSE"; --"TRUE","FALSE"
        ADD_SUB_0 : bit := '0'; --'0':'+'; '1':'-'
        DYN_ADD_SUB_1 : string := "FALSE"; --"TRUE","FALSE"
        ADD_SUB_1 : bit := '0'; --'0':'+'; '1':'-'
        
        DYN_C_SEL : string := "FALSE"; --"TRUE","FALSE"
        C_SEL : bit := '1'; --'0': select 0; '1': select  C input
        
        DYN_CASI_SEL : string := "FALSE"; --"FALSE","TRUE"
        CASI_SEL : bit := '1'; --'0': select 0; '1': select  casi
        DYN_ACC_SEL : string := "FALSE"; --"FALSE","TRUE"
        ACC_SEL : bit := '0'; --'0': PRE_LOAD; '1': DOUT feedback
        MULT12X12_EN : string := "FALSE" --"FALSE","TRUE"
	);
    
	port (
		A,SIA : in std_logic_vector(26 downto 0);
		B : in std_logic_vector(17 downto 0);
		D : in std_logic_vector(25 downto 0);
		C : in std_logic_vector(47 downto 0);
		CASI : in std_logic_vector(47 downto 0);
		ACCSEL : in std_logic;
		PSEL, ASEL : in std_logic;
		PADDSUB : in std_logic;
		CSEL, CASISEL : in std_logic;
		ADDSUB : in std_logic_vector(1 downto 0);
		CE : in std_logic_vector(1 downto 0);
		CLK : in std_logic_vector(1 downto 0);
		RESET : in std_logic_vector(1 downto 0);
		DOUT : out std_logic_vector(47 downto 0);
		SOA : out std_logic_vector(26 downto 0);
		CASO : out std_logic_vector(47 downto 0)
	);
end COMPONENT;
	attribute syn_black_box of MULTALU27X18 : Component is true;

----------------------------MULT12X12---------------------------------------
COMPONENT MULT12X12
    generic(
		AREG_CLK : string := "BYPASS"; -- "BYPASS","CLK0","CLK1"
        AREG_CE : string := "CE0"; -- "CE0","CE1"
        AREG_RESET : string := "RESET0"; --"RESET0", "RESET1"

        BREG_CLK : string := "BYPASS"; -- "BYPASS","CLK0","CLK1"
        BREG_CE : string := "CE0"; -- "CE0","CE1"
        BREG_RESET : string := "RESET0"; --"RESET0", "RESET1"

        PREG_CLK : string := "BYPASS"; -- "BYPASS","CLK0","CLK1"
        PREG_CE : string := "CE0"; -- "CE0","CE1"
        PREG_RESET : string := "RESET0"; --"RESET0", "RESET1"

        OREG_CLK : string := "BYPASS"; -- "BYPASS","CLK0","CLK1"
        OREG_CE : string := "CE0"; -- "CE0","CE1"
        OREG_RESET : string := "RESET0"; --"RESET0", "RESET1"

        MULT_RESET_MODE : string := "SYNC" -- SYNC,ASYNC
	);
    
	port (
		A : in std_logic_vector(11 downto 0);
		B : in std_logic_vector(11 downto 0);
		CE : in std_logic_vector(1 downto 0);
		CLK : in std_logic_vector(1 downto 0);
		RESET : in std_logic_vector(1 downto 0);
		DOUT : out std_logic_vector(23 downto 0)
	);
end COMPONENT;
	attribute syn_black_box of MULT12X12 : Component is true;

----------------------------MULT27X36---------------------------------------
COMPONENT MULT27X36
    generic(
		AREG_CLK : string := "BYPASS"; -- "BYPASS","CLK0","CLK1"
        AREG_CE : string := "CE0"; -- "CE0","CE1"
        AREG_RESET : string := "RESET0"; --"RESET0", "RESET1"

        BREG_CLK : string := "BYPASS"; -- "BYPASS","CLK0","CLK1"
        BREG_CE : string := "CE0"; -- "CE0","CE1"
        BREG_RESET : string := "RESET0"; --"RESET0", "RESET1"

        DREG_CLK : string := "BYPASS"; -- "BYPASS","CLK0","CLK1"
        DREG_CE : string := "CE0"; -- "CE0","CE1"
        DREG_RESET : string := "RESET0"; --"RESET0", "RESET1"

        PADDSUB_IREG_CLK : string := "BYPASS"; -- "BYPASS","CLK0","CLK1"
        PADDSUB_IREG_CE : string := "CE0"; -- "CE0","CE1"
        PADDSUB_IREG_RESET : string := "RESET0"; --"RESET0", "RESET1"

        PSEL_IREG_CLK : string := "BYPASS"; -- "BYPASS","CLK0","CLK1"
        PSEL_IREG_CE : string := "CE0"; -- "CE0","CE1"
        PSEL_IREG_RESET : string := "RESET0"; --"RESET0", "RESET1"

        PREG_CLK : string := "BYPASS"; -- "BYPASS","CLK0","CLK1"
        PREG_CE : string := "CE0"; -- "CE0","CE1"
        PREG_RESET : string := "RESET0"; --"RESET0", "RESET1"

        OREG_CLK : string := "BYPASS"; -- "BYPASS","CLK0","CLK1"
        OREG_CE : string := "CE0"; -- "CE0","CE1"
        OREG_RESET : string := "RESET0"; --"RESET0", "RESET1"

        MULT_RESET_MODE : string := "SYNC"; -- SYNC,ASYNC
        DYN_P_SEL : STRING := "FALSE"; --"TRUE","FALSE"
        P_SEL : bit := '0'; --0: select direct INA; 1: select preadder
        DYN_P_ADDSUB : STRING := "FALSE"; --"TRUE","FALSE"
        P_ADDSUB : bit := '0' --'0': add; '1': sub
    );
	port (
		A : in std_logic_vector(26 downto 0);
		B : in std_logic_vector(35 downto 0);
		D : in std_logic_vector(25 downto 0);
		CE : in std_logic_vector(1 downto 0);
		CLK : in std_logic_vector(1 downto 0);
		RESET : in std_logic_vector(1 downto 0);
        PSEL : in std_logic;
        PADDSUB : in std_logic;
		DOUT : out std_logic_vector(62 downto 0)
	);
end COMPONENT;
	attribute syn_black_box of MULT27X36 : Component is true;





    
end components;    
    
