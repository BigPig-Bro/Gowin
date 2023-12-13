
-- ===========Oooo==========================================Oooo========
-- =  Copyright (C) 2014-2023 Gowin Semiconductor Technology Co.,Ltd.
-- =                     All rights reserved.
-- =====================================================================
--
--  __      __      __
--  \ \    /  \    / /   [File name   ] prim_sim.vhd
--   \ \  / /\ \  / /    [Description ] GW5AT VHDL functional simulation library
--    \ \/ /  \ \/ /     [Timestamp   ] Sun June 26 11:00:30 2022
--     \  /    \  /      [version     ] 1.9.9
--      \/      \/       
--
-- ===========Oooo==========================================Oooo========


---------------------------package global------------------------------
library ieee;
use ieee.std_logic_1164.all;

package glb is
	signal GSRO : std_logic := '1';
end glb;

package body glb is
end glb;

------------------------------GSR---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity GSR is
    PORT (
         GSRI : in std_logic
    );
end GSR;

architecture Behavioral of GSR is
begin
    GSRO <= GSRI;
end Behavioral;

--------------------------LUT1------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity LUT1 is
    GENERIC ( INIT : bit_vector := X"0" );
    PORT (
	    F : out std_logic;
        I0 : in std_logic
    );
end LUT1;
architecture Behavioral of LUT1 is
	constant INIT_reg : std_logic_vector((INIT'length - 1) downto 0) := To_StdLogicVector(INIT);
	COMPONENT MUX2
		PORT(
			I0 : IN  std_logic;
			I1 : IN  std_logic;
			S0 : IN  std_logic;
			O : OUT  std_logic
		);
	END COMPONENT;
begin
   uut: MUX2 PORT MAP (
          I0 => INIT_reg(0),
          I1 => INIT_reg(1),
          S0 => I0,
          O => F
        );
end Behavioral;

--------------------------LUT2 -----------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity LUT2 is
    GENERIC ( INIT : bit_vector := X"0" );
    PORT (
   	 F : out std_logic;
   	 I0 : in std_logic;
   	 I1 : in std_logic
    );
end LUT2;

architecture Behavioral of LUT2 is
	constant INIT_reg : std_logic_vector((INIT'length - 1) downto 0) := To_StdLogicVector(INIT);
	COMPONENT MUX4
		PORT(
			I0 : IN  std_logic;
			I1 : IN  std_logic;
			I2 : IN  std_logic;
			I3 : IN  std_logic;
			S0 : IN  std_logic;
			S1 : IN  std_logic;
			O : OUT  std_logic
		);
	END COMPONENT;
begin
   m: MUX4 PORT MAP (
          I0 => INIT_reg(0),
          I1 => INIT_reg(1),
          I2 => INIT_reg(2),
          I3 => INIT_reg(3),
          S0 => I0,
          S1 => I1,
          O => F
        );
end Behavioral;

--------------------------LUT3------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity LUT3 is
    GENERIC ( INIT : bit_vector := X"00" );
    PORT (
   	    F : out std_logic;
   	    I0 : in std_logic;
   	    I1 : in std_logic;
   	    I2 : in std_logic
    );
end LUT3;

ARCHITECTURE Behavioral of LUT3 is
	constant INIT_reg : std_logic_vector(7 downto 0) := To_StdLogicVector(INIT);
	COMPONENT MUX8
	PORT(
		I0 : IN  std_logic;
		I1 : IN  std_logic;
		I2 : IN  std_logic;
		I3 : IN  std_logic;
		I4 : IN  std_logic;
		I5 : IN  std_logic;
		I6 : IN  std_logic;
		I7 : IN  std_logic;
		S0 : IN  std_logic;
		S1 : IN  std_logic;
		S2 : IN  std_logic;
		O : OUT  std_logic
	  );
	END COMPONENT;
begin

   m: MUX8 PORT MAP (
          I0 => INIT_reg(0),
          I1 => INIT_reg(1),
          I2 => INIT_reg(2),
          I3 => INIT_reg(3),
          I4 => INIT_reg(4),
          I5 => INIT_reg(5),
          I6 => INIT_reg(6),
          I7 => INIT_reg(7),
          S0 => I0,
          S1 => I1,
          S2 => I2,
          O => F
        );
end Behavioral;
  
--------------------------LUT4 -----------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity LUT4 is
    GENERIC ( INIT : bit_vector := X"0000" );
    PORT (
   	    F : out std_logic;
   	    I0 : in std_logic;
   	    I1 : in std_logic;
   	    I2 : in std_logic;
   	    I3 : in std_logic
    );
end LUT4;

ARCHITECTURE Behavioral of LUT4 is

	constant INIT_reg : std_logic_vector(15 downto 0) := To_StdLogicVector(INIT);    
	COMPONENT MUX16
		PORT(
			I0 : IN  std_logic;
			I1 : IN  std_logic;
			I2 : IN  std_logic;
			I3 : IN  std_logic;
			I4 : IN  std_logic;
			I5 : IN  std_logic;
			I6 : IN  std_logic;
			I7 : IN  std_logic;
			I8 : IN  std_logic;
			I9 : IN  std_logic;
			I10 : IN  std_logic;
			I11 : IN  std_logic;
			I12 : IN  std_logic;
			I13 : IN  std_logic;
			I14 : IN  std_logic;
			I15 : IN  std_logic;
			S0 : IN  std_logic;
			S1 : IN  std_logic;
			S2 : IN  std_logic;
			S3 : IN  std_logic;
			O : OUT  std_logic
		);
	END COMPONENT;
begin
	m: MUX16 PORT MAP (
          I0 => INIT_reg(0),
          I1 => INIT_reg(1),
          I2 => INIT_reg(2),
          I3 => INIT_reg(3),
          I4 => INIT_reg(4),
          I5 => INIT_reg(5),
          I6 => INIT_reg(6),
          I7 => INIT_reg(7),
          I8 => INIT_reg(8),
          I9 => INIT_reg(9),
          I10 => INIT_reg(10),
          I11 => INIT_reg(11),
          I12 => INIT_reg(12),
          I13 => INIT_reg(13),
          I14 => INIT_reg(14),
          I15 => INIT_reg(15),
          S0 => I0,
          S1 => I1,
          S2 => I2,
          S3 => I3,
          O => F
        );
end Behavioral;

--------------------------LUT5 -----------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;

entity LUT5 is
    GENERIC ( INIT : bit_vector := X"00000000" );
    PORT (
   	    F : out std_logic;
   	    I0 : in std_logic;
   	    I1 : in std_logic;
   	    I2 : in std_logic;
   	    I3 : in std_logic;
   	    I4 : in std_logic
    );
end LUT5;

architecture Behavioral of LUT5 is
	constant INIT_reg : std_logic_vector(31 downto 0) := To_StdLogicVector(INIT);    
	COMPONENT MUX32
		PORT(
			I0 : IN  std_logic;
			I1 : IN  std_logic;
			I2 : IN  std_logic;
			I3 : IN  std_logic;
			I4 : IN  std_logic;
			I5 : IN  std_logic;
			I6 : IN  std_logic;
			I7 : IN  std_logic;
			I8 : IN  std_logic;
			I9 : IN  std_logic;
			I10 : IN  std_logic;
			I11 : IN  std_logic;
			I12 : IN  std_logic;
			I13 : IN  std_logic;
			I14 : IN  std_logic;
			I15 : IN  std_logic;
			I16 : IN  std_logic;
			I17 : IN  std_logic;
			I18 : IN  std_logic;
			I19 : IN  std_logic;
			I20 : IN  std_logic;
			I21 : IN  std_logic;
			I22 : IN  std_logic;
			I23 : IN  std_logic;
			I24 : IN  std_logic;
			I25 : IN  std_logic;
			I26 : IN  std_logic;
			I27 : IN  std_logic;
			I28 : IN  std_logic;
			I29 : IN  std_logic;
			I30 : IN  std_logic;
			I31 : IN  std_logic;
			S0 : IN  std_logic;
			S1 : IN  std_logic;
			S2 : IN  std_logic;
			S3 : IN  std_logic;
			S4 : IN  std_logic;
			O : OUT  std_logic
		  );
	END COMPONENT;
begin
   m: MUX32 PORT MAP (
          I0 => INIT_reg(0),
          I1 => INIT_reg(1),
          I2 => INIT_reg(2),
          I3 => INIT_reg(3),
          I4 => INIT_reg(4),
          I5 => INIT_reg(5),
          I6 => INIT_reg(6),
          I7 => INIT_reg(7),
          I8 => INIT_reg(8),
          I9 => INIT_reg(9),
          I10 => INIT_reg(10),
          I11 => INIT_reg(11),
          I12 => INIT_reg(12),
          I13 => INIT_reg(13),
          I14 => INIT_reg(14),
          I15 => INIT_reg(15),
          I16 => INIT_reg(16),
          I17 => INIT_reg(17),
          I18 => INIT_reg(18),
          I19 => INIT_reg(19),
          I20 => INIT_reg(20),
          I21 => INIT_reg(21),
          I22 => INIT_reg(22),
          I23 => INIT_reg(23),
          I24 => INIT_reg(24),
          I25 => INIT_reg(25),
          I26 => INIT_reg(26),
          I27 => INIT_reg(27),
          I28 => INIT_reg(28),
          I29 => INIT_reg(29),
          I30 => INIT_reg(30),
          I31 => INIT_reg(31),
          S0 => I0,
          S1 => I1,
          S2 => I2,
          S3 => I3,
          S4 => I4,
          O => F
        );

end Behavioral;

--------------------------LUT6 -----------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;

entity LUT6 is
    GENERIC ( INIT : bit_vector := X"0000000000000000" );
    PORT (
   	    F : out std_logic;
   	    I0 : in std_logic;
   	    I1 : in std_logic;
   	    I2 : in std_logic;
   	    I3 : in std_logic;
   	    I4 : in std_logic;
   	    I5 : in std_logic
    );
end LUT6;

architecture  Behavioral of LUT6 is
	function mux2(I0 :  std_logic; I1 :  std_logic; S : std_logic) return std_logic is
		variable mux2_o : std_logic;
	begin
	
		if(S = '0') then
		    mux2_o := I0;
	    elsif(S = '1') then
		    mux2_o := I1;
        elsif(I0 = I1) then
	        mux2_o := I0;
        else
	        mux2_o := 'X';
	    end if;
		return mux2_o;
		
	end function mux2;

    COMPONENT LUT5
		GENERIC ( INIT : bit_vector := X"00000000" );
		PORT(
			F : OUT  std_logic;
			I0 : IN  std_logic;
			I1 : IN  std_logic;
			I2 : IN  std_logic;
			I3 : IN  std_logic;
			I4 : IN  std_logic
		);
    END COMPONENT;

	constant INIT_reg : std_logic_vector(63 downto 0) := To_StdLogicVector(INIT); 
	signal f0 : std_logic := '0';
	signal f1 : std_logic := '0';
begin
   l5_0: LUT5
		GENERIC MAP( INIT => TO_BITVECTOR(INIT_reg(31 downto 0)))
		PORT MAP (
            F => f0,
            I0 => I0,
            I1 => I1,
            I2 => I2,
            I3 => I3,
            I4 => I4
		);
	l5_1: LUT5
		GENERIC MAP( INIT => TO_BITVECTOR(INIT_reg(63 downto 32)))
		PORT MAP (
            F => f1,
            I0 => I0,
            I1 => I1,
            I2 => I2,
            I3 => I3,
            I4 => I4
		);
	F <= mux2(f0, f1, I5);

end Behavioral;

--------------------------LUT7 -----------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;

entity LUT7 is
    GENERIC ( INIT : bit_vector := X"00000000000000000000000000000000" );
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
end LUT7;

architecture  Behavioral of LUT7 is
    function mux2(I0 :  std_logic; I1 :  std_logic; S : std_logic) return std_logic is
	    variable mux2_o : std_logic;
    begin
	    if(S = '0') then
		    mux2_o := I0;
	    elsif(S = '1') then
		    mux2_o := I1;
        elsif(I0 = I1) then
	        mux2_o := I0;
        else
	        mux2_o := 'X';
	    end if;
        return mux2_o;		
    end function mux2;

    COMPONENT LUT6
    GENERIC ( INIT : bit_vector := X"0000000000000000");
    PORT(
        F : OUT  std_logic;
        I0 : IN  std_logic;
        I1 : IN  std_logic;
        I2 : IN  std_logic;
        I3 : IN  std_logic;
        I4 : IN  std_logic;
        I5 : IN  std_logic
    );
    END COMPONENT;
	signal f0 : std_logic := '0'; 
	signal f1 : std_logic := '0';
	constant INIT_reg : std_logic_vector(127 downto 0) := To_StdLogicVector(INIT); 
begin
    l6_0: LUT6
    GENERIC MAP(INIT => TO_BITVECTOR(INIT_reg(63 downto 0)))
    PORT MAP (
        F => f0,
        I0 => I0,
        I1 => I1,
        I2 => I2,
        I3 => I3,
        I4 => I4,
        I5 => I5
    );
    l6_1: LUT6
    GENERIC MAP( INIT => TO_BITVECTOR(INIT_reg(127 downto 64)))
    PORT MAP (
        F => f1,
        I0 => I0,
        I1 => I1,
        I2 => I2,
        I3 => I3,
        I4 => I4,
        I5 => I5
    );
    F <= mux2(f0, f1, I6);
end Behavioral;

--------------------------LUT8 -----------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;

entity LUT8 is
    GENERIC ( INIT : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000" );
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
end LUT8;
architecture  Behavioral of LUT8 is
    function mux2(I0 :  std_logic; I1 :  std_logic; S : std_logic) return std_logic is
        variable mux2_o : std_logic;
    begin
        if(S = '0') then
		    mux2_o := I0;
	    elsif(S = '1') then
		    mux2_o := I1;
        elsif(I0 = I1) then
	        mux2_o := I0;
        else
	        mux2_o := 'X';
	    end if;
        return mux2_o;	
    end function mux2;

    COMPONENT LUT7
    GENERIC ( INIT : bit_vector := X"00000000000000000000000000000000" );
    PORT(
        F : OUT  std_logic;
        I0 : IN  std_logic;
        I1 : IN  std_logic;
        I2 : IN  std_logic;
        I3 : IN  std_logic;
        I4 : IN  std_logic;
        I5 : IN  std_logic;
        I6 : IN  std_logic
    );
    END COMPONENT;
	signal f0 : std_logic := '0'; 
	signal f1 : std_logic := '0'; 
    constant INIT_reg : std_logic_vector(255 downto 0) := To_StdLogicVector(INIT);
begin
    l7_0: LUT7
    GENERIC MAP( INIT => TO_BITVECTOR(INIT_reg(127 downto 0)))
    PORT MAP (
        F => f0,
        I0 => I0,
        I1 => I1,
        I2 => I2,
        I3 => I3,
        I4 => I4,
        I5 => I5,
        I6 => I6
    );
    l7_1: LUT7
    GENERIC MAP( INIT => TO_BITVECTOR(INIT_reg(255 downto 128)))
    PORT MAP (
        F => f1,
        I0 => I0,
        I1 => I1,
        I2 => I2,
        I3 => I3,
        I4 => I4,
        I5 => I5,
        I6 => I6
    );
    F <= mux2(f0, f1, I7);
end Behavioral;
--------------------------MUX2------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX2 is
    PORT (
	    I0 : in std_logic;
	    I1 : in std_logic;
	    S0 : in std_logic;
	    O : out std_logic
    );
end MUX2;

architecture Behavioral of MUX2 is
	function mux2(I0 :  std_logic; I1 :  std_logic; S : std_logic) return std_logic is
		variable mux2_o : std_logic;
	begin
	
		if(S = '0') then
		    mux2_o := I0;
	    elsif(S = '1') then
		    mux2_o := I1;
        elsif(I0 = I1) then
	        mux2_o := I0;
        else
	        mux2_o := 'X';
	    end if;
		return mux2_o;
		
	end function mux2;
begin
	O <= mux2(I0, I1, S0);

end Behavioral;
--------------------------MUX2_LUT5------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX2_LUT5 is
    PORT (
	    I0 : in std_logic;
	    I1 : in std_logic;
	    S0 : in std_logic;
	    O : out std_logic
    );
end MUX2_LUT5;

architecture Behavioral of MUX2_LUT5 is
	function mux2(I0 :  std_logic; I1 :  std_logic; S : std_logic)	return std_logic is
		variable mux2_o : std_logic;
	begin
	
		if(S = '0') then
		    mux2_o := I0;
	    elsif(S = '1') then
		    mux2_o := I1;
        elsif(I0 = I1) then
	        mux2_o := I0;
        else
	        mux2_o := 'X';
	    end if;
		return mux2_o;
		
	end function mux2;
begin
	O <= mux2(I0, I1, S0);

end Behavioral;
--------------------------MUX2_LUT6------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX2_LUT6 is
    PORT (
	    I0 : in std_logic;
	    I1 : in std_logic;
	    S0 : in std_logic;
	    O : out std_logic
    );
end MUX2_LUT6;

architecture Behavioral of MUX2_LUT6 is
	function mux2(I0 :  std_logic; I1 :  std_logic; S : std_logic) return std_logic is
		variable mux2_o : std_logic;
	begin
	
		if(S = '0') then
		    mux2_o := I0;
	    elsif(S = '1') then
		    mux2_o := I1;
        elsif(I0 = I1) then
	        mux2_o := I0;
        else
	        mux2_o := 'X';
	    end if;
		return mux2_o;
		
	end function mux2;
begin
	O <= mux2(I0, I1, S0);

end Behavioral;
--------------------------MUX2_LUT7------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX2_LUT7 is
    PORT (
	    I0 : in std_logic;
	    I1 : in std_logic;
	    S0 : in std_logic;
	    O : out std_logic
    );
end MUX2_LUT7;

architecture Behavioral of MUX2_LUT7 is
	function mux2(I0 :  std_logic; I1 :  std_logic; S : std_logic) return std_logic is
		variable mux2_o : std_logic;
	begin
	
		if(S = '0') then
		    mux2_o := I0;
	    elsif(S = '1') then
		    mux2_o := I1;
        elsif(I0 = I1) then
	        mux2_o := I0;
        else
	        mux2_o := 'X';
	    end if;
		return mux2_o;
		
	end function mux2;
begin
	O <= mux2(I0, I1, S0);

end Behavioral;
--------------------------MUX2_LUT8------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX2_LUT8 is
    PORT (
	    I0 : in std_logic;
	    I1 : in std_logic;
	    S0 : in std_logic;
	    O : out std_logic
    );
end MUX2_LUT8;

architecture Behavioral of MUX2_LUT8 is
	function mux2(I0 :  std_logic; I1 :  std_logic; S : std_logic) return std_logic is
		variable mux2_o : std_logic;
	begin
	
		if(S = '0') then
		    mux2_o := I0;
	    elsif(S = '1') then
		    mux2_o := I1;
        elsif(I0 = I1) then
	        mux2_o := I0;
        else
	        mux2_o := 'X';
	    end if;
		return mux2_o;
		
	end function mux2;
begin
	O <= mux2(I0, I1, S0);

end Behavioral;
--------------------------MUX2_MUX8------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX2_MUX8 is
    PORT (
	    I0 : in std_logic;
	    I1 : in std_logic;
	    S0 : in std_logic;
	    O : out std_logic
    );
end MUX2_MUX8;

architecture Behavioral of MUX2_MUX8 is
	function mux2(I0 :  std_logic; I1 :  std_logic; S : std_logic)	return std_logic is
		variable mux2_o : std_logic;
	begin
	
		if(S = '0') then
		    mux2_o := I0;
	    elsif(S = '1') then
		    mux2_o := I1;
        elsif(I0 = I1) then
	        mux2_o := I0;
        else
	        mux2_o := 'X';
	    end if;
		return mux2_o;
		
	end function mux2;
begin
	O <= mux2(I0, I1, S0);

end Behavioral;
--------------------------MUX2_MUX16------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX2_MUX16 is
    PORT (
	    I0 : in std_logic;
	    I1 : in std_logic;
	    S0 : in std_logic;
	    O : out std_logic
    );
end MUX2_MUX16;

architecture Behavioral of MUX2_MUX16 is
	function mux2(I0 :  std_logic; I1 :  std_logic; S : std_logic)	return std_logic is
		variable mux2_o : std_logic;
	begin
	
		if(S = '0') then
		    mux2_o := I0;
	    elsif(S = '1') then
		    mux2_o := I1;
        elsif(I0 = I1) then
	        mux2_o := I0;
        else
	        mux2_o := 'X';
	    end if;
		return mux2_o;
		
	end function mux2;
begin
	O <= mux2(I0, I1, S0);

end Behavioral;
--------------------------MUX2_MUX32------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX2_MUX32 is
    PORT (
	    I0 : in std_logic;
	    I1 : in std_logic;
	    S0 : in std_logic;
	    O : out std_logic
    );
end MUX2_MUX32;

architecture Behavioral of MUX2_MUX32 is
	function mux2(I0 :  std_logic; I1 :  std_logic; S : std_logic) return std_logic is
		variable mux2_o : std_logic;
	begin
	
		if(S = '0') then
		    mux2_o := I0;
	    elsif(S = '1') then
		    mux2_o := I1;
        elsif(I0 = I1) then
	        mux2_o := I0;
        else
	        mux2_o := 'X';
	    end if;
		return mux2_o;
		
	end function mux2;
begin
	O <= mux2(I0, I1, S0);

end Behavioral;

--------------------------MUX4------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX4 is
    PORT (
	 I0 : in std_logic;
	 I1 : in std_logic;
	 I2 : in std_logic; 
	 I3 : in std_logic;
	 S0 : in std_logic;
	 S1 : in std_logic;
	 O : out std_logic
    );
end MUX4;

architecture Behavioral of MUX4 is
	function mux2(I0 :  std_logic; I1 :  std_logic; S : std_logic) return std_logic is
		variable mux2_o : std_logic;
	begin
	
		if(S = '0') then
		    mux2_o := I0;
	    elsif(S = '1') then
		    mux2_o := I1;
        elsif(I0 = I1) then
	        mux2_o := I0;
        else
	        mux2_o := 'X';
	    end if;
		return mux2_o;
		
	end function mux2;
begin
	process(I0, I1, I2, I3, S1, S0)
	variable f0 : std_logic := '0'; 
	variable f1 : std_logic := '0'; 
	begin
		f0 := mux2(I0, I1, S0);
		f1 := mux2(I2, I3, S0);
		O <= mux2(f0, f1, S1);
	end process;

end Behavioral;

--------------------------MUX8------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX8 is
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
end MUX8;

architecture Behavioral of MUX8 is
	function mux2(I0 :  std_logic; I1 :  std_logic; S : std_logic) return std_logic is
		variable mux2_o : std_logic;
	begin
	
		if(S = '0') then
		    mux2_o := I0;
	    elsif(S = '1') then
		    mux2_o := I1;
        elsif(I0 = I1) then
	        mux2_o := I0;
        else
	        mux2_o := 'X';
	    end if;
		return mux2_o;
		
	end function mux2;
	COMPONENT MUX4
	PORT(
		I0 : IN  std_logic;
		I1 : IN  std_logic;
		I2 : IN  std_logic;
		I3 : IN  std_logic;
		S0 : IN  std_logic;
		S1 : IN  std_logic;
		O : OUT  std_logic
	);
	END COMPONENT;
	signal f0 : std_logic := '0'; 
	signal f1 : std_logic := '0'; 	 
	 
begin
    m0: MUX4 PORT MAP (
        I0 => I0,
        I1 => I1,
        I2 => I2,
        I3 => I3,
        S0 => S0,
        S1 => S1,
        O => f0
    );
    m1: MUX4 PORT MAP (
        I0 => I4,
        I1 => I5,
        I2 => I6,
        I3 => I7,
        S0 => S0,
        S1 => S1,
        O => f1
    );
	O <= mux2(f0, f1, S2);

end Behavioral;

--------------------------MUX16-----------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX16 is 
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
end MUX16;

architecture Behavioral of MUX16 is
	function mux2(I0 :  std_logic; I1 :  std_logic; S : std_logic) return std_logic is
		variable mux2_o : std_logic;
	begin				
		if(S = '0') then
		    mux2_o := I0;
	    elsif(S = '1') then
		    mux2_o := I1;
        elsif(I0 = I1) then
	        mux2_o := I0;
        else
	        mux2_o := 'X';
	    end if;
		return mux2_o;				
	end function mux2;

	COMPONENT MUX8
		PORT(
			I0 : IN  std_logic;
			I1 : IN  std_logic;
			I2 : IN  std_logic;
			I3 : IN  std_logic;
			I4 : IN  std_logic;
			I5 : IN  std_logic;
			I6 : IN  std_logic;
			I7 : IN  std_logic;
			S0 : IN  std_logic;
			S1 : IN  std_logic;
			S2 : IN  std_logic;
			O : OUT  std_logic
		);
	END COMPONENT;
	signal f0 : std_logic := '0'; 
	signal f1 : std_logic := '0'; 	 
begin
    m0: MUX8 PORT MAP (
        I0 => I0,
        I1 => I1,
        I2 => I2,
        I3 => I3,
        I4 => I4,
        I5 => I5,
        I6 => I6,
        I7 => I7,
        S0 => S0,
        S1 => S1,
        S2 => S2,
        O => f0
	);
    m1: MUX8 PORT MAP (
        I0 => I8,
        I1 => I9,
        I2 => I10,
        I3 => I11,
        I4 => I12,
        I5 => I13,
        I6 => I14,
        I7 => I15,
        S0 => S0,
        S1 => S1,
        S2 => S2,
        O => f1
	);
 	O <= mux2(f0, f1, S3);

end Behavioral;

--------------------------MUX32-----------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX32 is 
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
end MUX32;

architecture Behavioral of MUX32 is
	function mux2(I0 :  std_logic; I1 :  std_logic; S : std_logic) return std_logic is
		variable mux2_o : std_logic;
	begin				
		if(S = '0') then
		    mux2_o := I0;
	    elsif(S = '1') then
		    mux2_o := I1;
        elsif(I0 = I1) then
	        mux2_o := I0;
        else
	        mux2_o := 'X';
	    end if;
		return mux2_o;				
	end function mux2;
    
	COMPONENT MUX16
		PORT(
			I0 : IN  std_logic;
			I1 : IN  std_logic;
			I2 : IN  std_logic;
			I3 : IN  std_logic;
			I4 : IN  std_logic;
			I5 : IN  std_logic;
			I6 : IN  std_logic;
			I7 : IN  std_logic;
			I8 : IN  std_logic;
			I9 : IN  std_logic;
			I10 : IN  std_logic;
			I11 : IN  std_logic;
			I12 : IN  std_logic;
			I13 : IN  std_logic;
			I14 : IN  std_logic;
			I15 : IN  std_logic;
			S0 : IN  std_logic;
			S1 : IN  std_logic;
			S2 : IN  std_logic;
			S3 : IN  std_logic;
			O : OUT  std_logic
		);
	END COMPONENT;
	signal f0 : std_logic := '0'; 
	signal f1 : std_logic := '0'; 	 
begin
	m0: MUX16 PORT MAP (
        I0 => I0,
        I1 => I1,
        I2 => I2,
        I3 => I3,
        I4 => I4,
        I5 => I5,
        I6 => I6,
        I7 => I7,
        I8 => I8,
        I9 => I9,
        I10 => I10,
        I11 => I11,
        I12 => I12,
        I13 => I13,
        I14 => I14,
        I15 => I15,
        S0 => S0,
        S1 => S1,
        S2 => S2,
        S3 => S3,
        O => f0
    );
	m1: MUX16 PORT MAP (
        I0 => I16,
        I1 => I17,
        I2 => I18,
        I3 => I19,
        I4 => I20,
        I5 => I21,
        I6 => I22,
        I7 => I23,
        I8 => I24,
        I9 => I25,
        I10 => I26,
        I11 => I27,
        I12 => I28,
        I13 => I29,
        I14 => I30,
        I15 => I31,
        S0 => S0,
        S1 => S1,
        S2 => S2,
        S3 => S3,
        O => f1
    );
	O <= mux2(f0, f1, S4);
end Behavioral;

--------------------------ALU-------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU is
    GENERIC (  
         ADD : INTEGER := 0 ;
       	 SUB : INTEGER := 1 ;
         ADDSUB : INTEGER := 2 ;
       	 NE : INTEGER := 3 ;
       	 GE : INTEGER := 4 ;
	     LE : INTEGER := 5;
       	 CUP : INTEGER := 6 ;
         CDN : INTEGER := 7 ;
         CUPCDN : INTEGER := 8;
	     ALU_MODE : INTEGER := 0
    );	
    PORT (
	 SUM : OUT std_logic;
	 COUT : OUT std_logic;	
	 I0 : IN std_logic;
	 I1: IN std_logic;
	 I3: IN std_logic;
	 CIN: IN std_logic
    );	
end ALU;

ARCHITECTURE Behavioral OF ALU IS
	SIGNAL S,C :std_logic;
	signal addsub_v,cupcdn_v : std_logic;
begin
	SUM <= S xor CIN;
	COUT <= CIN when S='1' else C;
	addsub_v <= ( I0 xor I1 ) when I3='1' else (I0 xor (not I1 ));
	cupcdn_v <= I0 when (I3='1') else (not I0 );
	process (I0, I1,I3,CIN,addsub_v,cupcdn_v) 
	begin	
		case (ALU_MODE) is
			when 0 =>  S <= I0 xor I1;
				       C <= I0;
			when 1 =>  S <= ( I0 xor (  not I1 )  ) ;
                   	   C <= I0;
            when 2 =>  S <= addsub_v;
                       C <= I0;
            when 3 =>  S <= ( I0 xor (  not I1 )  ) ;
                       C <= '1';
            when 4 =>  S <= ( I0 xor (  not I1 )  ) ;
                   	   C <= I0;
			when 5 =>  S <= ((not I0) xor I1);
				       C <= I1;
            when 6 =>  S <= I0;
                   	   C <= '0';
            when 7 =>  S <= ( not I0 ) ;
                   	   C <= '1';
            when 8 =>  S <= cupcdn_v;
                   	   C <= I0;
            when others => S <= 'X';
				       C <= 'X';
		  end case;
	end process;

end Behavioral;


----------------------------DFFSE--------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity DFFSE is
    GENERIC ( INIT : bit := '1' );	
    PORT (
	    Q : OUT std_logic;	
	    D : IN std_logic;
	    SET : IN std_logic;
	    CE: IN std_logic;	
	    CLK : IN std_logic
    );	
end DFFSE;

ARCHITECTURE Behavioral OF DFFSE IS
    SIGNAL gsrt: std_logic := '0';
    SIGNAL Q_reg : std_logic;	
begin
    gsrt <= GSRO;
    Q <= Q_reg;

    process (CLK,gsrt)
    begin
	    if (gsrt = '0') then
	        Q_reg <= TO_X01(INIT);
	    elsif (CLK'event and CLK='1') then
		    if (SET='1') then
			    Q_reg <= '1';
		    elsif (CE = '1') then
          		Q_reg <= D;	
		    end if;
	    end if;
    end process;

end Behavioral;

---------------------------DFFRE -------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity DFFRE is
    GENERIC ( INIT : bit := '0' );	
    PORT (
	    Q : OUT std_logic;	
	    D : IN std_logic;
	    RESET : IN std_logic;
	    CE: IN std_logic;	
	    CLK : IN std_logic
    );	
end DFFRE;

ARCHITECTURE Behavioral OF DFFRE IS
    SIGNAL gsrt : std_logic:= '0';
    SIGNAL Q_reg : std_logic;	
begin
    gsrt <= GSRO;
    Q <= Q_reg;
    process (CLK,gsrt)
    begin
	    if (gsrt = '0') then
	        Q_reg <= TO_X01(INIT);
	    elsif (CLK'event and CLK='1') then
		    if (RESET='1') then
			    Q_reg <= '0';
		    elsif (CE = '1') then
          		Q_reg <= D;	
		    end if;
	    end if;
    end process;

end Behavioral;

--------------------------DFFPE ---------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity DFFPE is
    GENERIC ( INIT : bit := '1' );	
    PORT (
	    Q : OUT std_logic;	
	    D : IN std_logic;
	    PRESET : IN std_logic;
	    CE: IN std_logic;	
	    CLK : IN std_logic
    );	
end DFFPE;

ARCHITECTURE Behavioral OF DFFPE IS
    SIGNAL gsrt : std_logic:= '0';
    SIGNAL Q_reg : std_logic;	
begin
    gsrt <= GSRO;
    Q <= Q_reg;

    process (CLK,PRESET,gsrt)
    begin
	    if (gsrt = '0') then
	        Q_reg <= TO_X01(INIT);
        elsif (PRESET='1') then
		    Q_reg <= '1';
	    elsif (CLK'event and CLK = '1') then
		    if (CE = '1') then
          		Q_reg <= D;
   		    end if;	
	    end if;
    end process;

end Behavioral;


-----------------------------DFFCE -------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity DFFCE is
    GENERIC ( INIT : bit := '0' );	
    PORT (
	    Q : OUT std_logic;	
	    D : IN std_logic;
	    CLEAR : IN std_logic;
	    CE: IN std_logic;	
	    CLK : IN std_logic
    );	
end DFFCE;

ARCHITECTURE Behavioral OF DFFCE IS
    SIGNAL gsrt : std_logic:= '0';
    SIGNAL Q_reg : std_logic;	
begin
    gsrt <= GSRO;
    Q <= Q_reg;
    process (CLK,CLEAR,gsrt)
    begin
	    if (gsrt = '0') then
	        Q_reg <= TO_X01(INIT);
	    elsif (CLEAR ='1') then
		    Q_reg <= '0';
	    elsif (CLK'event and CLK='1') then
		    if (CE='1') then
          		Q_reg <= D;
   		    end if;	
	    end if;
    end process;

end Behavioral;


-----------------------------DLCE ------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity DLCE is
    GENERIC ( INIT : bit := '0' );	
    PORT (
	    Q : OUT std_logic;	
	    D : IN std_logic;
	    CLEAR : IN std_logic;	
	    G : IN std_logic;
	    GE: IN std_logic
    );	
end DLCE;

ARCHITECTURE Behavioral OF DLCE IS
    SIGNAL gsrt : std_logic:= '0';
    SIGNAL Q_reg : std_logic;	
begin
    gsrt <= GSRO;
    Q <= Q_reg;

    process (D,G,CLEAR,GE,gsrt)
    begin
	    if (gsrt = '0') then
	        Q_reg <= TO_X01(INIT);
	    elsif (CLEAR='1') then
		    Q_reg <= '0';
	    elsif (G='1' and GE='1') then
		    Q_reg <= D;
	    end if;
    end process;

end Behavioral;


-----------------------------DLPE ------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity DLPE is
    GENERIC ( INIT : bit := '1' );	
    PORT (
	    Q : OUT std_logic;	
	    D : IN std_logic;
	    PRESET : IN std_logic;	
	    G : IN std_logic;
	    GE: IN std_logic
    );	
end DLPE;

ARCHITECTURE Behavioral OF DLPE IS
    SIGNAL gsrt : std_logic:= '0';
    SIGNAL Q_reg : std_logic;	
begin
    gsrt <= GSRO;
    Q <= Q_reg;

    process (D,G,PRESET,GE,gsrt)
    begin
	    if (gsrt = '0') then
	        Q_reg <= TO_X01(INIT);
	    elsif (PRESET='1') then
		    Q_reg <= '1';
	    elsif (G='1' and GE='1') then
		    Q_reg <= D;
	    end if;
    end process;

end Behavioral;


--------------------------------RAM16S1--------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE. STD_LOGIC_UNSIGNED.ALL;

entity RAM16S1 is
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
end RAM16S1;

architecture Behavioral of RAM16S1 is
	signal mem : std_logic_vector(15 downto 0) := TO_STDLOGICVECTOR(INIT_0);
begin
		
    DO <= mem(conv_integer(AD));
	
	process(CLK)
	begin
		if(CLK'event and CLK = '1') then 
			if(WRE = '1')then
				mem(conv_integer(AD)) <= DI;
			end if;
		end if;
	end process;

end Behavioral;

--------------------------------RAM16S2--------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE. STD_LOGIC_UNSIGNED.ALL;

entity RAM16S2 is
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
end RAM16S2;

architecture Behavioral of RAM16S2 is
	signal mem0 : std_logic_vector(15 downto 0) := TO_STDLOGICVECTOR(INIT_0);
	signal mem1 : std_logic_vector(15 downto 0) := TO_STDLOGICVECTOR(INIT_1);

begin
	
    DO(0) <= mem0(CONV_INTEGER(AD));
	DO(1) <= mem1(CONV_INTEGER(AD));
	
	process(CLK)
	begin
		if(CLK'event and CLK = '1') then 
			if(WRE = '1')then
				mem0(CONV_INTEGER(AD)) <= DI(0);
				mem1(CONV_INTEGER(AD)) <= DI(1);
			end if;
		end if;
	end process;
        
end Behavioral;

--------------------------------RAM16S4--------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE. STD_LOGIC_UNSIGNED.ALL;

entity RAM16S4 is
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
end RAM16S4;

architecture Behavioral of RAM16S4 is
	signal mem0 : std_logic_vector(15 downto 0) := TO_STDLOGICVECTOR(INIT_0);
	signal mem1 : std_logic_vector(15 downto 0) := TO_STDLOGICVECTOR(INIT_1);
	signal mem2 : std_logic_vector(15 downto 0) := TO_STDLOGICVECTOR(INIT_2);
	signal mem3 : std_logic_vector(15 downto 0) := TO_STDLOGICVECTOR(INIT_3);
begin

	DO(0) <= mem0(CONV_INTEGER(AD));
	DO(1) <= mem1(CONV_INTEGER(AD));
	DO(2) <= mem2(CONV_INTEGER(AD));
	DO(3) <= mem3(CONV_INTEGER(AD));
	
	process(CLK)
	begin
		if(CLK'event and CLK = '1') then 
			if(WRE = '1')then
				mem0(CONV_INTEGER(AD)) <= DI(0);
				mem1(CONV_INTEGER(AD)) <= DI(1);
				mem2(CONV_INTEGER(AD)) <= DI(2);
				mem3(CONV_INTEGER(AD)) <= DI(3);
			end if;
		end if;
	end process;
        
end Behavioral;

--------------------------------RAM16SDP1--------------------------

library IEEE;  
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE. STD_LOGIC_UNSIGNED.ALL;

entity RAM16SDP1 is
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
end RAM16SDP1;

architecture Behavioral of RAM16SDP1 is
	signal mem : std_logic_vector(15 downto 0) := TO_STDLOGICVECTOR(INIT_0);
begin
	process(CLK)
	begin
		if(CLK'event and CLK = '1') then
			if(WRE = '1') then
				mem(CONV_INTEGER(WAD))<=DI;
			end if;
		end if;
	end process;
	
	DO <= mem(CONV_INTEGER(RAD));

end Behavioral;

--------------------------------RAM16SDP2--------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE. STD_LOGIC_UNSIGNED.ALL;

entity RAM16SDP2 is
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
end RAM16SDP2;

architecture Behavioral of RAM16SDP2 is
	signal mem0 : std_logic_vector(15 downto 0) := TO_STDLOGICVECTOR(INIT_0);
	signal mem1 : std_logic_vector(15 downto 0) := TO_STDLOGICVECTOR(INIT_1);
begin

	process(CLK)
	begin
		if(CLK'event and CLK = '1') then
			if(WRE = '1') then
				mem0(CONV_INTEGER(WAD)) <= DI(0);
				mem1(CONV_INTEGER(WAD)) <= DI(1);
			end if;
		end if;
	end process;

	DO(0) <= mem0(CONV_INTEGER(RAD));
	DO(1) <= mem1(CONV_INTEGER(RAD));
	
end Behavioral;

--------------------------------RAM16SDP4--------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE. STD_LOGIC_UNSIGNED.ALL;

entity RAM16SDP4 is
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
end RAM16SDP4;

architecture Behavioral of RAM16SDP4 is
	signal mem0 : std_logic_vector(15 downto 0) := TO_STDLOGICVECTOR(INIT_0);
	signal mem1 : std_logic_vector(15 downto 0) := TO_STDLOGICVECTOR(INIT_1);
	signal mem2 : std_logic_vector(15 downto 0) := TO_STDLOGICVECTOR(INIT_2);
	signal mem3 : std_logic_vector(15 downto 0) := TO_STDLOGICVECTOR(INIT_3);

begin
	process(CLK)
	begin
		if(CLK'event and CLK = '1') then
			if(WRE = '1') then
				mem0(CONV_INTEGER(WAD)) <= DI(0);
				mem1(CONV_INTEGER(WAD)) <= DI(1);
				mem2(CONV_INTEGER(WAD)) <= DI(2);
				mem3(CONV_INTEGER(WAD)) <= DI(3);
			end if;
		end if;
	end process;
	
	DO(0) <= mem0(CONV_INTEGER(RAD));
	DO(1) <= mem1(CONV_INTEGER(RAD));
	DO(2) <= mem2(CONV_INTEGER(RAD));
	DO(3) <= mem3(CONV_INTEGER(RAD));

end Behavioral;


--------------------------------ROM16-----------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE. STD_LOGIC_UNSIGNED.ALL;

entity ROM16 is
    GENERIC ( 
        INIT_0 : bit_vector(15 downto 0) := X"0000" 
    );
    PORT (
 	    DO : out std_logic;
	    AD : in std_logic_vector(3 downto 0)
    );
end ROM16;

architecture Behavioral of ROM16 is
	signal ram_MEM : std_logic_vector(16 downto 0) := ('X' & To_StdLogicVector(INIT_0));

begin
	
    DO <= ram_MEM(CONV_INTEGER(AD));

end Behavioral;

-----------------INV---------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity INV is
    PORT (
    	O : OUT std_logic;
    	I : IN std_logic
    );
end INV;

architecture Behavioral of INV is
begin
    O <= NOT I;
end Behavioral;


----------------------GND-----------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity GND is
    PORT (
    	G : out std_logic
    );
end GND;

architecture Behavioral of GND is
begin
    G <= '0';
end Behavioral;

---------------------VCC------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity VCC is
    PORT (
    	V : out std_logic
    );
end VCC;

architecture Behavioral of VCC is
begin
    V <= '1';
end Behavioral;

----------------------IBUF-------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity IBUF is
    PORT (
    	O : OUT std_logic;
    	I : IN std_logic
    );
end IBUF;

architecture Behavioral of IBUF is
begin
    O <= TO_X01(I);
end Behavioral;

------------------------------OBUF---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity OBUF is
    PORT (
    	O : OUT std_logic;
    	I : IN std_logic
    );
end OBUF;

architecture Behavioral of OBUF is
begin
    O <= TO_X01(I);
end Behavioral;

------------------------------------TBUF---------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TBUF is
    PORT (
    	O : OUT std_logic;
    	I : IN std_logic;
    	OEN : IN std_logic
    );
end TBUF;

architecture Behavioral of TBUF is
begin
    process(I, OEN)
    begin
        if ((OEN = '1') or (OEN = 'H')) then
      	    O <= 'Z';
        elsif ((OEN = '0') or (OEN = 'L')) then
            O <= TO_X01(I);
        else                                      
            O <= 'X';  
        end if;
  end process;        

end Behavioral;

----------------------------IOBUF--------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity IOBUF is
    PORT (
    	O  : OUT   std_logic;
    	IO : INOUT std_logic;
     	I  : IN    std_logic;
	    OEN : IN    std_logic
    );
end IOBUF;

architecture  Behavioral of IOBUF is
begin
    process(IO, I, OEN)
    begin
    	O <= TO_X01(IO);
	    if ((OEN = '1') or (OEN = 'H')) then
	        IO <= 'Z';
	    elsif ((OEN = '0') or (OEN = 'L')) then
	        IO <= TO_X01(I);
	    else
	        IO <= 'X';
	    end if;		
    end process;

end Behavioral;

-----------------TLVDS_IBUF---------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;

entity TLVDS_IBUF is
    PORT(
        O : OUT std_logic;
        I : IN std_logic;
        IB : IN std_logic
        );
end TLVDS_IBUF;

architecture Behavioral of TLVDS_IBUF is
begin
    process(I,IB)
    begin
        if(I = '1' and IB = '0')then 
            O <= I;
        elsif(I = '0' and IB = '1')then 
            O <= I;
        elsif(I = 'X' or IB = 'X')then 
            O <= 'X';
        end if;
    end process;
end Behavioral;

-----------------TLVDS_OBUF---------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TLVDS_OBUF is
    PORT(
        O : OUT std_logic;
        OB : OUT std_logic;
        I : IN std_logic
        );
end TLVDS_OBUF;

architecture Behavioral of TLVDS_OBUF is
begin
    process(I)
    begin
        O <= I;
        OB <= not I;
    end process;
end Behavioral;

-----------------TLVDS_TBUF---------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TLVDS_TBUF is
    PORT (
    	O  : OUT   std_logic;
    	OB : OUT std_logic;
     	I  : IN    std_logic;
	    OEN : IN    std_logic
    );
end TLVDS_TBUF;

architecture  Behavioral of TLVDS_TBUF is
begin
    process(I, OEN)
    begin
	    if ((OEN = '1') or (OEN = 'H')) then
	        O <= 'Z';
            OB <= 'Z';
	    elsif ((OEN = '0') or (OEN = 'L')) then
	        O <= TO_X01(I);
            OB <= not TO_X01(I);
	    end if;		
    end process;

end Behavioral;

-----------------TLVDS_IOBUF---------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TLVDS_IOBUF is
    PORT (
    	O  : OUT   std_logic;
    	IOB : INOUT std_logic;
        IO : INOUT std_logic;
     	I  : IN    std_logic;
	    OEN : IN    std_logic
    );
end TLVDS_IOBUF;

architecture  Behavioral of TLVDS_IOBUF is
begin
    process(I, OEN)
    begin
	    if ((OEN = '1') or (OEN = 'H')) then
	        IO <= 'Z';
            IOB <= 'Z';
	    elsif ((OEN = '0') or (OEN = 'L')) then
	        IO <= TO_X01(I);
            IOB <= not TO_X01(I);
	    end if;		
    end process;

   process(IO,IOB)
   begin
        if(IO = '1' and IOB = '0')then 
            O <= IO;
        elsif(IO = '0' and IOB = '1')then 
            O <= IO;
        elsif(IO = 'X' or IOB = 'X')then 
            O <= 'X';
        end if;
   end process;

end Behavioral;

-----------------TLVDS_IBUF_ADC---------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;

entity TLVDS_IBUF_ADC is
    PORT(
        ADCEN : IN std_logic;
        I : IN std_logic;
        IB : IN std_logic
        );
end TLVDS_IBUF_ADC;

architecture Behavioral of TLVDS_IBUF_ADC is
begin
end Behavioral;



-----------------ELVDS_OBUF---------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ELVDS_OBUF is
    PORT(
        O : OUT std_logic;
        OB : OUT std_logic;
        I : IN std_logic
        );
end ELVDS_OBUF;

architecture Behavioral of ELVDS_OBUF is
begin
    process(I)
    begin
        O <= I;
        OB <= not I;
    end process;
end Behavioral;

-----------------ELVDS_TBUF---------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ELVDS_TBUF is
    PORT (
    	O  : OUT   std_logic;
    	OB : OUT std_logic;
     	I  : IN    std_logic;
	    OEN : IN    std_logic
    );
end ELVDS_TBUF;

architecture  Behavioral of ELVDS_TBUF is
begin
    process(I, OEN)
    begin
	    if ((OEN = '1') or (OEN = 'H')) then
	        O <= 'Z';
            OB <= 'Z';
	    elsif ((OEN = '0') or (OEN = 'L')) then
	        O <= TO_X01(I);
            OB <= not TO_X01(I);
	    end if;		
    end process;

end Behavioral;

-----------------ELVDS_IOBUF---------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ELVDS_IOBUF is
    PORT (
    	O  : OUT   std_logic;
    	IOB : INOUT std_logic;
        IO : INOUT std_logic;
     	I  : IN    std_logic;
	    OEN : IN    std_logic
    );
end ELVDS_IOBUF;

architecture  Behavioral of ELVDS_IOBUF is
begin
    process(I, OEN)
    begin
	    if ((OEN = '1') or (OEN = 'H')) then
	        IO <= 'Z';
            IOB <= 'Z';
	    elsif ((OEN = '0') or (OEN = 'L')) then
	        IO <= TO_X01(I);
            IOB <= not TO_X01(I);
	    end if;		
    end process;

    process(IO,IOB)
    begin
        if(IO = '1' and IOB = '0')then 
            O <= IO;
        elsif(IO = '0' and IOB = '1')then 
            O <= IO;
        elsif(IO = 'X' or IOB = 'X')then 
            O <= 'X';
        end if;
    end process;

end Behavioral;

------------------------MIPI_IBUF------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MIPI_IBUF is
    PORT (
         OH, OL, OB : OUT std_logic;
         IO, IOB : INOUT std_logic;
         I, IB : IN std_logic;
         OEN, OENB, HSEN, HSREN : IN std_logic
    );
end MIPI_IBUF;

architecture Behavioral of MIPI_IBUF is    

begin
    --LP mode
    OL <= TO_X01(IO);
    OB <= TO_X01(IOB);

    process(IO, I, OEN)
    begin
	    if ((OEN = '1') or (OEN = 'H')) then
	        IO <= 'Z';
	    elsif ((OEN = '0') or (OEN = 'L')) then
	        IO <= TO_X01(I);
	    else
	        IO <= 'X';
	    end if;		
    end process;

    process(IOB, IB, OENB)
    begin      
	    if ((OENB = '1') or (OENB = 'H')) then
	        IOB <= 'Z';
	    elsif ((OENB = '0') or (OENB = 'L')) then
	        IOB <= TO_X01(IB);
	    else
	        IOB <= 'X';
	    end if;
    end process;

    --HS mode   
    process (IO, IOB, HSREN, HSEN)
    begin
        if(HSEN = '1') then
            if((IO = '1') and (IOB = '0')) then
                OH <= TO_X01(IO);
            elsif((IO = '0') and (IOB = '1')) then
                OH <= TO_X01(IO);
            elsif((IO = 'X') or (IOB = 'X')) then
                OH <= 'X';
            end if;
        end if;
    end process;
end Behavioral;

------------------------MIPI_OBUF_A---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MIPI_OBUF_A is
    PORT (
         O : OUT std_logic;
         OB : OUT std_logic;
         I : IN std_logic;
         IB : IN std_logic;
         IL : IN std_logic;
         MODESEL : IN std_logic
    );
end MIPI_OBUF_A;

architecture Behavioral of MIPI_OBUF_A is
    SIGNAL O_HS,O_LP : std_logic;
    SIGNAL OB_HS,OB_LP : std_logic;
begin    

    process(I,IL,IB,MODESEL)
    begin
        if((MODESEL = '0') or (MODESEL = 'L')) then
            O_HS <= 'Z';
            OB_HS <= 'Z';
            O_LP <= TO_X01(IL);
            OB_LP <= TO_X01(IB);
        elsif((MODESEL = '1') or (MODESEL = 'H')) then
            O_LP <= 'Z';
            OB_LP <= 'Z';
            O_HS <= TO_X01(I);
            OB_HS <= not TO_X01(I);
        end if;
    end process;

    process(O_HS,O_LP,OB_HS,OB_LP,MODESEL)
    begin
        if((MODESEL = '0') or (MODESEL = 'L')) then
            O <= O_LP;
            OB <= OB_LP;
        elsif((MODESEL = '1') or (MODESEL = 'H')) then
            O <= O_HS;
            OB <= OB_HS;
        end if;
    end process;

end Behavioral;

----------------------------I3C_IOBUF--------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity I3C_IOBUF is
    PORT (
    	O  : OUT   std_logic;
    	IO : INOUT std_logic;
     	I  : IN    std_logic;
	    MODESEL : IN    std_logic
    );
end I3C_IOBUF;

architecture  Behavioral of I3C_IOBUF is
begin
    process(IO, I, MODESEL)
    begin
    	O <= TO_X01(IO);
	    if ((MODESEL = '1') or (MODESEL = 'H')) then -- open-drain mode
            if(I = '0') then --pull down
                IO <= '0';
            else             --floating
                IO <= 'Z';
            end if;
	    elsif ((MODESEL = '0') or (MODESEL = 'L')) then --normal mode
	        IO <= TO_X01(I);
	    end if;
    end process;

end Behavioral;

----------------------IBUF_R-------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity IBUF_R is
    PORT (
    	O : OUT std_logic;
    	I : IN std_logic;
        RTEN : IN std_logic
        
    );
end IBUF_R;

architecture Behavioral of IBUF_R is
begin
    O <= TO_X01(I);
end Behavioral;


----------------------------IOBUF_R--------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity IOBUF_R is
    PORT (
    	O  : OUT   std_logic;
    	IO : INOUT std_logic;
     	I  : IN    std_logic;
        RTEN  : IN    std_logic;
	    OEN : IN    std_logic
    );
end IOBUF_R;

architecture  Behavioral of IOBUF_R is
begin
    process(IO, I, OEN)
    begin
    	O <= TO_X01(IO);
	    if ((OEN = '1') or (OEN = 'H')) then
	        IO <= 'Z';
	    elsif ((OEN = '0') or (OEN = 'L')) then
	        IO <= TO_X01(I);
	    else
	        IO <= 'X';
	    end if;		
    end process;

end Behavioral;


-----------------ELVDS_IOBUF_R---------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ELVDS_IOBUF_R is
    PORT (
    	O  : OUT std_logic;
    	IOB : INOUT std_logic;
        IO : INOUT std_logic;
     	I  : IN std_logic;
        RTEN : IN std_logic;
	    OEN : IN  std_logic
    );
end ELVDS_IOBUF_R;

architecture  Behavioral of ELVDS_IOBUF_R is
begin
    process(I, OEN)
    begin
	    if ((OEN = '1') or (OEN = 'H')) then
	        IO <= 'Z';
            IOB <= 'Z';
	    elsif ((OEN = '0') or (OEN = 'L')) then
	        IO <= TO_X01(I);
            IOB <= not TO_X01(I);
	    end if;		
    end process;

   process(IO,IOB)
   begin
        if(IO = '1' and IOB = '0')then 
            O <= IO;
        elsif(IO = '0' and IOB = '1')then 
            O <= IO;
        elsif(IO = 'X' or IOB = 'X')then 
            O <= 'X';
    end if;
   end process;

end Behavioral;


-------------------SP---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.glb.GSRO;

entity SP is
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
end SP;

architecture Behavioral of SP is
	signal bp_reg,bp_reg_async,bp_reg_sync : std_logic_vector(31 downto 0):=conv_std_logic_vector(0,32);
	signal pl_reg,pl_reg_async,pl_reg_sync : std_logic_vector(31 downto 0):=conv_std_logic_vector(0,32);
	signal ram_MEM : std_logic_vector(16383 downto 0) :=TO_StdLogicVector(INIT_RAM_3F & INIT_RAM_3E & INIT_RAM_3D & INIT_RAM_3C &INIT_RAM_3B & INIT_RAM_3A & INIT_RAM_39 & INIT_RAM_38 &INIT_RAM_37 & INIT_RAM_36 & INIT_RAM_35 & INIT_RAM_34 &INIT_RAM_33 & INIT_RAM_32 & INIT_RAM_31 & INIT_RAM_30 &INIT_RAM_2F & INIT_RAM_2E & INIT_RAM_2D & INIT_RAM_2C &INIT_RAM_2B & INIT_RAM_2A & INIT_RAM_29 & INIT_RAM_28 &INIT_RAM_27 & INIT_RAM_26 & INIT_RAM_25 & INIT_RAM_24 &INIT_RAM_23 & INIT_RAM_22 & INIT_RAM_21 & INIT_RAM_20 &INIT_RAM_1F & INIT_RAM_1E & INIT_RAM_1D & INIT_RAM_1C &INIT_RAM_1B & INIT_RAM_1A & INIT_RAM_19 & INIT_RAM_18 &INIT_RAM_17 & INIT_RAM_16 & INIT_RAM_15 & INIT_RAM_14 &INIT_RAM_13 & INIT_RAM_12 & INIT_RAM_11 & INIT_RAM_10 &INIT_RAM_0F & INIT_RAM_0E & INIT_RAM_0D & INIT_RAM_0C & INIT_RAM_0B & INIT_RAM_0A & INIT_RAM_09 & INIT_RAM_08 &INIT_RAM_07 & INIT_RAM_06 & INIT_RAM_05 & INIT_RAM_04 &INIT_RAM_03 & INIT_RAM_02 & INIT_RAM_01 & INIT_RAM_00);
	signal data_width_t: integer := BIT_WIDTH;
	signal addr_width : integer;
	signal mc : std_logic := '0';
	signal pce : std_logic;
	signal bs_en : std_logic;
	signal addr : std_logic_vector(13 downto 0):="00000000000000";
	signal grstn : std_logic;

begin
    grstn <= GSRO;
	
	for_addr:for k in 0 to 13 generate
	begin
		addr(k)<= '0' when (k<(14-addr_width)) else AD(k);
	end generate for_addr;
	
	process (data_width_t)
	begin
		case (data_width_t) is
			when 1=> addr_width<=14;
			when 2=> addr_width<=13;
			when 4=> addr_width<=12;
			when 8=> addr_width<=11;
			when 16=> addr_width<=10;
			when 32=> addr_width<=9;
			when others=>addr_width<=0;
		end case;
	end process;

	DO <= bp_reg when (READ_MODE = '0') else pl_reg;

	pce <= CE and bs_en and grstn;
	process(BLKSEL)
	begin
		if(BLKSEL = TO_STDLOGICVECTOR(BLK_SEL)) then
			bs_en <= '1';
		else 
			bs_en <= '0';
		end if;

	end process;

    process (bp_reg_async,bp_reg_sync,pl_reg_async,pl_reg_sync) 
    begin
        if(RESET_MODE = "ASYNC") then
            bp_reg <= bp_reg_async;
            pl_reg <= pl_reg_async;
        else 
            bp_reg <= bp_reg_sync;
            pl_reg <= pl_reg_sync;
        end if;
    end process;

	process (CLK)
	variable i : integer :=0;
	begin
		if (CLK'event and CLK='1') then
		    if (pce='1') then
			    if (WRE = '1') then
				    if((BIT_WIDTH=1) or (BIT_WIDTH=2) or (BIT_WIDTH=4) or (BIT_WIDTH=8)) then
					    i := 0;
					    while(i < BIT_WIDTH) loop
						    ram_MEM((conv_integer(addr)+i))<= DI(i);
						    i := i+1;
					    end loop;
				    elsif(BIT_WIDTH=16) then
				        if (AD(0)='1') then
					        i := 0;
						    while (i < 8) loop
							    ram_MEM((conv_integer(addr)+i))<= DI(i);
							    i := i+1;
						    end loop;
					    end if;
					    if(AD(1)='1') then
						    i := 8;
						    while ((i >= 8) and (i<16)) loop
							    ram_MEM((conv_integer(addr)+i))<= DI(i);
							    i := i+1;
						    end loop;
					    end if;
				    elsif(BIT_WIDTH=32) then
					    if (AD(0)='1') then
						    i := 0;
						    while (i < 8) loop
							    ram_MEM((conv_integer(addr)+i))<= DI(i);
							    i := i+1;
						    end loop;
					    end if;
					    if(AD(1)='1') then
						    i := 8;
						    while ((i >= 8) and (i<16)) loop
							    ram_MEM((conv_integer(addr)+i))<= DI(i);
							    i := i+1;
						    end loop;
					    end if;
					    if(AD(2)='1') then
						    i := 16;
						    while ((i >= 16) and (i<24)) loop
							    ram_MEM((conv_integer(addr)+i))<= DI(i);
							    i := i+1;
						    end loop;
				        end if;
					    if(AD(3)='1') then
						    i := 24;
						    while ((i >= 24) and (i<32)) loop
							    ram_MEM((conv_integer(addr)+i))<= DI(i);
							    i := i+1;
						    end loop;
					    end if;
				    end if;
				    mc <= (not mc);
			    end if;
            end if;
	    end if;
	end process;

    process (CLK,RESET,grstn)
	variable i : integer :=0;
	begin
		if (grstn='0') then
			bp_reg_async <=(others=>'0');
		elsif (RESET='1') then
			bp_reg_async <=(others=>'0');
		elsif (CLK'event and CLK='1') then
		    if (pce='1') then
			    if (WRE = '1') then
				    if (WRITE_MODE = "01") then
                        i := 0;
					    while(i < data_width_t) loop
						    bp_reg_async(i) <= ram_MEM((conv_integer(addr)+i));
						    i := i+1;
					    end loop;

                        if(BIT_WIDTH <= 8) then
                            bp_reg_async((BIT_WIDTH-1) downto 0) <= DI((BIT_WIDTH-1) downto 0);  
                        elsif(BIT_WIDTH=16) then
                            if(AD(0) = '1') then
							    bp_reg_async(7 downto 0) <= DI(7 downto 0);
                            end if;
                            if(AD(1) = '1') then
                                bp_reg_async(15 downto 8) <= DI(15 downto 8);
                            end if;                        
                        elsif(BIT_WIDTH=32) then
                            if(AD(0) = '1') then
                                bp_reg_async(7 downto 0)  <= DI(7 downto 0);
                            end if;
                            if(AD(1) = '1') then
                                bp_reg_async(15 downto 8) <= DI(15 downto 8);
                            end if;
                            if(AD(2) = '1') then
                                bp_reg_async(23 downto 16) <= DI(23 downto 16);	
                            end if;
                            if(AD(3) = '1') then
                                bp_reg_async(31 downto 24) <= DI(31 downto 24);
                            end if;
                        end if;
				    end if;

				    if (WRITE_MODE = "10") then
					    i := 0;
					    while(i < data_width_t) loop
						    bp_reg_async(i) <= ram_MEM((conv_integer(addr)+i));
						    i := i+1;
					    end loop;
				    end if;

				elsif(WRE = '0') then
					i := 0;
					while(i < BIT_WIDTH) loop
						bp_reg_async(i) <= ram_MEM((conv_integer(addr)+i));
						i := i+1;
					end loop;
			    end if;
		    end if;
	    end if;
	end process;

    process (CLK,grstn)
	variable i : integer :=0;
	begin
		if (grstn='0') then
			bp_reg_sync <=(others=>'0');
		elsif (CLK'event and CLK='1') then
		    if (RESET='1') then
			    bp_reg_sync <=(others=>'0');
		    elsif (pce='1') then
			    if (WRE = '1') then
				    if (WRITE_MODE = "01") then
                        i := 0;
					    while(i < data_width_t) loop
						    bp_reg_sync(i) <= ram_MEM((conv_integer(addr)+i));
						    i := i+1;
					    end loop;

                        if(BIT_WIDTH <= 8) then
                            bp_reg_sync((BIT_WIDTH-1) downto 0) <= DI((BIT_WIDTH-1) downto 0);
                        elsif(BIT_WIDTH=16) then
                            if(AD(0) = '1') then
							    bp_reg_sync(7 downto 0) <= DI(7 downto 0);
                            end if;
                            if(AD(1) = '1') then
                                bp_reg_sync(15 downto 8) <= DI(15 downto 8);
                            end if;
                        elsif(BIT_WIDTH=32) then
                            if(AD(0) = '1') then
                                bp_reg_sync(7 downto 0)  <= DI(7 downto 0);
                            end if;
                            if(AD(1) = '1') then
                                bp_reg_sync(15 downto 8) <= DI(15 downto 8);
                            end if;
                            if(AD(2) = '1') then
                                bp_reg_sync(23 downto 16) <= DI(23 downto 16);
                            end if;
                            if(AD(3) = '1') then
                                bp_reg_sync(31 downto 24) <= DI(31 downto 24);
                            end if;
                        end if;
				    end if;

				    if (WRITE_MODE = "10") then
					    i := 0;
					    while(i < data_width_t) loop
						    bp_reg_sync(i) <= ram_MEM((conv_integer(addr)+i));
						    i := i+1;
					    end loop;
				    end if;

				elsif(WRE = '0') then
					i := 0;
					while(i < BIT_WIDTH) loop
						bp_reg_sync(i) <= ram_MEM((conv_integer(addr)+i));
						i := i+1;
					end loop;
			    end if;
		    end if;
	    end if;
	end process;

    process (CLK,RESET,grstn)
	begin
		if (grstn='0') then
			pl_reg_async <=(others=>'0');
		elsif (RESET='1') then
			pl_reg_async <=(others=>'0');
		elsif (CLK'event and CLK='1') then
		    if (OCE = '1') then
			    pl_reg_async <= bp_reg;
		    end if;
	    end if;
	end process;

    process (CLK,grstn)
	begin
		if (grstn='0') then
			pl_reg_sync <=(others=>'0');
		elsif (CLK'event and CLK='1') then
		    if (RESET='1') then
			    pl_reg_sync <=(others=>'0');
		    elsif (OCE = '1') then
			    pl_reg_sync <= bp_reg;
		    end if;
	    end if;
	end process;
    
end Behavioral;

----------------------------SPX9---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.glb.GSRO;

entity SPX9 is
    GENERIC ( 
	    BIT_WIDTH : integer :=9;
	    READ_MODE : bit := '0'; -- 0: bypass mode; 1: pipeline mode
	    WRITE_MODE : bit_vector := "00"; -- 00: normal mode; 01: write-through mode; 10: read-before-write mode
	    BLK_SEL : bit_vector := "000"; 
        RESET_MODE : string := "SYNC";--SYNC, ASYNC
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
end SPX9;

architecture Behavioral of SPX9 is
	signal bp_reg,pl_reg,bp_reg_async,pl_reg_async,bp_reg_sync,pl_reg_sync : std_logic_vector(35 downto 0) := conv_std_logic_vector(0,36);
	signal ram_MEM : std_logic_vector(18431 downto 0):=TO_StdLogicVector(INIT_RAM_3F & INIT_RAM_3E & INIT_RAM_3D & INIT_RAM_3C &INIT_RAM_3B & INIT_RAM_3A & INIT_RAM_39 & INIT_RAM_38 &INIT_RAM_37 & INIT_RAM_36 & INIT_RAM_35 & INIT_RAM_34 &INIT_RAM_33 & INIT_RAM_32 & INIT_RAM_31 & INIT_RAM_30 &INIT_RAM_2F & INIT_RAM_2E & INIT_RAM_2D & INIT_RAM_2C &INIT_RAM_2B & INIT_RAM_2A & INIT_RAM_29 & INIT_RAM_28 &INIT_RAM_27 & INIT_RAM_26 & INIT_RAM_25 & INIT_RAM_24 &INIT_RAM_23 & INIT_RAM_22 & INIT_RAM_21 & INIT_RAM_20 &INIT_RAM_1F & INIT_RAM_1E & INIT_RAM_1D & INIT_RAM_1C &INIT_RAM_1B & INIT_RAM_1A & INIT_RAM_19 & INIT_RAM_18 &INIT_RAM_17 & INIT_RAM_16 & INIT_RAM_15 & INIT_RAM_14 &INIT_RAM_13 & INIT_RAM_12 & INIT_RAM_11 & INIT_RAM_10 &INIT_RAM_0F & INIT_RAM_0E & INIT_RAM_0D & INIT_RAM_0C & INIT_RAM_0B & INIT_RAM_0A & INIT_RAM_09 & INIT_RAM_08 &INIT_RAM_07 & INIT_RAM_06 & INIT_RAM_05 & INIT_RAM_04 &INIT_RAM_03 & INIT_RAM_02 & INIT_RAM_01 & INIT_RAM_00);
	signal data_width_t,addr_width : integer:=0;
	signal addr : std_logic_vector(14 downto 0);
	signal bs_en : std_logic;
	signal pce : std_logic;
	signal mc : std_logic := '0';
    signal grstn : std_logic;
begin
    grstn <= GSRO;

	data_width_t <= BIT_WIDTH;
	addr <= conv_std_logic_vector(conv_integer(AD(13 downto (14-addr_width)))*data_width_t,15);

   process (data_width_t)
	begin
		case (data_width_t) is
			when 9=> addr_width<=11;
			when 18=> addr_width<=10;
			when 36=> addr_width<=9;
			when others=>addr_width<=0;
		end case;
	end process;
	
	DO <= bp_reg when (READ_MODE = '0') else pl_reg;
	
	pce <= CE and bs_en and grstn;
	process(BLKSEL)
	begin
		if(BLKSEL = TO_STDLOGICVECTOR(BLK_SEL)) then
			bs_en <= '1';
		else 
			bs_en <= '0';
		end if;

	end process;

    process (bp_reg_async,bp_reg_sync,pl_reg_async,pl_reg_sync) 
    begin
        if(RESET_MODE = "ASYNC") then
            bp_reg <= bp_reg_async;
            pl_reg <= pl_reg_async;
        else 
            bp_reg <= bp_reg_sync;
            pl_reg <= pl_reg_sync;
        end if;
    end process;
	
	process (CLK)
	variable i : integer :=0;
	begin
		if (CLK'event and CLK='1') then
		    if pce='1' then
			    if (WRE = '1') then
				    if(BIT_WIDTH=9) then
					    i := 0;
					    while(i < BIT_WIDTH) loop
						    ram_MEM((conv_integer(addr)+i))<= DI(i);
						    i := i+1;
					    end loop;
				    elsif(BIT_WIDTH=18) then
					    if (AD(0)='1') then
						    i := 0;
						    while (i < 9) loop
							    ram_MEM((conv_integer(addr)+i))<= DI(i);
							    i := i+1;
						    end loop;
					    end if;
					    if(AD(1)='1') then
						    i := 9;
						    while ((i >= 9) and (i < 18)) loop
							    ram_MEM((conv_integer(addr)+i))<= DI(i);
							    i := i+1;
						    end loop;
					    end if;
				    elsif(BIT_WIDTH=36) then
					    if (AD(0)='1') then
						    i := 0;
						    while (i < 9) loop
							    ram_MEM((conv_integer(addr)+i))<= DI(i);
						    	i := i+1;
						    end loop;
					    end if;
					    if(AD(1)='1') then
						    i := 9;
						    while ((i >= 9) and (i < 18)) loop
						    	ram_MEM((conv_integer(addr)+i))<= DI(i);
					    		i := i+1;
					    	end loop;
					    end if;
					    if(AD(2)='1') then
						    i := 18;
						    while ((i >= 18) and (i<27)) loop
							    ram_MEM((conv_integer(addr)+i))<= DI(i);
							    i := i+1;
						    end loop;
				        end if;
					    if(AD(3)='1') then
						    i := 27;
						    while ((i >= 27) and (i<36)) loop
							    ram_MEM((conv_integer(addr)+i))<= DI(i);
							    i := i+1;
						    end loop;
					    end if;
				    end if;
				    mc <= (not mc);
			    end if;
		    end if;
	    end if;
	end process;

    process (CLK, grstn)
	variable i : integer :=0;
	begin
		if (grstn='0') then
			bp_reg_sync <=(others=>'0');
        elsif (CLK'event and CLK='1') then
		    if (RESET='1') then
			    bp_reg_sync <=(others=>'0');
            elsif pce='1' then
			    if (WRE = '1') then
				    if (WRITE_MODE = "01") then
                        i := 0;
					    while(i < data_width_t) loop
						    bp_reg_sync(i) <= ram_MEM((conv_integer(addr)+i));
						    i := i+1;
					    end loop;

                        if(BIT_WIDTH = 9) then
					        bp_reg_sync((BIT_WIDTH-1) downto 0) <= DI((BIT_WIDTH-1) downto 0);             
                        elsif(BIT_WIDTH = 18) then
                            if(AD(0) = '1') then
							    bp_reg_sync(8 downto 0) <= DI(8 downto 0);
                            end if;
                            if(AD(1) = '1') then
                                bp_reg_sync(17 downto 9) <= DI(17 downto 9);
                            end if;                            
                        elsif(BIT_WIDTH = 36) then
                            if(AD(0) = '1') then
                                bp_reg_sync(8 downto 0)  <= DI(8 downto 0);
                            end if;
                            if(AD(1) = '1') then
                                bp_reg_sync(17 downto 9) <= DI(17 downto 9);
                            end if;
                            if(AD(2) = '1') then
                                bp_reg_sync(26 downto 18) <= DI(26 downto 18);	
                            end if;
                            if(AD(3) = '1') then
                                bp_reg_sync(35 downto 27) <= DI(35 downto 27);
                            end if;
                        end if;
				    end if;

				    if (WRITE_MODE = "10") then
					    i := 0;
					    while(i < data_width_t) loop
						    bp_reg_sync(i) <= ram_MEM((conv_integer(addr)+i));
						    i := i+1;
					    end loop;
				    end if;
				
			    elsif(WRE = '0') then
					i := 0;
					while(i < BIT_WIDTH) loop
						bp_reg_sync(i) <= ram_MEM((conv_integer(addr)+i));
						i := i+1;
					end loop;
			    end if;
		    end if;
	    end if;
	end process;

    process (CLK, RESET, grstn)
	variable i : integer :=0;
	begin
		if (grstn='0') then
			bp_reg_async <=(others=>'0');
		elsif (RESET='1') then
			bp_reg_async <=(others=>'0');
		elsif (CLK'event and CLK='1') then
		    if pce='1' then
			    if (WRE = '1') then
				    if (WRITE_MODE = "01") then
                        i := 0;
					    while(i < data_width_t) loop
						    bp_reg_async(i) <= ram_MEM((conv_integer(addr)+i));
						    i := i+1;
					    end loop;

                        if(BIT_WIDTH = 9) then
					        bp_reg_async((BIT_WIDTH-1) downto 0) <= DI((BIT_WIDTH-1) downto 0);             
                        elsif(BIT_WIDTH = 18) then
                            if(AD(0) = '1') then
							    bp_reg_async(8 downto 0) <= DI(8 downto 0);
                            end if;
                            if(AD(1) = '1') then
                                bp_reg_async(17 downto 9) <= DI(17 downto 9);
                            end if;                            
                        elsif(BIT_WIDTH = 36) then
                            if(AD(0) = '1') then
                                bp_reg_async(8 downto 0)  <= DI(8 downto 0);
                            end if;
                            if(AD(1) = '1') then
                                bp_reg_async(17 downto 9) <= DI(17 downto 9);
                            end if;
                            if(AD(2) = '1') then
                                bp_reg_async(26 downto 18) <= DI(26 downto 18);	
                            end if;
                            if(AD(3) = '1') then
                                bp_reg_async(35 downto 27) <= DI(35 downto 27);
                            end if;
                        end if;
				    end if;

				    if (WRITE_MODE = "10") then
					    i := 0;
					    while(i < data_width_t) loop
						    bp_reg_async(i) <= ram_MEM((conv_integer(addr)+i));
						    i := i+1;
					    end loop;
				    end if;
				
			    elsif(WRE = '0') then
					i := 0;
					while(i < BIT_WIDTH) loop
						bp_reg_async(i) <= ram_MEM((conv_integer(addr)+i));
						i := i+1;
					end loop;
			    end if;
		    end if;
	    end if;
	end process;

    process (CLK, RESET, grstn)
	begin
		if (grstn='0') then
			pl_reg_async <=(others=>'0');
		elsif (RESET='1') then
			pl_reg_async <=(others=>'0');
		elsif (CLK'event and CLK='1') then
		    if(OCE = '1') then
			    pl_reg_async <= bp_reg;
		    end if;
	    end if;
	end process;

    process (CLK, grstn)
	begin
		if (grstn='0') then
			pl_reg_sync <=(others=>'0');
		elsif (CLK'event and CLK='1') then
		    if (RESET='1') then
			    pl_reg_sync <=(others=>'0');
		    elsif(OCE = '1') then
			    pl_reg_sync <= bp_reg;
		    end if;
	    end if;
	end process;

end Behavioral;


----------------------------------SDPB---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.glb.GSRO;

entity SDPB is
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
        BLKSELA, BLKSELB : in std_logic_vector(2 downto 0);
	    DI : in std_logic_vector(31 downto 0)
    );
end SDPB;

architecture Behavioral of SDPB is
	signal bp_reg,bp_reg_async,bp_reg_sync : std_logic_vector(31 downto 0):=conv_std_logic_vector(0,32);
	signal pl_reg,pl_reg_async,pl_reg_sync : std_logic_vector(31 downto 0):=conv_std_logic_vector(0,32);
	signal ram_MEM : std_logic_vector(16383 downto 0):=TO_StdLogicVector(INIT_RAM_3F & INIT_RAM_3E & INIT_RAM_3D & INIT_RAM_3C &INIT_RAM_3B & INIT_RAM_3A & INIT_RAM_39 & INIT_RAM_38 &INIT_RAM_37 & INIT_RAM_36 & INIT_RAM_35 & INIT_RAM_34 &INIT_RAM_33 & INIT_RAM_32 & INIT_RAM_31 & INIT_RAM_30 &INIT_RAM_2F & INIT_RAM_2E & INIT_RAM_2D & INIT_RAM_2C &INIT_RAM_2B & INIT_RAM_2A & INIT_RAM_29 & INIT_RAM_28 &INIT_RAM_27 & INIT_RAM_26 & INIT_RAM_25 & INIT_RAM_24 &INIT_RAM_23 & INIT_RAM_22 & INIT_RAM_21 & INIT_RAM_20 &INIT_RAM_1F & INIT_RAM_1E & INIT_RAM_1D & INIT_RAM_1C &INIT_RAM_1B & INIT_RAM_1A & INIT_RAM_19 & INIT_RAM_18 &INIT_RAM_17 & INIT_RAM_16 & INIT_RAM_15 & INIT_RAM_14 &INIT_RAM_13 & INIT_RAM_12 & INIT_RAM_11 & INIT_RAM_10 &INIT_RAM_0F & INIT_RAM_0E & INIT_RAM_0D & INIT_RAM_0C & INIT_RAM_0B & INIT_RAM_0A & INIT_RAM_09 & INIT_RAM_08 &INIT_RAM_07 & INIT_RAM_06 & INIT_RAM_05 & INIT_RAM_04 &INIT_RAM_03 & INIT_RAM_02 & INIT_RAM_01 & INIT_RAM_00);
	signal data_width_t1,data_width_t2,addr_width_a,addr_width_b : integer:=0;
	signal mc : std_logic := '0';
	signal bs_ena,bs_enb : std_logic;
	signal pcea,pceb : std_logic;
	signal addr_a,addr_b : std_logic_vector(13 downto 0):=conv_std_logic_vector(0,14);
    signal grstn : std_logic;

begin
    grstn <= GSRO;

    data_width_t1 <= BIT_WIDTH_0;
	data_width_t2 <= BIT_WIDTH_1;
	
	for_addr:for k in 0 to 13 generate
	begin
			addr_a(k)<= '0' when (k<(14-addr_width_a)) else ADA(k);
			addr_b(k)<= '0' when (k<(14-addr_width_b)) else ADB(k);
	end generate for_addr;
	
	process (data_width_t1,data_width_t2)
	begin
		case (data_width_t1) is
			when 1=> addr_width_a<=14;
			when 2=> addr_width_a<=13;
			when 4=> addr_width_a<=12;
			when 8=> addr_width_a<=11;
			when 16=> addr_width_a<=10;
			when 32=> addr_width_a<=9;
			when others=>addr_width_a<=0;
		end case;
		case (data_width_t2) is
			when 1=> addr_width_b<=14;
			when 2=> addr_width_b<=13;
			when 4=> addr_width_b<=12;
			when 8=> addr_width_b<=11;
			when 16=> addr_width_b<=10;
			when 32=> addr_width_b<=9;
			when others=>addr_width_b<=0;
		end case;
	end process;

	DO <= bp_reg when (READ_MODE = '0') else pl_reg;
	
	pcea <= CEA and bs_ena and grstn;
	pceb <= CEB and bs_enb;
	process(BLKSELA, BLKSELB)
	begin
		if(BLKSELA = TO_STDLOGICVECTOR(BLK_SEL_0)) then
			bs_ena <= '1';
		else 
			bs_ena <= '0';
		end if;

        if(BLKSELB = TO_STDLOGICVECTOR(BLK_SEL_1)) then
			bs_enb <= '1';
		else 
			bs_enb <= '0';
		end if;

	end process;
	
    process (bp_reg_async,bp_reg_sync,pl_reg_async,pl_reg_sync) 
    begin
        if(RESET_MODE = "ASYNC") then
            bp_reg <= bp_reg_async;
            pl_reg <= pl_reg_async;
        else 
            bp_reg <= bp_reg_sync;
            pl_reg <= pl_reg_sync;
        end if;
    end process;

	process (CLKA)
	variable i : integer :=0;
	begin					    
	    if (CLKA'event and CLKA='1') then
		    if (pcea='1') then
			    if((data_width_t1=1) or (data_width_t1=2) or (data_width_t1=4) or (data_width_t1=8)) then
			        i := 0;
			        while(i < data_width_t1) loop
				        ram_MEM((conv_integer(addr_a)+i))<= DI(i);
				        i := i+1;
			        end loop;
		        elsif(data_width_t1=16) then
				    if (ADA(0)='1') then
					    i := 0;
					    while (i < 8) loop
						    ram_MEM((conv_integer(addr_a)+i))<= DI(i);
						    i := i+1;
					    end loop;
				    end if;
				    if(ADA(1)='1') then
					    i := 8;
					    while ((i >= 8) and (i<16)) loop
						    ram_MEM((conv_integer(addr_a)+i))<= DI(i);
						    i := i+1;
					    end loop;
				    end if;
		        elsif(data_width_t1=32) then
				    if (ADA(0)='1') then
					    i := 0;
					    while (i < 8) loop
						    ram_MEM((conv_integer(addr_a)+i))<= DI(i);
						    i := i+1;
					    end loop;
				    end if;
				    if(ADA(1)='1') then
					    i := 8;
					    while ((i >= 8) and (i<16)) loop
						    ram_MEM((conv_integer(addr_a)+i))<= DI(i);
						    i := i+1;
					    end loop;
				    end if;
				    if(ADA(2)='1') then
					    i := 16;
					    while ((i >= 16) and (i<24)) loop
						    ram_MEM((conv_integer(addr_a)+i))<= DI(i);
						    i := i+1;
					    end loop;
			        end if;
				    if(ADA(3)='1') then
				    	i := 24;
					    while ((i >= 24) and (i<32)) loop
					    	ram_MEM((conv_integer(addr_a)+i))<= DI(i);
					    	i := i+1;
				    	end loop;
			        end if;
		        end if;
		        mc <= (not mc);
	        end if;
	    end if;
	end process;

	process (CLKB,RESET,grstn)
	variable i : integer :=0;
	begin
		if grstn='0' then
			bp_reg_async <= (others=>'0');
		elsif RESET='1' then
			bp_reg_async <= (others=>'0');
		elsif CLKB'event and CLKB='1' then
			if (pceb='1') then
				i := 0;
				while(i < data_width_t2) loop
					bp_reg_async(i) <= ram_MEM((conv_integer(addr_b)+i));
					i := i+1;
				end loop;
			end if;
		end if;
	end process;

    process (CLKB,grstn)
	variable i : integer :=0;
	begin
		if grstn='0' then
			bp_reg_sync <= (others=>'0');
	    elsif CLKB'event and CLKB='1' then
		    if RESET='1' then
			    bp_reg_sync <= (others=>'0');
			elsif (pceb='1') then
				i := 0;
				while(i < data_width_t2) loop
					bp_reg_sync(i) <= ram_MEM((conv_integer(addr_b)+i));
					i := i+1;
				end loop;
			end if;
		end if;
	end process;

    process (CLKB,RESET,grstn)
	begin
		if grstn='0' then
			pl_reg_async <= (others=>'0');
		elsif RESET='1' then
			pl_reg_async <= (others=>'0');
		elsif CLKB'event and CLKB='1' then
			if(OCE = '1') then
				pl_reg_async <= bp_reg;
			end if;
		end if;
	end process;

    process (CLKB,RESET,grstn)
	variable i : integer :=0;
	begin
		if grstn='0' then
			pl_reg_sync <= (others=>'0');
		elsif CLKB'event and CLKB='1' then
		    if RESET='1' then
			    pl_reg_sync <= (others=>'0');
			elsif(OCE = '1') then
				pl_reg_sync <= bp_reg;
			end if;
		end if;
	end process;

end Behavioral;

----------------------------------SDPX9B---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.glb.GSRO;

entity SDPX9B is
    GENERIC ( 
	    BIT_WIDTH_0 : integer :=18; -- 9, 18, 36
	    BIT_WIDTH_1 : integer :=18; -- 9, 18, 36
	    READ_MODE : bit := '0'; -- 0: bypass mode; 1: pipeline mode
	    BLK_SEL_0 : bit_vector := "000";
	    BLK_SEL_1 : bit_vector := "000";
        RESET_MODE : string := "SYNC"; --SYNC,ASYNC
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
    	BLKSELA, BLKSELB : in std_logic_vector(2 downto 0);
	    DI : in std_logic_vector(35 downto 0)
    );
end SDPX9B;

architecture Behavioral of SDPX9B is
	signal bp_reg,pl_reg,bp_reg_async,pl_reg_async,bp_reg_sync,pl_reg_sync : std_logic_vector(35 downto 0) := conv_std_logic_vector(0, 36);
	signal ram_MEM : std_logic_vector(18431 downto 0):= TO_StdLogicVector(INIT_RAM_3F & INIT_RAM_3E & INIT_RAM_3D & INIT_RAM_3C &INIT_RAM_3B & INIT_RAM_3A & INIT_RAM_39 & INIT_RAM_38 &INIT_RAM_37 & INIT_RAM_36 & INIT_RAM_35 & INIT_RAM_34 &INIT_RAM_33 & INIT_RAM_32 & INIT_RAM_31 & INIT_RAM_30 &INIT_RAM_2F & INIT_RAM_2E & INIT_RAM_2D & INIT_RAM_2C &INIT_RAM_2B & INIT_RAM_2A & INIT_RAM_29 & INIT_RAM_28 &INIT_RAM_27 & INIT_RAM_26 & INIT_RAM_25 & INIT_RAM_24 &INIT_RAM_23 & INIT_RAM_22 & INIT_RAM_21 & INIT_RAM_20 &INIT_RAM_1F & INIT_RAM_1E & INIT_RAM_1D & INIT_RAM_1C &INIT_RAM_1B & INIT_RAM_1A & INIT_RAM_19 & INIT_RAM_18 &INIT_RAM_17 & INIT_RAM_16 & INIT_RAM_15 & INIT_RAM_14 &INIT_RAM_13 & INIT_RAM_12 & INIT_RAM_11 & INIT_RAM_10 &INIT_RAM_0F & INIT_RAM_0E & INIT_RAM_0D & INIT_RAM_0C & INIT_RAM_0B & INIT_RAM_0A & INIT_RAM_09 & INIT_RAM_08 &INIT_RAM_07 & INIT_RAM_06 & INIT_RAM_05 & INIT_RAM_04 &INIT_RAM_03 & INIT_RAM_02 & INIT_RAM_01 & INIT_RAM_00);
	signal data_width_t1,data_width_t2,addr_width_a,addr_width_b : integer:=0;
	signal addr_a,addr_b : std_logic_vector(14 downto 0):=conv_std_logic_vector(0,15);
	signal mc : std_logic := '0';
	signal bs_ena,bs_enb : std_logic;
	signal pcea,pceb : std_logic;
    signal grstn : std_logic;
	
begin
    grstn <= GSRO;

	data_width_t1 <= BIT_WIDTH_0;
	data_width_t2 <= BIT_WIDTH_1;

	addr_a <= conv_std_logic_vector(conv_integer(ADA(13 downto (14-addr_width_a)))*data_width_t1,15);
	addr_b <= conv_std_logic_vector(conv_integer(ADB(13 downto (14-addr_width_b)))*data_width_t2,15);

	process (data_width_t1,data_width_t2)
	begin
		case (data_width_t1) is
			when 9=> addr_width_a<=11;
			when 18=> addr_width_a<=10;
			when 36=> addr_width_a<=9;
			when others=>addr_width_a<=0;
		end case;
		case (data_width_t2) is
			when 9=> addr_width_b<=11;
			when 18=> addr_width_b<=10;
			when 36=> addr_width_b<=9;
			when others=>addr_width_b<=0;
		end case;
	end process;

	DO <= bp_reg when (READ_MODE = '0') else pl_reg;
	
	pcea <= CEA and bs_ena and grstn;
	pceb <= CEB and bs_enb;
	process(BLKSELA, BLKSELB)
	begin
		if(BLKSELA = TO_STDLOGICVECTOR(BLK_SEL_0)) then
			bs_ena <= '1';
		else
			bs_ena <= '0';
		end if;

        if(BLKSELB = TO_STDLOGICVECTOR(BLK_SEL_1)) then
			bs_enb <= '1';
		else
			bs_enb <= '0';
		end if;
	end process;

    process (bp_reg_async,bp_reg_sync,pl_reg_async,pl_reg_sync) 
    begin
        if(RESET_MODE = "ASYNC") then
            bp_reg <= bp_reg_async;
            pl_reg <= pl_reg_async;
        else 
            bp_reg <= bp_reg_sync;
            pl_reg <= pl_reg_sync;
        end if;
    end process;
	
	process (CLKA)
	variable i : integer :=0;
	begin
	    if CLKA'event and CLKA='1' then
		    if (pcea='1') then
		        if(data_width_t1=9) then
				    i := 0;
				    while(i < data_width_t1) loop
					    ram_MEM((conv_integer(addr_a)+i))<= DI(i);
					    i := i+1;
				    end loop;
			    elsif(data_width_t1=18) then
				    if (ADA(0)='1') then
					    i := 0;
					    while (i < 9) loop
						    ram_MEM((conv_integer(addr_a)+i))<= DI(i);
						    i := i+1;
					    end loop;
				    end if;
				    if(ADA(1)='1') then
					    i := 9;
					    while ((i >= 9) and (i < 18)) loop
						    ram_MEM((conv_integer(addr_a)+i))<= DI(i);
						    i := i+1;
					    end loop;
				    end if;
			    elsif(data_width_t1=36) then
				    if (ADA(0)='1') then
					    i := 0;
					    while (i < 9) loop
						    ram_MEM((conv_integer(addr_a)+i))<= DI(i);
						    i := i+1;
					    end loop;
				    end if;
			    	if(ADA(1)='1') then
					    i := 9;
					    while ((i >= 9) and (i < 18)) loop
						    ram_MEM((conv_integer(addr_a)+i))<= DI(i);
						    i := i+1;
				    	end loop;
			    	end if;
				    if(ADA(2)='1') then
					    i := 18;
					    while ((i >= 18) and (i<27)) loop
						    ram_MEM((conv_integer(addr_a)+i))<= DI(i);
						    i := i+1;
					    end loop;
			        end if;
				    if(ADA(3)='1') then
					    i := 27;
					    while ((i >= 27) and (i<36)) loop
						    ram_MEM((conv_integer(addr_a)+i))<= DI(i);
						    i := i+1;
					    end loop;
				    end if;
			    end if;
			mc <= (not mc);
            end if;
	    end if;
	end process;

	process (CLKB,RESET,grstn)
	variable i : integer :=0;
	begin
		if grstn='0' then
			bp_reg_async <= (others=>'0');
		elsif RESET='1' then
			bp_reg_async <= (others=>'0');
		elsif CLKB'event and CLKB='1' then
			if (pceb='1') then
				i := 0;
				while(i < data_width_t2) loop
					bp_reg_async(i) <= ram_MEM((conv_integer(addr_b)+i));
					i := i+1;
				end loop;
			end if;
		end if;
	end process;

    process (CLKB,grstn)
	variable i : integer :=0;
	begin
		if grstn='0' then
			bp_reg_sync <= (others=>'0');
		elsif CLKB'event and CLKB='1' then
		    if RESET='1' then
			    bp_reg_sync <= (others=>'0');
			elsif (pceb='1') then
				i := 0;
				while(i < data_width_t2) loop
					bp_reg_sync(i) <= ram_MEM((conv_integer(addr_b)+i));
					i := i+1;
				end loop;
			end if;
		end if;
	end process;

    process (CLKB,RESET,grstn)
	begin
		if grstn='0' then
			pl_reg_async <= (others=>'0');
		elsif RESET='1' then
			pl_reg_async <= (others=>'0');
		elsif CLKB'event and CLKB='1' then
			if(OCE = '1') then
				pl_reg_async <= bp_reg;
			end if;
		end if;
	end process;

    process (CLKB,grstn)
	begin
		if grstn='0' then
			pl_reg_sync <= (others=>'0');
		elsif CLKB'event and CLKB='1' then
		    if RESET='1' then
			    pl_reg_sync <= (others=>'0');
			elsif(OCE = '1') then
				pl_reg_sync <= bp_reg;
			end if;			
		end if;
	end process;

end Behavioral;

----------------------------DPB---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.glb.GSRO;

entity DPB is
    GENERIC (
		BIT_WIDTH_0 : integer :=16; -- 1, 2, 4, 8, 16
		BIT_WIDTH_1 : integer :=16; -- 1, 2, 4, 8, 16
		READ_MODE0 : bit := '0'; -- 0: bypass mode; 1: pipeline mode
		READ_MODE1 : bit := '0'; -- 0: bypass mode; 1: pipeline mode
		WRITE_MODE0 : bit_vector := "00"; -- 00: normal mode; 01: write-through mode; 10: read-before-write mode
		WRITE_MODE1 : bit_vector := "00"; -- 00: normal mode; 01: write-through mode; 10: read-before-write mode
	    BLK_SEL_0 : bit_vector := "000";
	    BLK_SEL_1 : bit_vector := "000";
        RESET_MODE : string := "SYNC";--SYNC, ASYNC
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
    	BLKSELA, BLKSELB : in std_logic_vector(2 downto 0);
		DIA,DIB : in std_logic_vector(15 downto 0)
    );
end DPB;

architecture Behavioral of DPB is
	signal bpa_reg,bpb_reg,pla_reg,plb_reg,bpa_reg_async,bpb_reg_async,pla_reg_async,plb_reg_async,bpa_reg_sync,bpb_reg_sync,pla_reg_sync,plb_reg_sync : std_logic_vector(15 downto 0):= X"0000";
	signal ram_MEM : std_logic_vector(16383 downto 0) := TO_StdLogicVector(INIT_RAM_3F & INIT_RAM_3E & INIT_RAM_3D & INIT_RAM_3C &INIT_RAM_3B & INIT_RAM_3A & INIT_RAM_39 & INIT_RAM_38 &INIT_RAM_37 & INIT_RAM_36 & INIT_RAM_35 & INIT_RAM_34 &INIT_RAM_33 & INIT_RAM_32 & INIT_RAM_31 & INIT_RAM_30 &INIT_RAM_2F & INIT_RAM_2E & INIT_RAM_2D & INIT_RAM_2C &INIT_RAM_2B & INIT_RAM_2A & INIT_RAM_29 & INIT_RAM_28 &INIT_RAM_27 & INIT_RAM_26 & INIT_RAM_25 & INIT_RAM_24 &INIT_RAM_23 & INIT_RAM_22 & INIT_RAM_21 & INIT_RAM_20 &INIT_RAM_1F & INIT_RAM_1E & INIT_RAM_1D & INIT_RAM_1C &INIT_RAM_1B & INIT_RAM_1A & INIT_RAM_19 & INIT_RAM_18 &INIT_RAM_17 & INIT_RAM_16 & INIT_RAM_15 & INIT_RAM_14 &INIT_RAM_13 & INIT_RAM_12 & INIT_RAM_11 & INIT_RAM_10 &INIT_RAM_0F & INIT_RAM_0E & INIT_RAM_0D & INIT_RAM_0C & INIT_RAM_0B & INIT_RAM_0A & INIT_RAM_09 & INIT_RAM_08 &INIT_RAM_07 & INIT_RAM_06 & INIT_RAM_05 & INIT_RAM_04 &INIT_RAM_03 & INIT_RAM_02 & INIT_RAM_01 & INIT_RAM_00);
	signal data_width_t1,data_width_t2,addr_width_a,addr_width_b : integer := 0;
	signal addr_a,addr_b : std_logic_vector(13 downto 0):=conv_std_logic_vector(0,14);
	signal mc : std_logic := '0';
	signal bs_ena,bs_enb : std_logic;
	signal pcea,pceb : std_logic;
    signal grstn : std_logic;

begin
    grstn <= GSRO;

    data_width_t1 <= BIT_WIDTH_0;
	data_width_t2 <= BIT_WIDTH_1;
	
	for_addr:for k in 0 to 13 generate
	begin
		addr_a(k)<= '0' when (k<(14-addr_width_a)) else ADA(K);
		addr_b(k)<= '0' when (k<(14-addr_width_b)) else ADB(K);
	end generate for_addr;

	process (data_width_t1,data_width_t2)
	begin
		case (data_width_t1) is
			when 1=> addr_width_a<=14;
			when 2=> addr_width_a<=13;
			when 4=> addr_width_a<=12;
			when 8=> addr_width_a<=11;
			when 16=> addr_width_a<=10;
			when others=>addr_width_a<=0;
		end case;
		case (data_width_t2) is
			when 1=> addr_width_b<=14;
			when 2=> addr_width_b<=13;
			when 4=> addr_width_b<=12;
			when 8=> addr_width_b<=11;
			when 16=> addr_width_b<=10;
			when others=>addr_width_b<=0;
		end case;
	end process;

	DOA <= bpa_reg when (READ_MODE0 = '0') else pla_reg;
	DOB <= bpb_reg when (READ_MODE1 = '0') else plb_reg;
	
	pcea <= CEA and bs_ena and grstn;
	pceb <= CEB and bs_enb;
	process(BLKSELA, BLKSELB)
	begin
		if(BLKSELA = TO_STDLOGICVECTOR(BLK_SEL_0)) then
			bs_ena <= '1';
		else
			bs_ena <= '0';
		end if;

        if(BLKSELB = TO_STDLOGICVECTOR(BLK_SEL_1)) then
			bs_enb <= '1';
		else
			bs_enb <= '0';
		end if;
	end process;

    process(bpa_reg_async, bpa_reg_sync, pla_reg_async, pla_reg_sync, bpb_reg_async, bpb_reg_sync, plb_reg_async, plb_reg_sync) 
    begin
        if(RESET_MODE = "ASYNC") then
            bpa_reg <= bpa_reg_async;
            pla_reg <= pla_reg_async;
            bpb_reg <= bpb_reg_async;
            plb_reg <= plb_reg_async;
        else 
            bpa_reg <= bpa_reg_sync;
            pla_reg <= pla_reg_sync;
            bpb_reg <= bpb_reg_sync;
            plb_reg <= plb_reg_sync;
        end if;
    end process;


	process (CLKA,CLKB)
	variable i : integer :=0;
	begin	
	    -------port A------------------------
	    if CLKA'event and CLKA='1' then
            if (pcea='1') then
			    if (WREA='1') then
			        if((BIT_WIDTH_0=1) or (BIT_WIDTH_0=2) or (BIT_WIDTH_0=4) or (BIT_WIDTH_0=8)) then
					    i := 0;
					    while(i < BIT_WIDTH_0) loop
						    ram_MEM((conv_integer(addr_a)+i))<= DIA(i);
						    i := i+1;
					    end loop;
				    elsif(BIT_WIDTH_0=16) then
					    if (ADA(0)='1') then
						    i := 0;
						    while (i < 8) loop
							    ram_MEM((conv_integer(addr_a)+i))<= DIA(i);
							    i := i+1;
						    end loop;
					    end if;
					    if(ADA(1)='1') then
						    i := 8;
						    while ((i >= 8) and (i<16)) loop
							    ram_MEM((conv_integer(addr_a)+i))<= DIA(i);
							    i := i+1;
						    end loop;
					    end if;
				    end if;
				    mc <= (not mc);
 			    end if;
		    end if;
	    end if;

	    -------------port B------------------------------------------
	    if CLKB'event and CLKB='1' then
		    if (pceb='1') then
			    if(WREB='1') then
				    if((BIT_WIDTH_1=1) or (BIT_WIDTH_1=2) or (BIT_WIDTH_1=4) or (BIT_WIDTH_1=8)) then
					    i := 0;
					    while(i < BIT_WIDTH_1) loop
						    ram_MEM((conv_integer(addr_b)+i))<= DIB(i);
						    i := i+1;
					    end loop;
				    elsif(BIT_WIDTH_1=16) then
					    if (ADB(0)='1') then
						    i := 0;
						    while (i < 8) loop
							    ram_MEM((conv_integer(addr_b)+i))<= DIB(i);
							    i := i+1;
						    end loop;
					    end if;
					    if(ADB(1)='1') then
						    i := 8;
						    while ((i >= 8) and (i<16)) loop
							    ram_MEM((conv_integer(addr_b)+i))<= DIB(i);
							    i := i+1;
						    end loop;
					    end if;
				    end if;
				    mc <= (not mc);
			    end if;
			end if;
        end if;
	end process;

    
    process (CLKA,CLKB,RESETA,RESETB,grstn)
	variable i : integer :=0;
	begin	
	    -------port A------------------------
	    if grstn='0' then
			bpa_reg_async <= (others=>'0');
	    elsif RESETA='1' then
			bpa_reg_async <= (others=>'0');
	    elsif CLKA'event and CLKA='1' then
		    if (pcea='1') then
			    if (WREA='1') then
			        if (WRITE_MODE0 = "01") then
                        i := 0;
					    while(i < data_width_t1) loop
			   	            bpa_reg_async(i) <= ram_MEM((conv_integer(addr_a)+i));
				            i := i+1;
					    end loop;
                        
                        if(BIT_WIDTH_0<=8) then
					        bpa_reg_async((BIT_WIDTH_0-1) downto 0) <= DIA((BIT_WIDTH_0-1) downto 0);
                        elsif(BIT_WIDTH_0=16) then
                            if(ADA(0) = '1') then
						        bpa_reg_async(7 downto 0) <= DIA(7 downto 0);
                            end if;
                            if(ADA(1) = '1') then
						        bpa_reg_async(15 downto 8) <= DIA(15 downto 8);
                            end if;
				        end if;
			        end if;

			        if (WRITE_MODE0 = "10") then
			    	    i := 0;
					    while(i < data_width_t1) loop
			   	            bpa_reg_async(i) <= ram_MEM((conv_integer(addr_a)+i));
				            i := i+1;
					    end loop;
				    end if;
					 		
				elsif(WREA = '0') then
					i := 0;
					while(i < BIT_WIDTH_0) loop
						bpa_reg_async(i) <= ram_MEM((conv_integer(addr_a)+i));
						i := i+1;
					end loop;
			    end if;
		    end if;
	    end if;

	    -------------port B------------------------------------------
	    if grstn='0' then
		    bpb_reg_async <=(others=>'0');
	    elsif RESETB='1' then
		    bpb_reg_async <=(others=>'0');
	    elsif CLKB'event and CLKB='1' then
		    if (pceb='1') then
			    if(WREB='1') then
				    if (WRITE_MODE1 = "01") then
                        i := 0;
					    while(i < data_width_t2) loop
						    bpb_reg_async(i) <= ram_MEM((conv_integer(addr_b)+i));
						    i := i+1;
					    end loop;

                        if(BIT_WIDTH_1<=8) then
					        bpb_reg_async((BIT_WIDTH_1-1) downto 0) <= DIB((BIT_WIDTH_1-1) downto 0);
                        elsif(BIT_WIDTH_1=16) then
                            if(ADB(0) = '1') then
						        bpb_reg_async(7 downto 0) <= DIB(7 downto 0);
                            end if;
                            if(ADB(1) = '1') then
						        bpb_reg_async(15 downto 8) <= DIB(15 downto 8);
                            end if;
				        end if;
				    end if;

				    if (WRITE_MODE1 = "10") then
					    i := 0;
					    while(i < data_width_t2) loop
						    bpb_reg_async(i) <= ram_MEM((conv_integer(addr_b)+i));
						    i := i+1;
					    end loop;
				    end if;

				elsif(WREB = '0') then
					i := 0;
					while(i < BIT_WIDTH_1) loop
						bpb_reg_async(i) <= ram_MEM((conv_integer(addr_b)+i));
						i := i+1;
					end loop;
			    end if;
			end if;
	    end if;
	end process;

    process (CLKA,CLKB,grstn)
	variable i : integer :=0;
	begin	
	    -------port A------------------------
	    if grstn='0' then
			bpa_reg_sync <= (others=>'0');
		elsif CLKA'event and CLKA='1' then
	        if RESETA='1' then
			    bpa_reg_sync <= (others=>'0');
		    elsif (pcea='1') then
			    if (WREA='1') then
			        if (WRITE_MODE0 = "01") then
                        i := 0;
					    while(i < data_width_t1) loop
			   	            bpa_reg_sync(i) <= ram_MEM((conv_integer(addr_a)+i));
				            i := i+1;
					    end loop;

                        if(BIT_WIDTH_0<=8) then
					        bpa_reg_sync((BIT_WIDTH_0-1) downto 0) <= DIA((BIT_WIDTH_0-1) downto 0);
                        elsif(BIT_WIDTH_0=16) then
                            if(ADA(0) = '1') then
						        bpa_reg_sync(7 downto 0) <= DIA(7 downto 0);
                            end if;
                            if(ADA(1) = '1') then
						        bpa_reg_sync(15 downto 8) <= DIA(15 downto 8);
                            end if;
				        end if;
			        end if;

			        if (WRITE_MODE0 = "10") then
			    	    i := 0;
					    while(i < data_width_t1) loop
			   	            bpa_reg_sync(i) <= ram_MEM((conv_integer(addr_a)+i));
				            i := i+1;
					    end loop;
				    end if;
					 		
				elsif(WREA = '0') then
					i := 0;
					while(i < BIT_WIDTH_0) loop
						bpa_reg_sync(i) <= ram_MEM((conv_integer(addr_a)+i));
						i := i+1;
					end loop;
			    end if;
		    end if;
	    end if;

	    -------------port B------------------------------------------
	    if grstn='0' then
			bpb_reg_sync <= (others=>'0');
		elsif CLKB'event and CLKB='1' then
	        if RESETB='1' then
		        bpb_reg_sync <=(others=>'0');
		    elsif (pceb='1') then
			    if(WREB='1') then
				    if (WRITE_MODE1 = "01") then
                        i := 0;
					    while(i < data_width_t2) loop
						    bpb_reg_sync(i) <= ram_MEM((conv_integer(addr_b)+i));
						    i := i+1;
					    end loop;

                        if(BIT_WIDTH_1<=8) then
					        bpb_reg_sync((BIT_WIDTH_1-1) downto 0) <= DIB((BIT_WIDTH_1-1) downto 0);
                        elsif(BIT_WIDTH_1=16) then
                            if(ADB(0) = '1') then
						        bpb_reg_sync(7 downto 0) <= DIB(7 downto 0);
                            end if;
                            if(ADB(1) = '1') then
						        bpb_reg_sync(15 downto 8) <= DIB(15 downto 8);
                            end if;
				        end if;
				    end if;

				    if (WRITE_MODE1 = "10") then
					    i := 0;
					    while(i < data_width_t2) loop
						    bpb_reg_sync(i) <= ram_MEM((conv_integer(addr_b)+i));
						    i := i+1;
					    end loop;
				    end if;

				elsif(WREB = '0') then
					i := 0;
					while(i < BIT_WIDTH_1) loop
						bpb_reg_sync(i) <= ram_MEM((conv_integer(addr_b)+i));
						i := i+1;
					end loop;
			    end if;
			end if;
	    end if;
	end process;

    process (CLKA,CLKB,RESETA,RESETB,grstn)
	begin	
	    if grstn='0' then
			pla_reg_async <= (others=>'0');
	    elsif RESETA='1' then
			pla_reg_async <= (others=>'0');
	    elsif CLKA'event and CLKA='1' then
		    if(OCEA = '1') then
		        pla_reg_async <= bpa_reg;
	        end if;
	    end if;

	    if grstn='0' then
		    plb_reg_async <=(others=>'0');
	    elsif RESETB='1' then
		    plb_reg_async <=(others=>'0');
	    elsif CLKB'event and CLKB='1' then
		    if(OCEB = '1') then
		        plb_reg_async <= bpb_reg;
	        end if;
		end if;
	end process;

    process (CLKA,CLKB,grstn)
	begin	
	    if grstn='0' then
			pla_reg_sync <= (others=>'0');
		elsif CLKA'event and CLKA='1' then
	        if RESETA='1' then
			    pla_reg_sync <= (others=>'0');
		    elsif(OCEA = '1') then
		        pla_reg_sync <= bpa_reg;
	        end if;
	    end if;

	    if grstn='0' then
			plb_reg_sync <= (others=>'0');
		elsif CLKB'event and CLKB='1' then
	        if RESETB='1' then
		        plb_reg_sync <=(others=>'0');
		    elsif(OCEB = '1') then
		        plb_reg_sync <= bpb_reg;
	        end if;
		end if;
	end process;
	
end Behavioral;

----------------------------DPX9B---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.glb.GSRO;

entity DPX9B is
    GENERIC ( 
	    BIT_WIDTH_0 : integer :=18; -- 9, 18
	    BIT_WIDTH_1 : integer :=18; -- 9, 18
	    READ_MODE0 : bit := '0'; -- 0: bypass mode; 1: pipeline mode
	    READ_MODE1 : bit := '0'; -- 0: bypass mode; 1: pipeline mode
	    WRITE_MODE0 : bit_vector := "00"; -- 00: normal mode; 01: write-through mode; 10: read-before-write mode
	    WRITE_MODE1 : bit_vector := "00"; -- 00: normal mode; 01: write-through mode; 10: read-before-write mode
        BLK_SEL_0 : bit_vector := "000";
        BLK_SEL_1 : bit_vector := "000";
        RESET_MODE : string := "SYNC";--SYNC, ASYNC
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
	    DOA,DOB : out std_logic_vector(17 downto 0):=conv_std_logic_vector(0,18);
	    CLKA,CLKB, CEA,CEB,OCEA,OCEB,RESETA,RESETB,WREA,WREB : in std_logic;
	    ADA,ADB : in std_logic_vector(13 downto 0);
	    DIA : in std_logic_vector(17 downto 0);
        BLKSELA, BLKSELB : in std_logic_vector(2 downto 0);
	    DIB : in std_logic_vector(17 downto 0)
    );
end DPX9B;

architecture Behavioral of DPX9B is
	signal bpa_reg,bpb_reg,pla_reg,plb_reg,bpa_reg_async,bpb_reg_async,pla_reg_async,plb_reg_async,bpa_reg_sync,bpb_reg_sync,pla_reg_sync,plb_reg_sync : std_logic_vector(17 downto 0) := conv_std_logic_vector(0, 18);
	signal ram_MEM : std_logic_vector(18431 downto 0):=TO_StdLogicVector(INIT_RAM_3F & INIT_RAM_3E & INIT_RAM_3D & INIT_RAM_3C &INIT_RAM_3B & INIT_RAM_3A & INIT_RAM_39 & INIT_RAM_38 &INIT_RAM_37 & INIT_RAM_36 & INIT_RAM_35 & INIT_RAM_34 &INIT_RAM_33 & INIT_RAM_32 & INIT_RAM_31 & INIT_RAM_30 &INIT_RAM_2F & INIT_RAM_2E & INIT_RAM_2D & INIT_RAM_2C &INIT_RAM_2B & INIT_RAM_2A & INIT_RAM_29 & INIT_RAM_28 &INIT_RAM_27 & INIT_RAM_26 & INIT_RAM_25 & INIT_RAM_24 &INIT_RAM_23 & INIT_RAM_22 & INIT_RAM_21 & INIT_RAM_20 &INIT_RAM_1F & INIT_RAM_1E & INIT_RAM_1D & INIT_RAM_1C &INIT_RAM_1B & INIT_RAM_1A & INIT_RAM_19 & INIT_RAM_18 &INIT_RAM_17 & INIT_RAM_16 & INIT_RAM_15 & INIT_RAM_14 &INIT_RAM_13 & INIT_RAM_12 & INIT_RAM_11 & INIT_RAM_10 &INIT_RAM_0F & INIT_RAM_0E & INIT_RAM_0D & INIT_RAM_0C & INIT_RAM_0B & INIT_RAM_0A & INIT_RAM_09 & INIT_RAM_08 &INIT_RAM_07 & INIT_RAM_06 & INIT_RAM_05 & INIT_RAM_04 &INIT_RAM_03 & INIT_RAM_02 & INIT_RAM_01 & INIT_RAM_00);
	signal data_width_t1,data_width_t2,addr_width_a,addr_width_b : integer:= 0;
	signal addr_a,addr_b : std_logic_vector(14 downto 0):=conv_std_logic_vector(0,15);
	signal mc : std_logic := '0';
	signal bs_ena,bs_enb : std_logic;
	signal pcea,pceb : std_logic;
    signal grstn : std_logic;

begin
    grstn <= GSRO;

	data_width_t1 <= BIT_WIDTH_0;
	data_width_t2 <= BIT_WIDTH_1;

	addr_a <= conv_std_logic_vector(conv_integer(ADA(13 downto (14-addr_width_a)))*data_width_t1,15);
	addr_b <= conv_std_logic_vector(conv_integer(ADB(13 downto (14-addr_width_b)))*data_width_t2,15);
	
	process (data_width_t1,data_width_t2)
	begin
		case (data_width_t1) is
			when 9=> addr_width_a<=11;
			when 18=> addr_width_a<=10;
			when others=>addr_width_a<=0;
		end case;
		case (data_width_t2) is
			when 9=> addr_width_b<=11;
			when 18=> addr_width_b<=10;
			when others=>addr_width_b<=0;
		end case;
	end process;

	DOA <= bpa_reg when (READ_MODE0 = '0') else pla_reg;
	DOB <= bpb_reg when (READ_MODE1 = '0') else plb_reg;
	
	pcea <= CEA and bs_ena and grstn;
	pceb <= CEB and bs_enb;
	process(BLKSELA, BLKSELB)
	begin
		if(BLKSELA = TO_STDLOGICVECTOR(BLK_SEL_0)) then
			bs_ena <= '1';
		else 
			bs_ena <= '0';
		end if;

        if(BLKSELB = TO_STDLOGICVECTOR(BLK_SEL_1)) then
			bs_enb <= '1';
		else 
			bs_enb <= '0';
		end if;
	end process;

    process(bpa_reg_async, bpa_reg_sync, pla_reg_async, pla_reg_sync, bpb_reg_async, bpb_reg_sync, plb_reg_async, plb_reg_sync) 
    begin
        if(RESET_MODE = "ASYNC") then
            bpa_reg <= bpa_reg_async;
            pla_reg <= pla_reg_async;
            bpb_reg <= bpb_reg_async;
            plb_reg <= plb_reg_async;
        else 
            bpa_reg <= bpa_reg_sync;
            pla_reg <= pla_reg_sync;
            bpb_reg <= bpb_reg_sync;
            plb_reg <= plb_reg_sync;
        end if;
    end process;

	process (CLKA,CLKB)
	variable i : integer :=0;
    begin
	-----------port A-----------------------		
	    if CLKA'event and CLKA='1' then
	        if (pcea='1') then
		        if (WREA='1') then			        
				    if(BIT_WIDTH_0=9) then
					    i := 0;
					    while(i < BIT_WIDTH_0) loop
						    ram_MEM((conv_integer(addr_a)+i))<= DIA(i);
						    i := i+1;
					    end loop;
				    elsif(BIT_WIDTH_0=18) then
					    if (ADA(0)='1') then
						    i := 0;
						    while (i < 9) loop
							    ram_MEM((conv_integer(addr_a)+i))<= DIA(i);
							    i := i+1;
						    end loop;
					    end if;
					    if(ADA(1)='1') then
						    i := 9;
						    while ((i >= 9) and (i<18)) loop
							    ram_MEM((conv_integer(addr_a)+i))<= DIA(i);
							    i := i+1;
						    end loop;
					    end if;
				    end if;
				    mc <= (not mc);
			    end if;
		    end if;
	    end if;

	    -------------port B----------------------
	    if CLKB'event and CLKB='1' then
		    if (pceb='1') then
			    if(WREB='1') then								
				    if(BIT_WIDTH_1=9) then
					    i := 0;
					    while(i < BIT_WIDTH_1) loop
						    ram_MEM((conv_integer(addr_b)+i))<= DIB(i);
						    i := i+1;
					    end loop;
				    elsif(BIT_WIDTH_1=18) then
					    if (ADB(0)='1') then
						    i := 0;
						    while (i < 9) loop
							    ram_MEM((conv_integer(addr_b)+i))<= DIB(i);
							    i := i+1;
						    end loop;
					    end if;
					    if(ADB(1)='1') then
						    i := 9;
						    while ((i >= 9) and (i<18)) loop
							    ram_MEM((conv_integer(addr_b)+i))<= DIB(i);
							    i := i+1;
						    end loop;
					    end if;
				    end if;
				    mc <= (not mc);
			    end if;
			end if;
	    end if;
	end process;

    process (CLKA,CLKB,RESETA,RESETB,grstn)
	variable i : integer :=0;
    begin
	-----------port A-----------------------		
	    if grstn='0' then
			bpa_reg_async <= (others=>'0');
	    elsif RESETA='1' then
			bpa_reg_async <= (others=>'0');
	    elsif CLKA'event and CLKA='1' then
		    if (pcea='1') then
		        if (WREA='1') then
			        if (WRITE_MODE0 = "01") then
                        i := 0;
					    while(i < data_width_t1) loop
			   	            bpa_reg_async(i) <= ram_MEM((conv_integer(addr_a)+i));
				            i := i+1;
					    end loop;

                        if (BIT_WIDTH_0 = 9) then
					        bpa_reg_async(8 downto 0) <= DIA(8 downto 0);
                        elsif(BIT_WIDTH_0 = 18) then
                            if(ADA(0) = '1') then
						        bpa_reg_async(8 downto 0) <= DIA(8 downto 0);
                            end if;
                            if(ADA(1) = '1') then
						        bpa_reg_async(17 downto 9) <= DIA(17 downto 9);
                            end if;
                        end if;
			        end if;
			        if (WRITE_MODE0 = "10") then
			    	    i := 0;
					    while(i < data_width_t1) loop
			   	            bpa_reg_async(i) <= ram_MEM((conv_integer(addr_a)+i));
				            i := i+1;
					    end loop;
				    end if;

				elsif(WREA = '0') then
					i := 0;
					while(i < BIT_WIDTH_0) loop
						bpa_reg_async(i) <= ram_MEM((conv_integer(addr_a)+i));
						i := i+1;
					end loop;
			    end if;
		    end if;
	    end if;

	    -------------port B----------------------
	    if grstn='0' then
			bpb_reg_async <= (others=>'0');
	    elsif RESETB='1' then
		    bpb_reg_async <=(others=>'0');
	    elsif CLKB'event and CLKB='1' then
		    if (pceb='1') then
			    if(WREB='1') then
				    if (WRITE_MODE1 = "01") then
                        i := 0;
					    while(i < data_width_t2) loop
						    bpb_reg_async(i) <= ram_MEM((conv_integer(addr_b)+i));
						    i := i+1;
					    end loop;

                        if (BIT_WIDTH_1 = 9) then
					        bpb_reg_async(8 downto 0) <= DIB(8 downto 0);
                        elsif(BIT_WIDTH_1 = 18) then
                            if(ADB(0) = '1') then
						        bpb_reg_async(8 downto 0) <= DIB(8 downto 0);
                            end if;
                            if(ADB(1) = '1') then
						        bpb_reg_async(17 downto 9) <= DIB(17 downto 9);
                            end if;
                        end if;
				    end if;
				    if (WRITE_MODE1 = "10") then
					    i := 0;
					    while(i < data_width_t2) loop
						    bpb_reg_async(i) <= ram_MEM((conv_integer(addr_b)+i));
						    i := i+1;
					    end loop;
				    end if;
				
				elsif(WREB = '0') then
					i := 0;
					while(i < BIT_WIDTH_1) loop
						bpb_reg_async(i) <= ram_MEM((conv_integer(addr_b)+i));
						i := i+1;
					end loop;
			    end if;
			end if;
	    end if;
	end process;

    process (CLKA,CLKB,grstn)
	variable i : integer :=0;
    begin
	-----------port A-----------------------		
	    if grstn='0' then
			bpa_reg_sync <= (others=>'0');
		elsif CLKA'event and CLKA='1' then
	        if RESETA='1' then
			    bpa_reg_sync <= (others=>'0');
		    elsif (pcea='1') then
		        if (WREA='1') then
			        if (WRITE_MODE0 = "01") then
                        i := 0;
					    while(i < data_width_t1) loop
			   	            bpa_reg_sync(i) <= ram_MEM((conv_integer(addr_a)+i));
				            i := i+1;
					    end loop;

                        if (BIT_WIDTH_0 = 9) then
					        bpa_reg_sync(8 downto 0) <= DIA(8 downto 0);
                        elsif(BIT_WIDTH_0 = 18) then
                            if(ADA(0) = '1') then
						        bpa_reg_sync(8 downto 0) <= DIA(8 downto 0);
                            end if;
                            if(ADA(1) = '1') then
						        bpa_reg_sync(17 downto 9) <= DIA(17 downto 9);
                            end if;
                        end if;
			        end if;
			        if (WRITE_MODE0 = "10") then
			    	    i := 0;
					    while(i < data_width_t1) loop
			   	            bpa_reg_sync(i) <= ram_MEM((conv_integer(addr_a)+i));
				            i := i+1;
					    end loop;
				    end if;

				elsif(WREA = '0') then
					i := 0;
					while(i < BIT_WIDTH_0) loop
						bpa_reg_sync(i) <= ram_MEM((conv_integer(addr_a)+i));
						i := i+1;
					end loop;
			    end if;
		    end if;
	    end if;

	    -------------port B----------------------
	    if grstn='0' then
			bpb_reg_sync <= (others=>'0');
		elsif CLKB'event and CLKB='1' then
	        if RESETB='1' then
		        bpb_reg_sync <=(others=>'0');
		    elsif (pceb='1') then
			    if(WREB='1') then
				    if (WRITE_MODE1 = "01") then
                        i := 0;
					    while(i < data_width_t2) loop
						    bpb_reg_sync(i) <= ram_MEM((conv_integer(addr_b)+i));
						    i := i+1;
					    end loop;

                        if (BIT_WIDTH_1 = 9) then
					        bpb_reg_sync(8 downto 0) <= DIB(8 downto 0);
                        elsif(BIT_WIDTH_1 = 18) then
                            if(ADB(0) = '1') then
						        bpb_reg_sync(8 downto 0) <= DIB(8 downto 0);
                            end if;
                            if(ADB(1) = '1') then
						        bpb_reg_sync(17 downto 9) <= DIB(17 downto 9);
                            end if;
                        end if;
				    end if;
				    if (WRITE_MODE1 = "10") then
					    i := 0;
					    while(i < data_width_t2) loop
						    bpb_reg_sync(i) <= ram_MEM((conv_integer(addr_b)+i));
						    i := i+1;
					    end loop;
				    end if;
				
				elsif(WREB = '0') then
					i := 0;
					while(i < BIT_WIDTH_1) loop
						bpb_reg_sync(i) <= ram_MEM((conv_integer(addr_b)+i));
						i := i+1;
					end loop;
			    end if;
			end if;
	    end if;
	end process;

    process (CLKA,CLKB,RESETA,RESETB,grstn)
    begin
	    if grstn='0' then
			pla_reg_async <=(others=>'0');
	    elsif RESETA='1' then
			pla_reg_async <=(others=>'0');
	    elsif CLKA'event and CLKA='1' then
		    if(OCEA = '1') then
		        pla_reg_async <= bpa_reg;
	        end if;
	    end if;

	    if grstn='0' then
			plb_reg_async <=(others=>'0');
	    elsif RESETB='1' then
		    plb_reg_async <=(others=>'0');
	    elsif CLKB'event and CLKB='1' then
		    if(OCEB = '1') then
		        plb_reg_async <= bpb_reg;
	        end if;
		end if;
	end process;

    process (CLKA,CLKB,grstn)
    begin
	    if grstn='0' then
			pla_reg_sync <=(others=>'0');
		elsif CLKA'event and CLKA='1' then
	        if RESETA='1' then
			    pla_reg_sync <=(others=>'0');
		    elsif(OCEA = '1') then
		        pla_reg_sync <= bpa_reg;
	        end if;
	    end if;

	    if grstn='0' then
			plb_reg_sync <=(others=>'0');
		elsif CLKB'event and CLKB='1' then
	        if RESETB='1' then
		        plb_reg_sync <=(others=>'0');
		    elsif(OCEB = '1') then
		        plb_reg_sync <= bpb_reg;
	        end if;
		end if;
	end process;
    
end Behavioral;

-----------------------pROM----------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.glb.GSRO;

entity pROM is
    GENERIC ( 
	    BIT_WIDTH : integer :=1; -- 1, 2, 4, 8, 16, 32	
	    READ_MODE : bit := '0'; -- 0: bypass mode; 1: pipeline mode
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
	    CLK, CE,OCE,RESET : in std_logic;
	    AD : in std_logic_vector(13 downto 0)
    );
end pROM;

architecture Behavioral of pROM is
	signal bp_reg,pl_reg,bp_reg_async,pl_reg_async,bp_reg_sync,pl_reg_sync : std_logic_vector(31 downto 0):= conv_std_logic_vector(0,32);
	signal ram_MEM : std_logic_vector(16383 downto 0):=TO_StdLogicVector(INIT_RAM_3F & INIT_RAM_3E & INIT_RAM_3D & INIT_RAM_3C &INIT_RAM_3B & INIT_RAM_3A & INIT_RAM_39 & INIT_RAM_38 &INIT_RAM_37 & INIT_RAM_36 & INIT_RAM_35 & INIT_RAM_34 &INIT_RAM_33 & INIT_RAM_32 & INIT_RAM_31 & INIT_RAM_30 &INIT_RAM_2F & INIT_RAM_2E & INIT_RAM_2D & INIT_RAM_2C &INIT_RAM_2B & INIT_RAM_2A & INIT_RAM_29 & INIT_RAM_28 &INIT_RAM_27 & INIT_RAM_26 & INIT_RAM_25 & INIT_RAM_24 &INIT_RAM_23 & INIT_RAM_22 & INIT_RAM_21 & INIT_RAM_20 &INIT_RAM_1F & INIT_RAM_1E & INIT_RAM_1D & INIT_RAM_1C &INIT_RAM_1B & INIT_RAM_1A & INIT_RAM_19 & INIT_RAM_18 &INIT_RAM_17 & INIT_RAM_16 & INIT_RAM_15 & INIT_RAM_14 &INIT_RAM_13 & INIT_RAM_12 & INIT_RAM_11 & INIT_RAM_10 &INIT_RAM_0F & INIT_RAM_0E & INIT_RAM_0D & INIT_RAM_0C & INIT_RAM_0B & INIT_RAM_0A & INIT_RAM_09 & INIT_RAM_08 &INIT_RAM_07 & INIT_RAM_06 & INIT_RAM_05 & INIT_RAM_04 &INIT_RAM_03 & INIT_RAM_02 & INIT_RAM_01 & INIT_RAM_00);
	signal data_width_t,addr_width : integer:=0;
	signal addr : std_logic_vector(13 downto 0):=conv_std_logic_vector(0,14);
    signal grstn : std_logic;
begin
    grstn <= GSRO;

	data_width_t <= BIT_WIDTH;
	for_addr:for k in 0 to 13 generate
	begin
		addr(k)<= '0' when (k<(14-addr_width)) else AD(k);
	end generate for_addr;
	process (data_width_t)
	begin
		case (data_width_t) is
			when 1=> addr_width<=14;
			when 2=> addr_width<=13;
			when 4=> addr_width<=12;
			when 8=> addr_width<=11;
			when 16=> addr_width<=10;
			when 32=> addr_width<=9;
			when others=>addr_width<=0;
		end case;
	end process;

	DO <= bp_reg when(READ_MODE = '0') else pl_reg;
	
	process (bp_reg_async,bp_reg_sync,pl_reg_async,pl_reg_sync) 
    begin
        if(RESET_MODE = "ASYNC") then
            bp_reg <= bp_reg_async;
            pl_reg <= pl_reg_async;
        else 
            bp_reg <= bp_reg_sync;
            pl_reg <= pl_reg_sync;
        end if;
    end process;

	process (CLK,RESET,grstn)
	variable i : integer :=0;
	begin
		if grstn='0' then
			bp_reg_async <= (others=>'0');
		elsif RESET='1' then
			bp_reg_async <= (others=>'0');
		elsif CLK'event and CLK='1' then
			if(CE = '1') then
				i := 0;
				while(i < data_width_t) loop
					bp_reg_async(i) <= ram_MEM((conv_integer(addr)+i));
					i := i+1;
				end loop;
		    end if;
		end if;
	end process;

    process (CLK,grstn)
	variable i : integer :=0;
	begin
		if grstn='0' then
			bp_reg_sync <= (others=>'0');
		elsif CLK'event and CLK='1' then
		    if RESET='1' then
			    bp_reg_sync <= (others=>'0');
		    elsif(CE = '1') then
				i := 0;
				while(i < data_width_t) loop
					bp_reg_sync(i) <= ram_MEM((conv_integer(addr)+i));
					i := i+1;
				end loop;
		    end if;
		end if;
	end process;

    process (CLK,RESET,grstn)
	begin
		if grstn='0' then
			pl_reg_async <= (others=>'0');
		elsif RESET='1' then
			pl_reg_async <= (others=>'0');
		elsif CLK'event and CLK='1' then
			if OCE='1' then
				pl_reg_async <= bp_reg;
			end if;
		end if;
	end process;

    process (CLK,grstn)
	begin
		if grstn='0' then
			pl_reg_sync <= (others=>'0');
		elsif CLK'event and CLK='1' then
		    if RESET='1' then
			    pl_reg_sync <= (others=>'0');
		    elsif OCE='1' then
				pl_reg_sync <= bp_reg;
			end if;
		end if;
	end process;

end Behavioral;

------------------------------pROMX9 ---------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.glb.GSRO;

entity pROMX9 is
    GENERIC ( 
    	BIT_WIDTH : integer :=9; -- 9, 18, 36
   	    READ_MODE : bit := '0'; -- 0: bypass mode; 1: pipeline mode
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
	    CLK, CE,OCE,RESET : in std_logic;
	    AD : in std_logic_vector(13 downto 0)
    );
end pROMX9;

architecture Behavioral of pROMX9 is
	signal bp_reg,pl_reg,bp_reg_async,pl_reg_async,bp_reg_sync,pl_reg_sync : std_logic_vector(35 downto 0) := conv_std_logic_vector(0,36);
	signal ram_MEM : std_logic_vector(18431 downto 0):=TO_StdLogicVector(INIT_RAM_3F & INIT_RAM_3E & INIT_RAM_3D & INIT_RAM_3C &INIT_RAM_3B & INIT_RAM_3A & INIT_RAM_39 & INIT_RAM_38 &INIT_RAM_37 & INIT_RAM_36 & INIT_RAM_35 & INIT_RAM_34 &INIT_RAM_33 & INIT_RAM_32 & INIT_RAM_31 & INIT_RAM_30 &INIT_RAM_2F & INIT_RAM_2E & INIT_RAM_2D & INIT_RAM_2C &INIT_RAM_2B & INIT_RAM_2A & INIT_RAM_29 & INIT_RAM_28 &INIT_RAM_27 & INIT_RAM_26 & INIT_RAM_25 & INIT_RAM_24 &INIT_RAM_23 & INIT_RAM_22 & INIT_RAM_21 & INIT_RAM_20 &INIT_RAM_1F & INIT_RAM_1E & INIT_RAM_1D & INIT_RAM_1C &INIT_RAM_1B & INIT_RAM_1A & INIT_RAM_19 & INIT_RAM_18 &INIT_RAM_17 & INIT_RAM_16 & INIT_RAM_15 & INIT_RAM_14 &INIT_RAM_13 & INIT_RAM_12 & INIT_RAM_11 & INIT_RAM_10 &INIT_RAM_0F & INIT_RAM_0E & INIT_RAM_0D & INIT_RAM_0C & INIT_RAM_0B & INIT_RAM_0A & INIT_RAM_09 & INIT_RAM_08 &INIT_RAM_07 & INIT_RAM_06 & INIT_RAM_05 & INIT_RAM_04 &INIT_RAM_03 & INIT_RAM_02 & INIT_RAM_01 & INIT_RAM_00);	
	signal data_width_t,addr_width : integer:=0;
	signal addr : std_logic_vector(14 downto 0):=conv_std_logic_vector(0,15);
    signal grstn : std_logic;
begin
    grstn <= GSRO;

	data_width_t <= BIT_WIDTH;
	addr <= conv_std_logic_vector(conv_integer(AD(13 downto (14-addr_width)))*data_width_t,15);

	process (data_width_t)
	begin
		case (data_width_t) is
			when 9=> addr_width<=11;
			when 18=> addr_width<=10;
			when 36=> addr_width<=9;
			when others=>addr_width<=0;
		end case;
	end process;

	DO <= bp_reg when(READ_MODE = '0') else pl_reg;
	
	process (bp_reg_async,bp_reg_sync,pl_reg_async,pl_reg_sync) 
    begin
        if(RESET_MODE = "ASYNC") then
            bp_reg <= bp_reg_async;
            pl_reg <= pl_reg_async;
        else 
            bp_reg <= bp_reg_sync;
            pl_reg <= pl_reg_sync;
        end if;
    end process;

	process (CLK,RESET,grstn)
	variable i : integer :=0;
	begin
		if grstn='0' then
			bp_reg_async <= (others=>'0');
		elsif RESET='1' then
			bp_reg_async <= (others=>'0');
		elsif CLK'event and CLK='1' then
			if(CE = '1')then
				i := 0;
				while(i < data_width_t) loop
					bp_reg_async(i) <= ram_MEM((conv_integer(addr)+i));
					i := i+1;
				end loop;
		    end if;
		end if;
	end process;

    process (CLK,grstn)
	variable i : integer :=0;
	begin
		if grstn='0' then
			bp_reg_sync <= (others=>'0');
	    elsif CLK'event and CLK='1' then
		    if RESET='1' then
			    bp_reg_sync <= (others=>'0');
			elsif(CE = '1')then
				i := 0;
				while(i < data_width_t) loop
					bp_reg_sync(i) <= ram_MEM((conv_integer(addr)+i));
					i := i+1;
				end loop;
		    end if;
		end if;
	end process;

    process (CLK,RESET,grstn)
	begin
		if grstn='0' then
			pl_reg_async <= (others=>'0');
		elsif RESET='1' then
			pl_reg_async <= (others=>'0');
		elsif CLK'event and CLK='1' then
			if(OCE = '1') then
				pl_reg_async <= bp_reg;
			end if;
		end if;
	end process;

    process (CLK,grstn)
	begin
		if grstn='0' then
			pl_reg_sync <= (others=>'0');
	    elsif CLK'event and CLK='1' then
		    if RESET='1' then
			    pl_reg_sync <= (others=>'0');
			elsif(OCE = '1') then
				pl_reg_sync <= bp_reg;
			end if;
		end if;
	end process;

end Behavioral;

----------------------------------SDP36KE---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
use STD.TEXTIO.ALL;
use IEEE.STD_LOGIC_TEXTIO.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.glb.GSRO;

entity SDP36KE is
    GENERIC ( 
	    READ_MODE : bit := '0'; -- 0: bypass mode; 1: pipeline mode
	    BLK_SEL_A : bit_vector := "000";
	    BLK_SEL_B : bit_vector := "000";
        ECC_WRITE_EN : string := "FALSE"; --"FALSE":disable ECC WRITE mode; "TRUE":enable ECC WRITE mode
        ECC_READ_EN : string := "FALSE"; --"FALSE":disable ECC READ mode; "TRUE":enable ECC READ mode
        RESET_MODE : string := "SYNC"; --SYNC, ASYNC
        INIT_FILE : string := "NONE";
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
	    INIT_RAM_3F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_40 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_41 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_42 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_43 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_44 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_45 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_46 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_47 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_48 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_49 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_4A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_4B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_4C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_4D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_4E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_4F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_50 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_51 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_52 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_53 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_54 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_55 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_56 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_57 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_58 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_59 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_5A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_5B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_5C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_5D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_5E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_5F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_60 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_61 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_62 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_63 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_64 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_65 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_66 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_67 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_68 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_69 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_6A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_6B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_6C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_6D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_6E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_6F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_70 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_71 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_72 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_73 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_74 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_75 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_76 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_77 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_78 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_79 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_7A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_7B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_7C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_7D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_7E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INIT_RAM_7F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
        INITP_RAM_00 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INITP_RAM_01 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INITP_RAM_02 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INITP_RAM_03 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INITP_RAM_04 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INITP_RAM_05 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INITP_RAM_06 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INITP_RAM_07 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INITP_RAM_08 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INITP_RAM_09 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INITP_RAM_0A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INITP_RAM_0B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INITP_RAM_0C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INITP_RAM_0D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INITP_RAM_0E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
	    INITP_RAM_0F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000"
	        
    );
    PORT (
	    DO : out std_logic_vector(63 downto 0):=conv_std_logic_vector(0,64);
	    DOP : out std_logic_vector(7 downto 0):=conv_std_logic_vector(0,8);
	    DECCO, SECCO : out std_logic;
	    ECCP : out std_logic_vector(7 downto 0):=conv_std_logic_vector(0,8);
	    CLKA, CLKB, CEA, CEB, OCE, RESET : in std_logic;
	    ADA, ADB : in std_logic_vector(8 downto 0);
        BLKSELA, BLKSELB : in std_logic_vector(2 downto 0);
        DIP : in std_logic_vector(7 downto 0);
        DECCI, SECCI : in std_logic;
	    DI : in std_logic_vector(63 downto 0)
    );
end SDP36KE;

architecture Behavioral of SDP36KE is

    signal pl_reg,pl_reg_async,pl_reg_sync : std_logic_vector(73 downto 0):=conv_std_logic_vector(0,74);
	signal bp_reg,bp_reg_async,bp_reg_sync : std_logic_vector(73 downto 0):=conv_std_logic_vector(0,74);

    signal ram_MEM : std_logic_vector(36863 downto 0) := (others =>'0');

	signal mem_32k : std_logic_vector(32767 downto 0) := to_stdlogicvector(INIT_RAM_7F & INIT_RAM_7E & INIT_RAM_7D & INIT_RAM_7C & INIT_RAM_7B & INIT_RAM_7A & INIT_RAM_79 & INIT_RAM_78 & INIT_RAM_77 & INIT_RAM_76& INIT_RAM_75& INIT_RAM_74&INIT_RAM_73& INIT_RAM_72& INIT_RAM_71& INIT_RAM_70&INIT_RAM_6F& INIT_RAM_6E& INIT_RAM_6D& INIT_RAM_6C&INIT_RAM_6B& INIT_RAM_6A& INIT_RAM_69& INIT_RAM_68&INIT_RAM_67& INIT_RAM_66& INIT_RAM_65& INIT_RAM_64&INIT_RAM_63& INIT_RAM_62& INIT_RAM_61& INIT_RAM_60&INIT_RAM_5F& INIT_RAM_5E& INIT_RAM_5D& INIT_RAM_5C&INIT_RAM_5B& INIT_RAM_5A& INIT_RAM_59& INIT_RAM_58&INIT_RAM_57& INIT_RAM_56& INIT_RAM_55& INIT_RAM_54&INIT_RAM_53& INIT_RAM_52& INIT_RAM_51& INIT_RAM_50&INIT_RAM_4F& INIT_RAM_4E& INIT_RAM_4D& INIT_RAM_4C&INIT_RAM_4B& INIT_RAM_4A& INIT_RAM_49& INIT_RAM_48&INIT_RAM_47& INIT_RAM_46& INIT_RAM_45& INIT_RAM_44&INIT_RAM_43& INIT_RAM_42& INIT_RAM_41& INIT_RAM_40&INIT_RAM_3F& INIT_RAM_3E& INIT_RAM_3D& INIT_RAM_3C&INIT_RAM_3B& INIT_RAM_3A& INIT_RAM_39& INIT_RAM_38&INIT_RAM_37& INIT_RAM_36& INIT_RAM_35& INIT_RAM_34&INIT_RAM_33& INIT_RAM_32& INIT_RAM_31& INIT_RAM_30&INIT_RAM_2F& INIT_RAM_2E& INIT_RAM_2D& INIT_RAM_2C&INIT_RAM_2B& INIT_RAM_2A& INIT_RAM_29& INIT_RAM_28&INIT_RAM_27& INIT_RAM_26& INIT_RAM_25& INIT_RAM_24&INIT_RAM_23& INIT_RAM_22& INIT_RAM_21& INIT_RAM_20&INIT_RAM_1F& INIT_RAM_1E& INIT_RAM_1D& INIT_RAM_1C&INIT_RAM_1B& INIT_RAM_1A& INIT_RAM_19& INIT_RAM_18&INIT_RAM_17& INIT_RAM_16& INIT_RAM_15& INIT_RAM_14&INIT_RAM_13& INIT_RAM_12& INIT_RAM_11& INIT_RAM_10&INIT_RAM_0F& INIT_RAM_0E& INIT_RAM_0D& INIT_RAM_0C& INIT_RAM_0B& INIT_RAM_0A& INIT_RAM_09& INIT_RAM_08&INIT_RAM_07& INIT_RAM_06& INIT_RAM_05& INIT_RAM_04&INIT_RAM_03& INIT_RAM_02& INIT_RAM_01& INIT_RAM_00);

	signal memp_4k : std_logic_vector(4095 downto 0) :=to_stdlogicvector(INITP_RAM_0F & INITP_RAM_0E & INITP_RAM_0D & INITP_RAM_0C & INITP_RAM_0B & INITP_RAM_0A & INITP_RAM_09 & INITP_RAM_08 & INITP_RAM_07 & INITP_RAM_06 & INITP_RAM_05 & INITP_RAM_04 & INITP_RAM_03 & INITP_RAM_02 & INITP_RAM_01 & INITP_RAM_00);

	signal mem_a,mem_b : std_logic_vector(71 downto 0);
	signal mc : std_logic:= '0';
	signal bs_ena,bs_enb : std_logic;
	signal pcea,pceb : std_logic;
	signal addr_a,addr_b : std_logic_vector(16 downto 0);
	signal data_b,data_b_new : std_logic_vector(63 downto 0);  
	signal ecc_a,ecc_b,ecc_b_new,ecc_addr : std_logic_vector(7 downto 0); 
	signal ecc_err : std_logic_vector(1 downto 0);
	signal bit_width_da : integer :=72;
	signal bit_width_db : integer :=72;
	signal bit_depth_ada : integer :=9;
	signal bit_depth_adb : integer :=9;
	signal i_a,i_d,i_m,i : integer ;
    signal grstn : std_logic;

    --Depth
    function GetDepth (Mdepth : in integer) return integer is
        file file_out2: text;
        variable fstatus : FILE_OPEN_STATUS;
        variable data: line;
        variable c : character ;
        variable func_depth : integer:= 512;
        variable good_data : boolean := false;
    begin
        if(INIT_FILE = "NONE")then
            func_depth := 512;
        else
            file_open(fstatus,file_out2,INIT_FILE);
            while not endfile(file_out2) loop
                readline(file_out2,data);
                while (data /= null and data'length > 2) loop
                    if(data(data'low) = ' ')then
                        deallocate(data);
                    elsif (data(data'low to data'low + 1) = "#A") then
                        while(data'length /=0)loop
                            read(data,c);
                            if(c = '=')then
                                read(data,func_depth);
                            end if;
                        end loop;
                    else
                        deallocate(data);
                    end if;
                end loop;
            end loop;
            file_close(file_out2);
        end if;
        return func_depth;
    end;

    --width
    function GetWidth (Mwidth : in integer) return integer is
        file file_out3: text;
        variable fstatus:FILE_OPEN_STATUS;
        variable data: line;
        variable good_data : boolean := false;
        variable c : character ;
        variable func_width :integer:= 72;
    begin
        if(INIT_FILE = "NONE")then
            func_width := 72;
        else
            file_open(fstatus,file_out3,INIT_FILE);
            while not endfile(file_out3) loop
                readline(file_out3,data);
                while (data /= null and data'length > 2) loop
                    if(data(data'low) = ' ')then
                        deallocate(data);
                    elsif (data(data'low to data'low + 1) = "#D") then
                        while(data'length /=0)loop
                            read(data,c);
                            if(c = '=')then
                                read(data,func_width);
                            end if;
                        end loop;
                    else
                        deallocate(data);
                    end if;
                end loop;
            end loop;
            file_close(file_out3);
        end if;
    	return func_width;
  	end;

    constant Mem_data : integer :=0;
	constant mem_depth : integer := Getdepth(Mem_data);
	constant mem_width : integer := GetWidth(Mem_data);
	type initf is array ((mem_depth) downto 0) of std_logic_vector((mem_width-1) downto 0);
	signal mem_init :initf:= (others => (others => '0'));


	procedure Char2QuadBits(C: Character; 
		RESULT: out std_ulogic_vector(3 downto 0);
		GOOD: out Boolean;
		GOOD2: out Boolean) is
	begin
		case c is
			when '0' => result :=  x"0"; good := TRUE; good2 := TRUE;
			when '1' => result :=  x"1"; good := TRUE; good2 := TRUE;
			when '2' => result :=  x"2"; good := TRUE; good2 := TRUE;
			when '3' => result :=  x"3"; good := TRUE; good2 := TRUE;
			when '4' => result :=  x"4"; good := TRUE; good2 := TRUE;
			when '5' => result :=  x"5"; good := TRUE; good2 := TRUE;
			when '6' => result :=  x"6"; good := TRUE; good2 := TRUE;
			when '7' => result :=  x"7"; good := TRUE; good2 := TRUE;
			when '8' => result :=  x"8"; good := TRUE; good2 := TRUE;
			when '9' => result :=  x"9"; good := TRUE; good2 := TRUE;
			when 'A' => result :=  x"A"; good := TRUE; good2 := TRUE;
			when 'B' => result :=  x"B"; good := TRUE; good2 := TRUE;
			when 'C' => result :=  x"C"; good := TRUE; good2 := TRUE;
			when 'D' => result :=  x"D"; good := TRUE; good2 := TRUE;
			when 'E' => result :=  x"E"; good := TRUE; good2 := TRUE;
			when 'F' => result :=  x"F"; good := TRUE; good2 := TRUE;
			when 'Z' => result(0) :=  'Z'; result(1) :=  'Z'; result(2) :=  'Z'; result(3) :=  'Z'; good := TRUE; good2 := TRUE;
			when 'X' => result(0) :=  'X'; result(1) :=  'X'; result(2) :=  'X'; result(3) :=  'X'; good := TRUE; good2 := TRUE;
 
			when 'a' => result :=  x"A"; good := TRUE; good2 := TRUE;
			when 'b' => result :=  x"B"; good := TRUE; good2 := TRUE;
			when 'c' => result :=  x"C"; good := TRUE; good2 := TRUE;
			when 'd' => result :=  x"D"; good := TRUE; good2 := TRUE;
			when 'e' => result :=  x"E"; good := TRUE; good2 := TRUE;
			when 'f' => result :=  x"F"; good := TRUE; good2 := TRUE;
            when 'z' => result(0) :=  'Z'; result(1) :=  'Z'; result(2) :=  'Z'; result(3) :=  'Z'; good := TRUE; good2 := TRUE;
            when 'x' => result(0) :=  'X'; result(1) :=  'X'; result(2) :=  'X'; result(3) :=  'X'; good := TRUE; good2 := TRUE;
            when '_' => result :=  x"0"; good := TRUE; good2 := TRUE;
            --when ' ' => result :=  x"0"; good := TRUE;
            
			when others => good := FALSE; good2 := FALSE;
		end case;
	end;
   
	procedure READHEX(L:inout LINE; VALUE:out STD_LOGIC_VECTOR;GOOD: out BOOLEAN;GOOD2 : out BOOLEAN) is
		variable ok: boolean;
        variable ok2: boolean;
		variable c:  character;
		constant ne: integer := value'length/4;
		variable bv: std_ulogic_vector(0 to value'length-1);
		variable s,s2:  string(1 to ne-1);
        variable i: integer :=1;
        variable flag: boolean := FALSE;
        variable bv2:std_ulogic_vector(0 to value'length-1) := (others => '0');
        variable j:integer;
        variable s3 : string (1 to L'length);

	begin
		if value'length mod 4 /= 0 then
			good := FALSE;
			return;
		end if;

        --add 0
        if(L'length < mem_width/4)then
            read(l,s3,ok);
            for zero in 0 to mem_width/4-1-s3'length loop
                write(l,string'("0"));
            end loop;
            write(l,s3);
        end if;


		loop					-- skip white space
			read(l, c, ok);
            if(c = '/')then
                read(l,c,ok);
                if(c = '/')then
                    good := FALSE;
                    return;
                elsif(c = '*')then
                    loop
                        read(l,c,ok);
                        if(c = '/' )then
                            read(l,c,ok);
                            if(c = ' ')then
                                exit;
                            end if;
                        elsif(c = ' ')then
                            ok := FALSE;
                            good := FALSE;
                            return;
                        end if;
                    end loop;
                end if;
            end if;
			exit when (not ok) or ((c /= ' ') and (c /= CR) and (c /= HT));
		end loop;

		if not ok then
			good := FALSE;
			return;
		end if;

		Char2QuadBits(c, bv(0 to 3), ok, ok2);

		if not ok then 
			good := FALSE;
            good2 := FALSE;
			return;
		end if;
        
        read(l,s,ok);
        while(i <= ne-1)loop
            if( s(i) = '_')then
                flag := TRUE;
                s2(i) := '0';
            else
                s2(i) := s(i);
            end if;
        i := i+1;
        end loop;


		if not ok then
			good := FALSE;
            good2 := FALSE;
			return;
		end if;

		for i in 1 to ne-1 loop
			Char2QuadBits(s2(i), bv(4*i to 4*i+3), ok, ok2);
			if not ok then
				good := FALSE;
                good2 := FALSE;
				return;
			end if;
		end loop;

        if(flag = TRUE)then
            i := 0;
            while( i<= ne-1)loop
                if( bv(4*i to 4*i+3) /= "0000")then
                    j := j+1;
                end if;
               i := i+1;
            end loop;
            i := 0;
            while(i <= ne-1)loop
                if( bv(4*i to 4*i+3) /= "0000")then
                    bv2( 4*(ne-j) to 4*(ne-j)+3 ) := bv(4*i to 4*i+3);
                    j:= j-1;
                end if;
                i := i+1;
            end loop;
        else
            bv2 := bv;
        end if;

		good := TRUE;
        good2 := TRUE;
		value := STD_LOGIC_VECTOR(bv2);
	end READHEX;

    procedure msg (
    constant data_line : in integer
    ) is
    
    variable message : LINE;
    constant MsgSeverity : severity_level := error;

    begin           
    write(message,STRING'("Illegal entry found at file:"));
    write(message,STRING'(INIT_FILE));
    write(message,LF);
    write(message,STRING'("     line "));
    write(message,data_line);
    write(message,STRING'(" while executing readmem "));
    write(message,LF);
    write(message,STRING'("     Please ensure that the file has proper entries"));
    ASSERT FALSE REPORT message.ALL SEVERITY MsgSeverity;
    DEALLOCATE (message);
  end msg;


    procedure msg2 (
    constant data_line : in integer
    ) is
    
    variable message : LINE;
    constant MsgSeverity : severity_level := warning;

    begin           
    write(message,STRING'("Illegal entry found at file:"));
    write(message,STRING'(INIT_FILE));
    write(message,LF);
    write(message,STRING'("     line "));
    write(message,data_line);
    write(message,STRING'(" while executing readmem "));
    write(message,LF);
    write(message,STRING'("     Please ensure that the file has proper entries"));
    ASSERT FALSE REPORT message.ALL SEVERITY MsgSeverity;
    DEALLOCATE (message);
  end msg2;


begin
    grstn <= GSRO;
    pcea <= CEA and bs_ena and grstn;
	pceb <= CEB and bs_enb;

	process(CLKA)
    file file_out : text;
    variable fstatus:FILE_OPEN_STATUS;
    variable buf: line;
    variable idx : integer := 0;
    variable init_tmp : initf:= (others => (others => '0'));
    variable good_data : boolean := false;
    variable good_data2 : boolean := false;
    variable init_flag : boolean := false;

    variable i : integer := 1;
    variable line_idx : integer := 0;
    variable long : integer := 0;
    variable str : string(1 to mem_width/4);
    variable c : character;
    
	begin
        if(init_flag = false)then
	        if (INIT_FILE = "NONE") then
	            if(mem_width = 72) then
	                for i in 0 to 511 loop
	            	    ram_MEM(i*72+71 downto i*72) <=
                        memp_4k (i*8+7)& 
                        mem_32k(i*64+63 downto i*64+56)& 
                        memp_4k (i*8+6)& 
                        mem_32k(i*64+55 downto i*64+48)& 
                        memp_4k (i*8+5)& 
                        mem_32k(i*64+47 downto i*64+40)& 
                        memp_4k (i*8+4)& 
                        mem_32k(i*64+39 downto i*64+32)& 
                        memp_4k (i*8+3)& 
                        mem_32k(i*64+31 downto i*64+24)& 
                        memp_4k (i*8+2)&
                        mem_32k(i*64+23 downto i*64+16)&
                        memp_4k (i*8+1)&
                        mem_32k(i*64+15 downto i*64+8)&
                        memp_4k (i*8)&
                        mem_32k(i*64+7 downto i*64);
	                end loop;
	            end if;
                init_flag := true;
	        else         
                file_open(fstatus,file_out,INIT_FILE);
                while not endfile(file_out) loop
                    line_idx := line_idx + 1;
                    readline(file_out,buf);
                    while (buf /= null and buf'length > 0) loop
                        if(buf'length = 1)then
                            if(buf(buf'low) /= ' ')then
                                readhex(buf,init_tmp(idx),good_data,good_data2);
                                if (good_data = true) then
                                    idx := idx + 1;
                                end if;
                                if (good_data = false) then
                                    exit;
                                end if;
                                deallocate(buf);
                            else
                                deallocate(buf);
                            end if;
                        elsif(buf'length > 18)then
                            good_data2 := false;
                            exit;
                        elsif (buf(buf'low to buf'low + 1) = "//") then
                            deallocate(buf);
                        elsif (buf(buf'low to buf'low + 1) = "/*" and buf(buf'high-1 to buf'high) = "*/") then
                            deallocate(buf);
                        elsif (buf(buf'low) = '#')then
                            deallocate(buf);
                        elsif (buf(buf'low to buf'low + 1) = "--")then
                            deallocate(buf);
                        elsif(buf(buf'low) = ' ')then
                            while(buf(buf'low) = ' ')loop
                                read(buf,c);
                            end loop;
                            readhex(buf,init_tmp(idx),good_data,good_data2);
                            if (good_data = true) then
                                idx := idx + 1;
                            end if;
                            if (good_data = false) then
                                exit;
                            end if;
                            deallocate(buf);

                        else
                            if(buf'length = mem_width/4)then
                                read(buf,str);
                                deallocate(buf);
                                long := str'length;
                                while( long /= 0)loop
                                    while((str(i) /= ' ') and (long /= 0))loop
                                        write(buf,str(i));
                                        if( i = mem_width/4)then
                                            long := long -1;
                                            exit;
                                        else
                                            i := i + 1;
                                            long := long - 1;
                                        end if;
                                    end loop;
                                    readhex(buf,init_tmp(idx),good_data,good_data2);
                                    if (good_data = true) then
                                        idx := idx + 1;
                                    end if;
                                    if (good_data = false) then
                                        exit;
                                    end if;
                                    if(str(i) = ' ')then
                                        i := i + 1;
                                        long := long - 1;
                                    end if;
                                    deallocate(buf);
                                end loop;
                                i := 1;

                            else
                                readhex(buf,init_tmp(idx),good_data,good_data2);
                                if (good_data = true) then
                                    idx := idx + 1;
                                end if;
                                if (good_data = false) then
                                    exit;
                                end if;
                                deallocate(buf);
                            end if;
                        end if;
                    end loop;
                    if(good_data2 = false)then
                        if(buf'length > 18)then
                            msg2(line_idx);
                            init_tmp(idx) := (others => '0');
                            exit;
                        else
                            msg(line_idx);
                            init_tmp(idx) := (others => '0');
                            exit;
                        end if;
                    end if;
                    if(idx > mem_depth)then
                        report "INIT_FILE is out of range" severity warning;
                        exit;
                    end if;
                    mem_init <= init_tmp;
                end loop;

                file_close(file_out);
                idx := 0;
                i := 0;          

            case mem_width is
                when 72 =>
                    for i_m in 0 to mem_depth-1 loop 
                        ram_MEM(i_m*72+71 downto i_m*72) <= init_tmp(i_m);
                    end loop;
                when others => null;
            end case;
            init_flag := true;
        end if;
    else
        if (CLKA'event and CLKA='1') then
		    if (pcea='1') then
		        if(bit_width_da=72) then
	                if(ECC_WRITE_EN = "TRUE") then
                        if(DECCI = '1')then
                            ram_MEM(conv_integer(addr_a)+71 downto conv_integer(addr_a)+63) <= ecc_a(7) & DI(63) & (not DI(62)) & DI(61 downto 56);
                        else
                            ram_MEM(conv_integer(addr_a)+71 downto conv_integer(addr_a)+63) <= ecc_a(7) & DI(63 downto 56);
                        end if;
	                    ram_MEM(conv_integer(addr_a)+62 downto conv_integer(addr_a)+54) <= ecc_a(6)& DI(55 downto 48);
	                    ram_MEM(conv_integer(addr_a)+53 downto conv_integer(addr_a)+45) <= ecc_a(5)& DI(47 downto 40);
	                    ram_MEM(conv_integer(addr_a)+44 downto conv_integer(addr_a)+36) <= ecc_a(4)& DI(39 downto 32);
                        if((SECCI or DECCI) = '1')then
                            ram_MEM(conv_integer(addr_a)+35 downto conv_integer(addr_a)+27) <= ecc_a(3) & DI(31) & (not DI(30)) & DI(29 downto 24);
                        else
                            ram_MEM(conv_integer(addr_a)+35 downto conv_integer(addr_a)+27) <=ecc_a(3) & DI(31 downto 24);
                        end if;
	                    ram_MEM(conv_integer(addr_a)+26 downto conv_integer(addr_a)+18)<= ecc_a(2)& DI(23 downto 16);
	                    ram_MEM(conv_integer(addr_a)+17 downto conv_integer(addr_a)+9)<= ecc_a(1)& DI(15 downto 8);
	                    ram_MEM(conv_integer(addr_a)+8 downto conv_integer(addr_a))<= ecc_a(0)& DI(7 downto 0);
	                else
                        if(DECCI = '1')then
                            ram_MEM(conv_integer(addr_a)+71 downto conv_integer(addr_a)+63) <= DIP(7) & DI(63) & (not DI(62)) & DI(61 downto 56);
                        else
                            ram_MEM(conv_integer(addr_a)+71 downto conv_integer(addr_a)+63) <= DIP(7) & DI(63 downto 56);
                        end if;
	                    ram_MEM(conv_integer(addr_a)+62 downto conv_integer(addr_a)+54)<= DIP(6)& DI(55 downto 48);
	                    ram_MEM(conv_integer(addr_a)+53 downto conv_integer(addr_a)+45)<= DIP(5)& DI(47 downto 40);
	                    ram_MEM(conv_integer(addr_a)+44 downto conv_integer(addr_a)+36)<= DIP(4)& DI(39 downto 32);
	                    if((SECCI or DECCI) = '1')then
                            ram_MEM(conv_integer(addr_a)+35 downto conv_integer(addr_a)+27) <= DIP(3) & DI(31) & (not DI(30)) & DI(29 downto 24); 
                        else
                            ram_MEM(conv_integer(addr_a)+35 downto conv_integer(addr_a)+27) <=DIP(3) & DI(31 downto 24);
                        end if;
                        ram_MEM(conv_integer(addr_a)+26 downto conv_integer(addr_a)+18) <= DIP(2)& DI(23 downto 16);
	                    ram_MEM(conv_integer(addr_a)+17 downto conv_integer(addr_a)+9) <= DIP(1)& DI(15 downto 8); 
	                    ram_MEM(conv_integer(addr_a)+8 downto conv_integer(addr_a))<= DIP(0)& DI(7 downto 0);
	                end if;
	            end if;
			    mc <= (not mc);
		    end if;
        end if;
    end if;
	end process;

	process(BLKSELA, BLKSELB)
	begin
		if(BLKSELA = TO_STDLOGICVECTOR(BLK_SEL_A)) then
			bs_ena <= '1';
		else 
			bs_ena <= '0';
		end if;

        if(BLKSELB = TO_STDLOGICVECTOR(BLK_SEL_B)) then
			bs_enb <= '1';
		else 
			bs_enb <= '0';
		end if;

	end process;

	process(ADA, ADB, bit_depth_ada, bit_depth_adb, mc)
    variable i : integer;
	begin
		if(bit_depth_ada=9)then
			addr_a <= ADA*"01001000";
		end if;
		if(bit_depth_adb=9)then
			addr_b <= ADB*"01001000";
			i := 0;
			while(i < 72) loop
				mem_b(i) <= ram_MEM((conv_integer(addr_a)+i));
			i := i+1;
			end loop;
		end if;

	end process;

	process(DI) 
	begin
    	ecc_a(0)<=DI( 0)xor DI( 1)xor DI( 2)xor DI( 3)xor DI( 4)xor DI( 5)xor DI( 6)xor DI( 7)xor DI(10)xor DI(13)xor DI(14)xor DI(17)xor DI(20)xor DI(23)xor DI(24)xor DI(27)xor DI(35)xor DI(43)xor DI(46)xor DI(47)xor DI(51)xor DI(52)xor DI(53)xor DI(56)xor DI(57)xor DI(58);
    	ecc_a(1)<=DI( 0)xor DI( 1)xor DI( 2)xor DI( 8)xor DI( 9)xor DI(10)xor DI(11)xor DI(12)xor DI(13)xor DI(14)xor DI(15)xor DI(18)xor DI(21)xor DI(22)xor DI(25)xor DI(28)xor DI(31)xor DI(32)xor DI(35)xor DI(43)xor DI(51)xor DI(54)xor DI(55)xor DI(59)xor DI(60)xor DI(61);
    	ecc_a(2)<=DI( 3)xor DI( 4)xor DI( 5)xor DI( 8)xor DI( 9)xor DI(10)xor DI(16)xor DI(17)xor DI(18)xor DI(19)xor DI(20)xor DI(21)xor DI(22)xor DI(23)xor DI(26)xor DI(29)xor DI(30)xor DI(33)xor DI(36)xor DI(39)xor DI(40)xor DI(43)xor DI(51)xor DI(59)xor DI(62)xor DI(63);
		ecc_a(3)<=DI( 3)xor DI( 6)xor DI( 7)xor DI(11)xor DI(12)xor DI(13)xor DI(16)xor DI(17)xor DI(18)xor DI(24)xor DI(25)xor DI(26)xor DI(27)xor DI(28)xor DI(29)xor DI(30)xor DI(31)xor DI(34)xor DI(37)xor DI(38)xor DI(41)xor DI(44)xor DI(47)xor DI(48)xor DI(51)xor DI(59);
		ecc_a(4)<=DI( 3)xor DI(11)xor DI(14)xor DI(15)xor DI(19)xor DI(20)xor DI(21)xor DI(24)xor DI(25)xor DI(26)xor DI(32)xor DI(33)xor DI(34)xor DI(35)xor DI(36)xor DI(37)xor DI(38)xor DI(39)xor DI(42)xor DI(45)xor DI(46)xor DI(49)xor DI(52)xor DI(55)xor DI(56)xor DI(59);
		ecc_a(5)<=DI( 0)xor DI( 3)xor DI(11)xor DI(19)xor DI(22)xor DI(23)xor DI(27)xor DI(28)xor DI(29)xor DI(32)xor DI(33)xor DI(34)xor DI(40)xor DI(41)xor DI(42)xor DI(43)xor DI(44)xor DI(45)xor DI(46)xor DI(47)xor DI(50)xor DI(53)xor DI(54)xor DI(57)xor DI(60)xor DI(63);
		ecc_a(6)<=DI( 1)xor DI( 4)xor DI( 7)xor DI( 8)xor DI(11)xor DI(19)xor DI(27)xor DI(30)xor DI(31)xor DI(35)xor DI(36)xor DI(37)xor DI(40)xor DI(41)xor DI(42)xor DI(48)xor DI(49)xor DI(50)xor DI(51)xor DI(52)xor DI(53)xor DI(54)xor DI(55)xor DI(58)xor DI(61)xor DI(62);
		ecc_a(7)<=DI( 2)xor DI( 5)xor DI( 6)xor DI( 9)xor DI(12)xor DI(15)xor DI(16)xor DI(19)xor DI(27)xor DI(35)xor DI(38)xor DI(39)xor DI(43)xor DI(44)xor DI(45)xor DI(48)xor DI(49)xor DI(50)xor DI(56)xor DI(57)xor DI(58)xor DI(59)xor DI(60)xor DI(61)xor DI(62)xor DI(63);

	end process;

    process(addr_b, ram_MEM,ecc_b,data_b,ecc_addr)
        variable j : std_logic;
	begin
        j := '0';                
        data_b <= ram_MEM(conv_integer(addr_b)+70 downto conv_integer(addr_b)+63)&
                  ram_MEM(conv_integer(addr_b)+61 downto conv_integer(addr_b)+54)&
                  ram_MEM(conv_integer(addr_b)+52 downto conv_integer(addr_b)+45)&
                  ram_MEM(conv_integer(addr_b)+43 downto conv_integer(addr_b)+36)&
                  ram_MEM(conv_integer(addr_b)+34 downto conv_integer(addr_b)+27)&
                  ram_MEM(conv_integer(addr_b)+25 downto conv_integer(addr_b)+18)&
                  ram_MEM(conv_integer(addr_b)+16 downto conv_integer(addr_b)+9)&
                  ram_MEM(conv_integer(addr_b)+7 downto conv_integer(addr_b));
        
    	ecc_b <= ram_MEM((conv_integer(addr_b)+71))& 
                 ram_MEM((conv_integer(addr_b)+62))& 
                 ram_MEM((conv_integer(addr_b)+53))& 
                 ram_MEM((conv_integer(addr_b)+44))& 
                 ram_MEM((conv_integer(addr_b)+35))& 
                 ram_MEM((conv_integer(addr_b)+26))& 
                 ram_MEM((conv_integer(addr_b)+17))& 
                 ram_MEM((conv_integer(addr_b)+8));
                
        if (ECC_READ_EN = "TRUE") then
            ecc_addr(0) <= ecc_b(0)xor data_b( 0)xor data_b( 1)xor data_b( 2)xor data_b( 3)xor data_b( 4)xor data_b( 5)xor data_b( 6)xor data_b( 7)xor data_b(10)xor data_b(13)xor data_b(14)xor data_b(17)xor data_b(20)xor data_b(23)xor data_b(24)xor data_b(27)xor data_b(35)xor data_b(43)xor data_b(46)xor data_b(47)xor data_b(51)xor data_b(52)xor data_b(53)xor data_b(56)xor data_b(57)xor data_b(58);
            ecc_addr(1) <=ecc_b(1)xor data_b( 0)xor data_b( 1)xor data_b( 2)xor data_b( 8)xor data_b( 9)xor data_b(10)xor data_b(11)xor data_b(12)xor data_b(13)xor data_b(14)xor data_b(15)xor data_b(18)xor data_b(21)xor data_b(22)xor data_b(25)xor data_b(28)xor data_b(31)xor data_b(32)xor data_b(35)xor data_b(43)xor data_b(51)xor data_b(54)xor data_b(55)xor data_b(59)xor data_b(60)xor data_b(61);
            ecc_addr(2) <=ecc_b(2)xor data_b( 3)xor data_b( 4)xor data_b( 5)xor data_b( 8)xor data_b( 9)xor data_b(10)xor data_b(16)xor data_b(17)xor data_b(18)xor data_b(19)xor data_b(20)xor data_b(21)xor data_b(22)xor data_b(23)xor data_b(26)xor data_b(29)xor data_b(30)xor data_b(33)xor data_b(36)xor data_b(39)xor data_b(40)xor data_b(43)xor data_b(51)xor data_b(59)xor data_b(62)xor data_b(63);
            ecc_addr(3) <=ecc_b(3)xor data_b( 3)xor data_b( 6)xor data_b( 7)xor data_b(11)xor data_b(12)xor data_b(13)xor data_b(16)xor data_b(17)xor data_b(18)xor data_b(24)xor data_b(25)xor data_b(26)xor data_b(27)xor data_b(28)xor data_b(29)xor data_b(30)xor data_b(31)xor data_b(34)xor data_b(37)xor data_b(38)xor data_b(41)xor data_b(44)xor data_b(47)xor data_b(48)xor data_b(51)xor data_b(59);
            ecc_addr(4) <=ecc_b(4)xor data_b( 3)xor data_b(11)xor data_b(14)xor data_b(15)xor data_b(19)xor data_b(20)xor data_b(21)xor data_b(24)xor data_b(25)xor data_b(26)xor data_b(32)xor data_b(33)xor data_b(34)xor data_b(35)xor data_b(36)xor data_b(37)xor data_b(38)xor data_b(39)xor data_b(42)xor data_b(45)xor data_b(46)xor data_b(49)xor data_b(52)xor data_b(55)xor data_b(56)xor data_b(59);
            ecc_addr(5) <=ecc_b(5)xor data_b( 0)xor data_b( 3)xor data_b(11)xor data_b(19)xor data_b(22)xor data_b(23)xor data_b(27)xor data_b(28)xor data_b(29)xor data_b(32)xor data_b(33)xor data_b(34)xor data_b(40)xor data_b(41)xor data_b(42)xor data_b(43)xor data_b(44)xor data_b(45)xor data_b(46)xor data_b(47)xor data_b(50)xor data_b(53)xor data_b(54)xor data_b(57)xor data_b(60)xor data_b(63);
            ecc_addr(6) <=ecc_b(6)xor data_b( 1)xor data_b( 4)xor data_b( 7)xor data_b( 8)xor data_b(11)xor data_b(19)xor data_b(27)xor data_b(30)xor data_b(31)xor data_b(35)xor data_b(36)xor data_b(37)xor data_b(40)xor data_b(41)xor data_b(42)xor data_b(48)xor data_b(49)xor data_b(50)xor data_b(51)xor data_b(52)xor data_b(53)xor data_b(54)xor data_b(55)xor data_b(58)xor data_b(61)xor data_b(62);
            ecc_addr(7) <=ecc_b(7)xor data_b( 2)xor data_b( 5)xor data_b( 6)xor data_b( 9)xor data_b(12)xor data_b(15)xor data_b(16)xor data_b(19)xor data_b(27)xor data_b(35)xor data_b(38)xor data_b(39)xor data_b(43)xor data_b(44)xor data_b(45)xor data_b(48)xor data_b(49)xor data_b(50)xor data_b(56)xor data_b(57)xor data_b(58)xor data_b(59)xor data_b(60)xor data_b(61)xor data_b(62)xor data_b(63);
            if ( ecc_addr/="00000000") then 
                for n in 0 to 7 loop
                    j := j xor ecc_addr(n);
                end loop;
                ecc_err <= (not j)& j;
                data_b_new<=data_b; 
                ecc_b_new<=ecc_b; 
                if(ecc_addr = "00100011")then data_b_new( 0) <= not data_b( 0);
				elsif(ecc_addr = "01000011")then data_b_new( 1) <= not data_b( 1);
				elsif(ecc_addr = "10000011")then data_b_new( 2) <= not data_b( 2);
				elsif(ecc_addr = "00111101")then data_b_new( 3) <= not data_b( 3);
				elsif(ecc_addr = "01000101")then data_b_new( 4) <= not data_b( 4);
				elsif(ecc_addr = "10000101")then data_b_new( 5) <= not data_b( 5);
				elsif(ecc_addr = "10001001")then data_b_new( 6) <= not data_b( 6);
				elsif(ecc_addr = "01001001")then data_b_new( 7) <= not data_b( 7);
				elsif(ecc_addr = "01000110")then data_b_new( 8) <= not data_b( 8);
				elsif(ecc_addr = "10000110")then data_b_new( 9) <= not data_b( 9);
				elsif(ecc_addr = "00000111")then data_b_new(10) <= not data_b(10);
				elsif(ecc_addr = "01111010")then data_b_new(11) <= not data_b(11);
				elsif(ecc_addr = "10001010")then data_b_new(12) <= not data_b(12);
				elsif(ecc_addr = "00001011")then data_b_new(13) <= not data_b(13);
				elsif(ecc_addr = "00010011")then data_b_new(14) <= not data_b(14);
				elsif(ecc_addr = "10010010")then data_b_new(15) <= not data_b(15);
				elsif(ecc_addr = "10001100")then data_b_new(16) <= not data_b(16);
				elsif(ecc_addr = "00001101")then data_b_new(17) <= not data_b(17);
				elsif(ecc_addr = "00001110")then data_b_new(18) <= not data_b(18);
				elsif(ecc_addr = "11110100")then data_b_new(19) <= not data_b(19);
				elsif(ecc_addr = "00010101")then data_b_new(20) <= not data_b(20);
				elsif(ecc_addr = "00010110")then data_b_new(21) <= not data_b(21);
				elsif(ecc_addr = "00100110")then data_b_new(22) <= not data_b(22);
				elsif(ecc_addr = "00100101")then data_b_new(23) <= not data_b(23);
				elsif(ecc_addr = "00011001")then data_b_new(24) <= not data_b(24);
				elsif(ecc_addr = "00011010")then data_b_new(25) <= not data_b(25);
				elsif(ecc_addr = "00011100")then data_b_new(26) <= not data_b(26);
				elsif(ecc_addr = "11101001")then data_b_new(27) <= not data_b(27);
				elsif(ecc_addr = "00101010")then data_b_new(28) <= not data_b(28);
				elsif(ecc_addr = "00101100")then data_b_new(29) <= not data_b(29);
				elsif(ecc_addr = "01001100")then data_b_new(30) <= not data_b(30);
				elsif(ecc_addr = "01001010")then data_b_new(31) <= not data_b(31);
				elsif(ecc_addr = "00110010")then data_b_new(32) <= not data_b(32);
				elsif(ecc_addr = "00110100")then data_b_new(33) <= not data_b(33);
				elsif(ecc_addr = "00111000")then data_b_new(34) <= not data_b(34);
				elsif(ecc_addr = "11010011")then data_b_new(35) <= not data_b(35);
				elsif(ecc_addr = "01010100")then data_b_new(36) <= not data_b(36);
				elsif(ecc_addr = "01011000")then data_b_new(37) <= not data_b(37);
				elsif(ecc_addr = "10011000")then data_b_new(38) <= not data_b(38);
				elsif(ecc_addr = "10010100")then data_b_new(39) <= not data_b(39);
				elsif(ecc_addr = "01100100")then data_b_new(40) <= not data_b(40);
				elsif(ecc_addr = "01101000")then data_b_new(41) <= not data_b(41);
				elsif(ecc_addr = "01110000")then data_b_new(42) <= not data_b(42);
				elsif(ecc_addr = "10100111")then data_b_new(43) <= not data_b(43);
				elsif(ecc_addr = "10101000")then data_b_new(44) <= not data_b(44);
				elsif(ecc_addr = "10110000")then data_b_new(45) <= not data_b(45);
				elsif(ecc_addr = "00110001")then data_b_new(46) <= not data_b(46);
				elsif(ecc_addr = "00101001")then data_b_new(47) <= not data_b(47);
				elsif(ecc_addr = "11001000")then data_b_new(48) <= not data_b(48);
				elsif(ecc_addr = "11010000")then data_b_new(49) <= not data_b(49);
				elsif(ecc_addr = "11100000")then data_b_new(50) <= not data_b(50);
				elsif(ecc_addr = "01001111")then data_b_new(51) <= not data_b(51);
				elsif(ecc_addr = "01010001")then data_b_new(52) <= not data_b(52);
				elsif(ecc_addr = "01100001")then data_b_new(53) <= not data_b(53);
				elsif(ecc_addr = "01100010")then data_b_new(54) <= not data_b(54);
				elsif(ecc_addr = "01010010")then data_b_new(55) <= not data_b(55);
				elsif(ecc_addr = "10010001")then data_b_new(56) <= not data_b(56);
				elsif(ecc_addr = "10100001")then data_b_new(57) <= not data_b(57);
				elsif(ecc_addr = "11000001")then data_b_new(58) <= not data_b(58);
				elsif(ecc_addr = "10011110")then data_b_new(59) <= not data_b(59);
				elsif(ecc_addr = "10100010")then data_b_new(60) <= not data_b(60);
				elsif(ecc_addr = "11000010")then data_b_new(61) <= not data_b(61);
				elsif(ecc_addr = "11000100")then data_b_new(62) <= not data_b(62);
				elsif(ecc_addr = "10100100")then data_b_new(63) <= not data_b(63);
				elsif(ecc_addr = "00000001")then ecc_b_new(0) <= not ecc_b(0);
				elsif(ecc_addr = "00000010")then ecc_b_new(1) <= not ecc_b(1);
				elsif(ecc_addr = "00000100")then ecc_b_new(2) <= not ecc_b(2);
				elsif(ecc_addr = "00001000")then ecc_b_new(3) <= not ecc_b(3);
				elsif(ecc_addr = "00010000")then ecc_b_new(4) <= not ecc_b(4);
				elsif(ecc_addr = "00100000")then ecc_b_new(5) <= not ecc_b(5);
				elsif(ecc_addr = "01000000")then ecc_b_new(6) <= not ecc_b(6);
				elsif(ecc_addr = "10000000")then ecc_b_new(7) <= not ecc_b(7);
                end if;
            else
                ecc_err <= "00";
                data_b_new<=data_b;
                ecc_b_new<=ecc_b;
            end if;
        else
            ecc_err <= "00";
            data_b_new<=data_b;
            ecc_b_new<=ecc_b;
        end if;
    end process;


	process(bp_reg_async, bp_reg_sync, pl_reg_async, pl_reg_sync)
	begin
		if(RESET_MODE = "ASYNC") then
	        bp_reg <= bp_reg_async;
	        pl_reg <= pl_reg_async;
	    else 
	        bp_reg <= bp_reg_sync;
	        pl_reg <= pl_reg_sync;
	    end if;

	end process;

	process (CLKB,RESET,grstn)
	begin
		if (grstn = '0') then
			bp_reg_async <= (others=>'0');
			pl_reg_async <= (others=>'0');
		elsif (RESET = '1') then
			bp_reg_async <= (others=>'0');
			pl_reg_async <= (others=>'0');
		elsif (CLKB'event and CLKB='1') then
			if (pceb = '1') then
				bp_reg_async <= ecc_err(1 downto 0)& ecc_b_new(7 downto 0)& data_b_new(63 downto 0);
			end if;
			if(OCE = '1')then
				pl_reg_async <= bp_reg;
			end if;
		end if;
	end process;

	process(CLKB,grstn)
	begin
		if(grstn = '0')then
			pl_reg_sync <= (others=>'0');
			bp_reg_sync <= (others=>'0');
		elsif CLKB'event and CLKB='1' then
            if(RESET = '1')then
			    pl_reg_sync <= (others=>'0');
			    bp_reg_sync <= (others=>'0');
		    else

			if(OCE = '1')then
				pl_reg_sync <= bp_reg;
			end if;
			if(pceb = '1')then
				bp_reg_sync <= ecc_err(1 downto 0)& ecc_b_new(7 downto 0)& data_b_new(63 downto 0);
			end if;
                end if;
		end if;
	end process;

	process(bp_reg, pl_reg)
	begin
		if(READ_MODE='0')then
			DO <= bp_reg(63 downto 0);
	        DOP <= bp_reg(71 downto 64);
	        SECCO <= bp_reg(72);
	        DECCO <= bp_reg(73);
	    else
	        DO <= pl_reg(63 downto 0);
	        DOP <= pl_reg(71 downto 64);
	        SECCO <= pl_reg(72);
	        DECCO <= pl_reg(73);
	    end if;
	end process;

	process(CLKA, grstn)
	begin
		if(grstn='0')then
			ECCP <= (others=>'0');
        elsif (CLKA'event and CLKA='1') then
            if (ECC_WRITE_EN="TRUE" or ECC_READ_EN="TRUE")then
			    ECCP <= ecc_a;
            end if;
		end if;

	end process;

end Behavioral;


---------------------
--/*DSP models*/
---------------------
-----------------MULTADDALU12X12---------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.glb.GSRO;

entity MULTADDALU12X12 is
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
end MULTADDALU12X12;

architecture Behavioral of MULTADDALU12X12 is

    signal ina0_reg_async,ina0_reg_sync,ina1_reg_async,ina1_reg_sync,ina0,ina0_reg,ina1,ina1_reg,ina_preg_async,ina_preg_sync,ina_preg,a_src : std_logic_vector(11 downto 0);
    signal A0_CLK,A0_CE,A0_RESET,A1_CLK,A1_CE,A1_RESET,B0_CLK,B0_CE,B0_RESET,B1_CLK,B1_CE,B1_RESET,ACCSEL_ICLK,ACCSEL_ICE,ACCSEL_IRESET,CASISEL_ICLK,CASISEL_ICE,CASISEL_IRESET,ADDSUB0_ICLK,ADDSUB0_ICE,ADDSUB0_IRESET,ADDSUB1_ICLK,ADDSUB1_ICE,ADDSUB1_IRESET,P0_CLK,P0_CE,P0_RESET,P1_CLK,P1_CE,P1_RESET,ACCSEL_PCLK,ACCSEL_PCE,ACCSEL_PRESET,CASISEL_PCLK,CASISEL_PCE,CASISEL_PRESET,ADDSUB0_PCLK,ADDSUB0_PCE,ADDSUB0_PRESET,ADDSUB1_PCLK,ADDSUB1_PCE,ADDSUB1_PRESET,O_CLK,O_CE,O_RESET : std_logic;
    signal inb0_reg_async,inb0_reg_sync,inb1_reg_async,inb1_reg_sync,inb0,inb0_reg,inb1,inb1_reg : std_logic_vector(11 downto 0);
    signal accsel0_reg_async,accsel0_reg_sync,accsel_0,accsel0_reg,accsel1_reg_async,accsel1_reg_sync,accsel_1,accsel1_reg : std_logic;
    signal casisel0_reg_async,casisel0_reg_sync,casisel_0,casisel0_reg,casisel1_reg_async,casisel1_reg_sync,casisel_1,casisel1_reg : std_logic;
    signal addsub0_reg0_async,addsub0_reg0_sync,addsub0_reg0,addsub0_0,addsub0_reg1_async,addsub0_reg1_sync,addsub0_reg1,addsub0_1 : std_logic;
    signal addsub1_reg0_async,addsub1_reg0_sync,addsub1_reg0,addsub1_0,addsub1_reg1_async,addsub1_reg1_sync,addsub1_reg1,addsub1_1 : std_logic;
    signal a0_ext,b0_ext,mult_out0,a1_ext,b1_ext,mult_out1 : std_logic_vector(23 downto 0);
    signal mult_out0_ext,mult_out1_ext : std_logic_vector(47 downto 0);
    signal out0_reg_async,out0_reg_sync,out0,out0_reg,out1_reg_async,out1_reg_sync,out1,out1_reg : std_logic_vector(23 downto 0);
    signal d_out,out_preg_async,out_preg_sync,out_preg,dout_reg,alu_out : std_logic_vector(47 downto 0);
    signal m_out0,m_out1,acc_load,d_casi : std_logic_vector(47 downto 0);
    signal out_reg_async,out_reg_sync,out_reg : std_logic_vector(47 downto 0);
    signal accsel_sig,casisel_sig,addsub0_sig,addsub1_sig : std_logic;
    signal grstn : std_logic;
    signal accsel_int,accsel_int0_reg_async,accsel_int0_reg_sync,accsel_int0,accsel_int0_reg,accsel_int1_reg_async,accsel_int1_reg_sync,accsel_int1,accsel_int1_reg : std_logic_vector(1 downto 0);

    begin
		grstn <= GSRO;

		process (ina0_reg_async, ina0_reg_sync, ina1_reg_async, ina1_reg_sync, inb0_reg_async, inb0_reg_sync, inb1_reg_async, inb1_reg_sync, ina_preg_async, ina_preg_sync, accsel0_reg_async, accsel0_reg_sync, accsel1_reg_async, accsel1_reg_sync, casisel0_reg_async, casisel0_reg_sync, casisel1_reg_async, casisel1_reg_sync, addsub0_reg0_async, addsub0_reg0_sync, addsub0_reg1_async, addsub0_reg1_sync, addsub1_reg0_async, addsub1_reg0_sync, addsub1_reg1_async, addsub1_reg1_sync, out0_reg_async, out0_reg_sync, out1_reg_async, out1_reg_sync, out_preg_async, out_preg_sync, out_reg_sync, out_reg_async, accsel_int0_reg_async, accsel_int0_reg_sync, accsel_int0_reg, accsel_int1_reg_async, accsel_int1_reg_sync, accsel_int1_reg)
		begin
			if MULT_RESET_MODE = "ASYNC" then
				ina0_reg <= ina0_reg_async;
                ina1_reg <= ina1_reg_async;
                inb0_reg <= inb0_reg_async;
                inb1_reg <= inb1_reg_async;
                accsel0_reg <= accsel0_reg_async;
                accsel1_reg <= accsel1_reg_async;
                casisel0_reg <= casisel0_reg_async;
                casisel1_reg <= casisel1_reg_async;
                addsub0_reg0 <= addsub0_reg0_async;
                addsub0_reg1 <= addsub0_reg1_async;
                addsub1_reg0 <= addsub1_reg0_async;
                addsub1_reg1 <= addsub1_reg1_async;
                out0_reg <= out0_reg_async;
                out1_reg <= out1_reg_async;
                out_preg <= out_preg_async;
                ina_preg <= ina_preg_async;
                out_reg <= out_reg_async;
                accsel_int0_reg <= accsel_int0_reg_async;
                accsel_int1_reg <= accsel_int1_reg_async;
 			elsif MULT_RESET_MODE = "SYNC" then
				ina0_reg <= ina0_reg_sync;
                ina1_reg <= ina1_reg_sync;
                inb0_reg <= inb0_reg_sync;
                inb1_reg <= inb1_reg_sync;
                accsel0_reg <= accsel0_reg_sync;
                accsel1_reg <= accsel1_reg_sync;
                casisel0_reg <= casisel0_reg_sync;
                casisel1_reg <= casisel1_reg_sync;
                addsub0_reg0 <= addsub0_reg0_sync;
                addsub0_reg1 <= addsub0_reg1_sync;
                addsub1_reg0 <= addsub1_reg0_sync;
                addsub1_reg1 <= addsub1_reg1_sync;
                out0_reg <= out0_reg_sync;
                out1_reg <= out1_reg_sync;
                out_preg <= out_preg_sync;
                ina_preg <= ina_preg_sync;
                out_reg <= out_reg_sync;
                accsel_int0_reg <= accsel_int0_reg_sync;
                accsel_int1_reg <= accsel_int1_reg_sync;
 			end if;
		end process;

        --clk,ce,reset mux
        --A0REG
        process(CLK)
        begin
            if (A0REG_CLK = "CLK0") then
                A0_CLK <= CLK(0);
            elsif (A0REG_CLK = "CLK1") then
                A0_CLK <= CLK(1);
            end if;
        end process;

        process(CE)
        begin
            if (A0REG_CE = "CE0") then
                A0_CE <= CE(0);
            elsif (A0REG_CE = "CE1") then
                A0_CE <= CE(1);
            end if;
        end process;

        process(RESET)
        begin
            if (A0REG_RESET = "RESET0") then
                A0_RESET <= RESET(0);
            elsif (A0REG_RESET = "RESET1") then
                A0_RESET <= RESET(1);
            end if;
        end process;

        --A1REG
        process(CLK)
        begin
            if (A1REG_CLK = "CLK0") then
                A1_CLK <= CLK(0);
            elsif (A1REG_CLK = "CLK1") then
                A1_CLK <= CLK(1);
            end if;
        end process;

        process(CE)
        begin
            if (A1REG_CE = "CE0") then
                A1_CE <= CE(0);
            elsif (A1REG_CE = "CE1") then
                A1_CE <= CE(1);
            end if;
        end process;

        process(RESET)
        begin
            if (A1REG_RESET = "RESET0") then
                A1_RESET <= RESET(0);
            elsif (A1REG_RESET = "RESET1") then
                A1_RESET <= RESET(1);
            end if;
        end process;

        --B0REG
        process(CLK)
        begin
            if (B0REG_CLK = "CLK0") then
                B0_CLK <= CLK(0);
            elsif (B0REG_CLK = "CLK1") then
                B0_CLK <= CLK(1);
            end if;
        end process;

        process(CE)
        begin
            if (B0REG_CE = "CE0") then
                B0_CE <= CE(0);
            elsif (B0REG_CE = "CE1") then
                B0_CE <= CE(1);
            end if;
        end process;

        process(RESET)
        begin
            if (B0REG_RESET = "RESET0") then
                B0_RESET <= RESET(0);
            elsif (B0REG_RESET = "RESET1") then
                B0_RESET <= RESET(1);
            end if;
        end process;

        --B1REG
        process(CLK)
        begin
            if (B1REG_CLK = "CLK0") then
                B1_CLK <= CLK(0);
            elsif (B1REG_CLK = "CLK1") then
                B1_CLK <= CLK(1);
            end if;
        end process;

        process(CE)
        begin
            if (B1REG_CE = "CE0") then
                B1_CE <= CE(0);
            elsif (B1REG_CE = "CE1") then
                B1_CE <= CE(1);
            end if;
        end process;

        process(RESET)
        begin
            if (B1REG_RESET = "RESET0") then
                B1_RESET <= RESET(0);
            elsif (B1REG_RESET = "RESET1") then
                B1_RESET <= RESET(1);
            end if;
        end process;

        --IREG
        process(CLK)
        begin
            if (ACCSEL_IREG_CLK = "CLK0") then
                ACCSEL_ICLK <= CLK(0);
            elsif (ACCSEL_IREG_CLK = "CLK1") then
                ACCSEL_ICLK <= CLK(1);
            end if;
        end process;

        process(CE)
        begin
            if (ACCSEL_IREG_CE = "CE0") then
                ACCSEL_ICE <= CE(0);
            elsif (ACCSEL_IREG_CE = "CE1") then
                ACCSEL_ICE <= CE(1);
            end if;
        end process;

        process(RESET)
        begin
            if (ACCSEL_IREG_RESET = "RESET0") then
                ACCSEL_IRESET <= RESET(0);
            elsif (ACCSEL_IREG_RESET = "RESET1") then
                ACCSEL_IRESET <= RESET(1);
            end if;
        end process;

        process(CLK)
        begin
            if (ADDSUB0_IREG_CLK = "CLK0") then
                ADDSUB0_ICLK <= CLK(0);
            elsif (ADDSUB0_IREG_CLK = "CLK1") then
                ADDSUB0_ICLK <= CLK(1);
            end if;
        end process;

        process(CE)
        begin
            if (ADDSUB0_IREG_CE = "CE0") then
                ADDSUB0_ICE <= CE(0);
            elsif (ADDSUB0_IREG_CE = "CE1") then
                ADDSUB0_ICE <= CE(1);
            end if;
        end process;

        process(RESET)
        begin
            if (ADDSUB0_IREG_RESET = "RESET0") then
                ADDSUB0_IRESET <= RESET(0);
            elsif (ADDSUB0_IREG_RESET = "RESET1") then
                ADDSUB0_IRESET <= RESET(1);
            end if;
        end process;

        process(CLK)
        begin
            if (ADDSUB1_IREG_CLK = "CLK0") then
                ADDSUB1_ICLK <= CLK(0);
            elsif (ADDSUB1_IREG_CLK = "CLK1") then
                ADDSUB1_ICLK <= CLK(1);
            end if;
        end process;

        process(CE)
        begin
            if (ADDSUB1_IREG_CE = "CE0") then
                ADDSUB1_ICE <= CE(0);
            elsif (ADDSUB1_IREG_CE = "CE1") then
                ADDSUB1_ICE <= CE(1);
            end if;
        end process;

        process(RESET)
        begin
            if (ADDSUB1_IREG_RESET = "RESET0") then
                ADDSUB1_IRESET <= RESET(0);
            elsif (ADDSUB1_IREG_RESET = "RESET1") then
                ADDSUB1_IRESET <= RESET(1);
            end if;
        end process;

        process(CLK)
        begin
            if (CASISEL_IREG_CLK = "CLK0") then
                CASISEL_ICLK <= CLK(0);
            elsif (CASISEL_IREG_CLK = "CLK1") then
                CASISEL_ICLK <= CLK(1);
            end if;
        end process;

        process(CE)
        begin
            if (CASISEL_IREG_CE = "CE0") then
                CASISEL_ICE <= CE(0);
            elsif (CASISEL_IREG_CE = "CE1") then
                CASISEL_ICE <= CE(1);
            end if;
        end process;

        process(RESET)
        begin
            if (CASISEL_IREG_RESET = "RESET0") then
                CASISEL_IRESET <= RESET(0);
            elsif (CASISEL_IREG_RESET = "RESET1") then
                CASISEL_IRESET <= RESET(1);
            end if;
        end process;


        --PREG0
        process(CLK)
        begin
            if (PREG0_CLK = "CLK0") then
                P0_CLK <= CLK(0);
            elsif (PREG0_CLK = "CLK1") then
                P0_CLK <= CLK(1);
            end if;
        end process;

        process(CE)
        begin
            if (PREG0_CE = "CE0") then
                P0_CE <= CE(0);
            elsif (PREG0_CE = "CE1") then
                P0_CE <= CE(1);
            end if;
        end process;

        process(RESET)
        begin
            if (PREG0_RESET = "RESET0") then
                P0_RESET <= RESET(0);
            elsif (PREG0_RESET = "RESET1") then
                P0_RESET <= RESET(1);
            end if;
        end process;

        --PREG1
        process(CLK)
        begin
            if (PREG1_CLK = "CLK0") then
                P1_CLK <= CLK(0);
            elsif (PREG1_CLK = "CLK1") then
                P1_CLK <= CLK(1);
            end if;
        end process;

        process(CE)
        begin
            if (PREG1_CE = "CE0") then
                P1_CE <= CE(0);
            elsif (PREG1_CE = "CE1") then
                P1_CE <= CE(1);
            end if;
        end process;

        process(RESET)
        begin
            if (PREG1_RESET = "RESET0") then
                P1_RESET <= RESET(0);
            elsif (PREG1_RESET = "RESET1") then
                P1_RESET <= RESET(1);
            end if;
        end process;

        --PREG
        process(CLK)
        begin
            if (ACCSEL_PREG_CLK = "CLK0") then
                ACCSEL_PCLK <= CLK(0);
            elsif (ACCSEL_PREG_CLK = "CLK1") then
                ACCSEL_PCLK <= CLK(1);
            end if;
        end process;

        process(CE)
        begin
            if (ACCSEL_PREG_CE = "CE0") then
                ACCSEL_PCE <= CE(0);
            elsif (ACCSEL_PREG_CE = "CE1") then
                ACCSEL_PCE <= CE(1);
            end if;
        end process;

        process(RESET)
        begin
            if (ACCSEL_PREG_RESET = "RESET0") then
                ACCSEL_PRESET <= RESET(0);
            elsif (ACCSEL_PREG_RESET = "RESET1") then
                ACCSEL_PRESET <= RESET(1);
            end if;
        end process;

        process(CLK)
        begin
            if (ADDSUB0_PREG_CLK = "CLK0") then
                ADDSUB0_PCLK <= CLK(0);
            elsif (ADDSUB0_PREG_CLK = "CLK1") then
                ADDSUB0_PCLK <= CLK(1);
            end if;
        end process;

        process(CE)
        begin
            if (ADDSUB0_PREG_CE = "CE0") then
                ADDSUB0_PCE <= CE(0);
            elsif (ADDSUB0_PREG_CE = "CE1") then
                ADDSUB0_PCE <= CE(1);
            end if;
        end process;

        process(RESET)
        begin
            if (ADDSUB0_PREG_RESET = "RESET0") then
                ADDSUB0_PRESET <= RESET(0);
            elsif (ADDSUB0_PREG_RESET = "RESET1") then
                ADDSUB0_PRESET <= RESET(1);
            end if;
        end process;

        process(CLK)
        begin
            if (ADDSUB1_PREG_CLK = "CLK0") then
                ADDSUB1_PCLK <= CLK(0);
            elsif (ADDSUB1_PREG_CLK = "CLK1") then
                ADDSUB1_PCLK <= CLK(1);
            end if;
        end process;

        process(CE)
        begin
            if (ADDSUB1_PREG_CE = "CE0") then
                ADDSUB1_PCE <= CE(0);
            elsif (ADDSUB1_PREG_CE = "CE1") then
                ADDSUB1_PCE <= CE(1);
            end if;
        end process;

        process(RESET)
        begin
            if (ADDSUB1_PREG_RESET = "RESET0") then
                ADDSUB1_PRESET <= RESET(0);
            elsif (ADDSUB1_PREG_RESET = "RESET1") then
                ADDSUB1_PRESET <= RESET(1);
            end if;
        end process;

        process(CLK)
        begin
            if (CASISEL_PREG_CLK = "CLK0") then
                CASISEL_PCLK <= CLK(0);
            elsif (CASISEL_PREG_CLK = "CLK1") then
                CASISEL_PCLK <= CLK(1);
            end if;
        end process;

        process(CE)
        begin
            if (CASISEL_IREG_CE = "CE0") then
                CASISEL_ICE <= CE(0);
            elsif (CASISEL_IREG_CE = "CE1") then
                CASISEL_ICE <= CE(1);
            end if;
        end process;

        process(RESET)
        begin
            if (CASISEL_IREG_RESET = "RESET0") then
                CASISEL_IRESET <= RESET(0);
            elsif (CASISEL_IREG_RESET = "RESET1") then
                CASISEL_IRESET <= RESET(1);
            end if;
        end process;

        --OREG
        process(CLK)
        begin
            if (OREG_CLK = "CLK0") then
                O_CLK <= CLK(0);
            elsif (OREG_CLK = "CLK1") then
                O_CLK <= CLK(1);
            end if;
        end process;

        process(CE)
        begin
            if (OREG_CE = "CE0") then
                O_CE <= CE(0);
            elsif (OREG_CE = "CE1") then
                O_CE <= CE(1);
            end if;
        end process;

        process(RESET)
        begin
            if (OREG_RESET = "RESET0") then
                O_RESET <= RESET(0);
            elsif (OREG_RESET = "RESET1") then
                O_RESET <= RESET(1);
            end if;
        end process;

        -- in reg
        process(A0_CLK, A0_RESET, grstn)
        begin
            if (grstn = '0') then
				ina0_reg_async <= (others=>'0');
			elsif A0_RESET = '1' then
				ina0_reg_async <= (others=>'0');
            elsif (A0_CLK'event and A0_CLK = '1') then  
                if (A0_CE = '1') then
                    ina0_reg_async <= A0;
                end if;
            end if;
        end process;

        process (A0_CLK, grstn)
		begin
			if (grstn = '0') then
				ina0_reg_sync <= (others=>'0');
			elsif (A0_CLK'event and A0_CLK = '1') then
			    if (A0_RESET = '1') then
				    ina0_reg_sync <= (others=>'0');
                elsif (A0_CE = '1') then
					ina0_reg_sync <= A0;
				end if;
			end if;
		end process;

        process(A1_CLK, A1_RESET, grstn)
        begin
            if (grstn = '0') then
				ina1_reg_async <= (others=>'0');
			elsif A1_RESET = '1' then
				ina1_reg_async <= (others=>'0');
            elsif (A1_CLK'event and A1_CLK = '1') then  
                if (A1_CE = '1') then
                    ina1_reg_async <= A1;
                end if;
            end if;
        end process;

        process (A1_CLK, grstn)
		begin
			if (grstn = '0') then
				ina1_reg_sync <= (others=>'0');
			elsif (A1_CLK'event and A1_CLK = '1') then
			    if (A1_RESET = '1') then
				    ina1_reg_sync <= (others=>'0');
                elsif (A1_CE = '1') then
					ina1_reg_sync <= A1;
				end if;
			end if;
		end process;

        process(A0, ina0_reg)
        begin
            if (A0REG_CLK = "BYPASS") then
                ina0 <= A0;
            else
                ina0 <= ina0_reg;
            end if;
        end process;

        process(A1, ina1_reg)
        begin
            if (A1REG_CLK = "BYPASS") then
                ina1 <= A1;
            else
                ina1 <= ina1_reg;
            end if;
        end process;

        process(B0_CLK, B0_RESET, grstn)
        begin
            if (grstn = '0') then
				inb0_reg_async <= (others=>'0');
			elsif B0_RESET = '1' then
				inb0_reg_async <= (others=>'0');
            elsif (B0_CLK'event and B0_CLK = '1') then  
                if (B0_CE = '1') then
                    inb0_reg_async <= B0;
                end if;
            end if;
        end process;

        process (B0_CLK, grstn)
		begin
			if (grstn = '0') then
				inb0_reg_sync <= (others=>'0');
			elsif (B0_CLK'event and B0_CLK = '1') then
			    if (B0_RESET = '1') then
				    inb0_reg_sync <= (others=>'0');
                elsif (B0_CE = '1') then
					inb0_reg_sync <= B0;
				end if;
			end if;
		end process;

        process(B1_CLK, B1_RESET, grstn)
        begin
            if (grstn = '0') then
				inb1_reg_async <= (others=>'0');
			elsif B1_RESET = '1' then
				inb1_reg_async <= (others=>'0');
            elsif (B1_CLK'event and B1_CLK = '1') then  
                if (B1_CE = '1') then
                    inb1_reg_async <= B1;
                end if;
            end if;
        end process;

        process (B1_CLK, grstn)
		begin
			if (grstn = '0') then
				inb1_reg_sync <= (others=>'0');
			elsif (B1_CLK'event and B1_CLK = '1') then
			    if (B1_RESET = '1') then
				    inb1_reg_sync <= (others=>'0');
                elsif (B1_CE = '1') then
					inb1_reg_sync <= B1;
				end if;
			end if;
		end process;

        process(B0, inb0_reg)
        begin
            if (B0REG_CLK = "BYPASS") then
                inb0 <= B0;
            else
                inb0 <= inb0_reg;
            end if;
        end process;

        process(B1, inb1_reg)
        begin
            if (B1REG_CLK = "BYPASS") then
                inb1 <= B1;
            else
                inb1 <= inb1_reg;
            end if;
        end process;

        accsel_sig <= TO_STDULOGIC(ACC_SEL) when(DYN_ACC_SEL = "FALSE") else ACCSEL;
        casisel_sig <= TO_STDULOGIC(CASI_SEL) when(DYN_CASI_SEL = "FALSE") else CASISEL;
    
        addsub0_sig <= TO_STDULOGIC(ADD_SUB_0) when(DYN_ADD_SUB_0 = "FALSE") else ADDSUB(0);
        addsub1_sig <= TO_STDULOGIC(ADD_SUB_1) when(DYN_ADD_SUB_1 = "FALSE") else ADDSUB(1);

        process(accsel_sig)
        begin
            if(accsel_sig = '0') then
                accsel_int <= "01";
            elsif(accsel_sig = '1') then
                accsel_int <= "10";
            end if;
          end process;

        process(ACCSEL_ICLK, ACCSEL_IRESET, grstn)
        begin
            if (grstn = '0') then
				accsel0_reg_async <= '0';
                accsel_int0_reg_async <= "00";
			elsif ACCSEL_IRESET = '1' then
				accsel0_reg_async <= '0';
                accsel_int0_reg_async <= "00";
            elsif (ACCSEL_ICLK'event and ACCSEL_ICLK = '1') then  
                if (ACCSEL_ICE = '1') then
                    accsel0_reg_async <= accsel_sig;
                    accsel_int0_reg_async <= accsel_int;
                end if;
            end if;
        end process;

        process (ACCSEL_ICLK, grstn)
		begin
			if (grstn = '0') then
				accsel0_reg_sync <= '0';
                accsel_int0_reg_sync <= "00";
			elsif (ACCSEL_ICLK'event and ACCSEL_ICLK = '1') then
			    if (ACCSEL_IRESET = '1') then
				    accsel0_reg_sync <= '0';
                    accsel_int0_reg_sync <= "00";
                elsif (ACCSEL_ICE = '1') then
					accsel0_reg_sync <= accsel_sig;
                    accsel_int0_reg_sync <= accsel_int;
				end if;
			end if;
		end process;

        process(accsel_sig, accsel0_reg, accsel_int, accsel_int0_reg)
        begin
            if (ACCSEL_IREG_CLK = "BYPASS") then
                accsel_0 <= accsel_sig;
                accsel_int0 <= accsel_int;
            else
                accsel_0 <= accsel0_reg;
                accsel_int0 <= accsel_int0_reg;
            end if;
        end process;

        process(ACCSEL_PCLK, ACCSEL_PRESET, grstn)
        begin
            if (grstn = '0') then
				accsel1_reg_async <= '0';
                accsel_int1_reg_async <= "00";
			elsif ACCSEL_PRESET = '1' then
				accsel1_reg_async <= '0';
                accsel_int1_reg_async <= "00";
            elsif (ACCSEL_PCLK'event and ACCSEL_PCLK = '1') then  
                if (ACCSEL_PCE = '1') then
                    accsel1_reg_async <= accsel_0;
                    accsel_int1_reg_async <= accsel_int0;
                end if;
            end if;
        end process;

        process (ACCSEL_PCLK, grstn)
		begin
			if (grstn = '0') then
				accsel1_reg_sync <= '0';
                accsel_int1_reg_sync <= "00";
			elsif (ACCSEL_PCLK'event and ACCSEL_PCLK = '1') then
			    if (ACCSEL_PRESET = '1') then
				    accsel1_reg_sync <= '0';
                    accsel_int1_reg_sync <= "00";
                elsif (ACCSEL_PCE = '1') then
					accsel1_reg_sync <= accsel_0;
                    accsel_int1_reg_sync <= accsel_int0;
				end if;
			end if;
		end process;

        process(accsel_0, accsel1_reg, accsel_int0, accsel_int1_reg)
        begin
            if (ACCSEL_PREG_CLK = "BYPASS") then
                accsel_1 <= accsel_0;
                accsel_int1 <= accsel_int0;
            else
                accsel_1 <= accsel1_reg;
                accsel_int1 <= accsel_int1_reg;
            end if;
        end process;

        process(CASISEL_ICLK, CASISEL_IRESET, grstn)
        begin
            if (grstn = '0') then
				casisel0_reg_async <= '0';
			elsif CASISEL_IRESET = '1' then
				casisel0_reg_async <= '0';
            elsif (CASISEL_ICLK'event and CASISEL_ICLK = '1') then  
                if (CASISEL_ICE = '1') then
                    casisel0_reg_async <= casisel_sig;
                end if;
            end if;
        end process;

        process (CASISEL_ICLK, grstn)
		begin
			if (grstn = '0') then
				casisel0_reg_sync <= '0';
			elsif (CASISEL_ICLK'event and CASISEL_ICLK = '1') then
			    if (CASISEL_IRESET = '1') then
				    casisel0_reg_sync <= '0';
                elsif (CASISEL_ICE = '1') then
					casisel0_reg_sync <= casisel_sig;
				end if;
			end if;
		end process;

        process(casisel_sig, casisel0_reg)
        begin
            if (CASISEL_IREG_CLK = "BYPASS") then
                casisel_0 <= casisel_sig;
            else
                casisel_0 <= casisel0_reg;
            end if;
        end process;

        process(CASISEL_PCLK, CASISEL_PRESET, grstn)
        begin
            if (grstn = '0') then
				casisel1_reg_async <= '0';
			elsif CASISEL_PRESET = '1' then
				casisel1_reg_async <= '0';
            elsif (CASISEL_PCLK'event and CASISEL_PCLK = '1') then  
                if (CASISEL_PCE = '1') then
                    casisel1_reg_async <= casisel_0;
                end if;
            end if;
        end process;

        process (CASISEL_PCLK, grstn)
		begin
			if (grstn = '0') then
				casisel1_reg_sync <= '0';
			elsif (CASISEL_PCLK'event and CASISEL_PCLK = '1') then
			    if (CASISEL_PRESET = '1') then
				    casisel1_reg_sync <= '0';
                elsif (CASISEL_PCE = '1') then
					casisel1_reg_sync <= casisel_0;
				end if;
			end if;
		end process;

        process(casisel_0, casisel1_reg)
        begin
            if (CASISEL_PREG_CLK = "BYPASS") then
                casisel_1 <= casisel_0;
            else
                casisel_1 <= casisel1_reg;
            end if;
        end process;


        process(ADDSUB0_ICLK, ADDSUB0_IRESET, grstn)
        begin
            if (grstn = '0') then
				addsub0_reg0_async <= '0';
			elsif ADDSUB0_IRESET = '1' then
				addsub0_reg0_async <= '0';
            elsif (ADDSUB0_ICLK'event and ADDSUB0_ICLK = '1') then  
                if (ADDSUB0_ICE = '1') then
                    addsub0_reg0_async <= addsub0_sig;
                end if;
            end if;
        end process;

        process (ADDSUB0_ICLK, grstn)
		begin
			if (grstn = '0') then
				addsub0_reg0_sync <= '0';
			elsif (ADDSUB0_ICLK'event and ADDSUB0_ICLK = '1') then
			    if (ADDSUB0_IRESET = '1') then
				    addsub0_reg0_sync <= '0';
                elsif (ADDSUB0_ICE = '1') then
					addsub0_reg0_sync <= addsub0_sig;
				end if;
			end if;
		end process;

        process(addsub0_sig, addsub0_reg0)
        begin
            if (ADDSUB0_IREG_CLK = "BYPASS") then
                addsub0_0 <= addsub0_sig;
            else
                addsub0_0 <= addsub0_reg0;
            end if;
        end process;

        process(ADDSUB0_PCLK, ADDSUB0_PRESET, grstn)
        begin
            if (grstn = '0') then
				addsub0_reg1_async <= '0';
			elsif ADDSUB0_PRESET = '1' then
				addsub0_reg1_async <= '0';
            elsif (ADDSUB0_PCLK'event and ADDSUB0_PCLK = '1') then  
                if (ADDSUB0_PCE = '1') then
                    addsub0_reg1_async <= addsub0_0;
                end if;
            end if;
        end process;

        process (ADDSUB0_PCLK, grstn)
		begin
			if (grstn = '0') then
				addsub0_reg1_sync <= '0';
			elsif (ADDSUB0_PCLK'event and ADDSUB0_PCLK = '1') then
			    if (ADDSUB0_PRESET = '1') then
				    addsub0_reg1_sync <= '0';
                elsif (ADDSUB0_PCE = '1') then
					addsub0_reg1_sync <= addsub0_0;
				end if;
			end if;
		end process;

        process(addsub0_0, addsub0_reg1)
        begin
            if (ADDSUB0_PREG_CLK = "BYPASS") then
                addsub0_1 <= addsub0_0;
            else
                addsub0_1 <= addsub0_reg1;
            end if;
        end process;

        process(ADDSUB1_ICLK, ADDSUB1_IRESET, grstn)
        begin
            if (grstn = '0') then
				addsub1_reg0_async <= '0';
			elsif ADDSUB1_IRESET = '1' then
				addsub1_reg0_async <= '0';
            elsif (ADDSUB1_ICLK'event and ADDSUB1_ICLK = '1') then  
                if (ADDSUB1_ICE = '1') then
                    addsub1_reg0_async <= addsub1_sig;
                end if;
            end if;
        end process;

        process (ADDSUB1_ICLK, grstn)
		begin
			if (grstn = '0') then
				addsub1_reg0_sync <= '0';
			elsif (ADDSUB1_ICLK'event and ADDSUB1_ICLK = '1') then
			    if (ADDSUB1_IRESET = '1') then
				    addsub1_reg0_sync <= '0';
                elsif (ADDSUB1_ICE = '1') then
					addsub1_reg0_sync <= addsub1_sig;
				end if;
			end if;
		end process;

        process(addsub1_sig, addsub1_reg0)
        begin
            if (ADDSUB1_IREG_CLK = "BYPASS") then
                addsub1_0 <= addsub1_sig;
            else
                addsub1_0 <= addsub1_reg0;
            end if;
        end process;

        process(ADDSUB1_PCLK, ADDSUB1_PRESET, grstn)
        begin
            if (grstn = '0') then
				addsub1_reg1_async <= '0';
			elsif ADDSUB1_PRESET = '1' then
				addsub1_reg1_async <= '0';
            elsif (ADDSUB1_PCLK'event and ADDSUB1_PCLK = '1') then  
                if (ADDSUB1_PCE = '1') then
                    addsub1_reg1_async <= addsub1_0;
                end if;
            end if;
        end process;

        process (ADDSUB1_PCLK, grstn)
		begin
			if (grstn = '0') then
				addsub1_reg1_sync <= '0';
			elsif (ADDSUB1_PCLK'event and ADDSUB1_PCLK = '1') then
			    if (ADDSUB1_PRESET = '1') then
				    addsub1_reg1_sync <= '0';
                elsif (ADDSUB1_PCE = '1') then
					addsub1_reg1_sync <= addsub1_0;
				end if;
			end if;
		end process;

        process(addsub1_0, addsub1_reg1)
        begin
            if (ADDSUB1_PREG_CLK = "BYPASS") then
                addsub1_1 <= addsub1_0;
            else
                addsub1_1 <= addsub1_reg1;
            end if;
        end process;

        process(ina0,ina1,inb0,inb1)
        begin
            a0_ext(11 downto 0) <= ina0;
            a0_ext(23 downto 12) <= (others=>ina0(11));
            b0_ext(11 downto 0) <= inb0;
            b0_ext(23 downto 12) <= (others=>inb0(11));
            a1_ext(11 downto 0) <= ina1;
            a1_ext(23 downto 12) <= (others=>ina1(11));
            b1_ext(11 downto 0) <= inb1;
            b1_ext(23 downto 12) <= (others=>inb1(11));
        end process;
        
        mult_out0_ext <= a0_ext * b0_ext;
        mult_out0 <= mult_out0_ext(23 downto 0);
        mult_out1_ext <= a1_ext * b1_ext;
        mult_out1 <= mult_out1_ext(23 downto 0);

        process(P0_CLK, P0_RESET, grstn)
        begin
            if (grstn = '0') then
				out0_reg_async <= (others=>'0');
			elsif P0_RESET = '1' then
				out0_reg_async <= (others=>'0');
            elsif (P0_CLK'event and P0_CLK = '1') then  
                if (P0_CE = '1') then
                    out0_reg_async <= mult_out0;
                end if;
            end if;
        end process;

        process (P0_CLK, grstn)
		begin
			if (grstn = '0') then
				out0_reg_sync <= (others=>'0');
			elsif (P0_CLK'event and P0_CLK = '1') then
			    if (P0_RESET = '1') then
				    out0_reg_sync <= (others=>'0');
                elsif (P0_CE = '1') then
					out0_reg_sync <= mult_out0;
				end if;
			end if;
		end process;

        process(P1_CLK, P1_RESET, grstn)
        begin
            if (grstn = '0') then
				out1_reg_async <= (others=>'0');
			elsif P1_RESET = '1' then
				out1_reg_async <= (others=>'0');
            elsif (P1_CLK'event and P1_CLK = '1') then  
                if (P1_CE = '1') then
                    out1_reg_async <= mult_out1;
                end if;
            end if;
        end process;

        process (P1_CLK, grstn)
		begin
			if (grstn = '0') then
				out1_reg_sync <= (others=>'0');
			elsif (P1_CLK'event and P1_CLK = '1') then
			    if (P1_RESET = '1') then
				    out1_reg_sync <= (others=>'0');
                elsif (P1_CE = '1') then
					out1_reg_sync <= mult_out1;
				end if;
			end if;
		end process;

        process(O_CLK, O_RESET, grstn)
        begin
            if (grstn = '0') then
				out_preg_async <= (others=>'0');
			elsif O_RESET = '1' then
				out_preg_async <= (others=>'0');
            elsif (O_CLK'event and O_CLK = '1') then  
                if (O_CE = '1') then
                    out_preg_async <= d_out;
                end if;
            end if;
        end process;

        process (O_CLK, grstn)
		begin
			if (grstn = '0') then
				out_preg_sync <= (others=>'0');
			elsif (O_CLK'event and O_CLK = '1') then
			    if (O_RESET = '1') then
				    out_preg_sync <= (others=>'0');
                elsif (O_CE = '1') then
					out_preg_sync <= d_out;
				end if;
			end if;
		end process;

        process(mult_out0, out0_reg)
        begin
            if (PREG0_CLK = "BYPASS") then
                out0 <= mult_out0;
            else
                out0 <= out0_reg;
            end if;
        end process;

        process(mult_out1, out1_reg)
        begin
            if (PREG1_CLK = "BYPASS") then
                out1 <= mult_out1;
            else
                out1 <= out1_reg;
            end if;
        end process;

        process(d_out, out_preg)
        begin
            if (FB_PREG_EN = "FALSE") then
                dout_reg <= d_out;
            else
                dout_reg <= out_preg;
            end if;
        end process;

        process(out0, out1)
        begin
            m_out0(23 downto 0) <= out0;
            m_out0(47 downto 24) <= (others=>out0(23));
            m_out1(23 downto 0) <= out1;
            m_out1(47 downto 24) <= (others=>out1(23));
        end process;

        process(dout_reg, accsel_1, accsel_int1)
        begin
            if(accsel_int1 = "10" or accsel_int1 = "11") then
                acc_load <= dout_reg(47 downto 0);
            elsif(accsel_int1 = "01") then
                acc_load <= TO_STDLOGICVECTOR(PRE_LOAD);
            else
                acc_load <= (others=>'0');
            end if;
        end process;

        d_casi <= CASI when (casisel_1 = '1') else (others=>'0');

        process(acc_load, m_out0, m_out1, d_casi, addsub0_1, addsub1_1)
        begin
            if(addsub0_1 = '0' and addsub1_1 = '0') then
                alu_out <= acc_load + m_out0 + m_out1 + d_casi;
            elsif(addsub0_1 = '0' and addsub1_1 = '1') then
                alu_out <= acc_load + m_out0 - m_out1 + d_casi;        
            elsif(addsub0_1 = '1' and addsub1_1 = '0') then
                alu_out <= acc_load - m_out0 + m_out1 + d_casi;        
            elsif(addsub0_1 = '1' and addsub1_1 = '1') then
                alu_out <= acc_load - m_out0 - m_out1 + d_casi;        
            end if;
        end process;

        -- output reg
        process(O_CLK, O_RESET, grstn)
        begin
            if (grstn = '0') then
				out_reg_async <= (others=>'0');
			elsif O_RESET = '1' then
				out_reg_async <= (others=>'0');
            elsif (O_CLK'event and O_CLK = '1') then  
                if (O_CE = '1') then
                    out_reg_async <= alu_out;
                end if;
            end if;
        end process;

        process (O_CLK, grstn)
		begin
			if (grstn = '0') then
				out_reg_sync <= (others=>'0');
			elsif (O_CLK'event and O_CLK = '1') then
			    if (O_RESET = '1') then
				    out_reg_sync <= (others=>'0');
                elsif (O_CE = '1') then
					out_reg_sync <= alu_out;
				end if;
			end if;
		end process;

        process(alu_out, out_reg)
        begin
            if (OREG_CLK = "BYPASS") then
                d_out <= alu_out;
            else
                d_out <= out_reg;
            end if;
        end process;

        DOUT <= d_out(47 downto 0);
        CASO <= d_out(47 downto 0);

end Behavioral;

-----------------MULTALU27X18---------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.glb.GSRO;

entity MULTALU27X18 is
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
        CASI_SEL : bit := '0'; --'0': select 0; '1': select  casi
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
end MULTALU27X18;

architecture Behavioral of MULTALU27X18 is

    signal ina_reg_async,ina_reg_sync,ina,ina_reg,a_src,a_in,ina_preg_async,ina_preg_sync,ina_preg,ina_ext,ind_ext : std_logic_vector(26 downto 0);
    signal A_CLK,A_CE,A_RESET,B_CLK,B_CE,B_RESET,C_ICLK,C_ICE,C_IRESET,C_PCLK,C_PCE,C_PRESET,D_CLK,D_CE,D_RESET,PSEL_ICLK,PSEL_ICE,PSEL_IRESET,ACCSEL_ICLK,ACCSEL_ICE,ACCSEL_IRESET,CSEL_ICLK,CSEL_ICE,CSEL_IRESET,CASISEL_ICLK,CASISEL_ICE,CASISEL_IRESET,ADDSUB0_ICLK,ADDSUB0_ICE,ADDSUB0_IRESET,ADDSUB1_ICLK,ADDSUB1_ICE,ADDSUB1_IRESET,PADDSUB_ICLK,PADDSUB_ICE,PADDSUB_IRESET,P_CLK,P_CE,P_RESET,ACCSEL_PCLK,ACCSEL_PCE,ACCSEL_PRESET,CSEL_PCLK,CSEL_PCE,CSEL_PRESET,CASISEL_PCLK,CASISEL_PCE,CASISEL_PRESET,ADDSUB0_PCLK,ADDSUB0_PCE,ADDSUB0_PRESET,ADDSUB1_PCLK,ADDSUB1_PCE,ADDSUB1_PRESET,O_CLK,O_CE,O_RESET : std_logic;
    signal ina_12_ext, ind_12_ext,a_12_in : std_logic_vector(11 downto 0);
    signal inb_reg_async,inb_reg_sync,inb,inb_reg : std_logic_vector(17 downto 0);
    signal ind_reg_async,ind_reg_sync,ind,ind_reg : std_logic_vector(25 downto 0);
    signal inc_ireg_async,inc_ireg_sync,inc_0,inc_ireg,inc_preg_async,inc_preg_sync,inc_1,inc_preg : std_logic_vector(47 downto 0);
    signal accsel0_reg_async,accsel0_reg_sync,accsel_0,accsel0_reg,accsel1_reg_async,accsel1_reg_sync,accsel_1,accsel1_reg : std_logic;
    signal addsub0_reg0_async,addsub0_reg0_sync,addsub0_reg0,addsub0_0,addsub0_reg1_async,addsub0_reg1_sync,addsub0_reg1,addsub0_1 : std_logic;
    signal addsub1_reg0_async,addsub1_reg0_sync,addsub1_reg0,addsub1_0,addsub1_reg1_async,addsub1_reg1_sync,addsub1_reg1,addsub1_1 : std_logic;
    signal casisel0_reg_async,casisel0_reg_sync,casisel_0,casisel0_reg,casisel1_reg_async,casisel1_reg_sync,casisel1_reg,casisel_1 : std_logic;
    signal csel0_reg_async,csel0_reg_sync,csel_0,csel0_reg,csel1_reg_async,csel1_reg_sync,csel1_reg,csel_1 : std_logic;
    signal a0,b0,mult_out,out0_reg_async,out0_reg_sync,out0,out0_reg : std_logic_vector(44 downto 0);
    signal d_out,out_preg_async,out_preg_sync,out_preg,dout_reg,alu_out : std_logic_vector(47 downto 0);
    signal mult_out_ext : std_logic_vector(89 downto 0);
    signal m_out0,acc_load,d_casi,c_sig : std_logic_vector(47 downto 0);
    signal out_reg_async,out_reg_sync,out_reg : std_logic_vector(47 downto 0);
    signal preadd_en,p_addsub_sig : std_logic;
    signal paddsub_reg0_async,paddsub_reg0_sync,paddsub_reg0,paddsub_0 : std_logic;
    signal psel_reg_async,psel_reg_sync,psel_reg,psel_0 : std_logic;
    signal a_sel_sig,accsel_sig,casisel_sig,csel_sig,addsub0_sig,addsub1_sig : std_logic;
    signal grstn : std_logic;
    signal accsel_int,accsel_int0_reg_async,accsel_int0_reg_sync,accsel_int0,accsel_int0_reg,accsel_int1_reg_async,accsel_int1_reg_sync,accsel_int1,accsel_int1_reg : std_logic_vector(1 downto 0);

    begin
		grstn <= GSRO;

        process(ina_reg_async, ina_reg_sync, inb_reg_async, inb_reg_sync, ind_reg_async, ind_reg_sync, inc_ireg_async, inc_ireg_sync, inc_preg_async, inc_preg_sync, psel_reg_async, psel_reg_sync, csel0_reg_async, csel0_reg_sync, csel1_reg_async, csel1_reg_sync, casisel0_reg_async, casisel0_reg_sync, casisel1_reg_async, casisel1_reg_sync, accsel0_reg_async, accsel0_reg_sync, accsel1_reg_async, accsel1_reg_sync, addsub0_reg0_async, addsub0_reg0_sync, addsub0_reg1_async, addsub0_reg1_sync, addsub1_reg0_async, addsub1_reg0_sync, addsub1_reg1_async, addsub1_reg1_sync, paddsub_reg0_async, paddsub_reg0_sync, out0_reg_async, out0_reg_sync, out_preg_async, out_preg_sync, ina_preg_sync, ina_preg_async, out_reg_sync, out_reg_async, accsel_int0_reg_async, accsel_int0_reg_sync, accsel_int0_reg, accsel_int1_reg_async, accsel_int1_reg_sync, accsel_int1_reg)
        begin
            if (MULT_RESET_MODE = "ASYNC") then
                ina_reg <= ina_reg_async;
                inb_reg <= inb_reg_async;
                inc_ireg <= inc_ireg_async;
                inc_preg <= inc_preg_async;
                ind_reg <= ind_reg_async;
                psel_reg <= psel_reg_async;
                accsel0_reg <= accsel0_reg_async;
                accsel1_reg <= accsel1_reg_async;
                csel0_reg <= csel0_reg_async;
                csel1_reg <= csel1_reg_async;
                casisel0_reg <= casisel0_reg_async;
                casisel1_reg <= casisel1_reg_async;
                addsub0_reg0 <= addsub0_reg0_async;
                addsub0_reg1 <= addsub0_reg1_async;
                addsub1_reg0 <= addsub1_reg0_async;
                addsub1_reg1 <= addsub1_reg1_async;
                paddsub_reg0 <= paddsub_reg0_async;
                out0_reg <= out0_reg_async;
                out_preg <= out_preg_async;
                ina_preg <= ina_preg_async;
                out_reg <= out_reg_async;
                accsel_int0_reg <= accsel_int0_reg_async;
                accsel_int1_reg <= accsel_int1_reg_async;
             elsif (MULT_RESET_MODE = "SYNC") then
                ina_reg <= ina_reg_sync;
                inb_reg <= inb_reg_sync;
                inc_ireg <= inc_ireg_sync;
                inc_preg <= inc_preg_sync;
                psel_reg <= psel_reg_sync;
                accsel0_reg <= accsel0_reg_sync;
                accsel1_reg <= accsel1_reg_sync;
                casisel0_reg <= casisel0_reg_sync;
                casisel1_reg <= casisel1_reg_sync;
                csel0_reg <= csel0_reg_sync;
                csel1_reg <= csel1_reg_sync;
                addsub0_reg0 <= addsub0_reg0_sync;
                addsub0_reg1 <= addsub0_reg1_sync;
                addsub1_reg0 <= addsub1_reg0_sync;
                addsub1_reg1 <= addsub1_reg1_sync;
                paddsub_reg0 <= paddsub_reg0_sync;
                out0_reg <= out0_reg_sync;
                out_preg <= out_preg_sync;
                ina_preg <= ina_preg_sync;
                out_reg <= out_reg_sync;
                accsel_int0_reg <= accsel_int0_reg_sync;
                accsel_int1_reg <= accsel_int1_reg_sync;
             end if;
        end process;

        --clk,ce,reset mux
        --AREG
        process(CLK)
        begin
            if (AREG_CLK = "CLK0") then
                A_CLK <= CLK(0);
            elsif (AREG_CLK = "CLK1") then
                A_CLK <= CLK(1);
            end if;
        end process;

        process(CE)
        begin
            if (AREG_CE = "CE0") then
                A_CE <= CE(0);
            elsif (AREG_CE = "CE1") then
                A_CE <= CE(1);
            end if;
        end process;

        process(RESET)
        begin
            if (AREG_RESET = "RESET0") then
                A_RESET <= RESET(0);
            elsif (AREG_RESET = "RESET1") then
                A_RESET <= RESET(1);
            end if;
        end process;

        --BREG
        process(CLK)
        begin
            if (BREG_CLK = "CLK0") then
                B_CLK <= CLK(0);
            elsif (BREG_CLK = "CLK1") then
                B_CLK <= CLK(1);
            end if;
        end process;

        process(CE)
        begin
            if (BREG_CE = "CE0") then
                B_CE <= CE(0);
            elsif (BREG_CE = "CE1") then
                B_CE <= CE(1);
            end if;
        end process;

        process(RESET)
        begin
            if (BREG_RESET = "RESET0") then
                B_RESET <= RESET(0);
            elsif (BREG_RESET = "RESET1") then
                B_RESET <= RESET(1);
            end if;
        end process;

        --CREG
        process(CLK)
        begin
            if (C_IREG_CLK = "CLK0") then
                C_ICLK <= CLK(0);
            elsif (C_IREG_CLK = "CLK1") then
                C_ICLK <= CLK(1);
            end if;
        end process;

        process(CE)
        begin
            if (C_IREG_CE = "CE0") then
                C_ICE <= CE(0);
            elsif (C_IREG_CE = "CE1") then
                C_ICE <= CE(1);
            end if;
        end process;

        process(RESET)
        begin
            if (C_IREG_RESET = "RESET0") then
                C_IRESET <= RESET(0);
            elsif (C_IREG_RESET = "RESET1") then
                C_IRESET <= RESET(1);
            end if;
        end process;

        process(CLK)
        begin
            if (C_PREG_CLK = "CLK0") then
                C_PCLK <= CLK(0);
            elsif (C_PREG_CLK = "CLK1") then
                C_PCLK <= CLK(1);
            end if;
        end process;

        process(CE)
        begin
            if (C_PREG_CE = "CE0") then
                C_PCE <= CE(0);
            elsif (C_PREG_CE = "CE1") then
                C_PCE <= CE(1);
            end if;
        end process;

        process(RESET)
        begin
            if (C_PREG_RESET = "RESET0") then
                C_PRESET <= RESET(0);
            elsif (C_PREG_RESET = "RESET1") then
                C_PRESET <= RESET(1);
            end if;
        end process;

        --DREG
        process(CLK)
        begin
            if (DREG_CLK = "CLK0") then
                D_CLK <= CLK(0);
            elsif (DREG_CLK = "CLK1") then
                D_CLK <= CLK(1);
            end if;
        end process;

        process(CE)
        begin
            if (DREG_CE = "CE0") then
                D_CE <= CE(0);
            elsif (DREG_CE = "CE1") then
                D_CE <= CE(1);
            end if;
        end process;

        process(RESET)
        begin
            if (DREG_RESET = "RESET0") then
                D_RESET <= RESET(0);
            elsif (DREG_RESET = "RESET1") then
                D_RESET <= RESET(1);
            end if;
        end process;


        --IREG
        process(CLK)
        begin
            if (ACCSEL_IREG_CLK = "CLK0") then
                ACCSEL_ICLK <= CLK(0);
            elsif (ACCSEL_IREG_CLK = "CLK1") then
                ACCSEL_ICLK <= CLK(1);
            end if;
        end process;

        process(CE)
        begin
            if (ACCSEL_IREG_CE = "CE0") then
                ACCSEL_ICE <= CE(0);
            elsif (ACCSEL_IREG_CE = "CE1") then
                ACCSEL_ICE <= CE(1);
            end if;
        end process;

        process(RESET)
        begin
            if (ACCSEL_IREG_RESET = "RESET0") then
                ACCSEL_IRESET <= RESET(0);
            elsif (ACCSEL_IREG_RESET = "RESET1") then
                ACCSEL_IRESET <= RESET(1);
            end if;
        end process;

        process(CLK)
        begin
            if (ADDSUB0_IREG_CLK = "CLK0") then
                ADDSUB0_ICLK <= CLK(0);
            elsif (ADDSUB0_IREG_CLK = "CLK1") then
                ADDSUB0_ICLK <= CLK(1);
            end if;
        end process;

        process(CE)
        begin
            if (ADDSUB0_IREG_CE = "CE0") then
                ADDSUB0_ICE <= CE(0);
            elsif (ADDSUB0_IREG_CE = "CE1") then
                ADDSUB0_ICE <= CE(1);
            end if;
        end process;

        process(RESET)
        begin
            if (ADDSUB0_IREG_RESET = "RESET0") then
                ADDSUB0_IRESET <= RESET(0);
            elsif (ADDSUB0_IREG_RESET = "RESET1") then
                ADDSUB0_IRESET <= RESET(1);
            end if;
        end process;

        process(CLK)
        begin
            if (ADDSUB1_IREG_CLK = "CLK0") then
                ADDSUB1_ICLK <= CLK(0);
            elsif (ADDSUB1_IREG_CLK = "CLK1") then
                ADDSUB1_ICLK <= CLK(1);
            end if;
        end process;

        process(CE)
        begin
            if (ADDSUB1_IREG_CE = "CE0") then
                ADDSUB1_ICE <= CE(0);
            elsif (ADDSUB1_IREG_CE = "CE1") then
                ADDSUB1_ICE <= CE(1);
            end if;
        end process;

        process(RESET)
        begin
            if (ADDSUB1_IREG_RESET = "RESET0") then
                ADDSUB1_IRESET <= RESET(0);
            elsif (ADDSUB1_IREG_RESET = "RESET1") then
                ADDSUB1_IRESET <= RESET(1);
            end if;
        end process;

        process(CLK)
        begin
            if (PSEL_IREG_CLK = "CLK0") then
                PSEL_ICLK <= CLK(0);
            elsif (PSEL_IREG_CLK = "CLK1") then
                PSEL_ICLK <= CLK(1);
            end if;
        end process;

        process(CE)
        begin
            if (PSEL_IREG_CE = "CE0") then
                PSEL_ICE <= CE(0);
            elsif (PSEL_IREG_CE = "CE1") then
                PSEL_ICE <= CE(1);
            end if;
        end process;

        process(RESET)
        begin
            if (PSEL_IREG_RESET = "RESET0") then
                PSEL_IRESET <= RESET(0);
            elsif (PSEL_IREG_RESET = "RESET1") then
                PSEL_IRESET <= RESET(1);
            end if;
        end process;

        process(CLK)
        begin
            if (PADDSUB_IREG_CLK = "CLK0") then
                PADDSUB_ICLK <= CLK(0);
            elsif (PADDSUB_IREG_CLK = "CLK1") then
                PADDSUB_ICLK <= CLK(1);
            end if;
        end process;

        process(CE)
        begin
            if (PADDSUB_IREG_CE = "CE0") then
                PADDSUB_ICE <= CE(0);
            elsif (PADDSUB_IREG_CE = "CE1") then
                PADDSUB_ICE <= CE(1);
            end if;
        end process;

        process(RESET)
        begin
            if (PADDSUB_IREG_RESET = "RESET0") then
                PADDSUB_IRESET <= RESET(0);
            elsif (PADDSUB_IREG_RESET = "RESET1") then
                PADDSUB_IRESET <= RESET(1);
            end if;
        end process;

        process(CLK)
        begin
            if (CSEL_IREG_CLK = "CLK0") then
                CSEL_ICLK <= CLK(0);
            elsif (CSEL_IREG_CLK = "CLK1") then
                CSEL_ICLK <= CLK(1);
            end if;
        end process;

        process(CE)
        begin
            if (CSEL_IREG_CE = "CE0") then
                CSEL_ICE <= CE(0);
            elsif (CSEL_IREG_CE = "CE1") then
                CSEL_ICE <= CE(1);
            end if;
        end process;

        process(RESET)
        begin
            if (CSEL_IREG_RESET = "RESET0") then
                CSEL_IRESET <= RESET(0);
            elsif (CSEL_IREG_RESET = "RESET1") then
                CSEL_IRESET <= RESET(1);
            end if;
        end process;

        process(CLK)
        begin
            if (CASISEL_IREG_CLK = "CLK0") then
                CASISEL_ICLK <= CLK(0);
            elsif (CASISEL_IREG_CLK = "CLK1") then
                CASISEL_ICLK <= CLK(1);
            end if;
        end process;

        process(CE)
        begin
            if (CASISEL_IREG_CE = "CE0") then
                CASISEL_ICE <= CE(0);
            elsif (CASISEL_IREG_CE = "CE1") then
                CASISEL_ICE <= CE(1);
            end if;
        end process;

        process(RESET)
        begin
            if (CASISEL_IREG_RESET = "RESET0") then
                CASISEL_IRESET <= RESET(0);
            elsif (CASISEL_IREG_RESET = "RESET1") then
                CASISEL_IRESET <= RESET(1);
            end if;
        end process;

        --PREG
        process(CLK)
        begin
            if (PREG_CLK = "CLK0") then
                P_CLK <= CLK(0);
            elsif (PREG_CLK = "CLK1") then
                P_CLK <= CLK(1);
            end if;
        end process;

        process(CE)
        begin
            if (PREG_CE = "CE0") then
                P_CE <= CE(0);
            elsif (PREG_CE = "CE1") then
                P_CE <= CE(1);
            end if;
        end process;

        process(RESET)
        begin
            if (PREG_RESET = "RESET0") then
                P_RESET <= RESET(0);
            elsif (PREG_RESET = "RESET1") then
                P_RESET <= RESET(1);
            end if;
        end process;

        process(CLK)
        begin
            if (ACCSEL_PREG_CLK = "CLK0") then
                ACCSEL_PCLK <= CLK(0);
            elsif (ACCSEL_PREG_CLK = "CLK1") then
                ACCSEL_PCLK <= CLK(1);
            end if;
        end process;

        process(CE)
        begin
            if (ACCSEL_PREG_CE = "CE0") then
                ACCSEL_PCE <= CE(0);
            elsif (ACCSEL_PREG_CE = "CE1") then
                ACCSEL_PCE <= CE(1);
            end if;
        end process;

        process(RESET)
        begin
            if (ACCSEL_PREG_RESET = "RESET0") then
                ACCSEL_PRESET <= RESET(0);
            elsif (ACCSEL_PREG_RESET = "RESET1") then
                ACCSEL_PRESET <= RESET(1);
            end if;
        end process;

        process(CLK)
        begin
            if (ADDSUB0_PREG_CLK = "CLK0") then
                ADDSUB0_PCLK <= CLK(0);
            elsif (ADDSUB0_PREG_CLK = "CLK1") then
                ADDSUB0_PCLK <= CLK(1);
            end if;
        end process;

        process(CE)
        begin
            if (ADDSUB0_PREG_CE = "CE0") then
                ADDSUB0_PCE <= CE(0);
            elsif (ADDSUB0_PREG_CE = "CE1") then
                ADDSUB0_PCE <= CE(1);
            end if;
        end process;

        process(RESET)
        begin
            if (ADDSUB0_PREG_RESET = "RESET0") then
                ADDSUB0_PRESET <= RESET(0);
            elsif (ADDSUB0_PREG_RESET = "RESET1") then
                ADDSUB0_PRESET <= RESET(1);
            end if;
        end process;

        process(CLK)
        begin
            if (ADDSUB1_PREG_CLK = "CLK0") then
                ADDSUB1_PCLK <= CLK(0);
            elsif (ADDSUB1_PREG_CLK = "CLK1") then
                ADDSUB1_PCLK <= CLK(1);
            end if;
        end process;

        process(CE)
        begin
            if (ADDSUB1_PREG_CE = "CE0") then
                ADDSUB1_PCE <= CE(0);
            elsif (ADDSUB1_PREG_CE = "CE1") then
                ADDSUB1_PCE <= CE(1);
            end if;
        end process;

        process(RESET)
        begin
            if (ADDSUB1_PREG_RESET = "RESET0") then
                ADDSUB1_PRESET <= RESET(0);
            elsif (ADDSUB1_PREG_RESET = "RESET1") then
                ADDSUB1_PRESET <= RESET(1);
            end if;
        end process;

        process(CLK)
        begin
            if (CSEL_PREG_CLK = "CLK0") then
                CSEL_PCLK <= CLK(0);
            elsif (CSEL_PREG_CLK = "CLK1") then
                CSEL_PCLK <= CLK(1);
            end if;
        end process;

        process(CE)
        begin
            if (CSEL_PREG_CE = "CE0") then
                CSEL_PCE <= CE(0);
            elsif (CSEL_PREG_CE = "CE1") then
                CSEL_PCE <= CE(1);
            end if;
        end process;

        process(RESET)
        begin
            if (CSEL_PREG_RESET = "RESET0") then
                CSEL_PRESET <= RESET(0);
            elsif (CSEL_PREG_RESET = "RESET1") then
                CSEL_PRESET <= RESET(1);
            end if;
        end process;

        process(CLK)
        begin
            if (CASISEL_PREG_CLK = "CLK0") then
                CASISEL_PCLK <= CLK(0);
            elsif (CASISEL_PREG_CLK = "CLK1") then
                CASISEL_PCLK <= CLK(1);
            end if;
        end process;

        process(CE)
        begin
            if (CASISEL_PREG_CE = "CE0") then
                CASISEL_PCE <= CE(0);
            elsif (CASISEL_PREG_CE = "CE1") then
                CASISEL_PCE <= CE(1);
            end if;
        end process;

        process(RESET)
        begin
            if (CASISEL_PREG_RESET = "RESET0") then
                CASISEL_PRESET <= RESET(0);
            elsif (CASISEL_PREG_RESET = "RESET1") then
                CASISEL_PRESET <= RESET(1);
            end if;
        end process;

        --OREG
        process(CLK)
        begin
            if (OREG_CLK = "CLK0") then
                O_CLK <= CLK(0);
            elsif (OREG_CLK = "CLK1") then
                O_CLK <= CLK(1);
            end if;
        end process;

        process(CE)
        begin
            if (OREG_CE = "CE0") then
                O_CE <= CE(0);
            elsif (OREG_CE = "CE1") then
                O_CE <= CE(1);
            end if;
        end process;

        process(RESET)
        begin
            if (OREG_RESET = "RESET0") then
                O_RESET <= RESET(0);
            elsif (OREG_RESET = "RESET1") then
                O_RESET <= RESET(1);
            end if;
        end process;

        --PADD or not
        a_sel_sig <= ASEL when (DYN_A_SEL = "TRUE") else TO_STDULOGIC(A_SEL);
    
        process(A, SIA, a_sel_sig)
        begin
            if(a_sel_sig = '0') then
                a_src <= A;
            else 
                a_src <= SIA;
            end if;
        end process;

        preadd_en <= PSEL when(DYN_P_SEL = "TRUE") else TO_STDULOGIC(P_SEL);
        p_addsub_sig <= PADDSUB when(DYN_P_ADDSUB = "TRUE") else TO_STDULOGIC(P_ADDSUB);

        process(PADDSUB_ICLK, PADDSUB_IRESET, grstn)
        begin
            if (grstn = '0') then
				paddsub_reg0_async <= '0';
			elsif PADDSUB_IRESET = '1' then
				paddsub_reg0_async <= '0';
            elsif (PADDSUB_ICLK'event and PADDSUB_ICLK = '1') then  
                if (PADDSUB_ICE = '1') then
                    paddsub_reg0_async <= p_addsub_sig;
                end if;
            end if;
        end process;

        process (PADDSUB_ICLK, grstn)
		begin
			if (grstn = '0') then
				paddsub_reg0_sync <= '0';
			elsif (PADDSUB_ICLK'event and PADDSUB_ICLK = '1') then
			    if (PADDSUB_IRESET = '1') then
				    paddsub_reg0_sync <= '0';
                elsif (PADDSUB_ICE = '1') then
					paddsub_reg0_sync <= p_addsub_sig;
				end if;
			end if;
		end process;

        process(p_addsub_sig, paddsub_reg0)
        begin
            if (PADDSUB_IREG_CLK = "BYPASS") then
                paddsub_0 <= p_addsub_sig;
            else
                paddsub_0 <= paddsub_reg0;
            end if;
        end process;

        process(PSEL_ICLK, PSEL_IRESET, grstn)
        begin
            if (grstn = '0') then
				psel_reg_async <= '0';
			elsif PSEL_IRESET = '1' then
				psel_reg_async <= '0';
            elsif (PSEL_ICLK'event and PSEL_ICLK = '1') then  
                if (PSEL_ICE = '1') then
                    psel_reg_async <= preadd_en;
                end if;
            end if;
        end process;

        process (PSEL_ICLK, grstn)
		begin
			if (grstn = '0') then
				psel_reg_sync <= '0';
			elsif (PSEL_ICLK'event and PSEL_ICLK = '1') then
			    if (PSEL_IRESET = '1') then
				    psel_reg_sync <= '0';
                elsif (PSEL_ICE = '1') then
					psel_reg_sync <= preadd_en;
				end if;
			end if;
		end process;

        process(preadd_en, psel_reg)
        begin
            if (PSEL_IREG_CLK = "BYPASS") then
                psel_0 <= preadd_en;
            else
                psel_0 <= psel_reg;
            end if;
        end process;

        process(ina, ind)
        begin
            ina_ext(25 downto 0) <= ina(25 downto 0);
            ina_ext(26) <= ina(25);
            ind_ext(25 downto 0) <= ind;
            ind_ext(26) <= ind(25);
            ina_12_ext(10 downto 0) <= ina(10 downto 0);
            ina_12_ext(11) <= ina(10);
            ind_12_ext(10 downto 0) <= ind(10 downto 0);
            ind_12_ext(11) <= ind(10);
        end process;

        process(ina_ext, ind_ext, ina_12_ext, ind_12_ext, ina)
        begin
            if(MULT12X12_EN = "FALSE") then
                if(psel_0 = '1') then
                    if(paddsub_0 = '0') then
                        a_in <= ina_ext + ind_ext;
                    else 
                        a_in <= ina_ext - ind_ext;
                    end if;
                else
                    a_in <= ina;
                end if;
            elsif(MULT12X12_EN = "TRUE") then
                if(psel_0 = '1') then
                    if(paddsub_0 = '0') then
                        a_12_in <= ina_12_ext + ind_12_ext;
                    else
                        a_12_in <= ina_12_ext - ind_12_ext;
                    end if;
                else
                    a_12_in <= ina(11 downto 0);
                end if;
            end if;

        end process;
       
        -- in reg
        process(A_CLK, A_RESET, grstn)
        begin
            if (grstn = '0') then
				ina_reg_async <= (others=>'0');
			elsif A_RESET = '1' then
				ina_reg_async <= (others=>'0');
            elsif (A_CLK'event and A_CLK = '1') then  
                if (A_CE = '1') then
                    ina_reg_async <= a_src;
                end if;
            end if;
        end process;

        process (A_CLK, grstn)
		begin
			if (grstn = '0') then
				ina_reg_sync <= (others=>'0');
			elsif (A_CLK'event and A_CLK = '1') then
			    if (A_RESET = '1') then
				    ina_reg_sync <= (others=>'0');
                elsif (A_CE = '1') then
					ina_reg_sync <= a_src;
				end if;
			end if;
		end process;

        process(a_src, ina_reg)
        begin
            if (AREG_CLK = "BYPASS") then
                ina <= a_src;
            else
                ina <= ina_reg;
            end if;
        end process;

        process(B_CLK, B_RESET, grstn)
        begin
            if (grstn = '0') then
				inb_reg_async <= (others=>'0');
			elsif B_RESET = '1' then
				inb_reg_async <= (others=>'0');
            elsif (B_CLK'event and B_CLK = '1') then  
                if (B_CE = '1') then
                    inb_reg_async <= B;
                end if;
            end if;
        end process;

        process (B_CLK, grstn)
		begin
			if (grstn = '0') then
				inb_reg_sync <= (others=>'0');
			elsif (B_CLK'event and B_CLK = '1') then
			    if (B_RESET = '1') then
				    inb_reg_sync <= (others=>'0');
                elsif (B_CE = '1') then
					inb_reg_sync <= B;
				end if;
			end if;
		end process;

        process(B, inb_reg)
        begin
            if (BREG_CLK = "BYPASS") then
                inb <= B;
            else
                inb <= inb_reg;
            end if;
        end process;

        process(D_CLK, D_RESET, grstn)
        begin
            if (grstn = '0') then
				ind_reg_async <= (others=>'0');
			elsif D_RESET = '1' then
				ind_reg_async <= (others=>'0');
            elsif (D_CLK'event and D_CLK = '1') then  
                if (D_CE = '1') then
                    ind_reg_async <= D;
                end if;
            end if;
        end process;

        process (D_CLK, grstn)
		begin
			if (grstn = '0') then
				ind_reg_sync <= (others=>'0');
			elsif (D_CLK'event and D_CLK = '1') then
			    if (D_RESET = '1') then
				    ind_reg_sync <= (others=>'0');
                elsif (D_CE = '1') then
					ind_reg_sync <= D;
				end if;
			end if;
		end process;

        process(D, ind_reg)
        begin
            if (DREG_CLK = "BYPASS") then
                ind <= D;
            else
                ind <= ind_reg;
            end if;
        end process;

        process(C_ICLK, C_IRESET, grstn)
        begin
            if (grstn = '0') then
				inc_ireg_async <= (others=>'0');
			elsif C_IRESET = '1' then
				inc_ireg_async <= (others=>'0');
            elsif (C_ICLK'event and C_ICLK = '1') then  
                if (C_ICE = '1') then
                    inc_ireg_async <= C;
                end if;
            end if;
        end process;

        process (C_ICLK, grstn)
		begin
			if (grstn = '0') then
				inc_ireg_sync <= (others=>'0');
			elsif (C_ICLK'event and C_ICLK = '1') then
			    if (C_IRESET = '1') then
				    inc_ireg_sync <= (others=>'0');
                elsif (C_ICE = '1') then
					inc_ireg_sync <= C;
				end if;
			end if;
		end process;

        process(C, inc_ireg)
        begin
            if (C_IREG_CLK = "BYPASS") then
                inc_0 <= C;
            else
                inc_0 <= inc_ireg;
            end if;
        end process;

        process(C_PCLK, C_PRESET, grstn)
        begin
            if (grstn = '0') then
				inc_preg_async <= (others=>'0');
			elsif C_PRESET = '1' then
				inc_preg_async <= (others=>'0');
            elsif (C_PCLK'event and C_PCLK = '1') then  
                if (C_PCE = '1') then
                    inc_preg_async <= inc_0;
                end if;
            end if;
        end process;

        process (C_PCLK, grstn)
		begin
			if (grstn = '0') then
				inc_preg_sync <= (others=>'0');
			elsif (C_PCLK'event and C_PCLK = '1') then
			    if (C_PRESET = '1') then
				    inc_preg_sync <= (others=>'0');
                elsif (C_PCE = '1') then
					inc_preg_sync <= inc_0;
				end if;
			end if;
		end process;

        process(inc_0, inc_preg)
        begin
            if (C_PREG_CLK = "BYPASS") then
                inc_1 <= inc_0;
            else
                inc_1 <= inc_preg;
            end if;
        end process;

        accsel_sig <= TO_STDULOGIC(ACC_SEL) when(DYN_ACC_SEL = "FALSE") else ACCSEL;
        casisel_sig <= TO_STDULOGIC(CASI_SEL) when(DYN_CASI_SEL = "FALSE") else CASISEL;
        csel_sig <= TO_STDULOGIC(C_SEL) when(DYN_C_SEL = "FALSE") else CSEL;
    
        addsub0_sig <= TO_STDULOGIC(ADD_SUB_0) when(DYN_ADD_SUB_0 = "FALSE") else ADDSUB(0);
        addsub1_sig <= TO_STDULOGIC(ADD_SUB_1) when(DYN_ADD_SUB_1 = "FALSE") else ADDSUB(1);

        process(accsel_sig)
        begin
            if(accsel_sig = '0') then
                accsel_int <= "01";
            elsif(accsel_sig = '1') then
                accsel_int <= "10";
            end if;
        end process;

        process(ACCSEL_ICLK, ACCSEL_IRESET, grstn)
        begin
            if (grstn = '0') then
				accsel0_reg_async <= '0';
                accsel_int0_reg_async <= "00";
			elsif ACCSEL_IRESET = '1' then
				accsel0_reg_async <= '0';
                accsel_int0_reg_async <= "00";
            elsif (ACCSEL_ICLK'event and ACCSEL_ICLK = '1') then
                if (ACCSEL_ICE = '1') then
                    accsel0_reg_async <= accsel_sig;
                    accsel_int0_reg_async <= accsel_int;
                end if;
            end if;
        end process;

        process (ACCSEL_ICLK, grstn)
		begin
			if (grstn = '0') then
				accsel0_reg_sync <= '0';
                accsel_int0_reg_sync <= "00";
			elsif (ACCSEL_ICLK'event and ACCSEL_ICLK = '1') then
			    if (ACCSEL_IRESET = '1') then
				    accsel0_reg_sync <= '0';
                    accsel_int0_reg_sync <= "00";
                elsif (ACCSEL_ICE = '1') then
					accsel0_reg_sync <= accsel_sig;
                    accsel_int0_reg_sync <= accsel_int;
				end if;
			end if;
		end process;

        process(accsel_sig, accsel0_reg, accsel_int, accsel_int0_reg)
        begin
            if (ACCSEL_IREG_CLK = "BYPASS") then
                accsel_0 <= accsel_sig;
                accsel_int0 <= accsel_int;
            else
                accsel_0 <= accsel0_reg;
                accsel_int0 <= accsel_int0_reg;
            end if;
        end process;

        process(ACCSEL_PCLK, ACCSEL_PRESET, grstn)
        begin
            if (grstn = '0') then
				accsel1_reg_async <= '0';
                accsel_int1_reg_async <= "00";
			elsif ACCSEL_PRESET = '1' then
				accsel1_reg_async <= '0';
                accsel_int1_reg_async <= "00";
            elsif (ACCSEL_PCLK'event and ACCSEL_PCLK = '1') then  
                if (ACCSEL_PCE = '1') then
                    accsel1_reg_async <= accsel_0;
                    accsel_int1_reg_async <= accsel_int0;
                end if;
            end if;
        end process;

        process (ACCSEL_PCLK, grstn)
		begin
			if (grstn = '0') then
				accsel1_reg_sync <= '0';
                accsel_int1_reg_sync <= "00";
			elsif (ACCSEL_PCLK'event and ACCSEL_PCLK = '1') then
			    if (ACCSEL_PRESET = '1') then
				    accsel1_reg_sync <= '0';
                    accsel_int1_reg_sync <= "00";
                elsif (ACCSEL_PCE = '1') then
					accsel1_reg_sync <= accsel_0;
                    accsel_int1_reg_sync <= accsel_int0;
				end if;
			end if;
		end process;

        process(accsel_0, accsel1_reg, accsel_int0, accsel_int1_reg)
        begin
            if (ACCSEL_PREG_CLK = "BYPASS") then
                accsel_1 <= accsel_0;
                accsel_int1 <= accsel_int0;
            else
                accsel_1 <= accsel1_reg;
                accsel_int1 <= accsel_int1_reg;
            end if;
        end process;

        process(CASISEL_ICLK, CASISEL_IRESET, grstn)
        begin
            if (grstn = '0') then
				casisel0_reg_async <= '0';
			elsif CASISEL_IRESET = '1' then
				casisel0_reg_async <= '0';
            elsif (CASISEL_ICLK'event and CASISEL_ICLK = '1') then
                if (CASISEL_ICE = '1') then
                    casisel0_reg_async <= casisel_sig;
                end if;
            end if;
        end process;

        process (CASISEL_ICLK, grstn)
		begin
			if (grstn = '0') then
				casisel0_reg_sync <= '0';
			elsif (CASISEL_ICLK'event and CASISEL_ICLK = '1') then
			    if (CASISEL_IRESET = '1') then
				    casisel0_reg_sync <= '0';
                elsif (CASISEL_ICE = '1') then
					casisel0_reg_sync <= casisel_sig;
				end if;
			end if;
		end process;

        process(casisel_sig, casisel0_reg)
        begin
            if (CASISEL_IREG_CLK = "BYPASS") then
                casisel_0 <= casisel_sig;
            else
                casisel_0 <= casisel0_reg;
            end if;
        end process;

        process(CASISEL_PCLK, CASISEL_PRESET, grstn)
        begin
            if (grstn = '0') then
				casisel1_reg_async <= '0';
			elsif CASISEL_PRESET = '1' then
				casisel1_reg_async <= '0';
            elsif (CASISEL_PCLK'event and CASISEL_PCLK = '1') then  
                if (CASISEL_PCE = '1') then
                    casisel1_reg_async <= casisel_0;
                end if;
            end if;
        end process;

        process (CASISEL_PCLK, grstn)
		begin
			if (grstn = '0') then
				casisel1_reg_sync <= '0';
			elsif (CASISEL_PCLK'event and CASISEL_PCLK = '1') then
			    if (CASISEL_PRESET = '1') then
				    casisel1_reg_sync <= '0';
                elsif (CASISEL_PCE = '1') then
					casisel1_reg_sync <= casisel_0;
				end if;
			end if;
		end process;

        process(casisel_0, casisel1_reg)
        begin
            if (CASISEL_PREG_CLK = "BYPASS") then
                casisel_1 <= casisel_0;
            else
                casisel_1 <= casisel1_reg;
            end if;
        end process;

        process(CSEL_ICLK, CSEL_IRESET, grstn)
        begin
            if (grstn = '0') then
				csel0_reg_async <= '0';
			elsif CSEL_IRESET = '1' then
				csel0_reg_async <= '0';
            elsif (CSEL_ICLK'event and CSEL_ICLK = '1') then
                if (CSEL_ICE = '1') then
                    csel0_reg_async <= csel_sig;
                end if;
            end if;
        end process;

        process (CSEL_ICLK, grstn)
		begin
			if (grstn = '0') then
				csel0_reg_sync <= '0';
			elsif (CSEL_ICLK'event and CSEL_ICLK = '1') then
			    if (CSEL_IRESET = '1') then
				    csel0_reg_sync <= '0';
                elsif (CSEL_ICE = '1') then
					csel0_reg_sync <= csel_sig;
				end if;
			end if;
		end process;

        process(csel_sig, csel0_reg)
        begin
            if (CSEL_IREG_CLK = "BYPASS") then
                csel_0 <= csel_sig;
            else
                csel_0 <= csel0_reg;
            end if;
        end process;

        process(CSEL_PCLK, CSEL_PRESET, grstn)
        begin
            if (grstn = '0') then
				csel1_reg_async <= '0';
			elsif CSEL_PRESET = '1' then
				csel1_reg_async <= '0';
            elsif (CSEL_PCLK'event and CSEL_PCLK = '1') then  
                if (CSEL_PCE = '1') then
                    csel1_reg_async <= csel_0;
                end if;
            end if;
        end process;

        process (CASISEL_PCLK, grstn)
		begin
			if (grstn = '0') then
				csel1_reg_sync <= '0';
			elsif (CSEL_PCLK'event and CSEL_PCLK = '1') then
			    if (CSEL_PRESET = '1') then
				    csel1_reg_sync <= '0';
                elsif (CSEL_PCE = '1') then
					csel1_reg_sync <= csel_0;
				end if;
			end if;
		end process;

        process(csel_0, csel1_reg)
        begin
            if (CSEL_PREG_CLK = "BYPASS") then
                csel_1 <= csel_0;
            else
                csel_1 <= csel1_reg;
            end if;
        end process;


        process(ADDSUB0_ICLK, ADDSUB0_IRESET, grstn)
        begin
            if (grstn = '0') then
				addsub0_reg0_async <= '0';
			elsif ADDSUB0_IRESET = '1' then
				addsub0_reg0_async <= '0';
            elsif (ADDSUB0_ICLK'event and ADDSUB0_ICLK = '1') then  
                if (ADDSUB0_ICE = '1') then
                    addsub0_reg0_async <= addsub0_sig;
                end if;
            end if;
        end process;

        process (ADDSUB0_ICLK, grstn)
		begin
			if (grstn = '0') then
				addsub0_reg0_sync <= '0';
			elsif (ADDSUB0_ICLK'event and ADDSUB0_ICLK = '1') then
			    if (ADDSUB0_IRESET = '1') then
				    addsub0_reg0_sync <= '0';
                elsif (ADDSUB0_ICE = '1') then
					addsub0_reg0_sync <= addsub0_sig;
				end if;
			end if;
		end process;

        process(addsub0_sig, addsub0_reg0)
        begin
            if (ADDSUB0_IREG_CLK = "BYPASS") then
                addsub0_0 <= addsub0_sig;
            else
                addsub0_0 <= addsub0_reg0;
            end if;
        end process;

        process(ADDSUB0_PCLK, ADDSUB0_PRESET, grstn)
        begin
            if (grstn = '0') then
				addsub0_reg1_async <= '0';
			elsif ADDSUB0_PRESET = '1' then
				addsub0_reg1_async <= '0';
            elsif (ADDSUB0_PCLK'event and ADDSUB0_PCLK = '1') then  
                if (ADDSUB0_PCE = '1') then
                    addsub0_reg1_async <= addsub0_0;
                end if;
            end if;
        end process;

        process (ADDSUB0_PCLK, grstn)
		begin
			if (grstn = '0') then
				addsub0_reg1_sync <= '0';
			elsif (ADDSUB0_PCLK'event and ADDSUB0_PCLK = '1') then
			    if (ADDSUB0_PRESET = '1') then
				    addsub0_reg1_sync <= '0';
                elsif (ADDSUB0_PCE = '1') then
					addsub0_reg1_sync <= addsub0_0;
				end if;
			end if;
		end process;

        process(addsub0_0, addsub0_reg1)
        begin
            if (ADDSUB0_PREG_CLK = "BYPASS") then
                addsub0_1 <= addsub0_0;
            else
                addsub0_1 <= addsub0_reg1;
            end if;
        end process;

        process(ADDSUB1_ICLK, ADDSUB1_IRESET, grstn)
        begin
            if (grstn = '0') then
				addsub1_reg0_async <= '0';
			elsif ADDSUB1_IRESET = '1' then
				addsub1_reg0_async <= '0';
            elsif (ADDSUB1_ICLK'event and ADDSUB1_ICLK = '1') then  
                if (ADDSUB1_ICE = '1') then
                    addsub1_reg0_async <= addsub1_sig;
                end if;
            end if;
        end process;

        process (ADDSUB1_ICLK, grstn)
		begin
			if (grstn = '0') then
				addsub1_reg0_sync <= '0';
			elsif (ADDSUB1_ICLK'event and ADDSUB1_ICLK = '1') then
			    if (ADDSUB1_IRESET = '1') then
				    addsub1_reg0_sync <= '0';
                elsif (ADDSUB1_ICE = '1') then
					addsub1_reg0_sync <= addsub1_sig;
				end if;
			end if;
		end process;

        process(addsub1_sig, addsub1_reg0)
        begin
            if (ADDSUB1_IREG_CLK = "BYPASS") then
                addsub1_0 <= addsub1_sig;
            else
                addsub1_0 <= addsub1_reg0;
            end if;
        end process;

        process(ADDSUB1_PCLK, ADDSUB1_PRESET, grstn)
        begin
            if (grstn = '0') then
				addsub1_reg1_async <= '0';
			elsif ADDSUB1_PRESET = '1' then
				addsub1_reg1_async <= '0';
            elsif (ADDSUB1_PCLK'event and ADDSUB1_PCLK = '1') then  
                if (ADDSUB1_PCE = '1') then
                    addsub1_reg1_async <= addsub1_0;
                end if;
            end if;
        end process;

        process (ADDSUB1_PCLK, grstn)
		begin
			if (grstn = '0') then
				addsub1_reg1_sync <= '0';
			elsif (ADDSUB1_PCLK'event and ADDSUB1_PCLK = '1') then
			    if (ADDSUB1_PRESET = '1') then
				    addsub1_reg1_sync <= '0';
                elsif (ADDSUB1_PCE = '1') then
					addsub1_reg1_sync <= addsub1_0;
				end if;
			end if;
		end process;

        process(addsub1_0, addsub1_reg1)
        begin
            if (ADDSUB1_PREG_CLK = "BYPASS") then
                addsub1_1 <= addsub1_0;
            else
                addsub1_1 <= addsub1_reg1;
            end if;
        end process;


        process(a_in, inb)
        begin
            if(MULT12X12_EN = "FALSE") then
                a0(26 downto 0) <= a_in;
                a0(44 downto 27) <= (others => a_in(26));
                b0(17 downto 0) <= inb;
                b0(44 downto 18) <= (others => inb(17));
            else
                a0(11 downto 0) <= a_in(11 downto 0);
                a0(44 downto 12) <= (others => a_in(11));
                b0(11 downto 0) <= inb(11 downto 0);
                b0(44 downto 12) <= (others => inb(11));
            end if;
        end process;

        mult_out_ext <= a0 * b0;
        mult_out <= mult_out_ext(44 downto 0);

        --pipeline reg
        process(P_CLK, P_RESET, grstn)
        begin
            if (grstn = '0') then
				out0_reg_async <= (others=>'0');
			elsif P_RESET = '1' then
				out0_reg_async <= (others=>'0');
            elsif (P_CLK'event and P_CLK = '1') then
                if (P_CE = '1') then
                    out0_reg_async <= mult_out;
                end if;
            end if;
        end process;

        process (P_CLK, grstn)
		begin
			if (grstn = '0') then
				out0_reg_sync <= (others=>'0');
			elsif (P_CLK'event and P_CLK = '1') then
			    if (P_RESET = '1') then
				    out0_reg_sync <= (others=>'0');
                elsif (P_CE = '1') then
					out0_reg_sync <= mult_out;
				end if;
			end if;
		end process;

        process(O_CLK, O_RESET, grstn)
        begin
            if (grstn = '0') then
				out_preg_async <= (others=>'0');
			elsif O_RESET = '1' then
				out_preg_async <= (others=>'0');
            elsif (O_CLK'event and O_CLK = '1') then  
                if (O_CE = '1') then
                    out_preg_async <= d_out;
                end if;
            end if;
        end process;

        process (O_CLK, grstn)
		begin
			if (grstn = '0') then
				out_preg_sync <= (others=>'0');
			elsif (O_CLK'event and O_CLK = '1') then
			    if (O_RESET = '1') then
				    out_preg_sync <= (others=>'0');
                elsif (O_CE = '1') then
					out_preg_sync <= d_out;
				end if;
			end if;
		end process;

        process(mult_out, out0_reg)
        begin
            if (PREG_CLK = "BYPASS") then
                out0 <= mult_out;
            else
                out0 <= out0_reg;
            end if;
        end process;

        process(d_out, out_preg)
        begin
            if (FB_PREG_EN = "FALSE") then
                dout_reg <= d_out;
            else
                dout_reg <= out_preg;
            end if;
        end process;

        process(out0)
        begin
            m_out0(44 downto 0) <= out0;
            m_out0(47 downto 45) <= (others => out0(44));
        end process;

        process(dout_reg, accsel_1, accsel_int1)
        begin
            if(accsel_int1 = "10" or accsel_int1 = "11") then
                acc_load <= dout_reg(47 downto 0);
            elsif(accsel_int1 = "01") then
                acc_load <= TO_STDLOGICVECTOR(PRE_LOAD);
            else
                acc_load <= (others=>'0');
            end if;
        end process;

        d_casi <= CASI when(casisel_1 = '1') else (others=>'0');
        c_sig <= inc_1 when(csel_1 = '1') else (others=>'0');

        process(acc_load, m_out0, d_casi, c_sig, addsub0_1,addsub1_1)
        begin
            if(addsub0_1 = '0' and addsub1_1 = '0') then
                alu_out <= acc_load + m_out0 + c_sig + d_casi;
            elsif(addsub0_1 = '0' and addsub1_1 = '1') then
                alu_out <= acc_load + m_out0 - c_sig + d_casi;
            elsif(addsub0_1 = '1' and addsub1_1 = '0') then
                alu_out <= acc_load - m_out0 + c_sig + d_casi;
            elsif(addsub0_1 = '1' and addsub1_1 = '1') then
                alu_out <= acc_load - m_out0 - c_sig + d_casi;
            end if;
        end process;

        --SOA
        process(A_CLK, A_RESET, grstn)
        begin
            if (grstn = '0') then
				ina_preg_async <= (others=>'0');
			elsif A_RESET = '1' then
				ina_preg_async <= (others=>'0');
            elsif (A_CLK'event and A_CLK = '1') then  
                if (A_CE = '1') then
                    ina_preg_async <= ina;
                end if;
            end if;
        end process;

        process (A_CLK, grstn)
		begin
			if (grstn = '0') then
				ina_preg_sync <= (others=>'0');
			elsif (A_CLK'event and A_CLK = '1') then
			    if (A_RESET = '1') then
				    ina_preg_sync <= (others=>'0');
                elsif (A_CE = '1') then
					ina_preg_sync <= ina;
				end if;
			end if;
		end process;

        process(ina, ina_preg)
        begin
            if (SOA_PREG_EN = "FALSE") then
                SOA <= ina;
            else
                SOA <= ina_preg;
            end if;
        end process;

        -- output reg
        process(O_CLK, O_RESET, grstn)
        begin
            if (grstn = '0') then
				out_reg_async <= (others=>'0');
			elsif O_RESET = '1' then
				out_reg_async <= (others=>'0');
            elsif (O_CLK'event and O_CLK = '1') then
                if (O_CE = '1') then
                    out_reg_async <= alu_out;
                end if;
            end if;
        end process;

        process (O_CLK, grstn)
		begin
			if (grstn = '0') then
				out_reg_sync <= (others=>'0');
			elsif (O_CLK'event and O_CLK = '1') then
			    if (O_RESET = '1') then
				    out_reg_sync <= (others=>'0');
                elsif (O_CE = '1') then
					out_reg_sync <= alu_out;
				end if;
			end if;
		end process;

        process(alu_out, out_reg)
        begin
            if (OREG_CLK = "BYPASS") then
                d_out <= alu_out;
            else
                d_out <= out_reg;
            end if;
        end process;

        DOUT <= d_out(47 downto 0);
        CASO <= d_out(47 downto 0);

end Behavioral;

-----------------MULT12X12---------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.glb.GSRO;

entity MULT12X12 is
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
end MULT12X12;

architecture Behavioral of MULT12X12 is
    signal ina_reg_async,ina_reg_sync,ina,ina_reg,inb_reg_async,inb_reg_sync,inb,inb_reg : std_logic_vector(11 downto 0);
    signal A_CLK,A_CE,A_RESET,B_CLK,B_CE,B_RESET,P_CLK,P_CE,P_RESET,O_CLK,O_CE,O_RESET : std_logic;
    signal a0,b0,mult_out0,out0_reg_async,out0_reg_sync,out0,out0_reg,m_out0 : std_logic_vector(23 downto 0);
    signal mult_out0_ext : std_logic_vector(47 downto 0);
    signal out_reg_async,out_reg_sync,out_reg,d_out : std_logic_vector(23 downto 0);
    signal grstn : std_logic;

    begin
		grstn <= GSRO;

        process(ina_reg_async, ina_reg_sync, inb_reg_async, inb_reg_sync, out0_reg_async, out0_reg_sync, out_reg_sync, out_reg_async)
    begin
            if (MULT_RESET_MODE = "ASYNC") then
                ina_reg <= ina_reg_async;
                inb_reg <= inb_reg_async;
                out0_reg <= out0_reg_async;
                out_reg <= out_reg_async;
            elsif (MULT_RESET_MODE = "SYNC") then
                ina_reg <= ina_reg_sync;
                inb_reg <= inb_reg_sync;
                out0_reg <= out0_reg_sync;
                out_reg <= out_reg_sync;
            end if;
        end process;

        --clk,ce,reset mux
        --AREG
        process(CLK)
        begin
            if (AREG_CLK = "CLK0") then
                A_CLK <= CLK(0);
            elsif (AREG_CLK = "CLK1") then
                A_CLK <= CLK(1);
            end if;
        end process;

        process(CE)
        begin
            if (AREG_CE = "CE0") then
                A_CE <= CE(0);
            elsif (AREG_CE = "CE1") then
                A_CE <= CE(1);
            end if;
        end process;

        process(RESET)
        begin
            if (AREG_RESET = "RESET0") then
                A_RESET <= RESET(0);
            elsif (AREG_RESET = "RESET1") then
                A_RESET <= RESET(1);
            end if;
        end process;

        --BREG
        process(CLK)
        begin
            if (BREG_CLK = "CLK0") then
                B_CLK <= CLK(0);
            elsif (BREG_CLK = "CLK1") then
                B_CLK <= CLK(1);
            end if;
        end process;

        process(CE)
        begin
            if (BREG_CE = "CE0") then
                B_CE <= CE(0);
            elsif (BREG_CE = "CE1") then
                B_CE <= CE(1);
            end if;
        end process;

        process(RESET)
        begin
            if (BREG_RESET = "RESET0") then
                B_RESET <= RESET(0);
            elsif (BREG_RESET = "RESET1") then
                B_RESET <= RESET(1);
            end if;
        end process;

        --PREG
        process(CLK)
        begin
            if (PREG_CLK = "CLK0") then
                P_CLK <= CLK(0);
            elsif (PREG_CLK = "CLK1") then
                P_CLK <= CLK(1);
            end if;
        end process;

        process(CE)
        begin
            if (PREG_CE = "CE0") then
                P_CE <= CE(0);
            elsif (PREG_CE = "CE1") then
                P_CE <= CE(1);
            end if;
        end process;

        process(RESET)
        begin
            if (PREG_RESET = "RESET0") then
                P_RESET <= RESET(0);
            elsif (PREG_RESET = "RESET1") then
                P_RESET <= RESET(1);
            end if;
        end process;

        --OREG
        process(CLK)
        begin
            if (OREG_CLK = "CLK0") then
                O_CLK <= CLK(0);
            elsif (OREG_CLK = "CLK1") then
                O_CLK <= CLK(1);
            end if;
        end process;

        process(CE)
        begin
            if (OREG_CE = "CE0") then
                O_CE <= CE(0);
            elsif (OREG_CE = "CE1") then
                O_CE <= CE(1);
            end if;
        end process;

        process(RESET)
        begin
            if (OREG_RESET = "RESET0") then
                O_RESET <= RESET(0);
            elsif (OREG_RESET = "RESET1") then
                O_RESET <= RESET(1);
            end if;
        end process;

        -- in reg
        process(A_CLK, A_RESET, grstn)
        begin
            if (grstn = '0') then
				ina_reg_async <= (others=>'0');
			elsif A_RESET = '1' then
				ina_reg_async <= (others=>'0');
            elsif (A_CLK'event and A_CLK = '1') then  
                if (A_CE = '1') then
                    ina_reg_async <= A;
                end if;
            end if;
        end process;

        process (A_CLK, grstn)
		begin
			if (grstn = '0') then
				ina_reg_sync <= (others=>'0');
			elsif (A_CLK'event and A_CLK = '1') then
			    if (A_RESET = '1') then
				    ina_reg_sync <= (others=>'0');
                elsif (A_CE = '1') then
					ina_reg_sync <= A;
				end if;
			end if;
		end process;

        process(A, ina_reg)
        begin
            if (AREG_CLK = "BYPASS") then
                ina <= A;
            else
                ina <= ina_reg;
            end if;
        end process;

        process(B_CLK, B_RESET, grstn)
        begin
            if (grstn = '0') then
				inb_reg_async <= (others=>'0');
			elsif B_RESET = '1' then
				inb_reg_async <= (others=>'0');
            elsif (B_CLK'event and B_CLK = '1') then  
                if (B_CE = '1') then
                    inb_reg_async <= B;
                end if;
            end if;
        end process;

        process (B_CLK, grstn)
		begin
			if (grstn = '0') then
				inb_reg_sync <= (others=>'0');
			elsif (B_CLK'event and B_CLK = '1') then
			    if (B_RESET = '1') then
				    inb_reg_sync <= (others=>'0');
                elsif (B_CE = '1') then
					inb_reg_sync <= B;
				end if;
			end if;
		end process;

        process(B, inb_reg)
        begin
            if (BREG_CLK = "BYPASS") then
                inb <= B;
            else
                inb <= inb_reg;
            end if;
        end process;

        process(ina, inb)
        begin
            a0(11 downto 0) <= ina;
            a0(23 downto 12) <= (others => ina(11));
            b0(11 downto 0) <= inb;
            b0(23 downto 12) <= (others => inb(11));
        end process;

        mult_out0_ext <= a0 * b0;
        mult_out0 <= mult_out0_ext(23 downto 0);

        --pipeline reg
        process(P_CLK, P_RESET, grstn)
        begin
            if (grstn = '0') then
				out0_reg_async <= (others=>'0');
			elsif P_RESET = '1' then
				out0_reg_async <= (others=>'0');
            elsif (P_CLK'event and P_CLK = '1') then
                if (P_CE = '1') then
                    out0_reg_async <= mult_out0;
                end if;
            end if;
        end process;

        process (P_CLK, grstn)
		begin
			if (grstn = '0') then
				out0_reg_sync <= (others=>'0');
			elsif (P_CLK'event and P_CLK = '1') then
			    if (P_RESET = '1') then
				    out0_reg_sync <= (others=>'0');
                elsif (P_CE = '1') then
					out0_reg_sync <= mult_out0;
				end if;
			end if;
		end process;

        process(mult_out0, out0_reg)
        begin
            if (PREG_CLK = "BYPASS") then
                out0 <= mult_out0;
            else
                out0 <= out0_reg;
            end if;
        end process;

        -- output reg
        process(O_CLK, O_RESET, grstn)
        begin
            if (grstn = '0') then
				out_reg_async <= (others=>'0');
			elsif O_RESET = '1' then
				out_reg_async <= (others=>'0');
            elsif (O_CLK'event and O_CLK = '1') then  
                if (O_CE = '1') then
                    out_reg_async <= out0;
                end if;
            end if;
        end process;

        process (O_CLK, grstn)
		begin
			if (grstn = '0') then
				out_reg_sync <= (others=>'0');
			elsif (O_CLK'event and O_CLK = '1') then
			    if (O_RESET = '1') then
				    out_reg_sync <= (others=>'0');
                elsif (O_CE = '1') then
					out_reg_sync <= out0;
				end if;
			end if;
		end process;

        process(out0, out_reg)
        begin
            if (OREG_CLK = "BYPASS") then
                d_out <= out0;
            else
                d_out <= out_reg;
            end if;
        end process;

        DOUT <= d_out(23 downto 0);

end Behavioral;


-----------------MULT27X36---------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.glb.GSRO;

entity MULT27X36 is
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
end MULT27X36;

architecture Behavioral of MULT27X36 is
    signal A_CLK,A_CE,A_RESET,B_CLK,B_CE,B_RESET,D_CLK,D_CE,D_RESET,PADDSUB_ICLK,PADDSUB_ICE,PADDSUB_IRESET,PSEL_ICLK,PSEL_ICE,PSEL_IRESET,P_CLK,P_CE,P_RESET,O_CLK,O_CE,O_RESET : std_logic;
    signal ina_reg_async,ina_reg_sync,ina,ina_reg,a_in: std_logic_vector(26 downto 0);
    signal inb_reg_async,inb_reg_sync,inb,inb_reg : std_logic_vector(35 downto 0);
    signal ind_reg_async,ind_reg_sync,ind,ind_reg : std_logic_vector(25 downto 0);
    signal ina_ext,ind_ext : std_logic_vector(26 downto 0);
    signal paddsub_reg0_async,paddsub_reg0_sync,paddsub_reg0,paddsub_0 : std_logic;
    signal psel_reg_async,psel_reg_sync,psel_reg,psel_0 : std_logic;

    signal a0,b0,mult_out0,out0_reg_async,out0_reg_sync,out0,out0_reg : std_logic_vector(62 downto 0);
    signal mult_out0_ext : std_logic_vector(125 downto 0);
    signal out_reg_async,out_reg_sync,out_reg,d_out : std_logic_vector(62 downto 0);
    signal preadd_en,p_addsub_sig : std_logic;
    signal grstn : std_logic;

    begin
		grstn <= GSRO;

        process(ina_reg_async, ina_reg_sync, inb_reg_async, inb_reg_sync, ind_reg_async, ind_reg_sync, paddsub_reg0_async, paddsub_reg0_sync, psel_reg_async, psel_reg_sync, out0_reg_async, out0_reg_sync, out_reg_sync, out_reg_async)
    begin
            if (MULT_RESET_MODE = "ASYNC") then
                ina_reg <= ina_reg_async;
                inb_reg <= inb_reg_async;
                ind_reg <= ind_reg_async;
                paddsub_reg0 <= paddsub_reg0_async;
                psel_reg <= psel_reg_async;
                out0_reg <= out0_reg_async;
                out_reg <= out_reg_async;
            elsif (MULT_RESET_MODE = "SYNC") then
                ina_reg <= ina_reg_sync;
                inb_reg <= inb_reg_sync;
                ind_reg <= ind_reg_sync;
                paddsub_reg0 <= paddsub_reg0_sync;
                psel_reg <= psel_reg_sync;
                out0_reg <= out0_reg_sync;
                out_reg <= out_reg_sync;
            end if;
        end process;

        --clk,ce,reset mux
        --AREG
        process(CLK)
        begin
            if (AREG_CLK = "CLK0") then
                A_CLK <= CLK(0);
            elsif (AREG_CLK = "CLK1") then
                A_CLK <= CLK(1);
            end if;
        end process;

        process(CE)
        begin
            if (AREG_CE = "CE0") then
                A_CE <= CE(0);
            elsif (AREG_CE = "CE1") then
                A_CE <= CE(1);
            end if;
        end process;

        process(RESET)
        begin
            if (AREG_RESET = "RESET0") then
                A_RESET <= RESET(0);
            elsif (AREG_RESET = "RESET1") then
                A_RESET <= RESET(1);
            end if;
        end process;

        --BREG
        process(CLK)
        begin
            if (BREG_CLK = "CLK0") then
                B_CLK <= CLK(0);
            elsif (BREG_CLK = "CLK1") then
                B_CLK <= CLK(1);
            end if;
        end process;

        process(CE)
        begin
            if (BREG_CE = "CE0") then
                B_CE <= CE(0);
            elsif (BREG_CE = "CE1") then
                B_CE <= CE(1);
            end if;
        end process;

        process(RESET)
        begin
            if (BREG_RESET = "RESET0") then
                B_RESET <= RESET(0);
            elsif (BREG_RESET = "RESET1") then
                B_RESET <= RESET(1);
            end if;
        end process;

        --DREG
        process(CLK)
        begin
            if (DREG_CLK = "CLK0") then
                D_CLK <= CLK(0);
            elsif (DREG_CLK = "CLK1") then
                D_CLK <= CLK(1);
            end if;
        end process;

        process(CE)
        begin
            if (DREG_CE = "CE0") then
                D_CE <= CE(0);
            elsif (DREG_CE = "CE1") then
                D_CE <= CE(1);
            end if;
        end process;

        process(RESET)
        begin
            if (DREG_RESET = "RESET0") then
                D_RESET <= RESET(0);
            elsif (DREG_RESET = "RESET1") then
                D_RESET <= RESET(1);
            end if;
        end process;

        --PADDSUB_IREG
        process(CLK)
        begin
            if (PADDSUB_IREG_CLK = "CLK0") then
                PADDSUB_ICLK <= CLK(0);
            elsif (PADDSUB_IREG_CLK = "CLK1") then
                PADDSUB_ICLK <= CLK(1);
            end if;
        end process;

        process(CE)
        begin
            if (PADDSUB_IREG_CE = "CE0") then
                PADDSUB_ICE <= CE(0);
            elsif (PADDSUB_IREG_CE = "CE1") then
                PADDSUB_ICE <= CE(1);
            end if;
        end process;

        process(RESET)
        begin
            if (PADDSUB_IREG_RESET = "RESET0") then
                PADDSUB_IRESET <= RESET(0);
            elsif (PADDSUB_IREG_RESET = "RESET1") then
                PADDSUB_IRESET <= RESET(1);
            end if;
        end process;

        --PSEL_IREG
        process(CLK)
        begin
            if (PSEL_IREG_CLK = "CLK0") then
                PSEL_ICLK <= CLK(0);
            elsif (PSEL_IREG_CLK = "CLK1") then
                PSEL_ICLK <= CLK(1);
            end if;
        end process;

        process(CE)
        begin
            if (PSEL_IREG_CE = "CE0") then
                PSEL_ICE <= CE(0);
            elsif (PSEL_IREG_CE = "CE1") then
                PSEL_ICE <= CE(1);
            end if;
        end process;

        process(RESET)
        begin
            if (PSEL_IREG_RESET = "RESET0") then
                PSEL_IRESET <= RESET(0);
            elsif (PSEL_IREG_RESET = "RESET1") then
                PSEL_IRESET <= RESET(1);
            end if;
        end process;

        --PREG
        process(CLK)
        begin
            if (PREG_CLK = "CLK0") then
                P_CLK <= CLK(0);
            elsif (PREG_CLK = "CLK1") then
                P_CLK <= CLK(1);
            end if;
        end process;

        process(CE)
        begin
            if (PREG_CE = "CE0") then
                P_CE <= CE(0);
            elsif (PREG_CE = "CE1") then
                P_CE <= CE(1);
            end if;
        end process;

        process(RESET)
        begin
            if (PREG_RESET = "RESET0") then
                P_RESET <= RESET(0);
            elsif (PREG_RESET = "RESET1") then
                P_RESET <= RESET(1);
            end if;
        end process;

        --OREG
        process(CLK)
        begin
            if (OREG_CLK = "CLK0") then
                O_CLK <= CLK(0);
            elsif (OREG_CLK = "CLK1") then
                O_CLK <= CLK(1);
            end if;
        end process;

        process(CE)
        begin
            if (OREG_CE = "CE0") then
                O_CE <= CE(0);
            elsif (OREG_CE = "CE1") then
                O_CE <= CE(1);
            end if;
        end process;

        process(RESET)
        begin
            if (OREG_RESET = "RESET0") then
                O_RESET <= RESET(0);
            elsif (OREG_RESET = "RESET1") then
                O_RESET <= RESET(1);
            end if;
        end process;

        -- in reg
        process(A_CLK, A_RESET, grstn)
        begin
            if (grstn = '0') then
				ina_reg_async <= (others=>'0');
			elsif A_RESET = '1' then
				ina_reg_async <= (others=>'0');
            elsif (A_CLK'event and A_CLK = '1') then  
                if (A_CE = '1') then
                    ina_reg_async <= A;
                end if;
            end if;
        end process;

        process (A_CLK, grstn)
		begin
			if (grstn = '0') then
				ina_reg_sync <= (others=>'0');
			elsif (A_CLK'event and A_CLK = '1') then
			    if (A_RESET = '1') then
				    ina_reg_sync <= (others=>'0');
                elsif (A_CE = '1') then
					ina_reg_sync <= A;
				end if;
			end if;
		end process;

        process(A, ina_reg)
        begin
            if (AREG_CLK = "BYPASS") then
                ina <= A;
            else
                ina <= ina_reg;
            end if;
        end process;

        process(B_CLK, B_RESET, grstn)
        begin
            if (grstn = '0') then
				inb_reg_async <= (others=>'0');
			elsif B_RESET = '1' then
				inb_reg_async <= (others=>'0');
            elsif (B_CLK'event and B_CLK = '1') then  
                if (B_CE = '1') then
                    inb_reg_async <= B;
                end if;
            end if;
        end process;

        process (B_CLK, grstn)
		begin
			if (grstn = '0') then
				inb_reg_sync <= (others=>'0');
			elsif (B_CLK'event and B_CLK = '1') then
			    if (B_RESET = '1') then
				    inb_reg_sync <= (others=>'0');
                elsif (B_CE = '1') then
					inb_reg_sync <= B;
				end if;
			end if;
		end process;

        process(B, inb_reg)
        begin
            if (BREG_CLK = "BYPASS") then
                inb <= B;
            else
                inb <= inb_reg;
            end if;
        end process;

        process(D_CLK, D_RESET, grstn)
        begin
            if (grstn = '0') then
				ind_reg_async <= (others=>'0');
			elsif D_RESET = '1' then
				ind_reg_async <= (others=>'0');
            elsif (D_CLK'event and D_CLK = '1') then  
                if (D_CE = '1') then
                    ind_reg_async <= D;
                end if;
            end if;
        end process;

        process (D_CLK, grstn)
		begin
			if (grstn = '0') then
				ind_reg_sync <= (others=>'0');
			elsif (D_CLK'event and D_CLK = '1') then
			    if (D_RESET = '1') then
				    ind_reg_sync <= (others=>'0');
                elsif (D_CE = '1') then
					ind_reg_sync <= D;
				end if;
			end if;
		end process;

        process(D, ind_reg)
        begin
            if (DREG_CLK = "BYPASS") then
                ind <= D;
            else
                ind <= ind_reg;
            end if;
        end process;

        --PADD or not
        process(ina, ind)
        begin
            ina_ext(25 downto 0) <= ina(25 downto 0);
            ina_ext(26) <= ina(25);
            ind_ext(25 downto 0) <= ind;
            ind_ext(26) <= ind(25);
        end process;

        preadd_en <= PSEL when(DYN_P_SEL = "TRUE") else '1' when (P_SEL = '1') else '0';
        p_addsub_sig <= PADDSUB when (DYN_P_ADDSUB = "TRUE") else To_StdULogic(P_ADDSUB);

        process(PADDSUB_ICLK, PADDSUB_IRESET, grstn)
        begin
            if (grstn = '0') then
				paddsub_reg0_async <= '0';
			elsif PADDSUB_IRESET = '1' then
				paddsub_reg0_async <= '0';
            elsif (PADDSUB_ICLK'event and PADDSUB_ICLK = '1') then  
                if (PADDSUB_ICE = '1') then
                    paddsub_reg0_async <= p_addsub_sig;
                end if;
            end if;
        end process;

        process (PADDSUB_ICLK, grstn)
		begin
			if (grstn = '0') then
				paddsub_reg0_sync <= '0';
			elsif (PADDSUB_ICLK'event and PADDSUB_ICLK = '1') then
			    if (PADDSUB_IRESET = '1') then
				    paddsub_reg0_sync <= '0';
                elsif (PADDSUB_ICE = '1') then
					paddsub_reg0_sync <= p_addsub_sig;
				end if;
			end if;
		end process;

        process(p_addsub_sig, paddsub_reg0)
        begin
            if (PADDSUB_IREG_CLK = "BYPASS") then
                paddsub_0 <= p_addsub_sig;
            else
                paddsub_0 <= paddsub_reg0;
            end if;
        end process;

        process(PSEL_ICLK, PSEL_IRESET, grstn)
        begin
            if (grstn = '0') then
				psel_reg_async <= '0';
			elsif PSEL_IRESET = '1' then
				psel_reg_async <= '0';
            elsif (PSEL_ICLK'event and PSEL_ICLK = '1') then  
                if (PSEL_ICE = '1') then
                    psel_reg_async <= preadd_en;
                end if;
            end if;
        end process;

        process (PSEL_ICLK, grstn)
		begin
			if (grstn = '0') then
				psel_reg_sync <= '0';
			elsif (PSEL_ICLK'event and PSEL_ICLK = '1') then
			    if (PSEL_IRESET = '1') then
				    psel_reg_sync <= '0';
                elsif (PSEL_ICE = '1') then
					psel_reg_sync <= preadd_en;
				end if;
			end if;
		end process;

        process(preadd_en, psel_reg)
        begin
            if (PSEL_IREG_CLK = "BYPASS") then
                psel_0 <= preadd_en;
            else
                psel_0 <= psel_reg;
            end if;
        end process;

        process(ina_ext, ind_ext, ina, psel_0, paddsub_0)
        begin
            if(psel_0 = '1') then
                if(paddsub_0 = '0') then
                    a_in <= ina_ext + ind_ext;
                else
                    a_in <= ina_ext - ind_ext;
                end if;
            else
                a_in <= ina;
            end if;
        end process;

        process(a_in, inb)
        begin
            a0(26 downto 0) <= a_in;
            a0(62 downto 27) <= (others => a_in(26));
            b0(35 downto 0) <= inb;
            b0(62 downto 36) <= (others => inb(35));
        end process;

        mult_out0_ext <= a0 * b0;
        mult_out0 <= mult_out0_ext(62 downto 0);

        --pipeline reg
        process(P_CLK, P_RESET, grstn)
        begin
            if (grstn = '0') then
				out0_reg_async <= (others=>'0');
			elsif P_RESET = '1' then
				out0_reg_async <= (others=>'0');
            elsif (P_CLK'event and P_CLK = '1') then
                if (P_CE = '1') then
                    out0_reg_async <= mult_out0;
                end if;
            end if;
        end process;

        process (P_CLK, grstn)
		begin
			if (grstn = '0') then
				out0_reg_sync <= (others=>'0');
			elsif (P_CLK'event and P_CLK = '1') then
			    if (P_RESET = '1') then
				    out0_reg_sync <= (others=>'0');
                elsif (P_CE = '1') then
					out0_reg_sync <= mult_out0;
				end if;
			end if;
		end process;

        process(mult_out0, out0_reg)
        begin
            if (PREG_CLK = "BYPASS") then
                out0 <= mult_out0;
            else
                out0 <= out0_reg;
            end if;
        end process;

        -- output reg
        process(O_CLK, O_RESET, grstn)
        begin
            if (grstn = '0') then
				out_reg_async <= (others=>'0');
			elsif O_RESET = '1' then
				out_reg_async <= (others=>'0');
            elsif (O_CLK'event and O_CLK = '1') then  
                if (O_CE = '1') then
                    out_reg_async <= out0;
                end if;
            end if;
        end process;

        process (O_CLK, grstn)
		begin
			if (grstn = '0') then
				out_reg_sync <= (others=>'0');
			elsif (O_CLK'event and O_CLK = '1') then
			    if (O_RESET = '1') then
				    out_reg_sync <= (others=>'0');
                elsif (O_CE = '1') then
					out_reg_sync <= out0;
				end if;
			end if;
		end process;

        process(out0, out_reg)
        begin
            if (OREG_CLK = "BYPASS") then
                d_out <= out0;
            else
                d_out <= out_reg;
            end if;
        end process;

        DOUT <= d_out(62 downto 0);

end Behavioral;


---------------------
--/*Hardcore models*/
---------------------
---------------------------------IDDR--------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity IDDR is
    GENERIC (
	    Q0_INIT : bit := '0';
	    Q1_INIT : bit := '0'
    );	
    PORT (
	    Q0 : OUT std_logic;
	    Q1 : OUT std_logic;	
	    D : IN std_logic;
	    CLK: IN std_logic
    );	
end IDDR;

ARCHITECTURE Behavioral OF IDDR IS
    SIGNAL gsrt : std_logic;
    SIGNAL q0_oreg,q0_reg : std_logic := '0';
    SIGNAL q1_oreg,q1_reg : std_logic := '0';	
begin
    gsrt <= GSRO;

    process(CLK,gsrt)
	begin
	    if (gsrt = '0') then
	        q0_oreg <= TO_X01(Q0_INIT);
	        q0_reg <= TO_X01(Q0_INIT);
	        q1_reg <= TO_X01(Q0_INIT);
	    elsif (CLK'event and CLK = '1') then
			q0_oreg <= D;
            q0_reg <= q0_oreg;
	        q1_reg <= q1_oreg;
	    end if;
    end process;

    process(CLK,gsrt)
	begin
	    if (gsrt = '0') then
		    q1_oreg <= TO_X01(Q1_INIT);	
	    elsif (CLK'event and CLK = '0') then
			q1_oreg <= D;
	    end if;
    end process;

    Q0 <= q0_reg;
    Q1 <= q1_reg;

end Behavioral;

---------------------------------IDDRC---------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity IDDRC is
    GENERIC ( 
	    Q0_INIT : bit := '0';
	    Q1_INIT : bit := '0'
    );	
    PORT (
	    Q0 : OUT std_logic;
	    Q1 : OUT std_logic;
	    D : IN std_logic;
	    CLEAR: IN std_logic;
	    CLK: IN std_logic
    );	
end IDDRC;

ARCHITECTURE Behavioral OF IDDRC IS
    SIGNAL gsrt : std_logic;
    SIGNAL q0_oreg,q0_reg : std_logic := '0';
    SIGNAL q1_oreg,q1_reg : std_logic := '0';
	
begin
    gsrt <= GSRO;

    process(CLK, CLEAR,gsrt)
    begin
	    if (gsrt = '0') then
	        q0_oreg <= TO_X01(Q0_INIT);
		    q1_reg <= TO_X01(Q1_INIT);	
		    q0_reg <= TO_X01(Q1_INIT);	
	    elsif (CLEAR = '1') then
		    q0_oreg <= '0';
		    q1_reg <= '0';
		    q0_reg <= '0';
	    elsif (CLK'event and CLK = '1') then
			q0_oreg <= D;
            q0_reg <= q0_oreg;
	        q1_reg <= q1_oreg;
	    end if;
    end process;

    process(CLK, CLEAR,gsrt)
    begin
	    if (gsrt = '0') then
		    q1_oreg <= TO_X01(Q1_INIT);	
	    elsif (CLEAR = '1') then
		    q1_oreg <= '0';
	    elsif (CLK'event and CLK = '0') then
			q1_oreg <= D;
	    end if;
    end process;

    Q0 <= q0_reg;
    Q1 <= q1_reg;

end Behavioral;

----------------------------IDDR_MEM------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use work.glb.GSRO;

entity IDDR_MEM is
	PORT (
		Q0 : out std_logic;	
		Q1 : out std_logic;	
		D : in std_logic;
		ICLK : in std_logic;
		PCLK : in std_logic;
		RESET : in std_logic;
		WADDR : in std_logic_vector(2 downto 0);
		RADDR : in std_logic_vector(2 downto 0)
	);
end IDDR_MEM;

architecture Behavioral of IDDR_MEM is

	signal d0_reg  : std_logic := '0';
	signal d0_mem : std_logic_vector(7 downto 0) := "00000000";
	signal d1_mem : std_logic_vector(7 downto 0) := "00000000";
	signal q_data : std_logic_vector(1 downto 0) := "00";
	SIGNAL grstn: std_logic := '0';
 	SIGNAL lrstn: std_logic := '0';

begin
   	grstn <= GSRO;
	lrstn <= (NOT RESET);

	process(ICLK, grstn, lrstn)
	begin
		if(grstn='0') then
			d0_reg <= '0';
		elsif(lrstn='0') then
			d0_reg <= '0';
		elsif(rising_edge(ICLK)) then
			d0_reg <= D;
		end if;
	end process;		

	process(ICLK, grstn, lrstn)
	begin
		if(grstn = '0') then
			d0_mem <= "00000000";
			d1_mem <= "00000000";
		elsif(lrstn ='0') then
			d0_mem <= "00000000";
			d1_mem <= "00000000";
		elsif(falling_edge(ICLK)) then
			d0_mem(CONV_INTEGER(WADDR)) <= d0_reg;
			d1_mem(CONV_INTEGER(WADDR)) <= D;
		end if;		
	end process;

	process(PCLK, grstn, lrstn)
	begin
		if(grstn='0') then
			q_data <= "00";
		elsif(lrstn='0') then
			q_data <= "00";
		elsif(rising_edge(PCLK)) then
			q_data <= (d1_mem(CONV_INTEGER(RADDR)), d0_mem(CONV_INTEGER(RADDR)));	
		end if;
	end process;
	
	(Q1,Q0) <= q_data;
	
end Behavioral;

-------------------------------ODDR----------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity ODDR is
    GENERIC ( 
        TXCLK_POL : bit := '0'; --'0':Rising edge output; '1':Falling edge output        
        CONSTANT INIT : std_logic := '0' 
    );	
    PORT ( 
	    Q0 : OUT std_logic;	
	    Q1 : OUT std_logic;	
	    D0 : IN std_logic;
	    D1 : IN std_logic;
	    TX : IN std_logic;
	    CLK : IN std_logic
    );	
end ODDR;

architecture Behavioral of ODDR is
	signal gsrt : std_logic := '0';
	signal d0_reg_0,d0_reg_1,d0_reg_2 : std_logic := '0';
	signal d1_reg_0,d1_reg_1,d1_reg_2 : std_logic := '0';
	signal tx_reg_0,tx_reg_1,tx_reg_p,tx_reg_n : std_logic := '0';
begin
	gsrt <= GSRO;

    process(CLK, gsrt)
	begin
		if(gsrt = '0') then
			d0_reg_0 <= TO_X01(INIT);
			d1_reg_0 <= TO_X01(INIT);
            d0_reg_1 <= TO_X01(INIT);
			d1_reg_1 <= TO_X01(INIT);
			d1_reg_2 <= TO_X01(INIT);
			tx_reg_0 <= TO_X01(INIT);
			tx_reg_1 <= TO_X01(INIT);
			tx_reg_p <= TO_X01(INIT);
		elsif(CLK'event and CLK='1') then
			d0_reg_0 <= D0;
	        d1_reg_0 <= D1;
            d0_reg_1 <= d0_reg_0;
	        d1_reg_1 <= d1_reg_0;
	        d1_reg_2 <= d1_reg_1;
            tx_reg_0 <= TX;
            tx_reg_1 <= tx_reg_0;
            tx_reg_p <= tx_reg_n;
		end if;
	end process;

	process(CLK, gsrt)
	begin
		if(gsrt = '0') then
			d0_reg_2 <= TO_X01(INIT);
            tx_reg_n <= TO_X01(INIT);
		elsif(CLK'event and CLK='0') then
	        d0_reg_2 <= d0_reg_1;
            tx_reg_n <= tx_reg_1;
		end if;
	end process;

    Q0 <= d0_reg_2 when (CLK = '1') else d1_reg_2;
    Q1 <= tx_reg_p when (TXCLK_POL = '0') else tx_reg_n;	

end Behavioral;

-------------------------------ODDRC----------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity ODDRC is
    GENERIC (
        TXCLK_POL : bit := '0'; --'0':Rising edge output; '1':Falling edge output
        CONSTANT INIT : std_logic := '0'
    );	
    PORT (
	    Q0 : OUT std_logic;
	    Q1 : OUT std_logic;
	    D0 : IN std_logic;
	    D1: IN std_logic;
	    TX: IN std_logic;
	    CLK : IN std_logic;
	    CLEAR: IN std_logic
    );
end ODDRC;

ARCHITECTURE Behavioral OF ODDRC IS
    SIGNAL d0_reg_0,d0_reg_1,d0_reg_2 : std_logic := '0';	
    SIGNAL d1_reg_0,d1_reg_1,d1_reg_2 : std_logic := '0';
    signal tx_reg_0,tx_reg_1,tx_reg_p,tx_reg_n : std_logic := '0';
    signal gsrt : std_logic := '0';
begin
	gsrt <= GSRO;
	
	process(CLK, gsrt, CLEAR)
	begin
		if(gsrt = '0') then
			d0_reg_0 <= TO_X01(INIT);
			d1_reg_0 <= TO_X01(INIT);
            d0_reg_1 <= TO_X01(INIT);
			d1_reg_1 <= TO_X01(INIT);
			d1_reg_2 <= TO_X01(INIT);
			tx_reg_0 <= TO_X01(INIT);
			tx_reg_1 <= TO_X01(INIT);
			tx_reg_p <= TO_X01(INIT);
		elsif(CLEAR = '1') then
			d0_reg_0 <= '0';
			d1_reg_0 <= '0';
            d0_reg_1 <= '0';
			d1_reg_1 <= '0';
			d1_reg_2 <= '0';
			tx_reg_0 <= '0';
			tx_reg_1 <= '0';
			tx_reg_p <= '0';
		elsif (CLK'event and CLK ='1') then
	        d0_reg_0 <= D0;
	        d1_reg_0 <= D1;
            d0_reg_1 <= d0_reg_0;
	        d1_reg_1 <= d1_reg_0;
	        d1_reg_2 <= d1_reg_1;
            tx_reg_0 <= TX;
            tx_reg_1 <= tx_reg_0;
            tx_reg_p <= tx_reg_n;
        end if;
	end process;

	process (CLK, gsrt, CLEAR)
	begin
		if(gsrt = '0') then
			d0_reg_2 <= TO_X01(INIT);
            tx_reg_n <= TO_X01(INIT);
		elsif(CLEAR = '1') then
			d0_reg_2 <= '0';
            tx_reg_n <= '0';
		elsif CLK'event and CLK ='0' then
	        d0_reg_2 <= d0_reg_1;
            tx_reg_n <= tx_reg_1;            
	    end if;
	end process;

    Q0 <= d0_reg_2 when (CLK = '1') else d1_reg_2;
    Q1 <= tx_reg_p when (TXCLK_POL = '0') else tx_reg_n;

end Behavioral;

----------------------------ODDR_MEM------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity ODDR_MEM is
    GENERIC(
        TXCLK_POL : bit := '0'; --'0':Rising edge output; '1':Falling edge output
        TCLK_SOURCE : string := "DQSW"
    );
    PORT (
		 Q0 : out std_logic;	
		 Q1 : out std_logic;	
		 TCLK : in std_logic;
		 PCLK : in std_logic;
		 RESET : in std_logic;
		 D0 : in std_logic;
		 D1 : in std_logic;
		 TX : in std_logic
    );
end ODDR_MEM;

architecture Behavioral of ODDR_MEM is
	signal tx_reg_1,tx_reg_2  : std_logic;
	signal d_reg_0,d_reg_1 : std_logic_vector(1 downto 0);
	signal tx_reg_p,tx_reg_n  : std_logic;
	signal d_reg_p,d_reg_n  : std_logic;
    signal tclk_sig : std_logic;
	SIGNAL grstn: std_logic;
 	SIGNAL lrstn: std_logic;
	
begin	

	grstn <= GSRO;
	lrstn <= (NOT RESET);
    tclk_sig <= TCLK when (TCLK_SOURCE = "DQSW") else (not TCLK);

	process(PCLK, grstn, lrstn)
	begin
		if(grstn = '0') then
			d_reg_0 <= "00";
			tx_reg_1 <= '0';
		elsif(lrstn = '0') then
			d_reg_0 <= "00";
			tx_reg_1 <= '0';
		elsif(rising_edge(PCLK)) then
			d_reg_0 <= (D1,D0);
			tx_reg_1 <= TX;
		end if;
	end process;

	process(tclk_sig, grstn, lrstn)
	begin
		if(grstn = '0') then
			d_reg_1 <= "00";
			tx_reg_2 <= '0';
		elsif(lrstn = '0') then
			d_reg_1 <= "00";
			tx_reg_2 <= '0';
		elsif(rising_edge(tclk_sig)) then
			d_reg_1 <= d_reg_0;
			tx_reg_2 <= tx_reg_1;
		end if;
	end process;

	process(tclk_sig, grstn, lrstn)
	begin
		if(grstn = '0') then
			d_reg_p <= '0';
			tx_reg_p <= '0';
		elsif(lrstn = '0') then
			d_reg_p <= '0';
			tx_reg_p <= '0';
		elsif(rising_edge(tclk_sig)) then
			d_reg_p <= d_reg_1(1);
			tx_reg_p <= tx_reg_n;
		end if;
	end process;

	process(tclk_sig, grstn, lrstn)
	begin
		if(grstn = '0') then
			d_reg_n <= '0';
			tx_reg_n <= '0';
		elsif(lrstn = '0') then
			d_reg_n <= '0';
			tx_reg_n <= '0';
		elsif(falling_edge(tclk_sig)) then
			d_reg_n <= d_reg_1(0);
			tx_reg_n <= tx_reg_2;
		end if;
	end process;

	Q0 <= d_reg_n when (tclk_sig = '1') else d_reg_p;
    Q1 <= tx_reg_p when (TXCLK_POL = '0') else tx_reg_n;	
	
end Behavioral;

-----------------------------------------IDES4-------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity IDES4 is
	PORT (
		D : IN std_logic;
		RESET : IN std_logic;
		CALIB : IN std_logic;
		FCLK : IN std_logic;
		PCLK : IN std_logic;
		Q0 : OUT std_logic;
		Q1 : OUT std_logic;
		Q2 : OUT std_logic;
		Q3 : OUT std_logic
	);
end IDES4;

ARCHITECTURE Behavioral of IDES4 is
	signal grstn : std_logic;
	signal lrstn : std_logic;
	SIGNAL d0_reg,d1_reg : std_logic;
	SIGNAL D_data,data, Q_reg : std_logic_vector(3 downto 0);	
	signal reset_delay,calib_rising_p : std_logic;
	SIGNAL calib_data : std_logic_vector(2 downto 0);	
	signal data_en1,data_en,dcnt_en,data_sel,calib_state : std_logic := '0';
	signal d0_reg0,d0_reg1,d1_reg0,d1_reg1 : std_logic := '0';
begin
	grstn <= GSRO;
	lrstn <= not RESET;
	
	process(FCLK, grstn, lrstn)
	begin
		if(grstn = '0') then
			d0_reg <= '0';
		elsif(lrstn = '0') then
			d0_reg <= '0';
		elsif(rising_edge(FCLK)) then
			d0_reg <= D;
		end if;
	end process;

	process(FCLK,grstn,lrstn)
	begin
		if (grstn = '0') then
			d1_reg <= '0';
		elsif (lrstn='0') then
			d1_reg <= '0';
		elsif(falling_edge(FCLK))then
			d1_reg <= D;
		end if;
	end process;

	process (FCLK, grstn, lrstn) 
    begin
        if (grstn = '0') then
			d0_reg0 <= '0';
            d0_reg1 <= '0';
            d1_reg0 <= '0';
            d1_reg1 <= '0';
		elsif (lrstn = '0') then
		    d0_reg0 <= '0';
            d0_reg1 <= '0';
            d1_reg0 <= '0';
            d1_reg1 <= '0';
        elsif(rising_edge(FCLK)) then
            d0_reg0 <= d0_reg;
            d0_reg1 <= d0_reg0;
            d1_reg0 <= d1_reg;
            d1_reg1 <= d1_reg0;
        end if;
    end process;

    process(FCLK, grstn,lrstn) 
    begin
        if (grstn = '0') then
            reset_delay <= '0';
		elsif (lrstn = '0') then
            reset_delay <= '0';
        elsif(rising_edge(FCLK)) then
            reset_delay <= '1';
        end if;
    end process;

    process(FCLK,reset_delay)
	begin
		if (reset_delay = '0') then
			calib_data <= "000";
		elsif(rising_edge(FCLK)) then
			calib_data <= calib_data(1 downto 0) & CALIB;
		end if;
	end process;
	
	calib_rising_p <= calib_data(1) and (not calib_data(2));
    dcnt_en <= not (calib_rising_p and calib_state);

	process (FCLK, reset_delay) 
    begin
		if (reset_delay = '0') then
            calib_state <= '0';
            data_en1 <= '0';
            data_en  <= '0';
            data_sel <= '0';
		elsif(rising_edge(FCLK)) then
            data_en <= not data_en1;
            if (calib_rising_p = '1') then
                calib_state <= not calib_state;
                data_sel <= not data_sel;
            else 
                calib_state <= calib_state;
                data_sel <= data_sel;
            end if;
                
            if (dcnt_en = '1') then
                data_en1 <= not data_en1;
            else 
                data_en1 <= data_en1;
            end if;
        end if;
    end process;
    
	process (data_sel, d0_reg, d0_reg0, d0_reg1, d1_reg0, d1_reg1) 
    begin
        if(data_sel = '1') then
            D_data(3) <= d0_reg;
            D_data(2) <= d1_reg0;
            D_data(1) <= d0_reg0;
            D_data(0) <= d1_reg1;
        else
            D_data(3) <= d1_reg0;
            D_data(2) <= d0_reg0;
            D_data(1) <= d1_reg1;
            D_data(0) <= d0_reg1;
        end if;
    end process;
    
    process(FCLK,grstn,lrstn)
	begin
		if (grstn = '0') then
			data <= "0000";
		elsif (lrstn = '0') then
			data <= "0000";
		elsif (rising_edge(FCLK)) then
            if (data_en = '1' ) then
                data <= D_data;
            end if;
		end if;
	end process;

	process(PCLK,grstn,lrstn)
	begin
		if (grstn = '0') then
			Q_reg <= "0000";
		elsif (lrstn = '0') then
			Q_reg <= "0000";
		elsif(rising_edge(PCLK))then
			Q_reg <= data;
		end if;
	end process;

	(Q3,Q2,Q1,Q0) <= Q_reg;

end Behavioral;

--------------------------IDES4_MEM----------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.glb.GSRO;

entity IDES4_MEM is
	PORT(
		D,RESET : IN std_logic;
		CALIB : IN std_logic;
		ICLK,FCLK,PCLK : IN std_logic;
		WADDR : IN std_logic_vector(2 downto 0);
		RADDR : IN std_logic_vector(2 downto 0);
		Q0 : OUT std_logic;
		Q1 : OUT std_logic;
		Q2 : OUT std_logic;
		Q3 : OUT std_logic
	 );
end IDES4_MEM;

ARCHITECTURE Behavioral of IDES4_MEM is
	SIGNAL d0_reg : std_logic;
	SIGNAL D_data,data,Q_reg : std_logic_vector(3 downto 0) := "0000";
	SIGNAL d0_mem,d1_mem : std_logic_vector(7 downto 0) := "00000000";
	signal data_en1,data_en,dcnt_en,data_sel,calib_state : std_logic := '0';
	signal d0_reg0,d0_reg1,d1_reg0,d1_reg1 : std_logic := '0';
	signal calib_rising_p : std_logic;
    signal calib_data : std_logic_vector(2 downto 0);
    signal grstn,lrstn,reset_delay : std_logic;
begin
	grstn <= GSRO;
	lrstn <= not RESET;
	process(ICLK,grstn,lrstn)
	begin
		if(grstn = '0') then
			d0_reg <= '0';
		elsif(lrstn = '0') then
			d0_reg <= '0';
		elsif(rising_edge(ICLK))then
			d0_reg <= D;
		end if;
	end process;

	process(ICLK,grstn,lrstn)
	begin
		if (grstn = '0') then
			d1_mem <= "00000000";
		elsif (lrstn = '0') then
			d1_mem <= "00000000";
		elsif(falling_edge(ICLK))then
			d1_mem(CONV_INTEGER(WADDR)) <= D;
		end if;
	end process;

	process(ICLK,grstn,lrstn)
	begin
		if (grstn = '0') then
			d0_mem <= "00000000";
		elsif (lrstn = '0') then
			d0_mem <= "00000000";
		elsif(falling_edge(ICLK))then
			d0_mem(CONV_INTEGER(WADDR)) <= d0_reg;
		end if;
	end process;

	process (FCLK, grstn, lrstn) 
    begin
        if (grstn = '0') then
            d0_reg0 <= '0';
            d0_reg1 <= '0';
            d1_reg0 <= '0';
            d1_reg1 <= '0';
		elsif (lrstn = '0') then
            d0_reg0 <= '0';
            d0_reg1 <= '0';
            d1_reg0 <= '0';
            d1_reg1 <= '0';
		elsif(rising_edge(FCLK))then
            d0_reg0 <= d0_mem(CONV_INTEGER(RADDR));
            d0_reg1 <= d0_reg0;
            d1_reg0 <= d1_mem(CONV_INTEGER(RADDR));
            d1_reg1 <= d1_reg0;
        end if;
    end process;

	process(FCLK, grstn,lrstn) 
    begin
        if (grstn = '0') then
            reset_delay <= '0';
		elsif (lrstn = '0') then
            reset_delay <= '0';
        elsif(rising_edge(FCLK)) then
            reset_delay <= '1';
        end if;
    end process;

    process(FCLK,reset_delay)
	begin
		if (reset_delay = '0') then
			calib_data <= "000";
		elsif(rising_edge(FCLK)) then
			calib_data <= calib_data(1 downto 0) & CALIB;
		end if;
	end process;
	
	calib_rising_p <= calib_data(1) and (not calib_data(2));
    dcnt_en <= not (calib_rising_p and calib_state);

	process (FCLK, reset_delay) 
    begin
		if (reset_delay = '0') then
            calib_state <= '0';
            data_en1 <= '0';
            data_en  <= '0';
            data_sel <= '0';
		elsif(rising_edge(FCLK)) then
            data_en <= not data_en1;
            if (calib_rising_p = '1') then
                calib_state <= not calib_state;
                data_sel <= not data_sel;
            else 
                calib_state <= calib_state;
                data_sel <= data_sel;
            end if;
                
            if (dcnt_en = '1') then
                data_en1 <= not data_en1;
            else 
                data_en1 <= data_en1;
            end if;
        end if;
    end process;
    
	process (data_sel, d0_mem, d0_reg0, d0_reg1, d1_reg0, d1_reg1) 
    begin
        if(data_sel = '1') then
            D_data(3) <= d0_mem(CONV_INTEGER(RADDR));
            D_data(2) <= d1_reg0;
            D_data(1) <= d0_reg0;
            D_data(0) <= d1_reg1;
        else
            D_data(3) <= d1_reg0;
            D_data(2) <= d0_reg0;
            D_data(1) <= d1_reg1;
            D_data(0) <= d0_reg1;
        end if;
    end process;

	process(FCLK,grstn,lrstn)
	begin
		if (grstn = '0') then
			data <= "0000";
		elsif (lrstn = '0') then
			data <= "0000";
		elsif (rising_edge(FCLK)) then
			if(data_en = '1') then 
				data <= D_data;
			end if;
		end if;
	end process;

	process(PCLK,grstn,lrstn)
	begin
		if (grstn = '0') then
			Q_reg <= "0000";
		elsif (lrstn = '0') then
			Q_reg <= "0000";
		elsif(rising_edge(PCLK))then
			Q_reg <= data;
		end if;
	end process;

	(Q3,Q2,Q1,Q0) <= Q_reg;

end Behavioral;

----------------------------IVIDEO------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.glb.GSRO;

entity IVIDEO is
    PORT (
		D : IN std_logic;
		RESET : IN std_logic;
		CALIB : IN std_logic;
		FCLK : IN std_logic;
		PCLK : IN std_logic;
		Q0 : OUT std_logic;
		Q1 : OUT std_logic;
		Q2 : OUT std_logic;
		Q3 : OUT std_logic;
		Q4 : OUT std_logic;
		Q5 : OUT std_logic;
		Q6 : OUT std_logic
    );
end IVIDEO;

ARCHITECTURE Behavioral of IVIDEO is
	SIGNAL d0_reg,d1_reg,d0_ireg,d0_ireg0,d1_ireg,d1_ireg1 : std_logic;
	SIGNAL reset_delay : std_logic;
	SIGNAL D_data,data,Q_reg : std_logic_vector(6 downto 0) := "0000000";
	SIGNAL calib_data : std_logic_vector(2 downto 0) := "000";
	SIGNAL data_en,data_en0,data_en1,dcnt_en,dsel_en,data_sel : std_logic := '0';
	SIGNAL d0_reg0,d0_reg1,d0_reg2,d1_reg0,d1_reg1,d1_reg2,d1_reg3 : std_logic := '0';
	SIGNAL calib_rising_p: std_logic;
	SIGNAL grstn: std_logic;
	SIGNAL lrstn: std_logic;

begin
	grstn <= GSRO;
	lrstn <= not RESET;

	process(FCLK,grstn,lrstn)
	begin
		if(grstn='0') then
			d0_ireg <= '0';
			d0_ireg0 <= d0_ireg;
        	d0_reg <= d0_ireg0;
		elsif(lrstn='0') then
			d0_ireg <= '0';
			d0_ireg0 <= d0_ireg;
        	d0_reg <= d0_ireg0;
		elsif(falling_edge(FCLK))then
			d0_ireg <= D;
			d0_ireg0 <= d0_ireg;
        	d0_reg <= d0_ireg0;
		end if;
	end process;

	process(FCLK,grstn,lrstn)
	begin
		if (grstn='0') then
			d1_ireg <= '0';
			d1_ireg1 <= d1_ireg;
        	d1_reg <= d1_ireg1;
		elsif (lrstn='0') then
			d1_ireg <= '0';
			d1_ireg1 <= d1_ireg;
        	d1_reg <= d1_ireg1;
		elsif(rising_edge(FCLK))then
			d1_ireg <= D;
			d1_ireg1 <= d1_ireg;
        	d1_reg <= d1_ireg1;
		end if;
	end process;

	process(FCLK,grstn,lrstn)
	begin
		if (grstn='0') then
			reset_delay <= '0';
		elsif (lrstn='0') then
			reset_delay <= '0';
		elsif(rising_edge(FCLK))then
			reset_delay <= '1';
		end if;
	end process;

	process(FCLK,reset_delay)
	begin
		if (reset_delay = '0') then
			calib_data <= "000";
		elsif(rising_edge(FCLK)) then
			calib_data <= calib_data(1 downto 0)&CALIB;
		end if;
	end process;
	
	calib_rising_p <=  not(calib_data(1) and (not calib_data(2)));
    dcnt_en <= calib_rising_p;
	dsel_en <= not(not(data_sel and data_en1 and (not data_en0) and calib_rising_p)) and (not(data_en0 and data_en1 and (not data_sel)));

	
	process(FCLK, reset_delay) 
    begin
		if (reset_delay = '0') then
            data_en1 <= '0';
            data_en0 <= '0';
            data_en  <= '0';
            data_sel <= '0';
		elsif(rising_edge(FCLK)) then
            data_en <= not(not(data_en0 and (not data_en1) and (not data_sel)) and (not((not data_en0) and (not data_en1) and data_sel)));
            if (dsel_en = '1') then
                data_sel <= not data_sel;
            else
                data_sel <= data_sel;
            end if;
        
            if (dcnt_en = '1') then
                data_en0 <= not data_en0;
            else
                data_en0 <= data_en0;
            end if;
                                                                                   
            if (dcnt_en = '1') then
                data_en1 <= data_en0 xor data_en1;
            else
                data_en1 <= data_en1;
            end if;   
        end if;          
    end process;

    process(FCLK, grstn, lrstn) 
    begin
		if (grstn='0') then
            d0_reg0 <= '0';
            d0_reg1 <= '0';
            d0_reg2 <= '0';
            d1_reg0 <= '0';
            d1_reg1 <= '0';
            d1_reg2 <= '0';
            d1_reg3 <= '0';
		elsif (lrstn='0') then
            d0_reg0 <= '0';
            d0_reg1 <= '0';
            d0_reg2 <= '0';
            d1_reg0 <= '0';
            d1_reg1 <= '0';
            d1_reg2 <= '0';
            d1_reg3 <= '0';
		elsif(rising_edge(FCLK)) then
            d0_ireg0 <= d0_ireg;
		    d0_reg <= d0_ireg0;
            d0_reg0 <= d0_reg;
            d0_reg1 <= d0_reg0;
            d0_reg2 <= d0_reg1;
		    d1_ireg1 <= d1_ireg;
		    d1_reg <= d1_ireg1;
            d1_reg0 <= d1_reg;
            d1_reg1 <= d1_reg0;
            d1_reg2 <= d1_reg1;
            d1_reg3 <= d1_reg2;
        end if;
    end process;

    process(data_sel, d0_reg, d0_reg0, d0_reg1, d0_reg2, d1_reg0, d1_reg1, d1_reg2, d1_reg3) 
    begin
        if(data_sel = '1') then
            D_data(6) <= d0_reg;
            D_data(5) <= d1_reg0;
            D_data(4) <= d0_reg0;
            D_data(3) <= d1_reg1;
            D_data(2) <= d0_reg1;
            D_data(1) <= d1_reg2;
            D_data(0) <= d0_reg2;
        else
            D_data(6) <= d1_reg0;
            D_data(5) <= d0_reg0;
            D_data(4) <= d1_reg1;
            D_data(3) <= d0_reg1;
            D_data(2) <= d1_reg2;
            D_data(1) <= d0_reg2;
            D_data(0) <= d1_reg3;
        end if;
    end process;
	
	process(FCLK,grstn,lrstn)
	begin
		if (grstn='0') then
			data <= "0000000";
		elsif (lrstn='0') then
			data <= "0000000";
		elsif(rising_edge(FCLK))then
			if(data_en = '1') then
				data <= D_data;
			end if;
		end if;
	end process;

	process(PCLK,grstn,lrstn)
	begin
		if (grstn='0') then
			Q_reg <= "0000000";
		elsif (lrstn='0') then
			Q_reg <= "0000000";
		elsif(rising_edge(PCLK))then
			Q_reg <= data;
		end if;
	end process;

	(Q6,Q5,Q4,Q3,Q2,Q1,Q0) <= Q_reg;
	
end Behavioral;


-----------------------------------IDES8-------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.glb.GSRO;

entity IDES8 is
    PORT (
		D,RESET : IN std_logic;
		CALIB : IN std_logic;
		FCLK,PCLK : IN std_logic;
		Q0 : OUT std_logic;
		Q1 : OUT std_logic;
		Q2 : OUT std_logic;
		Q3 : OUT std_logic;
		Q4 : OUT std_logic;
		Q5 : OUT std_logic;
		Q6 : OUT std_logic;
		Q7 : OUT std_logic
    );
end IDES8;

ARCHITECTURE Behavioral of IDES8 is
SIGNAL grstn,lrstn,reset_delay : std_logic;
SIGNAL d0_reg,d1_reg : std_logic;
SIGNAL data_en,data_en0,data_en1,data_sel,calib_state,dcnt_en : std_logic := '0';
signal d0_reg0,d0_reg1,d0_reg2,d0_reg3,d1_reg0,d1_reg1,d1_reg2,d1_reg3 : std_logic  := '0';
SIGNAL D_data,data,Q_reg : std_logic_vector(7 downto 0);
SIGNAL calib_data : std_logic_vector(2 downto 0);
SIGNAL calib_rising_p : std_logic;

begin
	grstn <= GSRO;
	lrstn <= not RESET;
	
	process(FCLK,grstn,lrstn)
	begin
		if(grstn = '0') then
			d0_reg <= '0';
		elsif(lrstn = '0') then
			d0_reg <= '0';
		elsif(rising_edge(FCLK))then
			d0_reg <= D;
		end if;
	end process;

	process(FCLK,grstn,lrstn)
	begin
		if (grstn = '0') then
			d1_reg <= '0';
		elsif (lrstn = '0') then
			d1_reg <= '0';
		elsif(falling_edge(FCLK))then
			d1_reg <= D;
		end if;
	end process;

	process(FCLK,grstn,lrstn)
	begin
		if (grstn='0') then
			reset_delay <= '0';
		elsif (lrstn='0') then
			reset_delay <= '0';
		elsif(rising_edge(FCLK))then
			reset_delay <= '1';
		end if;
	end process;

	process(FCLK,reset_delay)
	begin
		if (reset_delay = '0') then
			calib_data <= "000";
		elsif(rising_edge(FCLK)) then
			calib_data <= calib_data(1 downto 0)&CALIB;
		end if;
	end process;
	
	calib_rising_p <=  calib_data(1) and (not calib_data(2));
    dcnt_en <= not (calib_rising_p and calib_state);
	
	process(FCLK, reset_delay) 
    begin
		if (reset_delay = '0') then
            calib_state <= '0';
            data_en1 <= '0';
            data_en0 <= '0';
            data_en  <= '0';
            data_sel <= '0';
		elsif(rising_edge(FCLK)) then
            data_en <= data_en0 and (not data_en1);
            if (calib_rising_p = '1') then
                calib_state <= not calib_state;
                data_sel <= not data_sel;
            else
                calib_state <= calib_state;
                data_sel <= data_sel;
            end if;
        
            if (dcnt_en = '1') then
                data_en0 <= not data_en0;
            else
                data_en0 <= data_en0;
            end if;
                                                                                   
            if (dcnt_en = '1') then
                data_en1 <= data_en0 xor data_en1;
            else
                data_en1 <= data_en1;
            end if;   
        end if;          
    end process;

    process(FCLK, grstn, lrstn) 
    begin
		if (grstn='0') then
            d0_reg0 <= '0';
            d0_reg1 <= '0';
            d0_reg2 <= '0';
            d0_reg3 <= '0';
            d1_reg0 <= '0';
            d1_reg1 <= '0';
            d1_reg2 <= '0';
            d1_reg3 <= '0';
		elsif (lrstn='0') then
            d0_reg0 <= '0';
            d0_reg1 <= '0';
            d0_reg2 <= '0';
            d0_reg3 <= '0';
            d1_reg0 <= '0';
            d1_reg1 <= '0';
            d1_reg2 <= '0';
            d1_reg3 <= '0';
		elsif(rising_edge(FCLK)) then
            d0_reg0 <= d0_reg;
            d0_reg1 <= d0_reg0;
            d0_reg2 <= d0_reg1;
            d0_reg3 <= d0_reg2;
            d1_reg0 <= d1_reg;
            d1_reg1 <= d1_reg0;
            d1_reg2 <= d1_reg1;
            d1_reg3 <= d1_reg2;
        end if;
    end process;

    process(data_sel, d0_reg, d0_reg0, d0_reg1, d0_reg2, d0_reg3, d1_reg0, d1_reg1, d1_reg2, d1_reg3) 
    begin
        if(data_sel = '1') then
            D_data(7) <= d0_reg;
            D_data(6) <= d1_reg0;
            D_data(5) <= d0_reg0;
            D_data(4) <= d1_reg1;
            D_data(3) <= d0_reg1;
            D_data(2) <= d1_reg2;
            D_data(1) <= d0_reg2;
            D_data(0) <= d1_reg3;
        else
            D_data(7) <= d1_reg0;
            D_data(6) <= d0_reg0;
            D_data(5) <= d1_reg1;
            D_data(4) <= d0_reg1;
            D_data(3) <= d1_reg2;
            D_data(2) <= d0_reg2;
            D_data(1) <= d1_reg3;
            D_data(0) <= d0_reg3;
        end if;
    end process;
	
	process(FCLK,grstn,lrstn)
	begin
		if (grstn = '0') then
			data <= "00000000";
		elsif(lrstn = '0')then
			data <= "00000000";
		elsif(rising_edge(FCLK))then
			if(data_en = '1') then
				data <= D_data;
			end if;
		end if;
	end process;

	process(PCLK,grstn,lrstn)
	begin
		if (grstn = '0') then
			Q_reg <= "00000000";
		elsif(lrstn='0')then
			Q_reg <= "00000000";
		elsif(rising_edge(PCLK))then
			Q_reg <= data;
		end if;
	end process;

	(Q7,Q6,Q5,Q4,Q3,Q2,Q1,Q0) <= Q_reg;

end Behavioral;

-------------------------IDES8_MEM----------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.glb.GSRO;

entity IDES8_MEM is
    PORT (
		D,RESET : IN std_logic;
		CALIB : IN std_logic;
		FCLK,ICLK,PCLK : IN std_logic;
		Q0 : OUT std_logic;
		Q1 : OUT std_logic;
		Q2 : OUT std_logic;
		Q3 : OUT std_logic;
		Q4 : OUT std_logic;
		Q5 : OUT std_logic;
		Q6 : OUT std_logic;
		Q7 : OUT std_logic;
		WADDR : in std_logic_vector(2 downto 0);
		RADDR : in std_logic_vector(2 downto 0)
    );
end IDES8_MEM;

ARCHITECTURE Behavioral of IDES8_MEM is
signal grstn,lrstn,reset_delay : std_logic; 
SIGNAL d0_reg : std_logic;
signal data_en,data_en0,data_en1,data_sel,calib_state,dcnt_en : std_logic := '0';
SIGNAL D_data,data,Q_reg,d0_mem,d1_mem : std_logic_vector(7 downto 0);
SIGNAL calib_data : std_logic_vector(2 downto 0);
signal d0_reg0,d0_reg1,d0_reg2,d0_reg3,d1_reg0,d1_reg1,d1_reg2,d1_reg3 : std_logic := '0';
signal calib_rising_p : std_logic;

begin
	grstn <= GSRO;
	lrstn <= not RESET;
	process(ICLK,grstn,lrstn)
	begin
		if(grstn = '0') then
			d0_reg <= '0';
		elsif(lrstn = '0') then
			d0_reg <= '0';
		elsif(rising_edge(ICLK))then
			d0_reg <= D;
		end if;
	end process;

	process(ICLK,grstn,lrstn)
	begin
		if (grstn = '0') then
			d0_mem <= "00000000";
		elsif (lrstn = '0') then
			d0_mem <= "00000000";
		elsif(falling_edge(ICLK))then
			d0_mem(CONV_INTEGER(WADDR)) <= d0_reg;
		end if;
	end process;

	process(ICLK,grstn,lrstn)
	begin
		if (grstn = '0') then
			d1_mem <= "00000000";
		elsif (lrstn = '0') then
			d1_mem <= "00000000";
		elsif(falling_edge(ICLK))then
			d1_mem(CONV_INTEGER(WADDR)) <= D;
		end if;
	end process;

	process(FCLK,grstn,lrstn)
	begin
		if (grstn='0') then
			reset_delay <= '0';
		elsif (lrstn='0') then
			reset_delay <= '0';
		elsif(rising_edge(FCLK))then
			reset_delay <= '1';
		end if;
	end process;

	process(FCLK,reset_delay)
	begin
		if (reset_delay = '0') then
			calib_data <= "000";
		elsif(rising_edge(FCLK)) then
			calib_data <= calib_data(1 downto 0)&CALIB;
		end if;
	end process;
	
	calib_rising_p <=  calib_data(1) and (not calib_data(2));
    dcnt_en <= not (calib_rising_p and calib_state);
	
	process(FCLK, reset_delay) 
    begin
		if (reset_delay = '0') then
            calib_state <= '0';
            data_en1 <= '0';
            data_en0 <= '0';
            data_en  <= '0';
            data_sel <= '0';
		elsif(rising_edge(FCLK)) then
            data_en <= data_en0 and (not data_en1);
            if (calib_rising_p = '1') then
                calib_state <= not calib_state;
                data_sel <= not data_sel;
            else
                calib_state <= calib_state;
                data_sel <= data_sel;
            end if;
        
            if (dcnt_en = '1') then
                data_en0 <= not data_en0;
            else
                data_en0 <= data_en0;
            end if;
                                                                                   
            if (dcnt_en = '1') then
                data_en1 <= data_en0 xor data_en1;
            else
                data_en1 <= data_en1;
            end if;   
        end if;          
    end process;

    process(FCLK, grstn, lrstn) 
	begin
		if (grstn='0') then
            d0_reg0 <= '0';
            d0_reg1 <= '0';
            d0_reg2 <= '0';
            d0_reg3 <= '0';
            d1_reg0 <= '0';
            d1_reg1 <= '0';
            d1_reg2 <= '0';
            d1_reg3 <= '0';
		elsif (lrstn='0') then
            d0_reg0 <= '0';
            d0_reg1 <= '0';
            d0_reg2 <= '0';
            d0_reg3 <= '0';
            d1_reg0 <= '0';
            d1_reg1 <= '0';
            d1_reg2 <= '0';
            d1_reg3 <= '0';
		elsif(rising_edge(FCLK)) then
            d0_reg0 <= d0_mem(CONV_INTEGER(RADDR));
            d0_reg1 <= d0_reg0;
            d0_reg2 <= d0_reg1;
            d0_reg3 <= d0_reg2;
            d1_reg0 <= d1_mem(CONV_INTEGER(RADDR));
            d1_reg1 <= d1_reg0;
            d1_reg2 <= d1_reg1;
            d1_reg3 <= d1_reg2;
        end if;
    end process;

    process(data_sel, d0_mem, d0_reg0, d0_reg1, d0_reg2, d1_reg0, d1_reg1, d1_reg2, d1_reg3) 
	begin
        if(data_sel = '1') then
            D_data(7) <= d0_mem(CONV_INTEGER(RADDR));
            D_data(6) <= d1_reg0;
            D_data(5) <= d0_reg0;
            D_data(4) <= d1_reg1;
            D_data(3) <= d0_reg1;
            D_data(2) <= d1_reg2;
            D_data(1) <= d0_reg2;
            D_data(0) <= d1_reg3;
        else
            D_data(7) <= d1_reg0;
            D_data(6) <= d0_reg0;
            D_data(5) <= d1_reg1;
            D_data(4) <= d0_reg1;
            D_data(3) <= d1_reg2;
            D_data(2) <= d0_reg2;
            D_data(1) <= d1_reg3;
            D_data(0) <= d0_reg3;
        end if;
    end process;
	
	process(FCLK,grstn,lrstn)
	begin
		if (grstn = '0') then
			data <= "00000000";
		elsif(lrstn = '0')then
			data <= "00000000";
		elsif(rising_edge(FCLK))then
			if(data_en = '1') then
				data <= D_data;
			end if;
		end if;
	end process;

	process(PCLK,grstn,lrstn)
	begin
		if (grstn = '0') then
			Q_reg <= "00000000";
		elsif(lrstn = '0')then
			Q_reg <= "00000000";
		elsif(rising_edge(PCLK))then
			Q_reg <= data;
		end if;
	end process;

	(Q7,Q6,Q5,Q4,Q3,Q2,Q1,Q0) <= Q_reg;

end Behavioral;

--------------------------------------IDES10----------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.glb.GSRO;

entity IDES10 is
    PORT (
		D,RESET : IN std_logic;
		CALIB : IN std_logic;
		FCLK,PCLK : IN std_logic;
		Q0 : OUT std_logic;
		Q1 : OUT std_logic;
		Q2 : OUT std_logic;
		Q3 : OUT std_logic;
		Q4 : OUT std_logic;
		Q5 : OUT std_logic;
		Q6 : OUT std_logic;
		Q7 : OUT std_logic;
		Q8 : OUT std_logic;
		Q9 : OUT std_logic
    );
end IDES10;

ARCHITECTURE Behavioral of IDES10 is
	SIGNAL d0_reg,d1_reg,grstn,lrstn,reset_delay,dcnt_reset : std_logic;
	SIGNAL data_en,data_en0,data_en1,data_en2,dcnt_en,data_sel,calib_state : std_logic := '0';
	SIGNAL D_data,data,Q_reg : std_logic_vector(9 downto 0);
	SIGNAL calib_data : std_logic_vector(2 downto 0);
	SIGNAL d0_reg0,d0_reg1,d0_reg2,d0_reg3,d0_reg4,d1_reg0,d1_reg1,d1_reg2,d1_reg3,d1_reg4 : std_logic := '0';
    SIGNAL calib_rising_p : std_logic;

begin
	grstn <= GSRO;
	lrstn <= not RESET;
	process(FCLK,grstn,lrstn)
	begin
		if(grstn = '0') then
			d0_reg<= '0';
		elsif(lrstn = '0') then
			d0_reg<= '0';
		elsif(rising_edge(FCLK))then
			d0_reg <= D;
		end if;
	end process;

	process(FCLK,grstn,lrstn)
	begin
		if (grstn = '0') then
			d1_reg <= '0';
		elsif (lrstn = '0') then
			d1_reg <= '0';
		elsif(falling_edge(FCLK))then
			d1_reg <= D;
		end if;
	end process;

	process(FCLK,grstn,lrstn)
	begin
		if (grstn='0') then
			reset_delay <= '0';
		elsif (lrstn='0') then
			reset_delay <= '0';
		elsif(rising_edge(FCLK))then
			reset_delay <= '1';
		end if;
	end process;

	process(FCLK,reset_delay)
	begin
		if (reset_delay = '0') then
			calib_data <= "000";
		elsif(rising_edge(FCLK)) then
			calib_data <= calib_data(1 downto 0)&CALIB;
		end if;
	end process;
	
	calib_rising_p <=  calib_data(1) and (not calib_data(2));
    dcnt_en <= not (calib_rising_p and calib_state);
    dcnt_reset <= data_en2 and (not data_en1) and (not data_en0);
	
	process(FCLK, reset_delay) 
    begin
		if (reset_delay = '0') then
            calib_state <= '0';
            data_en1 <= '0';
            data_en0 <= '0';
            data_en2 <= '0';
            data_en  <= '0';
            data_sel <= '0';
		elsif(rising_edge(FCLK)) then
            data_en <= (not data_en0) and data_en1;
            if (calib_rising_p = '1') then
                calib_state <= not calib_state;
                data_sel <= not data_sel;
            else
                calib_state <= calib_state;
                data_sel <= data_sel;
            end if;
        
            if (dcnt_en = '1') then
                data_en0 <= not(dcnt_reset or data_en0);
            else
                data_en0 <= data_en0;
            end if;                                                                                   
            if (dcnt_en = '1') then
                data_en1 <= data_en0 xor data_en1;
            else
                data_en1 <= data_en1;
            end if;   

            if (dcnt_en = '1') then
                data_en2 <= ((data_en0 and data_en1) xor data_en2) and (not dcnt_reset);
            else
                data_en2 <= data_en2;
            end if;  

        end if;          
    end process;

    process(FCLK, grstn, lrstn) 
    begin
		if (grstn = '0') then
            d0_reg0 <= '0';
            d0_reg1 <= '0';
            d0_reg2 <= '0';
            d0_reg3 <= '0';
            d0_reg4 <= '0';
            d1_reg0 <= '0';
            d1_reg1 <= '0';
            d1_reg2 <= '0';
            d1_reg3 <= '0';
            d1_reg4 <= '0';
		elsif(lrstn = '0')then
            d0_reg0 <= '0';
            d0_reg1 <= '0';
            d0_reg2 <= '0';
            d0_reg3 <= '0';
            d0_reg4 <= '0';
            d1_reg0 <= '0';
            d1_reg1 <= '0';
            d1_reg2 <= '0';
            d1_reg3 <= '0';
            d1_reg4 <= '0';        
		elsif(rising_edge(FCLK))then
            d0_reg0 <= d0_reg;
            d0_reg1 <= d0_reg0;
            d0_reg2 <= d0_reg1;
            d0_reg3 <= d0_reg2;
            d0_reg4 <= d0_reg3;
            d1_reg0 <= d1_reg;
            d1_reg1 <= d1_reg0;
            d1_reg2 <= d1_reg1;
            d1_reg3 <= d1_reg2;
            d1_reg4 <= d1_reg3;
        end if;
    end process;

    process(data_sel, d0_reg, d0_reg0, d0_reg1, d0_reg2, d0_reg3, d0_reg4, d1_reg0, d1_reg1, d1_reg2, d1_reg3, d1_reg4) 
    begin
        if(data_sel = '1') then
            D_data(9) <= d0_reg;
            D_data(8) <= d1_reg0;
            D_data(7) <= d0_reg0;
            D_data(6) <= d1_reg1;
            D_data(5) <= d0_reg1;
            D_data(4) <= d1_reg2;
            D_data(3) <= d0_reg2;
            D_data(2) <= d1_reg3;
            D_data(1) <= d0_reg3;
            D_data(0) <= d1_reg4;
        else 
            D_data(9) <= d1_reg0;
            D_data(8) <= d0_reg0;
            D_data(7) <= d1_reg1;
            D_data(6) <= d0_reg1;
            D_data(5) <= d1_reg2;
            D_data(4) <= d0_reg2;
            D_data(3) <= d1_reg3;
            D_data(2) <= d0_reg3;
            D_data(1) <= d1_reg4;
            D_data(0) <= d0_reg4;
        end if;
    end process;

	process(FCLK,grstn,lrstn)
	begin
		if (grstn = '0') then
			data <= "0000000000";
		elsif(lrstn = '0')then
			data <= "0000000000";
		elsif(rising_edge(FCLK))then
			if(data_en = '1') then
				data <= D_data;
			end if;
		end if;
	end process;

	process(PCLK,grstn,lrstn)
	begin
		if (grstn = '0') then
			Q_reg <= "0000000000";
		elsif(lrstn = '0')then
			Q_reg <= "0000000000";
		elsif(rising_edge(PCLK))then
			Q_reg <= data;
		end if;
	end process;

	(Q9,Q8,Q7,Q6,Q5,Q4,Q3,Q2,Q1,Q0) <= Q_reg;

end Behavioral;

-----------------------------------IDES16-------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.glb.GSRO;

entity IDES16 is
    PORT (
		D,RESET : IN std_logic;
		CALIB : IN std_logic;
		FCLK,PCLK : IN std_logic;
		Q0 : OUT std_logic;
		Q1 : OUT std_logic;
		Q2 : OUT std_logic;
		Q3 : OUT std_logic;
		Q4 : OUT std_logic;
		Q5 : OUT std_logic;
		Q6 : OUT std_logic;
		Q7 : OUT std_logic;
        Q8 : OUT std_logic;
		Q9 : OUT std_logic;
		Q10 : OUT std_logic;
		Q11 : OUT std_logic;
		Q12 : OUT std_logic;
		Q13 : OUT std_logic;
		Q14 : OUT std_logic;
		Q15 : OUT std_logic
    );
end IDES16;

ARCHITECTURE Behavioral of IDES16 is
SIGNAL grstn,lrstn,reset_delay : std_logic;
SIGNAL d0_reg,d1_reg : std_logic;
SIGNAL calib_0,calib_1,calib_2 : std_logic := '0';
SIGNAL dcnt0,dcnt1,dcnt2 : std_logic := '0';
SIGNAL data_sel_en,calib_state_en,dcnt_en,d_up_en : std_logic;
SIGNAL data_sel,calib_state,d_up : std_logic := '0';
signal d0_reg0,d0_reg1,d0_reg2,d0_reg3,d0_reg4,d0_reg5,d0_reg6,d0_reg7,d1_reg0,d1_reg1,d1_reg2,d1_reg3,d1_reg4,d1_reg5,d1_reg6,d1_reg7  : std_logic  := '0';
SIGNAL D_data,data,Q_reg : std_logic_vector(15 downto 0);

begin
	grstn <= GSRO;
	lrstn <= not RESET;
	
	process(FCLK,grstn,lrstn)
	begin
		if(grstn = '0') then
			d0_reg <= '0';
		elsif(lrstn = '0') then
			d0_reg <= '0';
		elsif(rising_edge(FCLK))then
			d0_reg <= D;
		end if;
	end process;

	process(FCLK,grstn,lrstn)
	begin
		if (grstn = '0') then
			d1_reg <= '0';
		elsif (lrstn = '0') then
			d1_reg <= '0';
		elsif(falling_edge(FCLK))then
			d1_reg <= D;
		end if;
	end process;

	process(FCLK,grstn,lrstn)
	begin
		if (grstn='0') then
			reset_delay <= '0';
		elsif (lrstn='0') then
			reset_delay <= '0';
		elsif(rising_edge(FCLK))then
			reset_delay <= '1';
		end if;
	end process;

    process(FCLK,reset_delay)
    begin
        if(reset_delay = '0') then
            calib_0 <= '0';
            calib_1 <= '0';
            calib_2 <= '0';
        elsif(rising_edge(FCLK)) then
            calib_0 <= CALIB;
            calib_1 <= calib_0;
            calib_2 <= calib_1;
        end if;
    end process;

    data_sel_en <= calib_1 and (not calib_2);

    process(FCLK,reset_delay)
    begin
        if(reset_delay = '0') then
            data_sel <= '0';
        elsif(rising_edge(FCLK)) then
            if(data_sel_en = '1') then
                data_sel <= not data_sel;
            else
                data_sel <= data_sel;
            end if;
        end if;
    end process;

    calib_state_en <= data_sel_en;

    process(FCLK,reset_delay)
    begin
        if(reset_delay = '0') then
            calib_state <= '0';
        elsif(rising_edge(FCLK)) then
            if(calib_state_en = '1') then
                calib_state <= not calib_state;
            else
                calib_state <= calib_state;
            end if;
        end if;
    end process;

    dcnt_en <= not(calib_state and calib_state_en);
    
    process(FCLK,reset_delay)
    begin
        if(reset_delay = '0') then
            dcnt0 <= '0';
            dcnt1 <= '0';
            dcnt2 <= '0';
        elsif(rising_edge(FCLK)) then
            if(dcnt_en = '1') then
                dcnt0 <= not dcnt0;
                dcnt1 <= dcnt1 xor dcnt0;
                dcnt2 <= dcnt2 xor (dcnt1 and dcnt0);
            else
                dcnt0 <= dcnt0;
                dcnt1 <= dcnt1;
                dcnt2 <= dcnt2;
            end if;
        end if;
    end process;

    d_up_en <= ((not dcnt2) and dcnt1) and dcnt0;
    
    process(FCLK,reset_delay)
    begin
        if(reset_delay = '0') then
            d_up <= '0';
        elsif(rising_edge(FCLK)) then
            if(d_up_en = '1') then
                d_up <= '1';
            else
                d_up <= '0';
            end if;
        end if;
    end process;

    process(FCLK, grstn, lrstn) 
    begin
		if (grstn='0') then
            d0_reg0 <= '0';
            d0_reg1 <= '0';
            d0_reg2 <= '0';
            d0_reg3 <= '0';
            d0_reg4 <= '0';
            d0_reg5 <= '0';
            d0_reg6 <= '0';
            d0_reg7 <= '0';
            d1_reg0 <= '0';
            d1_reg1 <= '0';
            d1_reg2 <= '0';
            d1_reg3 <= '0';
            d1_reg4 <= '0';
            d1_reg5 <= '0';
            d1_reg6 <= '0';
            d1_reg7 <= '0';
		elsif (lrstn='0') then
            d0_reg0 <= '0';
            d0_reg1 <= '0';
            d0_reg2 <= '0';
            d0_reg3 <= '0';
            d0_reg4 <= '0';
            d0_reg5 <= '0';
            d0_reg6 <= '0';
            d0_reg7 <= '0';
            d1_reg0 <= '0';
            d1_reg1 <= '0';
            d1_reg2 <= '0';
            d1_reg3 <= '0';
            d1_reg4 <= '0';
            d1_reg5 <= '0';
            d1_reg6 <= '0';
            d1_reg7 <= '0';
		elsif(rising_edge(FCLK)) then
            d0_reg0 <= d0_reg;
            d0_reg1 <= d0_reg0;
            d0_reg2 <= d0_reg1;
            d0_reg3 <= d0_reg2;
            d0_reg4 <= d0_reg3;
            d0_reg5 <= d0_reg4;
            d0_reg6 <= d0_reg5;
            d0_reg7 <= d0_reg6;
            d1_reg0 <= d1_reg;
            d1_reg1 <= d1_reg0;
            d1_reg2 <= d1_reg1;
            d1_reg3 <= d1_reg2;
            d1_reg4 <= d1_reg3;
            d1_reg5 <= d1_reg4;
            d1_reg6 <= d1_reg5;
            d1_reg7 <= d1_reg6;
        end if;
    end process;

    process(data_sel, d0_reg, d0_reg0, d0_reg1, d0_reg2, d0_reg3, d0_reg4, d0_reg5, d0_reg6, d0_reg7, d1_reg0, d1_reg1, d1_reg2, d1_reg3, d1_reg4, d1_reg5, d1_reg6, d1_reg7) 
    begin
        if(data_sel = '1') then
            D_data(15) <= d0_reg;
            D_data(14) <= d1_reg0;
            D_data(13) <= d0_reg0;
            D_data(12) <= d1_reg1;
            D_data(11) <= d0_reg1;
            D_data(10) <= d1_reg2;
            D_data(9) <= d0_reg2;
            D_data(8) <= d1_reg3;
            D_data(7) <= d0_reg3;
            D_data(6) <= d1_reg4;
            D_data(5) <= d0_reg4;
            D_data(4) <= d1_reg5;
            D_data(3) <= d0_reg5;
            D_data(2) <= d1_reg6;
            D_data(1) <= d0_reg6;
            D_data(0) <= d1_reg7;
        else
            D_data(15) <= d1_reg0;
            D_data(14) <= d0_reg0;
            D_data(13) <= d1_reg1;
            D_data(12) <= d0_reg1;
            D_data(11) <= d1_reg2;
            D_data(10) <= d0_reg2;
            D_data(9) <= d1_reg3;
            D_data(8) <= d0_reg3;
            D_data(7) <= d1_reg4;
            D_data(6) <= d0_reg4;
            D_data(5) <= d1_reg5;
            D_data(4) <= d0_reg5;
            D_data(3) <= d1_reg6;
            D_data(2) <= d0_reg6;
            D_data(1) <= d1_reg7;
            D_data(0) <= d0_reg7;
        end if;
    end process;
	
	process(FCLK,grstn,lrstn)
	begin
		if (grstn = '0') then
			data <= "0000000000000000";
		elsif(lrstn = '0')then
			data <= "0000000000000000";
		elsif(rising_edge(FCLK))then
			if(d_up = '1') then
				data <= D_data;
			end if;
		end if;
	end process;

	process(PCLK,grstn,lrstn)
	begin
		if (grstn = '0') then
			Q_reg <= "0000000000000000";
		elsif(lrstn='0')then
			Q_reg <= "0000000000000000";
		elsif(rising_edge(PCLK))then
			Q_reg <= data;
		end if;
	end process;

	(Q15,Q14,Q13,Q12,Q11,Q10,Q9,Q8,Q7,Q6,Q5,Q4,Q3,Q2,Q1,Q0) <= Q_reg;

end Behavioral;

-----------------------------------IDES14-------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.glb.GSRO;

entity IDES14 is
    PORT (
		D,RESET : IN std_logic;
		CALIB : IN std_logic;
		FCLK,PCLK : IN std_logic;
		Q0 : OUT std_logic;
		Q1 : OUT std_logic;
		Q2 : OUT std_logic;
		Q3 : OUT std_logic;
		Q4 : OUT std_logic;
		Q5 : OUT std_logic;
		Q6 : OUT std_logic;
		Q7 : OUT std_logic;
        Q8 : OUT std_logic;
		Q9 : OUT std_logic;
		Q10 : OUT std_logic;
		Q11 : OUT std_logic;
		Q12 : OUT std_logic;
		Q13 : OUT std_logic
    );
end IDES14;

ARCHITECTURE Behavioral of IDES14 is
SIGNAL grstn,lrstn,reset_delay : std_logic;
SIGNAL d0_reg,d1_reg : std_logic;
SIGNAL calib_0,calib_1,calib_2 : std_logic := '0';
SIGNAL dcnt0,dcnt1,dcnt2 : std_logic := '0';
SIGNAL data_sel_en,calib_state_en,dcnt_en,d_up_en : std_logic;
SIGNAL data_sel,calib_state,d_up : std_logic := '0';
signal d0_reg0,d0_reg1,d0_reg2,d0_reg3,d0_reg4,d0_reg5,d0_reg6,d0_reg7,d1_reg0,d1_reg1,d1_reg2,d1_reg3,d1_reg4,d1_reg5,d1_reg6,d1_reg7  : std_logic  := '0';
SIGNAL D_data,data,Q_reg : std_logic_vector(13 downto 0);

begin
	grstn <= GSRO;
	lrstn <= not RESET;
	
	process(FCLK,grstn,lrstn)
	begin
		if(grstn = '0') then
			d0_reg <= '0';
		elsif(lrstn = '0') then
			d0_reg <= '0';
		elsif(rising_edge(FCLK))then
			d0_reg <= D;
		end if;
	end process;

	process(FCLK,grstn,lrstn)
	begin
		if (grstn = '0') then
			d1_reg <= '0';
		elsif (lrstn = '0') then
			d1_reg <= '0';
		elsif(falling_edge(FCLK))then
			d1_reg <= D;
		end if;
	end process;

	process(FCLK,grstn,lrstn)
	begin
		if (grstn='0') then
			reset_delay <= '0';
		elsif (lrstn='0') then
			reset_delay <= '0';
		elsif(rising_edge(FCLK))then
			reset_delay <= '1';
		end if;
	end process;

    process(FCLK,reset_delay)
    begin
        if(reset_delay = '0') then
            calib_0 <= '0';
            calib_1 <= '0';
            calib_2 <= '0';
        elsif(rising_edge(FCLK)) then
            calib_0 <= CALIB;
            calib_1 <= calib_0;
            calib_2 <= calib_1;
        end if;
    end process;

    data_sel_en <= calib_1 and (not calib_2);

    process(FCLK,reset_delay)
    begin
        if(reset_delay = '0') then
            data_sel <= '0';
        elsif(rising_edge(FCLK)) then
            if(data_sel_en = '1') then
                data_sel <= not data_sel;
            else
                data_sel <= data_sel;
            end if;
        end if;
    end process;

    calib_state_en <= data_sel_en;

    process(FCLK,reset_delay)
    begin
        if(reset_delay = '0') then
            calib_state <= '0';
        elsif(rising_edge(FCLK)) then
            if(calib_state_en = '1') then
                calib_state <= not calib_state;
            else
                calib_state <= calib_state;
            end if;
        end if;
    end process;

    dcnt_en <= not(calib_state and calib_state_en);
    
    process(FCLK,reset_delay)
    begin
        if(reset_delay = '0') then
            dcnt0 <= '0';
            dcnt1 <= '0';
            dcnt2 <= '0';
        elsif(rising_edge(FCLK)) then
            if(dcnt_en = '1') then
                dcnt0 <= not(dcnt0 or ((not dcnt0) and dcnt1 and dcnt2));
                dcnt1 <= not((dcnt1 xnor dcnt0) or ((not dcnt0) and dcnt1 and dcnt2));
                dcnt2 <= not((dcnt2 xnor (dcnt1 and dcnt0)) or ((not dcnt0) and dcnt1 and dcnt2));
            else
                dcnt0 <= dcnt0;
                dcnt1 <= dcnt1;
                dcnt2 <= dcnt2;
            end if;
        end if;
    end process;

    d_up_en <= ((not dcnt2) and dcnt1) and dcnt0;
    
    process(FCLK,reset_delay)
    begin
        if(reset_delay = '0') then
            d_up <= '0';
        elsif(rising_edge(FCLK)) then
            if(d_up_en = '1') then
                d_up <= '1';
            else
                d_up <= '0';
            end if;
        end if;
    end process;

    process(FCLK, grstn, lrstn) 
    begin
		if (grstn='0') then
            d0_reg0 <= '0';
            d0_reg1 <= '0';
            d0_reg2 <= '0';
            d0_reg3 <= '0';
            d0_reg4 <= '0';
            d0_reg5 <= '0';
            d0_reg6 <= '0';
            d0_reg7 <= '0';
            d1_reg0 <= '0';
            d1_reg1 <= '0';
            d1_reg2 <= '0';
            d1_reg3 <= '0';
            d1_reg4 <= '0';
            d1_reg5 <= '0';
            d1_reg6 <= '0';
            d1_reg7 <= '0';
		elsif (lrstn='0') then
            d0_reg0 <= '0';
            d0_reg1 <= '0';
            d0_reg2 <= '0';
            d0_reg3 <= '0';
            d0_reg4 <= '0';
            d0_reg5 <= '0';
            d0_reg6 <= '0';
            d0_reg7 <= '0';
            d1_reg0 <= '0';
            d1_reg1 <= '0';
            d1_reg2 <= '0';
            d1_reg3 <= '0';
            d1_reg4 <= '0';
            d1_reg5 <= '0';
            d1_reg6 <= '0';
            d1_reg7 <= '0';
		elsif(rising_edge(FCLK)) then
            d0_reg0 <= d0_reg;
            d0_reg1 <= d0_reg0;
            d0_reg2 <= d0_reg1;
            d0_reg3 <= d0_reg2;
            d0_reg4 <= d0_reg3;
            d0_reg5 <= d0_reg4;
            d0_reg6 <= d0_reg5;
            d0_reg7 <= d0_reg6;
            d1_reg0 <= d1_reg;
            d1_reg1 <= d1_reg0;
            d1_reg2 <= d1_reg1;
            d1_reg3 <= d1_reg2;
            d1_reg4 <= d1_reg3;
            d1_reg5 <= d1_reg4;
            d1_reg6 <= d1_reg5;
            d1_reg7 <= d1_reg6;
        end if;
    end process;

    process(data_sel, d0_reg0, d0_reg1, d0_reg2, d0_reg3, d0_reg4, d0_reg5, d0_reg6, d0_reg7, d1_reg0, d1_reg1, d1_reg2, d1_reg3, d1_reg4, d1_reg5, d1_reg6, d1_reg7) 
    begin
        if(data_sel = '1') then
            D_data(13) <= d0_reg0;
            D_data(12) <= d1_reg1;
            D_data(11) <= d0_reg1;
            D_data(10) <= d1_reg2;
            D_data(9) <= d0_reg2;
            D_data(8) <= d1_reg3;
            D_data(7) <= d0_reg3;
            D_data(6) <= d1_reg4;
            D_data(5) <= d0_reg4;
            D_data(4) <= d1_reg5;
            D_data(3) <= d0_reg5;
            D_data(2) <= d1_reg6;
            D_data(1) <= d0_reg6;
            D_data(0) <= d1_reg7;
        else
            D_data(13) <= d1_reg1;
            D_data(12) <= d0_reg1;
            D_data(11) <= d1_reg2;
            D_data(10) <= d0_reg2;
            D_data(9) <= d1_reg3;
            D_data(8) <= d0_reg3;
            D_data(7) <= d1_reg4;
            D_data(6) <= d0_reg4;
            D_data(5) <= d1_reg5;
            D_data(4) <= d0_reg5;
            D_data(3) <= d1_reg6;
            D_data(2) <= d0_reg6;
            D_data(1) <= d1_reg7;
            D_data(0) <= d0_reg7;
        end if;
    end process;
	
	process(FCLK,grstn,lrstn)
	begin
		if (grstn = '0') then
			data <= (others=>'0');
		elsif(lrstn = '0')then
			data <= (others=>'0');
		elsif(rising_edge(FCLK))then
			if(d_up = '1') then
				data <= D_data;
			end if;
		end if;
	end process;

	process(PCLK,grstn,lrstn)
	begin
		if (grstn = '0') then
			Q_reg <= (others=>'0');
		elsif(lrstn='0')then
			Q_reg <= (others=>'0');
		elsif(rising_edge(PCLK))then
			Q_reg <= data;
		end if;
	end process;

	(Q13,Q12,Q11,Q10,Q9,Q8,Q7,Q6,Q5,Q4,Q3,Q2,Q1,Q0) <= Q_reg;

end Behavioral;


-----------------------------------IDES32-------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.glb.GSRO;

entity IDES32 is
    PORT (
		D,RESET : IN std_logic;
		CALIB : IN std_logic;
		FCLK,PCLK : IN std_logic;
		Q0 : OUT std_logic;
		Q1 : OUT std_logic;
		Q2 : OUT std_logic;
		Q3 : OUT std_logic;
		Q4 : OUT std_logic;
		Q5 : OUT std_logic;
		Q6 : OUT std_logic;
		Q7 : OUT std_logic;
        Q8 : OUT std_logic;
		Q9 : OUT std_logic;
		Q10 : OUT std_logic;
		Q11 : OUT std_logic;
		Q12 : OUT std_logic;
		Q13 : OUT std_logic;
		Q14 : OUT std_logic;
		Q15 : OUT std_logic;
        Q16 : OUT std_logic;
		Q17 : OUT std_logic;
		Q18 : OUT std_logic;
		Q19 : OUT std_logic;
		Q20 : OUT std_logic;
		Q21 : OUT std_logic;
        Q22 : OUT std_logic;
		Q23 : OUT std_logic;
		Q24 : OUT std_logic;
		Q25 : OUT std_logic;
		Q26 : OUT std_logic;
		Q27 : OUT std_logic;
        Q28 : OUT std_logic;
		Q29 : OUT std_logic;
		Q30 : OUT std_logic;
		Q31 : OUT std_logic
    );
end IDES32;

ARCHITECTURE Behavioral of IDES32 is
SIGNAL grstn,lrstn,reset_delay : std_logic;
SIGNAL d0_reg,d1_reg : std_logic;
SIGNAL calib_0,calib_1,calib_2 : std_logic := '0';
SIGNAL dcnt0,dcnt1,dcnt2 : std_logic := '0';
SIGNAL data_sel_en,calib_state_en,dcnt_en,d_up_en : std_logic;
SIGNAL data_sel,calib_state,d_up : std_logic := '0';
signal d0_reg0,d0_reg1,d0_reg2,d0_reg3,d0_reg4,d0_reg5,d0_reg6,d0_reg7,d0_reg8,d0_reg9,d0_reg10,d0_reg11,d0_reg12,d0_reg13,d0_reg14,d0_reg15,d0_reg16,d1_reg0,d1_reg1,d1_reg2,d1_reg3,d1_reg4,d1_reg5,d1_reg6,d1_reg7,d1_reg8,d1_reg9,d1_reg10,d1_reg11,d1_reg12,d1_reg13,d1_reg14,d1_reg15,d1_reg16  : std_logic  := '0';
SIGNAL D_data,data,Q_reg : std_logic_vector(31 downto 0);

begin
	grstn <= GSRO;
	lrstn <= not RESET;
	
	process(FCLK,grstn,lrstn)
	begin
		if(grstn = '0') then
			d0_reg <= '0';
		elsif(lrstn = '0') then
			d0_reg <= '0';
		elsif(rising_edge(FCLK))then
			d0_reg <= D;
		end if;
	end process;

	process(FCLK,grstn,lrstn)
	begin
		if (grstn = '0') then
			d1_reg <= '0';
		elsif (lrstn = '0') then
			d1_reg <= '0';
		elsif(falling_edge(FCLK))then
			d1_reg <= D;
		end if;
	end process;

	process(FCLK,grstn,lrstn)
	begin
		if (grstn='0') then
			reset_delay <= '0';
		elsif (lrstn='0') then
			reset_delay <= '0';
		elsif(rising_edge(FCLK))then
			reset_delay <= '1';
		end if;
	end process;

    process(FCLK,reset_delay)
    begin
        if(reset_delay = '0') then
            calib_0 <= '0';
            calib_1 <= '0';
            calib_2 <= '0';
        elsif(rising_edge(FCLK)) then
            calib_0 <= CALIB;
            calib_1 <= calib_0;
            calib_2 <= calib_1;
        end if;
    end process;

    data_sel_en <= calib_1 and (not calib_2);

    process(FCLK,reset_delay)
    begin
        if(reset_delay = '0') then
            data_sel <= '0';
        elsif(rising_edge(FCLK)) then
            if(data_sel_en = '1') then
                data_sel <= not data_sel;
            else
                data_sel <= data_sel;
            end if;
        end if;
    end process;

    calib_state_en <= data_sel_en;

    process(FCLK,reset_delay)
    begin
        if(reset_delay = '0') then
            calib_state <= '0';
        elsif(rising_edge(FCLK)) then
            if(calib_state_en = '1') then
                calib_state <= not calib_state;
            else
                calib_state <= calib_state;
            end if;
        end if;
    end process;

    dcnt_en <= not(calib_state and calib_state_en);
    
    process(FCLK,reset_delay)
    begin
        if(reset_delay = '0') then
            dcnt0 <= '0';
            dcnt1 <= '0';
            dcnt2 <= '0';
        elsif(rising_edge(FCLK)) then
            if(dcnt_en = '1') then
                dcnt0 <= not dcnt0;
                dcnt1 <= dcnt1 xor dcnt0;
                dcnt2 <= dcnt2 xor (dcnt1 and dcnt0);
            else
                dcnt0 <= dcnt0;
                dcnt1 <= dcnt1;
                dcnt2 <= dcnt2;
            end if;
        end if;
    end process;

    d_up_en <= ((not dcnt2) and dcnt1) and dcnt0;
    
    process(FCLK,reset_delay)
    begin
        if(reset_delay = '0') then
            d_up <= '0';
        elsif(rising_edge(FCLK)) then
            if(d_up_en = '1') then
                d_up <= '1';
            else
                d_up <= '0';
            end if;
        end if;
    end process;

    process(FCLK, grstn, lrstn) 
    begin
		if (grstn='0') then
            d0_reg0 <= '0';
            d0_reg1 <= '0';
            d0_reg2 <= '0';
            d0_reg3 <= '0';
            d0_reg4 <= '0';
            d0_reg5 <= '0';
            d0_reg6 <= '0';
            d0_reg7 <= '0';
            d0_reg8 <= '0';
            d0_reg9 <= '0';
            d0_reg10 <= '0';
            d0_reg11 <= '0';
            d0_reg12 <= '0';
            d0_reg13 <= '0';
            d0_reg14 <= '0';
            d0_reg15 <= '0';
            d0_reg16 <= '0';
            d1_reg0 <= '0';
            d1_reg1 <= '0';
            d1_reg2 <= '0';
            d1_reg3 <= '0';
            d1_reg4 <= '0';
            d1_reg5 <= '0';
            d1_reg6 <= '0';
            d1_reg7 <= '0';
            d1_reg8 <= '0';
            d1_reg9 <= '0';
            d1_reg10 <= '0';
            d1_reg11 <= '0';
            d1_reg12 <= '0';
            d1_reg13 <= '0';
            d1_reg14 <= '0';
            d1_reg15 <= '0';
            d1_reg16 <= '0';
		elsif (lrstn='0') then
            d0_reg0 <= '0';
            d0_reg1 <= '0';
            d0_reg2 <= '0';
            d0_reg3 <= '0';
            d0_reg4 <= '0';
            d0_reg5 <= '0';
            d0_reg6 <= '0';
            d0_reg7 <= '0';
            d0_reg8 <= '0';
            d0_reg9 <= '0';
            d0_reg10 <= '0';
            d0_reg11 <= '0';
            d0_reg12 <= '0';
            d0_reg13 <= '0';
            d0_reg14 <= '0';
            d0_reg15 <= '0';
            d0_reg16 <= '0';
            d1_reg0 <= '0';
            d1_reg1 <= '0';
            d1_reg2 <= '0';
            d1_reg3 <= '0';
            d1_reg4 <= '0';
            d1_reg5 <= '0';
            d1_reg6 <= '0';
            d1_reg7 <= '0';
            d1_reg8 <= '0';
            d1_reg9 <= '0';
            d1_reg10 <= '0';
            d1_reg11 <= '0';
            d1_reg12 <= '0';
            d1_reg13 <= '0';
            d1_reg14 <= '0';
            d1_reg15 <= '0';
            d1_reg16 <= '0';
		elsif(rising_edge(FCLK)) then
            d0_reg0 <= d0_reg;
            d0_reg1 <= d0_reg0;
            d0_reg2 <= d0_reg1;
            d0_reg3 <= d0_reg2;
            d0_reg4 <= d0_reg3;
            d0_reg5 <= d0_reg4;
            d0_reg6 <= d0_reg5;
            d0_reg7 <= d0_reg6;
            d0_reg8 <= d0_reg7;
            d0_reg9 <= d0_reg8;
            d0_reg10 <= d0_reg9;
            d0_reg11 <= d0_reg10;
            d0_reg12 <= d0_reg11;
            d0_reg13 <= d0_reg12;
            d0_reg14 <= d0_reg13;
            d0_reg15 <= d0_reg14;
            d0_reg16 <= d0_reg15;
            d1_reg0 <= d1_reg;
            d1_reg1 <= d1_reg0;
            d1_reg2 <= d1_reg1;
            d1_reg3 <= d1_reg2;
            d1_reg4 <= d1_reg3;
            d1_reg5 <= d1_reg4;
            d1_reg6 <= d1_reg5;
            d1_reg7 <= d1_reg6;
            d1_reg8 <= d1_reg7;
            d1_reg9 <= d1_reg8;
            d1_reg10 <= d1_reg9;
            d1_reg11 <= d1_reg10;
            d1_reg12 <= d1_reg11;
            d1_reg13 <= d1_reg12;
            d1_reg14 <= d1_reg13;
            d1_reg15 <= d1_reg14;
            d1_reg16 <= d1_reg15;
        end if;
    end process;

    process(data_sel, d0_reg0, d0_reg1, d0_reg2, d0_reg3, d0_reg4, d0_reg5, d0_reg6, d0_reg7,d0_reg8,d0_reg9,d0_reg10,d0_reg11,d0_reg12,d0_reg13,d0_reg14,d0_reg15,d0_reg16, d1_reg0, d1_reg1, d1_reg2, d1_reg3, d1_reg4, d1_reg5, d1_reg6, d1_reg7,d1_reg8,d1_reg9,d1_reg10,d1_reg11,d1_reg12,d1_reg13,d1_reg14,d1_reg15,d1_reg16) 
    begin
        if(data_sel = '1') then
            D_data(31) <= d0_reg0;
            D_data(30) <= d1_reg1;
            D_data(29) <= d0_reg1;
            D_data(28) <= d1_reg2;
            D_data(27) <= d0_reg2;
            D_data(26) <= d1_reg3;
            D_data(25) <= d0_reg3;
            D_data(24) <= d1_reg4;
            D_data(23) <= d0_reg4;
            D_data(22) <= d1_reg5;
            D_data(21) <= d0_reg5;
            D_data(20) <= d1_reg6;
            D_data(19) <= d0_reg6;
            D_data(18) <= d1_reg7;
            D_data(17) <= d0_reg7;
            D_data(16) <= d1_reg8;
            D_data(15) <= d0_reg8;
            D_data(14) <= d1_reg9;
            D_data(13) <= d0_reg9;
            D_data(12) <= d1_reg10;
            D_data(11) <= d0_reg10;
            D_data(10) <= d1_reg11;
            D_data(9) <= d0_reg11;
            D_data(8) <= d1_reg12;
            D_data(7) <= d0_reg12;
            D_data(6) <= d1_reg13;
            D_data(5) <= d0_reg13;
            D_data(4) <= d1_reg14;
            D_data(3) <= d0_reg14;
            D_data(2) <= d1_reg15;
            D_data(1) <= d0_reg15;
            D_data(0) <= d1_reg16;
        else
            D_data(31) <= d1_reg1;
            D_data(30) <= d0_reg1;
            D_data(29) <= d1_reg2;
            D_data(28) <= d0_reg2;
            D_data(27) <= d1_reg3;
            D_data(26) <= d0_reg3;
            D_data(25) <= d1_reg4;
            D_data(24) <= d0_reg4;
            D_data(23) <= d1_reg5;
            D_data(22) <= d0_reg5;
            D_data(21) <= d1_reg6;
            D_data(20) <= d0_reg6;
            D_data(19) <= d1_reg7;
            D_data(18) <= d0_reg7;
            D_data(17) <= d1_reg8;
            D_data(16) <= d0_reg8;
            D_data(15) <= d1_reg9;
            D_data(14) <= d0_reg9;
            D_data(13) <= d1_reg10;
            D_data(12) <= d0_reg10;
            D_data(11) <= d1_reg11;
            D_data(10) <= d0_reg11;
            D_data(9) <= d1_reg12;
            D_data(8) <= d0_reg12;
            D_data(7) <= d1_reg13;
            D_data(6) <= d0_reg13;
            D_data(5) <= d1_reg14;
            D_data(4) <= d0_reg14;
            D_data(3) <= d1_reg15;
            D_data(2) <= d0_reg15;
            D_data(1) <= d1_reg16;
            D_data(0) <= d0_reg16;
        end if;
    end process;
	
	process(FCLK,grstn,lrstn)
	begin
		if (grstn = '0') then
			data <= (others=>'0');
		elsif(lrstn = '0')then
			data <= (others=>'0');
		elsif(rising_edge(FCLK))then
			if(d_up = '1') then
				data <= D_data;
			end if;
		end if;
	end process;

	process(PCLK,grstn,lrstn)
	begin
		if (grstn = '0') then
			Q_reg <= (others=>'0');
		elsif(lrstn='0')then
			Q_reg <= (others=>'0');
		elsif(rising_edge(PCLK))then
			Q_reg <= data;
		end if;
	end process;

	(Q31, Q30, Q29, Q28, Q27, Q26, Q25, Q24, Q23, Q22, Q21, Q20, Q19, Q18, Q17, Q16, Q15,Q14,Q13,Q12,Q11,Q10,Q9,Q8,Q7,Q6,Q5,Q4,Q3,Q2,Q1,Q0) <= Q_reg;

end Behavioral;


-------------------------OSER4------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity OSER4 is
	GENERIC (
        HWL : string := "false"; --"true"; "false"
        TXCLK_POL : bit := '0' --'0':Rising edge output; '1':Falling edge output
	);
	PORT (
		D0 : in std_logic;
		D1 : in std_logic;
		D2 : in std_logic;
		D3 : in std_logic;
		TX0 : in std_logic;
		TX1 : in std_logic;
		PCLK : in std_logic;
		RESET : in std_logic;
		FCLK : in std_logic;
		Q0 : OUT std_logic;
		Q1 : OUT std_logic
	);
end OSER4;

architecture Behavioral of OSER4 is

	SIGNAL d_reg0,d_reg1,d_reg2 : std_logic_vector(3 downto 0);
	SIGNAL tx_reg0,tx_reg1,tx_reg2 : std_logic_vector(1 downto 0);
	SIGNAL rstn_dsel,d_up0,d_up1 : std_logic;
	SIGNAL dsel : std_logic := '0';	
    SIGNAL d_en0,d_en1 : std_logic;
	SIGNAL d_reg_n,tx_reg_n,d_reg_p,tx_reg_p : std_logic;
	SIGNAL grstn,lrstn : std_logic;
		
begin
	grstn <= GSRO;
	lrstn <= (not RESET);	 

	process(PCLK, grstn, lrstn)
	begin
		if(grstn = '0') then
			d_reg0 <= "0000";
			tx_reg0 <= "00";
		elsif (lrstn='0') then
			d_reg0 <= "0000";
			tx_reg0 <= "00";
		elsif (PCLK'event and PCLK ='1' ) then
			d_reg0 <= (D3,D2,D1,D0);
			tx_reg0 <= (TX1,TX0);
		end if;
	end process;

	process(FCLK, grstn, lrstn)
		begin
		if(grstn = '0') then
			rstn_dsel <= '0';
		elsif(lrstn = '0') then
			rstn_dsel <= '0';
		elsif(FCLK'event and FCLK = '1') then
			rstn_dsel <= '1';
		end if;
	end process;

    process(FCLK, rstn_dsel)
	begin
		if(rstn_dsel = '0') then
			dsel <= '0';
		elsif(FCLK'event and FCLK = '1') then
			dsel <= (not dsel);
		end if;
	end process;
    
    d_en0 <= not dsel;
    d_en1 <= (not dsel) when (HWL = "true") else dsel;

    process(FCLK, rstn_dsel)
	begin
		if(rstn_dsel = '0') then
			d_up0 <= '0';
			d_up1 <= '0';
		elsif(FCLK'event and FCLK = '1') then
            if(d_en0 = '1') then
                d_up0 <= '1';
            else
                d_up0 <= '0';
            end if;

            if(d_en1 = '1') then
                d_up1 <= '1';
            else
                d_up1 <= '0';
            end if;
		end if;
	end process;

	process(FCLK, grstn, lrstn)
	begin
		if(grstn = '0') then
			d_reg1 <= "0000";
			tx_reg1 <= "00";
		elsif(lrstn = '0') then
			d_reg1 <= "0000";
			tx_reg1 <= "00";
		elsif(FCLK'event and FCLK = '1') then
			if (d_up0 = '1') then
				d_reg1 <= d_reg0;
				tx_reg1 <= tx_reg0;
            else
                d_reg1 <= d_reg1;
                tx_reg1 <= tx_reg1;
			end if;
		end if;
	end process;

	process(FCLK, grstn, lrstn)
	begin
		if(grstn = '0') then
			d_reg2 <= "0000";
			tx_reg2 <= "00";
		elsif(lrstn = '0') then
			d_reg2 <= "0000";
			tx_reg2 <= "00";
		elsif(FCLK'event and FCLK = '1') then 
			if (d_up1 = '1') then
				d_reg2 <= d_reg1;
				tx_reg2 <= tx_reg1;
			else 
				d_reg2 <= "00" & d_reg2(3 downto 2);
				tx_reg2 <= '0' & tx_reg2(1);
			end if;
		end if;
	end process;

	process(FCLK, grstn, lrstn)
	begin
		if(grstn = '0') then
			d_reg_p <= '0';
			tx_reg_p <= '0';
		elsif (lrstn = '0') then
			d_reg_p <= '0';
			tx_reg_p <= '0';
		elsif (FCLK'event and FCLK = '1') then 
			d_reg_p <= d_reg2(1);
			tx_reg_p <= tx_reg_n;
		end if;
	end process;

	process(FCLK, grstn, lrstn)
	begin
		if(grstn='0') then
			d_reg_n <= '0';
            tx_reg_n <= '0'; 
		elsif(lrstn='0') then
			d_reg_n <= '0';
            tx_reg_n <= '0'; 
		elsif(FCLK'event and FCLK = '0') then
			d_reg_n <= d_reg2(0);
            tx_reg_n <= tx_reg2(0);
		end if;
	end process;

	Q0 <= d_reg_n when FCLK = '1' else d_reg_p;
    Q1 <= tx_reg_p when (TXCLK_POL = '0') else tx_reg_n;
	
end Behavioral;

-----------------OSER4_MEM--------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity OSER4_MEM is
	GENERIC (
		HWL : string := "false";
        TXCLK_POL : bit := '0';--'0':Rising edge output; '1':Falling edge output
        TCLK_SOURCE : string := "DQSW"    
	);
	PORT (
		D0 : in std_logic;
		D1 : in std_logic;
		D2 : in std_logic;
		D3 : in std_logic;
		TX0 : in std_logic;
		TX1 : in std_logic;
		PCLK : in std_logic;
		RESET : in std_logic;
		FCLK : in std_logic;
		TCLK : in std_logic;
		Q0 : OUT std_logic;
		Q1 : OUT std_logic
	);
end OSER4_MEM;

architecture Behavioral of OSER4_MEM is
	SIGNAL d_reg0,d_reg1,d_reg2 : std_logic_vector(3 downto 0);
	SIGNAL tx_reg0,tx_reg1,tx_reg2 : std_logic_vector(1 downto 0);
	SIGNAL rstn_dsel0,d_up0,rstn_dsel1,d_up1 : std_logic;
	SIGNAL dsel0,dsel1 : std_logic := '0';
	SIGNAL d_en0,d_en1 : std_logic;
	SIGNAL d_reg_n,tx_reg_n,d_reg_p,tx_reg_p : std_logic;
    signal tclk_sig : std_logic;
	SIGNAL grstn: std_logic;
	SIGNAL lrstn: std_logic;
begin
	grstn <= GSRO;
	lrstn <= not RESET;
    tclk_sig <= TCLK when (TCLK_SOURCE = "DQSW") else (not TCLK);

	process(PCLK, grstn, lrstn)
	begin
		if(grstn = '0') then
			d_reg0 <= "0000";
			tx_reg0 <= "00";
		elsif(lrstn = '0') then
			d_reg0 <= "0000";
			tx_reg0 <= "00";
		elsif(PCLK'event and PCLK = '1') then 
			d_reg0 <= (D3,D2,D1,D0);
			tx_reg0 <= (TX1,TX0);
		end if;
	end process;

    process(FCLK, grstn, lrstn)
		begin
		if(grstn = '0') then
			rstn_dsel0 <= '0';
		elsif(lrstn = '0') then
			rstn_dsel0 <= '0';
		elsif(FCLK'event and FCLK = '1') then
			rstn_dsel0 <= '1';
		end if;
	end process;

    process(FCLK, rstn_dsel0)
	begin
		if(rstn_dsel0 = '0') then
			dsel0 <= '0';
		elsif(FCLK'event and FCLK = '1') then
			dsel0 <= (not dsel0);
		end if;
	end process;
    
    d_en0 <= not dsel0;

    process(FCLK, rstn_dsel0)
	begin
		if(rstn_dsel0 = '0') then
			d_up0 <= '0';
		elsif(FCLK'event and FCLK = '1') then
            if(d_en0 = '1') then
                d_up0 <= '1';
            else
                d_up0 <= '0';
            end if;
		end if;
	end process;

    process(tclk_sig, grstn, lrstn)
		begin
		if(grstn = '0') then
			rstn_dsel1 <= '0';
		elsif(lrstn = '0') then
			rstn_dsel1 <= '0';
		elsif(tclk_sig'event and tclk_sig = '1') then
			rstn_dsel1 <= '1';
		end if;
	end process;

    process(tclk_sig, rstn_dsel1)
	begin
		if(rstn_dsel1 = '0') then
			dsel1 <= '0';
		elsif(tclk_sig'event and tclk_sig = '1') then
			dsel1 <= (not dsel1);
		end if;
	end process;

    d_en1 <= (not dsel1) when (HWL = "true") else dsel1;

    process(tclk_sig, rstn_dsel1)
	begin
		if(rstn_dsel1 = '0') then
			d_up1 <= '0';
		elsif(tclk_sig'event and tclk_sig = '1') then
            if(d_en1 = '1') then
                d_up1 <= '1';
            else
                d_up1 <= '0';
            end if;
		end if;
	end process;

	process(FCLK, grstn, lrstn)
	begin
		if(grstn = '0') then
			d_reg1 <= "0000";
			tx_reg1 <= "00";
		elsif(lrstn = '0') then
			d_reg1 <= "0000";
			tx_reg1 <= "00";
		elsif(FCLK'event and FCLK = '1') then
			if(d_up0 = '1') then
				d_reg1 <= d_reg0;
				tx_reg1 <= tx_reg0;
            else 
                d_reg1 <= d_reg1;
				tx_reg1 <= tx_reg1;
			end if;
		end if;
	end process;
	
	process(tclk_sig, grstn, lrstn)
	begin
		if(grstn = '0') then
			d_reg2 <= "0000";
			tx_reg2 <= "00";
		elsif(lrstn = '0') then
			d_reg2 <= "0000";
			tx_reg2 <= "00";
		elsif(tclk_sig'event and tclk_sig = '1') then 
			if(d_up1 = '1') then
				d_reg2 <= d_reg1;
				tx_reg2 <= tx_reg1;
			else
				d_reg2 <= "00"&d_reg2(3 downto 2);
				tx_reg2 <= "0"&tx_reg2(1);
			end if;
		end if;
	end process;

	process(tclk_sig, grstn, lrstn)
	begin
		if (grstn = '0') then
			d_reg_p <= '0';
			tx_reg_p <= '0';
		elsif (lrstn = '0') then
			d_reg_p <= '0';
			tx_reg_p <= '0';
		elsif (tclk_sig'event and tclk_sig = '1') then 
			d_reg_p <= d_reg2(1);
			tx_reg_p <= tx_reg_n;
		end if;
	end process;

	process(tclk_sig, grstn, lrstn)
	begin
		if (grstn = '0') then
			d_reg_n <= '0';
			tx_reg_n <= '0';
		elsif (lrstn = '0') then
			d_reg_n <= '0';
			tx_reg_n <= '0';
		elsif (tclk_sig'event and tclk_sig = '0') then
			d_reg_n <= d_reg2(0);
			tx_reg_n <= tx_reg2(0);
		end if;
	end process;

	Q0 <= d_reg_n when tclk_sig  = '1' else d_reg_p;
    Q1 <= tx_reg_p when (TXCLK_POL = '0') else tx_reg_n;    

end Behavioral;

--------------------OVIDEO----------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.glb.GSRO;

entity OVIDEO is
	PORT (
		D0 : in std_logic;
		D1 : in std_logic;
		D2 : in std_logic;
		D3 : in std_logic;
		D4 : in std_logic;
		D5 : in std_logic;
		D6 : in std_logic;
		PCLK : in std_logic;
		RESET : in std_logic;
		FCLK : in std_logic;
		Q : OUT std_logic
	);
end OVIDEO;

architecture Behavioral of OVIDEO is
	SIGNAL d_reg0 : std_logic_vector(6 downto 0);
	SIGNAL d_reg1,d_reg2,d_reg3 : std_logic_vector(7 downto 0);
	SIGNAL rstn_dsel : std_logic;
	SIGNAL dcnt0,dcnt1,dsel : std_logic := '0';
	SIGNAL dsel_en,dcnt_reset,d_en0,d_en1 : std_logic;
	SIGNAL d_up0,d_up1 : std_logic;
	SIGNAL d_reg_p,d_reg_n : std_logic;
	SIGNAL grstn: std_logic;
	SIGNAL lrstn: std_logic;

begin
	grstn <= GSRO;
	lrstn <= (not RESET);

	process(PCLK, grstn, lrstn)
	begin
		if(grstn = '0') then
			d_reg0 <= "0000000";
		elsif(lrstn = '0') then
			d_reg0 <= "0000000";
		elsif(PCLK'event and PCLK = '1') then 
			d_reg0 <= (D6,D5,D4,D3,D2,D1,D0);
		end if;
	end process;

	process(FCLK, grstn, lrstn)
	begin
		if(grstn = '0') then
			rstn_dsel <= '0';
		elsif(lrstn = '0') then
			rstn_dsel <= '0';
		elsif(FCLK'event and FCLK = '1')then
			rstn_dsel <= '1';
		end if;
	end process;

    process(FCLK, rstn_dsel)
	begin
		if(rstn_dsel = '0') then
			dcnt0 <= '0';
			dcnt1 <= '0';
		elsif(FCLK'event and FCLK = '1') then
			dcnt0 <= not (dcnt0 or dcnt_reset);
			dcnt1 <= not((dcnt0 xnor dcnt1) or dcnt_reset);
		end if;
	end process;

    dsel_en <= (dsel and dcnt1 and (not dcnt0)) or ((not dsel) and dcnt1 and dcnt0);

    process(FCLK, rstn_dsel)
	begin
		if(rstn_dsel = '0') then
			dsel <= '0';
		elsif(FCLK'event and FCLK = '1') then
            if(dsel_en = '1') then
			    dsel <= not dsel;
            else
			    dsel <= dsel;
            end if;
		end if;
	end process;

    dcnt_reset <= (not dcnt0) and dcnt1 and dsel;
    d_en0 <= ((not dsel) and (not dcnt1) and dcnt0) or (dsel and (not dcnt1) and (not dcnt0));

    process(FCLK, rstn_dsel)
	begin
		if(rstn_dsel = '0') then
			d_up0 <= '0';
		elsif(FCLK'event and FCLK = '1') then
            if(d_en0 = '1') then
			    d_up0 <= '1';
            else
			    d_up0 <= '0';
            end if;
		end if;
	end process;

    d_en1 <= ((not dsel) and dcnt1 and (not dcnt0)) or (dsel and (not dcnt1) and dcnt0);

    process(FCLK, rstn_dsel)
	begin
		if(rstn_dsel = '0') then
			d_up1 <= '0';
		elsif(FCLK'event and FCLK = '1') then
            if(d_en1 = '1') then
			    d_up1 <= '1';
            else
			    d_up1 <= '0';
            end if;
		end if;
	end process;

    process(d_reg0, d_reg2, dsel)
    begin
        if(dsel = '1') then 
            d_reg1(0) <= d_reg2(6);
            d_reg1(1) <= d_reg0(0);
            d_reg1(2) <= d_reg0(1);
            d_reg1(3) <= d_reg0(2);
            d_reg1(4) <= d_reg0(3);
            d_reg1(5) <= d_reg0(4);
            d_reg1(6) <= d_reg0(5);
            d_reg1(7) <= d_reg0(6);
        else
            d_reg1(0) <= d_reg0(0);
            d_reg1(1) <= d_reg0(1);
            d_reg1(2) <= d_reg0(2);
            d_reg1(3) <= d_reg0(3);
            d_reg1(4) <= d_reg0(4);
            d_reg1(5) <= d_reg0(5);
            d_reg1(6) <= d_reg0(6);
            d_reg1(7) <= '0';
        end if;
    end process;

	process(FCLK, grstn, lrstn)
	begin
		if(grstn = '0') then
			d_reg2 <= "00000000";
		elsif(lrstn = '0') then
			d_reg2 <= "00000000";
		elsif(FCLK'event and FCLK = '1')then
		   	if(d_up0 = '1') then
				d_reg2 <= d_reg1;
            else
				d_reg2 <= d_reg2;
			end if;
		end if;
	end process;

	process(FCLK, grstn, lrstn)
	begin
		if(grstn = '0') then
			d_reg3 <= "00000000";
		elsif(lrstn = '0') then
			d_reg3 <= "00000000";
		elsif(FCLK'event and FCLK = '1')then
			if (d_up1 = '1') then
				d_reg3 <= d_reg2;
			else
				d_reg3 <= "00"&d_reg3(7 downto 2);
			end if;
		end if;		
	end process;

	process (FCLK, grstn, lrstn)
	begin
		if (grstn = '0') then
			d_reg_p <= '0';
		elsif (lrstn = '0') then
			d_reg_p <= '0';
		elsif (FCLK 'event and FCLK = '1') then 
			d_reg_p <= d_reg3(1);
		end if;
	end process;

	process (FCLK, grstn, lrstn)
	begin
		if (grstn = '0') then
			d_reg_n <= '0';
		elsif (lrstn = '0') then
			d_reg_n <= '0';
		elsif (FCLK 'event and FCLK = '0') then
			d_reg_n <= d_reg3(0);
		end if;
	end process;

	Q <= d_reg_n when FCLK = '1' else d_reg_p;

end Behavioral;

--------------------OSER8-----------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.glb.GSRO;

entity OSER8 is
    GENERIC (
        HWL : string := "false";
        TXCLK_POL : bit := '0' --'0':Rising edge output; '1':Falling edge output
    );
    PORT (
       	D0 : in std_logic;
       	D1 : in std_logic;
       	D2 : in std_logic;
       	D3 : in std_logic;
       	D4 : in std_logic;
      	D5 : in std_logic;
       	D6 : in std_logic;
       	D7 : in std_logic;
       	TX0 : in std_logic;
    	TX1 : in std_logic;
	    TX2 : in std_logic;
	    TX3 : in std_logic;
	    PCLK : in std_logic;
	    RESET : in std_logic;
    	FCLK : in std_logic;
       	Q0 : OUT std_logic;
       	Q1 : OUT std_logic
    );
end OSER8;

architecture Behavioral of OSER8 is
   	SIGNAL d_reg0,d_reg1,d_reg2 : std_logic_vector(7 downto 0);
   	SIGNAL tx_reg0,tx_reg1,tx_reg2 : std_logic_vector(3 downto 0);
   	SIGNAL rstn_dsel,d_up0,d_up1 : std_logic;
   	SIGNAL dcnt0,dcnt1 : std_logic := '0';
   	SIGNAL d_en0,d_en1 : std_logic;
  	SIGNAL d_reg_p,d_reg_n,tx_reg_p,tx_reg_n : std_logic;
    SIGNAL grstn,lrstn: std_logic;

begin
	grstn <= GSRO;
	lrstn <= (not RESET);	 

	process(PCLK, grstn, lrstn)
	begin
		if(grstn = '0') then
			d_reg0  <= "00000000";
			tx_reg0 <= "0000";
		elsif(lrstn = '0') then
			d_reg0  <= "00000000";
			tx_reg0 <= "0000";
		elsif(PCLK 'event and PCLK = '1') then 
			d_reg0  <= (D7, D6, D5, D4, D3, D2, D1, D0);
			tx_reg0 <= (TX3, TX2, TX1, TX0);
		end if;
	end process;

	process(FCLK, grstn, lrstn)
	begin
		if(grstn = '0') then
			rstn_dsel <= '0';
		elsif(lrstn = '0') then
			rstn_dsel <= '0';
		elsif(FCLK 'event and FCLK = '1') then
			rstn_dsel <= '1';
		end if;
	end process;

    process(FCLK, rstn_dsel)
	begin
		if(rstn_dsel = '0') then
			dcnt0 <= '0';
			dcnt1 <= '0';
		elsif(FCLK 'event and FCLK = '1') then
			dcnt0 <= not dcnt0;
			dcnt1 <= dcnt0 xor dcnt1;
		end if;
	end process;

    d_en0 <= dcnt0 and (not dcnt1);
    d_en1 <= (dcnt0 and (not dcnt1)) when (HWL = "true") else ((not dcnt0) and (not dcnt1));

    process(FCLK, rstn_dsel)
	begin
		if(rstn_dsel = '0') then
			d_up0 <= '0';
			d_up1 <= '0';
		elsif(FCLK 'event and FCLK = '1') then
            if(d_en0 = '1') then
			    d_up0 <= '1';
            else 
                d_up0 <= '0';
            end if;

            if(d_en1 = '1') then
			    d_up1 <= '1';
            else 
                d_up1 <= '0';
            end if;
		end if;
	end process;


	process(FCLK, grstn, lrstn)
	begin
		if (grstn = '0') then
			d_reg1  <= "00000000";
			tx_reg1 <= "0000";
		elsif(lrstn = '0') then
			d_reg1  <= "00000000";
			tx_reg1 <= "0000";
		elsif(FCLK'event and FCLK = '1') then
			if(d_up0 = '1') then
				d_reg1  <= d_reg0;
				tx_reg1 <= tx_reg0;
            else
                d_reg1  <= d_reg1;
				tx_reg1 <= tx_reg1;
			end if;
		end if;
	end process;

	process(FCLK, grstn, lrstn)
	begin
		if(grstn = '0') then
			d_reg2  <= "00000000";
			tx_reg2 <= "0000";
		elsif(lrstn = '0') then
			d_reg2  <= "00000000";
			tx_reg2 <= "0000";
		elsif(FCLK 'event and FCLK = '1') then
			if(d_up1 = '1') then
				d_reg2  <= d_reg1;
				tx_reg2 <= tx_reg1;
			else 
				d_reg2  <= "00"&d_reg2(7 downto 2);
				tx_reg2 <= '0'&tx_reg2(3 downto 1);
			end if;
		end if;
	end process;

	process(FCLK, grstn, lrstn)
	begin
		if(grstn = '0') then
			d_reg_p <= '0';
			tx_reg_p <= '0';
		elsif(lrstn = '0') then
			d_reg_p <= '0';
			tx_reg_p <= '0';
		elsif(FCLK 'event and FCLK = '1') then 
			d_reg_p <= d_reg2(1);
			tx_reg_p <= tx_reg_n;
		end if;
	end process;

	process(FCLK, grstn, lrstn)
	begin
		if(grstn = '0') then
			d_reg_n <= '0';
			tx_reg_n <= '0';
		elsif(lrstn = '0') then
			d_reg_n <= '0';
			tx_reg_n <= '0';
		elsif(FCLK 'event and FCLK = '0') then
			d_reg_n <= d_reg2(0);
            tx_reg_n <= tx_reg2(0);
		end if;
	end process;

	Q0 <= d_reg_n when FCLK = '1' else d_reg_p;
    Q1 <= tx_reg_p when (TXCLK_POL = '0') else tx_reg_n;

end Behavioral;

-----------------OSER8_MEM--------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.glb.GSRO;

entity OSER8_MEM is
	GENERIC(
		HWL : string := "false";
        TXCLK_POL : bit := '0';
        TCLK_SOURCE : string := "DQSW"
	);
	PORT (
		D0 : in std_logic;
		D1 : in std_logic;
		D2 : in std_logic;
		D3 : in std_logic;
		D4 : in std_logic;
		D5 : in std_logic;
		D6 : in std_logic;
		D7 : in std_logic;
		TX0 : in std_logic;
		TX1 : in std_logic;
		TX2 : in std_logic;
		TX3 : in std_logic;
		PCLK : in std_logic;
		RESET : in std_logic;
		FCLK : in std_logic;
		TCLK : in std_logic;
		Q0 : OUT std_logic;
		Q1 : OUT std_logic
	);
end OSER8_MEM;

architecture Behavioral of OSER8_MEM is

	SIGNAL d_reg0,d_reg1,d_reg2 : std_logic_vector(7 downto 0);
	SIGNAL tx_reg0,tx_reg1,tx_reg2 : std_logic_vector(3 downto 0);
	SIGNAL rstn_dsel0,d_up0,rstn_dsel1,d_up1 : std_logic;
	SIGNAL dcnt0,dcnt1,hcnt0,hcnt1 : std_logic := '0';
	SIGNAL d_en0,d_en1 : std_logic;
	SIGNAL d_reg_p,d_reg_n,tx_reg_p,tx_reg_n : std_logic;
    signal tclk_sig : std_logic;
	SIGNAL grstn: std_logic;
	SIGNAL lrstn: std_logic;

begin
	grstn <= GSRO;
	lrstn <= not RESET;
    tclk_sig <= TCLK when (TCLK_SOURCE = "DQSW") else (not TCLK);    
	
	process(PCLK, grstn, lrstn)
	begin
		if(grstn = '0') then
			d_reg0 <= "00000000";
			tx_reg0 <= "0000";
		elsif(lrstn = '0') then
			d_reg0 <= "00000000";
			tx_reg0 <= "0000";
		elsif(PCLK 'event and PCLK = '1') then 
			d_reg0 <= (D7,D6,D5,D4,D3,D2,D1,D0);
			tx_reg0 <= (TX3,TX2,TX1,TX0);
		end if;
	end process;

	process(FCLK, grstn, lrstn)
	begin
		if(grstn='0') then
			rstn_dsel0 <= '0';
		elsif (lrstn='0') then
			rstn_dsel0 <= '0';
		elsif (FCLK 'event and FCLK = '1') then
			rstn_dsel0 <= '1';
		end if;
	end process;

    process(FCLK, rstn_dsel0)
	begin
		if(rstn_dsel0='0') then
			dcnt0 <= '0';
			dcnt1 <= '0';
		elsif (FCLK 'event and FCLK = '1') then
			dcnt0 <= not dcnt0;
            dcnt1 <= dcnt0 xor dcnt1;
		end if;
	end process;

    d_en0 <= dcnt0 and (not dcnt1);

    process(FCLK, rstn_dsel0)
	begin
		if(rstn_dsel0='0') then
			d_up0 <= '0';
		elsif (FCLK 'event and FCLK = '1') then
            if(d_en0 = '1') then
			    d_up0 <= '1';
            else
                d_up0 <= '0';
            end if;
		end if;
	end process;

    process(tclk_sig, grstn, lrstn)
	begin
		if(grstn='0') then
			rstn_dsel1 <= '0';
		elsif (lrstn='0') then
			rstn_dsel1 <= '0';
		elsif (tclk_sig 'event and tclk_sig = '1') then
			rstn_dsel1 <= '1';
		end if;
	end process;

    process(tclk_sig, rstn_dsel1)
	begin
		if(rstn_dsel1='0') then
			hcnt0 <= '0';
			hcnt1 <= '0';
		elsif (tclk_sig 'event and tclk_sig = '1') then
			hcnt0 <= not hcnt0;
            hcnt1 <= hcnt0 xor hcnt1;
		end if;
	end process;

    d_en1 <= (hcnt0 and (not hcnt1)) when (HWL = "true") else ((not hcnt0) and (not hcnt1));

    process(tclk_sig, rstn_dsel1)
	begin
		if(rstn_dsel1='0') then
			d_up1 <= '0';
		elsif (tclk_sig 'event and tclk_sig = '1') then
            if(d_en1 = '1') then
			    d_up1 <= '1';
            else
                d_up1 <= '0';
            end if;
		end if;
	end process;

	process(FCLK, grstn, lrstn)
	begin
		if(grstn = '0') then
			d_reg1 <= "00000000";
			tx_reg1 <= "0000";
		elsif(lrstn = '0') then
			d_reg1 <= "00000000";
			tx_reg1 <= "0000";
		elsif(FCLK 'event and FCLK = '1') then
			if(d_up0 = '1') then
				d_reg1 <= d_reg0;
				tx_reg1 <= tx_reg0;
            else
                d_reg1 <= d_reg1;
				tx_reg1 <= tx_reg1;
			end if;
		end if;
	end process;

	process(tclk_sig, grstn, lrstn)
	begin
		if(grstn = '0') then
			d_reg2 <= "00000000";
			tx_reg2 <= "0000";
		elsif(lrstn = '0') then
			d_reg2 <= "00000000";
			tx_reg2 <= "0000";
		elsif(tclk_sig 'event and tclk_sig = '1') then
			if(d_up1 = '1') then
				d_reg2 <= d_reg1;
				tx_reg2 <= tx_reg1;
			else
				d_reg2 <= "00"&d_reg2(7 downto 2);
				tx_reg2 <= '0'&tx_reg2(3 downto 1);
			end if;
		end if;
	end process;

	process(tclk_sig, grstn, lrstn)
	begin
		if(grstn = '0') then
			d_reg_p <= '0';
			tx_reg_p <= '0';
		elsif(lrstn = '0') then
			d_reg_p <= '0';
			tx_reg_p <= '0';
		elsif(tclk_sig 'event and tclk_sig = '1') then
			d_reg_p <= d_reg2(1);
			tx_reg_p <= tx_reg_n;
		end if;
	end process;

	process(tclk_sig, grstn, lrstn)
	begin
		if(grstn = '0') then
			d_reg_n <= '0';
			tx_reg_n <= '0';
		elsif(lrstn = '0') then
			d_reg_n <= '0';
			tx_reg_n <= '0';
		elsif(tclk_sig 'event and tclk_sig = '0') then
			d_reg_n <= d_reg2(0);
            tx_reg_n <= tx_reg2(0);
		end if;
	end process;

	Q0 <= d_reg_n when tclk_sig = '1' else d_reg_p;
    Q1 <= tx_reg_p when (TXCLK_POL = '0') else tx_reg_n;
		
end Behavioral;

--------------------OSER10-----------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.glb.GSRO;

entity OSER10 is
	PORT (
		D0 : in std_logic;
		D1 : in std_logic;
		D2 : in std_logic;
		D3 : in std_logic;
		D4 : in std_logic;
		D5 : in std_logic;
		D6 : in std_logic;
		D7 : in std_logic;
		D8 : in std_logic;
		D9 : in std_logic;
		PCLK : in std_logic;
		RESET : in std_logic;
		FCLK : in std_logic;
		Q : OUT std_logic
	);
end OSER10;

architecture Behavioral of OSER10 is
	SIGNAL d_reg0,d_reg1,d_reg2 : std_logic_vector(9 downto 0);
	SIGNAL rstn_dsel,d_up0,d_up1 : std_logic;
	SIGNAL dcnt0,dcnt1,dcnt2 : std_logic := '0';
	SIGNAL d_en,dcnt_reset : std_logic;
	SIGNAL d_reg_p,d_reg_n : std_logic;
	SIGNAL grstn: std_logic;
	SIGNAL lrstn: std_logic;
begin
	grstn <= GSRO;
	lrstn <= (not RESET);	 
	
	process(PCLK, grstn, lrstn)
	begin
		if(grstn = '0') then
			d_reg0 <= "0000000000";
		elsif(lrstn='0') then
			d_reg0 <= "0000000000";
		elsif(PCLK 'event and PCLK = '1') then
			d_reg0 <= (D9,D8,D7,D6,D5,D4,D3,D2,D1,D0);
		end if;
	end process;

	process(FCLK, grstn, lrstn)
	begin
		if(grstn='0') then
			rstn_dsel <= '0';
		elsif(lrstn='0') then
			rstn_dsel <= '0';
		elsif(FCLK 'event and FCLK = '1') then
			rstn_dsel <= '1';
		end if;
	end process;

    process(FCLK, rstn_dsel)
	begin
		if(rstn_dsel='0') then
			dcnt0 <= '0';
			dcnt1 <= '0';
			dcnt2 <= '0';
		elsif(FCLK 'event and FCLK = '1') then
			dcnt0 <= not(dcnt0 or dcnt_reset);
            dcnt1 <= (dcnt0 xor dcnt1) and (not dcnt_reset);
            dcnt2 <= (dcnt2 xor (dcnt0 and dcnt1)) and (not dcnt_reset);
		end if;
	end process;

    dcnt_reset <= (not dcnt0) and (not dcnt1) and dcnt2;
    d_en <= (not dcnt0) and dcnt1;

    process(FCLK, rstn_dsel)
	begin
		if(rstn_dsel='0') then
			d_up0 <= '0';
			d_up1 <= '0';
		elsif(FCLK 'event and FCLK = '1') then
            if(d_en = '1') then
                d_up0 <= '1';
                d_up1 <= '1';
            else
                d_up0 <= '0';
                d_up1 <= '0';
            end if;
		end if;
	end process;

	process(FCLK, grstn, lrstn)
	begin
		if(grstn='0') then
			d_reg1 <= "0000000000";
		elsif(lrstn='0') then
			d_reg1 <= "0000000000";
		elsif(FCLK 'event and FCLK = '1') then
			if(d_up0 = '1') then
				d_reg1 <= d_reg0;
            else 
                d_reg1 <= d_reg1;
			end if;
		end if;
	end process;

	process(FCLK, grstn, lrstn)
	begin
		if(grstn='0') then
			d_reg2 <= "0000000000";
		elsif(lrstn='0') then
			d_reg2 <= "0000000000";
		elsif(FCLK 'event and FCLK = '1') then
			if(d_up1 = '1') then
				d_reg2 <= d_reg1;
			else
				d_reg2 <= "00"&d_reg2(9 downto 2);
			end if;
		end if;
	end process;

	process(FCLK, grstn, lrstn)
	begin
		if(grstn='0') then
			d_reg_p <= '0';
		elsif(lrstn='0') then
			d_reg_p <= '0';
		elsif(FCLK 'event and FCLK = '1') then
			d_reg_p <= d_reg2(1);
		end if;
	end process;

	process(FCLK, grstn, lrstn)
	begin
		if(grstn='0') then
			d_reg_n <= '0';
		elsif(lrstn='0') then
			d_reg_n <= '0';	
		elsif(FCLK 'event and FCLK = '0') then
			d_reg_n <= d_reg2(0);
	    end if;
	end process;
	
	Q <= d_reg_n when FCLK = '1' else d_reg_p;

end Behavioral;

--------------------OSER16-----------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.glb.GSRO;

entity OSER16 is
	PORT (
		D0 : in std_logic;
		D1 : in std_logic;
		D2 : in std_logic;
		D3 : in std_logic;
		D4 : in std_logic;
		D5 : in std_logic;
		D6 : in std_logic;
		D7 : in std_logic;
		D8 : in std_logic;
		D9 : in std_logic;
        D10 : in std_logic;
		D11 : in std_logic;
		D12 : in std_logic;
		D13 : in std_logic;
		D14 : in std_logic;
		D15 : in std_logic;
		PCLK : in std_logic;
		RESET : in std_logic;
		FCLK : in std_logic;
		Q : OUT std_logic
	);
end OSER16;

architecture Behavioral of OSER16 is
	SIGNAL d_reg0,d_reg1,d_reg2 : std_logic_vector(15 downto 0);
    SIGNAL rstn_dsel,d_up0,d_up1 : std_logic;
    SIGNAL dcnt0,dcnt1,dcnt2 : std_logic := '0';
    SIGNAL d_en : std_logic;
	SIGNAL d_reg_p,d_reg_n : std_logic;
	SIGNAL grstn: std_logic;
	SIGNAL lrstn: std_logic;
begin
	grstn <= GSRO;
	lrstn <= (not RESET);	 
	
    process(FCLK, grstn, lrstn)
	begin
		if(grstn='0') then
			rstn_dsel <= '0';
		elsif(lrstn='0') then
			rstn_dsel <= '0';
		elsif(FCLK 'event and FCLK = '1') then
			rstn_dsel <= '1';
		end if;
	end process;

    process(FCLK, rstn_dsel)
	begin
		if(rstn_dsel='0') then
			dcnt0 <= '0';
			dcnt1 <= '0';
			dcnt2 <= '0';
		elsif(FCLK 'event and FCLK = '1') then
			dcnt0 <= not dcnt0;
            dcnt1 <= dcnt1 xor dcnt0;
            dcnt2 <= dcnt2 xor (dcnt1 and dcnt0);
		end if;
	end process;

    d_en <= ((not dcnt2) and dcnt1) and dcnt0;

    process(FCLK, rstn_dsel)
	begin
		if(rstn_dsel='0') then
			d_up0 <= '0';
			d_up1 <= '0';
		elsif(FCLK 'event and FCLK = '1') then
            if(d_en = '1') then
                d_up0 <= '1';
                d_up1 <= '1';
            else
                d_up0 <= '0';
                d_up1 <= '0';
            end if;
		end if;
	end process;

	process(PCLK, grstn, lrstn)
	begin
		if(grstn = '0') then
			d_reg0 <= "0000000000000000";
		elsif(lrstn='0') then
			d_reg0 <= "0000000000000000";
		elsif(PCLK 'event and PCLK = '1') then
			d_reg0 <= (D15,D14,D13,D12,D11,D10,D9,D8,D7,D6,D5,D4,D3,D2,D1,D0);
		end if;
	end process;

	process(FCLK, grstn, lrstn)
	begin
		if(grstn='0') then
			d_reg1 <= "0000000000000000";
		elsif(lrstn='0') then
			d_reg1 <= "0000000000000000";
		elsif(FCLK 'event and FCLK = '1') then
			if(d_up0 = '1') then
				d_reg1 <= d_reg0;
            else 
                d_reg1 <= d_reg1;
			end if;
		end if;
	end process;

	process(FCLK, grstn, lrstn)
	begin
		if(grstn='0') then
			d_reg2 <= "0000000000000000";
		elsif(lrstn='0') then
			d_reg2 <= "0000000000000000";
		elsif(FCLK 'event and FCLK = '1') then
			if(d_up1 = '1') then
				d_reg2 <= d_reg1;
			else
				d_reg2 <= "00"&d_reg2(15 downto 2);
			end if;
		end if;
	end process;

	process(FCLK, grstn, lrstn)
	begin
		if(grstn='0') then
			d_reg_p <= '0';
		elsif(lrstn='0') then
			d_reg_p <= '0';
		elsif(FCLK 'event and FCLK = '1') then
			d_reg_p <= d_reg2(1);
		end if;
	end process;

	process(FCLK, grstn, lrstn)
	begin
		if(grstn='0') then
			d_reg_n <= '0';
		elsif(lrstn='0') then
			d_reg_n <= '0';	
		elsif(FCLK 'event and FCLK = '0') then
			d_reg_n <= d_reg2(0);
	    end if;
	end process;
	
	Q <= d_reg_n when FCLK = '1' else d_reg_p;

end Behavioral;

--------------------OSIDES32-----------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.glb.GSRO;

entity OSIDES32 is
    generic(
            C_STATIC_DLY : integer := 0;   -- 0~255
            DYN_DLY_EN : string := "FALSE";
            ADAPT_EN : string := "FALSE"
        );
	port(
		PCLK,FCLKP,FCLKN,FCLKQP,FCLKQN : in std_logic;
		D : in std_logic;
        RESET : in std_logic;
        SDTAP : in std_logic;
        VALUE : in std_logic;
        DLYSTEP : in std_logic_vector(7 downto 0);
		Q : out std_logic_vector(31 downto 0);
		DF : out std_logic
	 );
end OSIDES32;

 architecture Behavioral of OSIDES32 is
    signal D_a,D_b : std_logic;
    signal d_p,dq_p,dq_n,d_n,d_qp,dq_qp,dq_qn,d_qn : std_logic;
    signal db_p,dqb_p,dqb_n,db_n,db_qp,dqb_qp,dqb_qn,db_qn : std_logic;
    signal rstn_syn,cnt_0,cnt_1,d_up : std_logic;
    signal d_up_en : std_logic;
    signal dqn_reg0,dqnb_reg0,dn_reg0,dnb_reg0,dqp_reg0,dqpb_reg0,dp_reg0,dpb_reg0,
    dqn_reg1,dqnb_reg1,dn_reg1,dnb_reg1,dqp_reg1,dqpb_reg1,dp_reg1,dpb_reg1,
    dqn_reg2,dqnb_reg2,dn_reg2,dnb_reg2,dqp_reg2,dqpb_reg2,dp_reg2,dpb_reg2,
    dqn_reg3,dqnb_reg3,dn_reg3,dnb_reg3,dqp_reg3,dqpb_reg3,dp_reg3,dpb_reg3 : std_logic;

    signal D_data,Q_data : std_logic_vector(31 downto 0);
	signal grstn : std_logic;
    signal DF0 : std_logic;

    component IODELAY
        generic (
        C_STATIC_DLY:integer:=0;
        DYN_DLY_EN : string := "FALSE";
        ADAPT_EN : string := "FALSE"
        );
        port(
                DO:out std_logic;
                DF:out std_logic; 
                DI:in std_logic;
                DLYSTEP:in std_logic_vector(7 downto 0);
                SDTAP:in std_logic;
                VALUE:in std_logic
            );
    end component;

begin
    grstn <= GSRO;
    dly_0:IODELAY
    generic map (
                    C_STATIC_DLY=>0,
                    DYN_DLY_EN=>"FALSE",
                    ADAPT_EN=>"FALSE"

                )
    port map (
                 DO=>D_a,
                 DF=>DF0,
                 DI=>D,
                 DLYSTEP=>"00000000",
                 SDTAP=>'0',
                 VALUE=>'0'
             );

    dly_1:IODELAY
    generic map (
                    C_STATIC_DLY=>C_STATIC_DLY,
                    DYN_DLY_EN=>DYN_DLY_EN,
                    ADAPT_EN=>ADAPT_EN
                )
    port map (
                 DO=>D_b,
                 DF=>DF,
                 DI=>D,
                 DLYSTEP=>DLYSTEP,
                 SDTAP=>SDTAP,
                 VALUE=>VALUE
             );



	process(FCLKP,grstn,RESET)
	begin
        if(grstn = '0')then
            d_p <= '0';
            dq_p <= '0';
            dq_n <= '0';
        elsif(RESET = '1')then
            d_p <= '0';
            dq_p <= '0';
            dq_n <= '0';
        elsif(rising_edge(FCLKP))then
            d_p <= D_a;
            dq_p <= '0';
            dq_n <= '0';
        end if;
	end process;

    process(FCLKN,grstn,RESET)
    begin
        if(grstn = '0')then
            d_n <= '0';
        elsif(RESET = '1')then
            d_n <= '0';
        elsif(rising_edge(FCLKN))then
            d_n <= D_a;
        end if;
    end process;

    process(FCLKQP,grstn,RESET)
    begin
        if(grstn = '0')then
            d_qp <= '0';
            dq_qp <= '0';
            dq_qn <= '0';
        elsif(RESET = '1')then
            d_qp <= '0';
            dq_qp <= '0';
            dq_qn <= '0';
        elsif(rising_edge(FCLKQP))then
            d_qp <= D_a;
            dq_qp <= d_qp;
            dq_qn <= d_qn;
        end if;
    end process;

    process(FCLKQN,grstn,RESET)
    begin
        if(grstn = '0')then
            d_qn <= '0';
        elsif(RESET = '1')then
            d_qn <= '0';
        elsif(rising_edge(FCLKQN))then
            d_qn <= D_a;
        end if;
    end process;

    process(FCLKP,grstn,RESET)
    begin
        if(grstn = '0')then
            db_p <= '0';
            dqb_p <= '0';
            dqb_n <= '0';
        elsif(RESET = '1')then
            db_p <= '0';
            dqb_p <= '0';
            dqb_n <= '0';
        elsif(rising_edge(FCLKP))then
            db_p <= D_b;
            dqb_p <= db_p;
            dqb_n <= db_n;
        end if;
    end process;

    process(FCLKN,grstn,RESET)
    begin
        if(grstn = '0')then
            db_n <= '0';
        elsif(RESET = '1')then
            db_n <= '0';
        elsif(rising_edge(FCLKN))then
            db_n <= D_b;
        end if;
    end process;

    process(FCLKQP,grstn,RESET)
    begin
        if(grstn = '0')then
            db_qp <= '0';
            dqb_qp <= '0';
            dqb_qn <= '0';
        elsif(RESET = '1')then
            db_qp <= '0';
            dqb_qp <= '0';
            dqb_qn <= '0';
        elsif(rising_edge(FCLKQP))then
            db_qp <= D_b;
            dqb_qp <= db_qp;
            dqb_qn <= db_qn;
        end if;
    end process;

    process(FCLKQN,grstn,RESET)
    begin
        if(grstn = '0')then
            db_qn <= '0';
        elsif(RESET = '1')then
            db_qn <= '0';
        elsif(rising_edge(FCLKQN))then
            db_qn <= D_b;
        end if;
    end process;

    process(FCLKP,grstn,RESET)
    begin
        if(grstn = '0')then
            dn_reg0 <= '0';
            dp_reg0 <= '0';
            dn_reg1 <= '0';
            dp_reg1 <= '0';
            dn_reg2 <= '0';
            dp_reg2 <= '0';
            dn_reg3 <= '0';
            dp_reg3 <= '0';
            dqn_reg0 <= '0';
            dqp_reg0 <= '0';
            dqn_reg1 <= '0';
            dqp_reg1 <= '0';
            dqn_reg2 <= '0';
            dqp_reg2 <= '0';
            dqn_reg3 <= '0';
            dqp_reg3 <= '0';
            dnb_reg0 <= '0';
            dpb_reg0 <= '0';
            dnb_reg1 <= '0';
            dpb_reg1 <= '0';
            dnb_reg2 <= '0';
            dpb_reg2 <= '0';
            dnb_reg3 <= '0';
            dpb_reg3 <= '0';
            dqnb_reg0 <= '0';
            dqpb_reg0 <= '0';
            dqnb_reg1 <= '0';
            dqpb_reg1 <= '0';
            dqnb_reg2 <= '0';
            dqpb_reg2 <= '0';
            dqnb_reg3 <= '0';
            dqpb_reg3 <= '0';
        elsif(RESET = '1')then
            dn_reg0 <= '0';
            dp_reg0 <= '0';
            dn_reg1 <= '0';
            dp_reg1 <= '0';
            dn_reg2 <= '0';
            dp_reg2 <= '0';
            dn_reg3 <= '0';
            dp_reg3 <= '0';
            dqn_reg0 <= '0';
            dqp_reg0 <= '0';
            dqn_reg1 <= '0';
            dqp_reg1 <= '0';
            dqn_reg2 <= '0';
            dqp_reg2 <= '0';
            dqn_reg3 <= '0';
            dqp_reg3 <= '0';
            dnb_reg0 <= '0';
            dpb_reg0 <= '0';
            dnb_reg1 <= '0';
            dpb_reg1 <= '0';
            dnb_reg2 <= '0';
            dpb_reg2 <= '0';
            dnb_reg3 <= '0';
            dpb_reg3 <= '0';
            dqnb_reg0 <= '0';
            dqpb_reg0 <= '0';
            dqnb_reg1 <= '0';
            dqpb_reg1 <= '0';
            dqnb_reg2 <= '0';
            dqpb_reg2 <= '0';
            dqnb_reg3 <= '0';
            dqpb_reg3 <= '0';
        elsif(rising_edge(FCLKP))then
            dn_reg0 <= dq_n;
            dp_reg0 <= dq_p;
            dn_reg1 <= dn_reg0;
            dp_reg1 <= dp_reg0;
            dn_reg2 <= dn_reg1;
            dp_reg2 <= dp_reg1;
            dn_reg3 <= dn_reg2;
            dp_reg3 <= dp_reg2;
            dqn_reg0 <= dq_qn;
            dqp_reg0 <= dq_qp;
            dqn_reg1 <= dqn_reg0;
            dqp_reg1 <= dqp_reg0;
            dqn_reg2 <= dqn_reg1;
            dqp_reg2 <= dqp_reg1;
            dqn_reg3 <= dqn_reg2;
            dqp_reg3 <= dqp_reg2;

            dnb_reg0 <= dqb_n;
            dpb_reg0 <= dqb_p;
            dnb_reg1 <= dnb_reg0;
            dpb_reg1 <= dpb_reg0;
            dnb_reg2 <= dnb_reg1;
            dpb_reg2 <= dpb_reg1;
            dnb_reg3 <= dnb_reg2;
            dpb_reg3 <= dpb_reg2;
            dqnb_reg0 <= dqb_qn;
            dqpb_reg0 <= dqb_qp;
            dqnb_reg1 <= dqnb_reg0;
            dqpb_reg1 <= dqpb_reg0;
            dqnb_reg2 <= dqnb_reg1;
            dqpb_reg2 <= dqpb_reg1;
            dqnb_reg3 <= dqnb_reg2;
            dqpb_reg3 <= dqpb_reg2;
        end if;
    end process;

    process(FCLKQP,grstn,RESET)
    begin
        if(grstn = '0')then
            rstn_syn <= '0';
        elsif(RESET = '1')then
            rstn_syn <= '0';
        elsif(rising_edge(FCLKQP))then
            rstn_syn <= '1';
        end if;
    end process;

    process(FCLKQP,grstn,rstn_syn)
    begin
        if(grstn = '0')then
            cnt_0 <= '0';
            cnt_1 <= '0';
        elsif(rstn_syn = '0')then
            cnt_0 <= '0';
            cnt_1 <= '0';
        elsif(rising_edge(FCLKQP))then
            cnt_0 <= not cnt_0;
            cnt_1 <= cnt_0 xor cnt_1;
        end if;
    end process;

    d_up_en <= cnt_0 and (not cnt_1);

    process(FCLKQP,grstn,rstn_syn)
    begin
        if(grstn = '0')then
            d_up <= '0';
        elsif(rstn_syn = '0')then
            d_up <= '0';
        elsif(rising_edge(FCLKQP))then
            if(d_up_en = '1')then
                d_up <= '1';
            else
                d_up <= '0';
            end if;
        end if;
    end process;

    process(FCLKQP,grstn,RESET)
    begin
        if(grstn = '0')then
            D_data <= (others => '0');
        elsif(RESET = '1')then
            D_data <= (others => '0');
        elsif(rising_edge(FCLKQP))then
            if(d_up = '1')then
                D_data(31) <= dqn_reg0;
                D_data(30) <= dqnb_reg0;
                D_data(29) <= dn_reg0;
                D_data(28) <= dnb_reg0;
                D_data(27) <= dqp_reg0;
                D_data(26) <= dqpb_reg0;
                D_data(25) <= dp_reg0;
                D_data(24) <= dpb_reg0;
                D_data(23) <= dqn_reg1;
                D_data(22) <= dqnb_reg1;
                D_data(21) <= dn_reg1;
                D_data(20) <= dnb_reg1;
                D_data(19) <= dqp_reg1;
                D_data(18) <= dqpb_reg1;
                D_data(17) <= dp_reg1;
                D_data(16) <= dpb_reg1;
                D_data(15) <= dqn_reg2;
                D_data(14) <= dqnb_reg2;
                D_data(13) <= dn_reg2;
                D_data(12) <= dnb_reg2;
                D_data(11) <= dqp_reg2;
                D_data(10) <= dqpb_reg2;
                D_data(9) <= dp_reg2;
                D_data(8) <= dpb_reg2;
                D_data(7) <= dqn_reg3;
                D_data(6) <= dqnb_reg3;
                D_data(5) <= dn_reg3;
                D_data(4) <= dnb_reg3;
                D_data(3) <= dqp_reg3;
                D_data(2) <= dqpb_reg3;
                D_data(1) <= dp_reg3;
                D_data(0) <= dpb_reg3;
            end if;
        end if;
    end process;

    process(PCLK,grstn,RESET)
    begin
        if(grstn = '0')then
            Q_data <= (others => '0');
        elsif(RESET = '1')then
            Q_data <= (others => '0');
        elsif(rising_edge(PCLK))then
            Q_data <= D_data;
        end if;
    end process;
    
    Q <= Q_data;
	

end Behavioral;


--------------------IODELAY-----------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

entity IODELAY is
	GENERIC (
        C_STATIC_DLY : integer := 0;   -- 0~255
        DYN_DLY_EN : string := "FALSE";
        ADAPT_EN : string := "FALSE"
    ); 
	PORT (
		DI : IN std_logic;
		SDTAP : IN std_logic;
		VALUE : IN std_logic;
		DLYSTEP : IN std_logic_vector(7 downto 0);
		DO : OUT std_logic;
		DF : OUT std_logic
	);
end IODELAY;

architecture Behavioral of IODELAY is
    signal delay_data,delay_data_adapt : std_logic_vector(7 downto 0);
	signal delay_time : time := 0.000 ns;
    signal delay_data_real : std_logic_vector(7 downto 0);
    signal pre_value,delay_out : std_logic;
    signal delay_code : std_logic_vector(7 downto 0);
    signal cnt_step,cnt_value : integer := 0;
    signal cnt_start,cnt_step_start,cnt_value_start : std_logic := '0';

begin

    delay_code <= conv_std_logic_vector(C_STATIC_DLY,8) when (DYN_DLY_EN = "FALSE") else DLYSTEP;
    
    DF <= '1' when ((C_STATIC_DLY > CONV_INTEGER(DLYSTEP)) and (delay_data_adapt = DLYSTEP))or 
          ((C_STATIC_DLY < CONV_INTEGER(DLYSTEP))and (delay_data_adapt = DLYSTEP))
      else
          '0';


    
    delay_data_real <= delay_data when (ADAPT_EN = "FALSE") else delay_data_adapt;
    delay_time <=  (0.0125 ns * (CONV_INTEGER(delay_data_real)+1));
    delay_out <= DI after delay_time;
    DO <= delay_out;

    process(SDTAP,VALUE)
    begin
        if(SDTAP = '0')then
            delay_data <= delay_code;
        end if;
    end process;

    process(SDTAP,VALUE)
    begin
        if(SDTAP = '1')then
            if(pre_value = '0' and VALUE = '1')then
                cnt_start <= '1';
            else
                cnt_start <= '0';
            end if;
        end if;
    end process;

    process(DI)
    begin
        if(cnt_start = '1')then
            if(cnt_value = 22)then
                cnt_value <= 0;
                cnt_value_start <= '1';
            elsif(cnt_value = 15)then
                cnt_step_start <= '1';
                cnt_value <= cnt_value + 1;
            else
                cnt_value <= cnt_value + 1;
            end if;

            if(cnt_value_start = '1')then
                cnt_value <= 0;
            end if;
        elsif(rising_edge(DI))then
            cnt_value <= 0;
            cnt_value_start <= '0';
            cnt_step_start <= '0';
        end if;
    end process;

    process(DI)
    begin
        if(cnt_step_start = '1')then
            if(cnt_step = 7)then
                cnt_step <= 0;
            else
                cnt_step <= cnt_step + 1;
            end if;
        elsif(rising_edge(DI))then
            cnt_step <= 0;
        end if;
    end process;

    process(SDTAP,VALUE,cnt_step,DLYSTEP,cnt_value_start)
    begin
        if(SDTAP = '0')then
            delay_data_adapt <= conv_std_logic_vector(C_STATIC_DLY,8);
        else
            if(cnt_value_start = '1')then
                if(C_STATIC_DLY < DLYSTEP)then
                    if(delay_data_adapt /= DLYSTEP)then
                        if(cnt_step = 7)then
                            delay_data_adapt <= delay_data_adapt + 1;
                        end if;
                    end if;
                elsif(C_STATIC_DLY > DLYSTEP)then
                    if(delay_data_adapt /= DLYSTEP)then
                        if(cnt_step = 7)then
                            delay_data_adapt <= delay_data_adapt - 1;
                        end if;
                    end if;
                end if;
            end if;
        end if;
        end process;

    process (VALUE) 
    begin
        pre_value <= VALUE;
    end process;
	
	
end Behavioral;

---------------------OSC------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY OSC IS
GENERIC (
    FREQ_DIV : integer := 100  --3, 2~126(only even num)
);
PORT (
    OSCOUT: OUT STD_LOGIC
);
END OSC;

ARCHITECTURE BHV OF OSC IS
SIGNAL oscr : STD_LOGIC := '0';

BEGIN
    
    PROCESS
    BEGIN
        wait for ((2.381 ns) * FREQ_DIV);
	    oscr <= not oscr;
    END PROCESS;

    OSCOUT <= oscr;

END BHV;

---------------------OSCA------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY OSCA IS
GENERIC (
    FREQ_DIV : integer := 100  --3, 2~126(only even num)
);
PORT (
    OSCEN : in STD_LOGIC;
    OSCOUT: OUT STD_LOGIC
);
END OSCA;

ARCHITECTURE BHV OF OSCA IS
SIGNAL oscr : STD_LOGIC := '0';

BEGIN
    
    PROCESS
    BEGIN
        wait for ((2.381 ns) * FREQ_DIV);
	    oscr <= not oscr;
    END PROCESS;

    OSCOUT <= oscr when (OSCEN = '1') else '1';

END BHV;


------------------------------DDRDLL---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use work.glb.GSRO;

entity DDRDLL is
    GENERIC(
        DLL_FORCE : STRING := "FALSE"; --TRUE: force lock and code; FALSE: code/lock generated from DDRDLL loop
        DIV_SEL : bit := '1'; --0,normal lock mode; 1,fast lock mode
	    CODESCAL : STRING := "000"; --001 010 011 100 101 110 111
        SCAL_EN : STRING := "TRUE" --TRUE,FALSE
    );
    PORT(
        CLKIN:IN std_logic:='0';
        STOP: In std_logic:='0';
        RESET : In std_logic:='0';
        UPDNCNTL : In std_logic:='0';
        LOCK : OUT std_logic;
        STEP : OUT std_logic_vector(7 downto 0)
     );
end DDRDLL;

architecture Behavioral of DDRDLL is
signal clk_out :std_logic :='0';
signal clkin_edge_pre :time := 0 ns;
signal clkin_period :time := 2 ns;
signal delta : real := 0.025;
signal stop_0 : std_logic:= '0';
signal stop_1n : std_logic:= '1';
signal cnt : integer := 0;
signal clk_effect : std_logic := '0';
signal code_tmp : INTEGER := 0;
signal code_reg,code_reg_sig : std_logic_vector(7 downto 0) := "00000000";
signal clkin_period_pre : time := 0 ns;
signal lock_reg : std_logic := '0';
signal grstn : std_logic;
signal reset_sig: std_logic := '0';
begin
        
grstn<= GSRO;	
reset_sig <= RESET or (not grstn);


--determine clkin_period	 
process(CLKIN,reset_sig)
begin
    if(reset_sig = '1') then
        clk_effect <= '0';
        clkin_period <= 0 ns;
    elsif(CLKIN'event and CLKIN = '1') then
        clkin_period_pre <= clkin_period;
        clkin_period <= NOW - clkin_edge_pre;
		clkin_edge_pre <= NOW;

        if(clkin_period > 0 ns) then
            if(clkin_period = clkin_period_pre) then
		        clk_effect <= '1';
		    else
			    clk_effect <= '0';
		    end if;   
        end if;
    end if;
  
end process; 

process(CLKIN, reset_sig) 
begin
    if (reset_sig = '1') then
        stop_0 <= '0';
    elsif(CLKIN'event and CLKIN='0') then
        stop_0 <= STOP;
    end if;
end process;

process(CLKIN, reset_sig)
begin
    if (reset_sig = '1') then
        stop_1n <= '1';
    elsif(CLKIN'event and CLKIN='0') then
        stop_1n <= not stop_0;
    end if;
end process;

clk_out <= CLKIN and stop_1n;

process(clk_out, reset_sig)
begin
    if (reset_sig = '1') then
        cnt <= 0;
        lock_reg <= '0';
    elsif(clk_out'event and clk_out='1') then
        cnt <= cnt + 1;

        if(DIV_SEL = '0') then
            if(cnt >= 33600) then
                lock_reg <= '1';
            else
                lock_reg <= '0';
            end if;
        end if;

        if(DIV_SEL = '1') then
            if(cnt >= 2100) then
                lock_reg <= '1';
            else               
                lock_reg <= '0';
            end if;               
        end if;
    end if;

end process;

LOCK <= '1' when (DLL_FORCE = "TURE") else lock_reg;

--determine delay code
process(CLKIN,reset_sig,clk_effect,UPDNCNTL)
begin
    if(reset_sig ='1')then
        code_tmp <= 0;
    elsif(clk_effect = '1')then
        if(UPDNCNTL = '0')then
            if(SCAL_EN = "TRUE")then
                if(CODESCAL="000")then
                    code_tmp <= INTEGER(clkin_period/(1 ns)*11.22222);
                elsif(CODESCAL = "001")then
                    code_tmp <= INTEGER(clkin_period/(1 ns)*12.44444);
                elsif(CODESCAL = "010")then
                    code_tmp <= INTEGER(clkin_period/(1 ns)*13.6667);
                elsif(CODESCAL = "011")then
                    code_tmp <= INTEGER(clkin_period/(1 ns)*15.0);
                elsif(CODESCAL = "100")then
                    code_tmp <= INTEGER(clkin_period/(1 ns)*8.7778);
                elsif(CODESCAL = "101")then
                    code_tmp <= INTEGER(clkin_period/(1 ns)*7.5556);
                elsif(CODESCAL = "110")then
                    code_tmp <= INTEGER(clkin_period/(1 ns)*6.3333);
                elsif(CODESCAL = "111")then
                    code_tmp <= INTEGER(clkin_period/(1 ns)*5.0);
                end if;
            else
                code_tmp <= INTEGER(clkin_period/(1 ns)*10.0);
            end if;
        end if;
    end if;

end process;

code_reg <= conv_std_logic_vector(code_tmp,8);
STEP <= code_reg when (DLL_FORCE = "FALSE") else conv_std_logic_vector(255,8);

end Behavioral;

------------------------------CLKDIV---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use work.glb.GSRO;

entity CLKDIV is
    GENERIC(
	     DIV_MODE : STRING := "2" -- "1","2","3","3.5","4","5","6","7","8"
    );
    PORT(
         HCLKIN : IN std_logic;
	     RESETN : IN std_logic;
	     CALIB : In std_logic;
	     CLKOUT : OUT std_logic
    );
end CLKDIV;

architecture Behavioral of CLKDIV is
signal reset_0 : std_logic;
signal calib_0,calib_1,calib_2,calib_en,calib_resetn : std_logic;
signal calib_state : std_logic := '0';
signal dsel_en,clk_div_0,cnt_reset,clk_div,cnt_enable :std_logic;
signal select_no_3p5 : std_logic := '1';
signal select3p5,select5,select3,select6,select7 : std_logic := '0';
signal clk_div_1,clk_div2,d_sel,cnt_0,cnt_1,cnt_2,clk_div7_8,dsel_clk : std_logic := '0';
signal grstn :std_logic;

begin
    
    grstn <= GSRO;

    select_no_3p5 <= '0' when (DIV_MODE = "3.5") else '1';
    select3p5 <= '1' when (DIV_MODE = "3.5") else '0';
    select5 <= '1' when (DIV_MODE = "5") else '0';
    select3 <= '1' when (DIV_MODE = "3") else '0';
    select6 <= '1' when (DIV_MODE = "6") else '0';
    select7 <= '1' when (DIV_MODE = "7") else '0';

    process(HCLKIN, grstn, RESETN)
    begin
        if (grstn = '0') then
            reset_0 <= '0';
        elsif (RESETN = '0') then
            reset_0 <= '0';
        elsif (HCLKIN'event and HCLKIN = '1') then
            reset_0 <= '1';
        end if;
    end process;
	
    process(HCLKIN, reset_0)
    begin
        if (reset_0 = '0') then
            calib_0 <= '0';
        elsif (HCLKIN'event and HCLKIN = '1') then
            calib_0 <= (not CALIB);
        end if;
    end process;

    process(HCLKIN, reset_0)
    begin
        if (reset_0 = '0') then
            calib_1 <= '0';
        elsif (HCLKIN'event and HCLKIN = '1') then
            calib_1 <= calib_0;
        end if;
    end process;

    process(HCLKIN, reset_0)
    begin
        if (reset_0 = '0') then
            calib_2 <= '0';
        elsif (HCLKIN'event and HCLKIN = '1') then
            calib_2 <= calib_1;
        end if;
    end process;

    calib_resetn <=  not (calib_1 and (not calib_2));
    calib_en <= not (calib_resetn or (not select_no_3p5));

    process(HCLKIN, reset_0)
    begin
        if (reset_0 = '0') then
            calib_state <= '0';
        elsif (HCLKIN'event and HCLKIN = '1') then
            if (calib_en = '1') then
                calib_state <= not calib_state;
            else
                calib_state <= calib_state;
            end if;
        end if;
    end process;

    cnt_enable <= (not((not calib_resetn)and calib_state) and select_no_3p5) or (calib_resetn and select3p5);

    dsel_en <= (d_sel and cnt_0 and cnt_1 and select3p5) or (calib_resetn and (not d_sel) and (not cnt_0) and cnt_1 and select3p5);

    dsel_clk <= HCLKIN xor d_sel;
    process(dsel_clk, reset_0) 
    begin
        if (reset_0 = '0') then
            d_sel  <= '0';
        elsif (dsel_clk'event and dsel_clk = '1') then
            if(dsel_en = '1') then
                d_sel  <= not d_sel;
            elsif(dsel_en = '0') then
                d_sel <= d_sel;
            end if;
        end if;
    end process;

    cnt_reset <= ((select3 and ((not cnt_2) and cnt_1 and (not cnt_0))) or (select6 and (cnt_2 and (not cnt_1) and cnt_0)) or (select7 and (cnt_2 and cnt_1 and (not cnt_0))) or (select5 and (not cnt_0) and (not cnt_1) and cnt_2))or (select3p5 and (not d_sel) and (not cnt_0) and cnt_1);

    process(HCLKIN, reset_0)
    begin
        if (reset_0 = '0') then
            cnt_0  <= '1';
        elsif (HCLKIN'event and HCLKIN = '1') then
            if(cnt_enable = '1') then
                cnt_0  <= not(cnt_0 or cnt_reset);
            elsif(cnt_enable = '0') then
                cnt_0 <= cnt_0;
            end if;
        end if;
    end process;

    process(HCLKIN, reset_0) 
    begin
        if (reset_0 = '0') then
            cnt_1  <= '1';
        elsif (HCLKIN'event and HCLKIN = '1') then
            if(cnt_enable = '1') then
                cnt_1  <= not(cnt_reset or (cnt_0 xnor cnt_1));
            elsif(cnt_enable = '0') then
                cnt_1 <= cnt_1;
            end if;
        end if;
    end process;

    process(HCLKIN, reset_0) 
    begin
        if (reset_0 = '0') then
            cnt_2  <= '0';
        elsif (HCLKIN'event and HCLKIN = '1') then
            if(cnt_enable = '1') then
                cnt_2  <= not(cnt_reset or (cnt_2 xnor (cnt_0 and cnt_1)));
            elsif(cnt_enable = '0') then
                cnt_2 <= cnt_2;
            end if;
        end if;
    end process;

    clk_div_0 <= not cnt_1;
    process(HCLKIN, reset_0) 
    begin
        if(reset_0 = '0') then
            clk_div_1 <= '0';
        elsif (HCLKIN'event and HCLKIN = '0') then
            clk_div_1 <= clk_div_0;
        end if;
    end process;

    clk_div <= clk_div_1 when (d_sel = '1') else clk_div_0;
    clk_div2 <= not cnt_0;
    clk_div7_8 <= cnt_2;

    CLKOUT <= HCLKIN when (DIV_MODE = "1") else clk_div2 when (DIV_MODE = "2") else clk_div7_8 when ((DIV_MODE = "7") or (DIV_MODE = "8")) else clk_div;

end Behavioral;


------------------------------CLKDIV2---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use work.glb.GSRO;

entity CLKDIV2 is
    PORT(
         HCLKIN : IN std_logic;
	     RESETN : IN std_logic;
	     CLKOUT : OUT std_logic
    );
end CLKDIV2;

architecture Behavioral of CLKDIV2 is
signal reset_0 : std_logic := '0';
signal clk_div2 : std_logic := '0';
signal grstn :std_logic;

begin
    
    grstn <= GSRO;

    process(HCLKIN, grstn, RESETN)
    begin
        if (grstn = '0') then
            reset_0 <= '0';
        elsif (RESETN = '0') then
            reset_0 <= '0';
        elsif (HCLKIN'event and HCLKIN = '1') then
            reset_0 <= '0';
        end if;
    end process;

    process(HCLKIN, grstn, RESETN)
    begin
        if (grstn = '0') then
            clk_div2  <= '0';
        elsif (RESETN = '0') then
            clk_div2  <= '0';
        elsif (HCLKIN'event and HCLKIN = '1') then
            clk_div2 <= (clk_div2 xor (not reset_0));
        end if;
    end process;

    CLKOUT <= clk_div2;

end Behavioral;

----------------------------DHCE ------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.glb.GSRO;

entity DHCE is
    PORT (
	 CLKOUT : OUT std_logic;	
	 CEN : IN std_logic;	
	 CLKIN : IN std_logic
    );
end DHCE;

ARCHITECTURE Behavioral OF DHCE IS
    SIGNAL ce_reg0,ce_reg1,ce_reg2,ce_reg3 : std_logic;		
    SIGNAL grstn :std_logic;
begin
	
    grstn <= GSRO;
    process (CLKIN,grstn)
    begin
        if(grstn = '0') then
            ce_reg0 <= '0';
            ce_reg1 <= '0';
            ce_reg2 <= '0';
            ce_reg3 <= '0';
	    elsif (CLKIN'event and CLKIN='0') then
            ce_reg0 <= (not CEN);
            ce_reg1 <= ce_reg0;
            ce_reg2 <= ce_reg1;
            ce_reg3 <= ce_reg2;
	    end if;
    end process;

    CLKOUT <= CLKIN and ce_reg3;

end Behavioral;


------------------------------DLLDLY---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use work.glb.GSRO;

entity DLLDLY is
    generic(
        DLY_SIGN : bit := '0'; -- '0':'+',  '1': '-'
        DLY_ADJ : integer := 0; --0~255, dly_sign=0 :dly_adj; dly_sign=1: -256+dly_adj
        DYN_DLY_EN : string := "FALSE"; --"TRUE","FALSE"
        ADAPT_EN : string := "FALSE"; --"TRUE","FALSE"
        STEP_SEL : bit := '0' --1'b0:DLLSTEP; 1'b1:CSTEP
    );
    port(
        CLKIN :in std_logic;
        DLLSTEP : in std_logic_vector(7 downto 0);
        CSTEP : in std_logic_vector(7 downto 0);
        LOADN,MOVE: in std_logic;
        CLKOUT : out std_logic;
        FLAG : out std_logic
     );
end DLLDLY;

architecture Behavioral of DLLDLY is

signal premove : std_logic;
signal clk_effect : std_logic := '0';
signal step_reg,dllstep_adj_pre,CSTEP_pre : std_logic_vector(7 downto 0);
signal dllstep_adj : std_logic_vector(7 downto 0);
signal dly_adj_reg : real;
signal del : time := 0.0125 ns;
signal step_dly : time := 0.0 ns;
signal clkin_edge,clkin_period,clkin_period_pre : time;
signal step_data,step_data_adapt : std_logic_vector(7 downto 0) := "00000000";
signal step_pre,step_cur,step_code : std_logic_vector(7 downto 0);
signal step_data_real : std_logic_vector(7 downto 0);
signal cnt_step,cnt_value : integer := 0;
signal cnt_start,cnt_step_start,cnt_value_start : std_logic := '0';
signal flag_add, flag_sub : std_logic := '0';
signal grstn : std_logic;

begin
        
grstn<= GSRO;	

dly_adj_reg <= real(DLY_ADJ) when (DLY_SIGN = '0') else 
           real(-DLY_ADJ);


process(CLKIN)
begin
    if(grstn = '0') then
        clkin_edge <= 0 ns;
    elsif(CLKIN'event and CLKIN = '1') then
        clkin_edge <= NOW;
        clkin_period <= NOW - clkin_edge;
        clkin_period_pre <= clkin_period;
    end if;

    if(clkin_period > 0 ns) then
        if(clkin_period_pre = clkin_period) then
            clk_effect <= '1';
		else
			clk_effect <= '0';
		end if;   
    end if;
  
end process; 

step_code <= conv_std_logic_vector(DLY_ADJ,8) when(DYN_DLY_EN = "FALSE")else
             step_cur;

process(LOADN,clk_effect,step_code)
begin
    if(clk_effect = '1')then
        if(LOADN = '0')then
            step_data <= step_code;
        end if;
    end if;
end process;

process(MOVE)
begin
    premove <= MOVE;
end process;

process(LOADN,MOVE)
begin
    if(clk_effect = '1')then
        if(LOADN = '1')then
            if(premove = '0' and MOVE = '1')then
                cnt_start <= '1';
            else
                cnt_start <= '0';
            end if;
        end if;
    end if;
end process;

process(CLKIN)
begin
    if(cnt_start = '1')then
        if(cnt_value = 22)then
            cnt_value <= 0;
            cnt_value_start <= '1';
        elsif(cnt_value = 15)then
            cnt_step_start <= '1';
            cnt_value <= cnt_value + 1;
        else
            cnt_value <= cnt_value + 1;
        end if;

        if(cnt_value_start = '1')then
            cnt_value <= 0;
        end if;

    elsif(CLKIN'event and CLKIN = '0')then
        cnt_value <= 0;
        cnt_value_start <= '0';
        cnt_step_start <= '0';
    end if;
end process;


process(CLKIN)
begin
    if(cnt_step_start = '1')then
        if(cnt_step = 7)then
            cnt_step <= 0;
        else
            cnt_step <= cnt_step + 1;
        end if;
    elsif(CLKIN'event and CLKIN = '0')then
        cnt_step <= 0;
    end if;
end process;


dllstep_adj <= "00000000" when( CONV_INTEGER(DLLSTEP) + INTEGER(dly_adj_reg) <= 0 ) else
               "11111111" when( CONV_INTEGER(DLLSTEP) + INTEGER(dly_adj_reg) >= 255)else
               conv_std_logic_vector(INTEGER(real(CONV_INTEGER(DLLSTEP)) + dly_adj_reg),8);


process(dllstep_adj)
begin
    dllstep_adj_pre <= dllstep_adj;
end process;

process(CSTEP)
begin
    CSTEP_pre <= CSTEP;
end process;

step_pre <= dllstep_adj_pre when(STEP_SEL = '0')else
            CSTEP_pre;
step_cur <= dllstep_adj when(STEP_SEL = '0')else
            CSTEP;

process(DLLSTEP, CSTEP, LOADN, MOVE, CLKIN, clk_effect)
begin
    if(clk_effect = '1')then
        flag_add <= '0';
        flag_sub <= '0';

        if(LOADN = '0')then
            step_data_adapt <= step_pre;
        else
            if(cnt_value_start = '1')then
                if(step_data_adapt < step_cur)then
                    flag_add <= '1';

                    if(step_data_adapt /= step_cur)then
                        if(cnt_step = 7)then
                            step_data_adapt <= step_data_adapt + 1;
                        end if;
                    end if;
                elsif(step_data_adapt > step_cur)then
                    flag_sub <= '1';

                    if(step_data_adapt /= step_cur)then
                        if(cnt_step = 7)then
                            step_data_adapt <= step_data_adapt - 1;
                        end if;
                    end if;
                end if;
            end if;
        end if;
    end if;
end process;

FLAG <= '1' when(((flag_add = '1') and (step_data_adapt = step_cur)) or
        ((flag_sub = '1') and (step_data_adapt = step_cur)))else
        '0';
step_data_real <= step_data when(ADAPT_EN = "FALSE") else
                  step_data_adapt;

process(step_data_real)
begin
    step_dly <= (CONV_INTEGER(step_data_real) + 1) * del;
end process;

process(CLKIN)
begin
    CLKOUT <= transport CLKIN after step_dly;
end process;

end Behavioral;

------------------------------DCS---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DCS is
	GENERIC (
		DCS_MODE : string := "RISING"   --CLK0,CLK1,CLK2,CLK3,GND,VCC,RISING,FALLING,CLK0_GND,CLK0_VCC,CLK1_GND,CLK1_VCC,CLK2_GND,CLK2_VCC,CLK3_GND,CLK3_VCC
	);
	PORT (
		CLKIN0 : IN std_logic;
		CLKIN1 : IN std_logic;
		CLKIN2 : IN std_logic;
		CLKIN3 : IN std_logic;
		CLKSEL : IN std_logic_vector(3 downto 0);
		SELFORCE : IN std_logic;
		CLKOUT : OUT std_logic
	);
end DCS;

ARCHITECTURE Behavioral of DCS is
	signal clk0_out,clk1_out,clk2_out,clk3_out,gnd_out,vcc_out : std_logic;
	signal flag_g0,flag_v0,flag_g1,flag_v1,flag_g2,flag_v2,flag_g3,flag_v3 : std_logic := '0';
	signal clk0_gnd,clk0_vcc,clk1_gnd,clk1_vcc,clk2_gnd,clk2_vcc,clk3_gnd,clk3_vcc : std_logic;
	signal clkout_f0,clkout_f1,clkout_f2,clkout_f3,clkout_f : std_logic;
    signal clkout_r0,clkout_r1,clkout_r2,clkout_r3,clkout_r : std_logic;
	signal flag_f0,flag_f1,flag_f2,flag_f3 : std_logic := '0';
    signal flag_r0,flag_r1,flag_r2,flag_r3 : std_logic := '0';
	signal selforce_out : std_logic;
	signal dcsout : std_logic;
	signal clk_out : std_logic := '0';

begin
-- CLK,GND,VCC
    clk0_out <= CLKIN0;
    clk1_out <= CLKIN1;
    clk2_out <= CLKIN2;
    clk3_out <= CLKIN3;

    gnd_out <= '0';
    vcc_out <= '1';
-- FALLING
    process(CLKIN0)
	begin
		if(falling_edge(CLKIN0) and CLKSEL(0) = '1' and flag_f1 = '0' and flag_f2 = '0' and flag_f3 = '0') then
			flag_f0 <= '1';
		elsif(falling_edge(CLKIN0)) then
			flag_f0 <= '0';
		end if;
	end process;
    clkout_f0 <= CLKIN0 and flag_f0;

    process(CLKIN1)
	begin
		if(falling_edge(CLKIN1) and CLKSEL(1) = '1' and flag_f0 = '0' and flag_f2 = '0' and flag_f3 = '0') then
			flag_f1 <= '1';
		elsif(falling_edge(CLKIN1)) then
			flag_f1 <= '0';
		end if;
	end process;
    clkout_f1 <= CLKIN1 and flag_f1;

    process(CLKIN2)
	begin
		if(falling_edge(CLKIN2) and CLKSEL(2) = '1' and flag_f0 = '0' and flag_f1 = '0' and flag_f3 = '0') then
			flag_f2 <= '1';
		elsif(falling_edge(CLKIN2)) then
			flag_f2 <= '0';
		end if;
	end process;
    clkout_f2 <= CLKIN2 and flag_f2;

    process(CLKIN3)
	begin
		if(falling_edge(CLKIN3) and CLKSEL(3) = '1' and flag_f0 = '0' and flag_f1 = '0' and flag_f2 = '0') then
			flag_f3 <= '1';
		elsif(falling_edge(CLKIN3)) then
			flag_f3 <= '0';
		end if;
	end process;
    clkout_f3 <= CLKIN3 and flag_f3;

    clkout_f <= clkout_f0 when flag_f0 = '1' else
                clkout_f1 when flag_f1 = '1' else
                clkout_f2 when flag_f2 = '1' else
                clkout_f3 when flag_f3 = '1' else '0';

-- RISING
    process(CLKIN0)
    begin
        if(rising_edge(CLKIN0) and CLKSEL(0) = '1' and flag_r1 = '0' and flag_r2 = '0' and flag_r3 = '0') then
            flag_r0 <= '1';
        elsif(rising_edge(CLKIN0)) then
            flag_r0 <= '0';
        end if;
    end process;
    clkout_r0 <= not ((not CLKIN0) and flag_r0);

    process(CLKIN1)
    begin
        if(rising_edge(CLKIN1) and CLKSEL(1) = '1' and flag_r0 = '0' and flag_r2 = '0' and flag_r3 = '0') then
            flag_r1 <= '1';
        elsif(rising_edge(CLKIN1)) then
            flag_r1 <= '0';
        end if;
    end process;
    clkout_r1 <= not ((not CLKIN1) and flag_r1);

    process(CLKIN2)
    begin
        if(rising_edge(CLKIN2) and CLKSEL(2) = '1' and flag_r0 = '0' and flag_r1 = '0' and flag_r3 = '0') then
            flag_r2 <= '1';
        elsif(rising_edge(CLKIN2)) then
            flag_r2 <= '0';
        end if;
    end process;
    clkout_r2 <= not ((not CLKIN2) and flag_r2);

    process(CLKIN3)
    begin
        if(rising_edge(CLKIN3) and CLKSEL(3) = '1' and flag_r0 = '0' and flag_r1 = '0' and flag_r2 = '0') then
            flag_r3 <= '1';
        elsif(rising_edge(CLKIN3)) then
            flag_r3 <= '0';
        end if;
    end process;
    clkout_r3 <= not ((not CLKIN3) and flag_r3);

    clkout_r <= clkout_r0 when flag_r0 = '1' else
                clkout_r1 when flag_r1 = '1' else
                clkout_r2 when flag_r2 = '1' else
                clkout_r3 when flag_r3 = '1' else '1';

    -- CLK0_GND
    process(CLKIN0)
	begin
		if(falling_edge(CLKIN0) and CLKSEL(0) = '1') then
			flag_g0 <= '1';
		elsif(falling_edge(CLKIN0)) then
			flag_g0 <= '0';
		end if;
	end process;
    clk0_gnd <= CLKIN0 and flag_g0;
    -- CLK0_VCC
    process(CLKIN0)
	begin
		if(rising_edge(CLKIN0) and CLKSEL(0) = '1') then
			flag_v0 <= '1';
		elsif(rising_edge(CLKIN0)) then
			flag_v0 <= '0';
		end if;
	end process;
    clk0_vcc <= not ((not CLKIN0) and flag_v0);

    -- CLK1_GND
    process(CLKIN1)
	begin
		if(falling_edge(CLKIN1) and CLKSEL(1) = '1') then
			flag_g1 <= '1';
		elsif(falling_edge(CLKIN1)) then
			flag_g1 <= '0';
		end if;
	end process;
    clk1_gnd <= CLKIN1 and flag_g1;
    -- CLK1_VCC
    process(CLKIN1)
	begin
		if(rising_edge(CLKIN1) and CLKSEL(1) = '1') then
			flag_v1 <= '1';
		elsif(rising_edge(CLKIN1)) then
			flag_v1 <= '0';
		end if;
	end process;
    clk1_vcc <= not ((not CLKIN1) and flag_v1);

    -- CLK2_GND
    process(CLKIN2)
	begin
		if(falling_edge(CLKIN2) and CLKSEL(2) = '1') then
			flag_g2 <= '1';
		elsif(falling_edge(CLKIN2)) then
			flag_g2 <= '0';
		end if;
	end process;
    clk2_gnd <= CLKIN2 and flag_g2;
    -- CLK2_VCC
    process(CLKIN2)
	begin
		if(rising_edge(CLKIN2) and CLKSEL(2) = '1') then
			flag_v2 <= '1';
		elsif(rising_edge(CLKIN2)) then
			flag_v2 <= '0';
		end if;
	end process;
    clk2_vcc <= not ((not CLKIN2) and flag_v2);

    -- CLK3_GND
    process(CLKIN3)
	begin
		if(falling_edge(CLKIN3) and CLKSEL(3) = '1') then
			flag_g3 <= '1';
		elsif(falling_edge(CLKIN3)) then
			flag_g3 <= '0';
		end if;
	end process;
    clk3_gnd <= CLKIN3 and flag_g3;
    -- CLK3_VCC
    process(CLKIN3)
	begin
		if(rising_edge(CLKIN3) and CLKSEL(3) = '1') then
			flag_v3 <= '1';
		elsif(rising_edge(CLKIN3)) then
			flag_v3 <= '0';
		end if;
	end process;
    clk3_vcc <= not ((not CLKIN3) and flag_v3);

    -- dcsout
    process(clk0_out,clk1_out,clk2_out,clk3_out,gnd_out,vcc_out,clk0_gnd,clk0_vcc,clk1_gnd,clk1_vcc,clk2_gnd,clk2_vcc,clk3_gnd,clk3_vcc,clkout_f,clkout_r)
	begin
		if(DCS_MODE = "CLK0") then
			dcsout <= clk0_out;
		elsif(DCS_MODE = "CLK1") then
			dcsout <= clk1_out;
        elsif(DCS_MODE = "CLK2") then
			dcsout <= clk2_out;
        elsif(DCS_MODE = "CLK3") then
			dcsout <= clk3_out;
        elsif(DCS_MODE = "GND") then
			dcsout <= gnd_out;
        elsif(DCS_MODE = "VCC") then
			dcsout <= vcc_out;
        elsif(DCS_MODE = "FALLING") then
			dcsout <= clkout_f;
        elsif(DCS_MODE = "RISING") then
			dcsout <= clkout_r;
        elsif(DCS_MODE = "CLK0_GND") then
			dcsout <= clk0_gnd;
        elsif(DCS_MODE = "CLK0_VCC") then
			dcsout <= clk0_vcc;
        elsif(DCS_MODE = "CLK1_GND") then
			dcsout <= clk1_gnd;
        elsif(DCS_MODE = "CLK1_VCC") then
			dcsout <= clk1_vcc;
        elsif(DCS_MODE = "CLK2_GND") then
			dcsout <= clk2_gnd;
        elsif(DCS_MODE = "CLK2_VCC") then
			dcsout <= clk2_vcc;
        elsif(DCS_MODE = "CLK3_GND") then
			dcsout <= clk3_gnd;
        elsif(DCS_MODE = "CLK3_VCC") then
			dcsout <= clk3_vcc;
		end if;
	end process;

    -- clk_out
    selforce_out <= CLKIN0 when CLKSEL = "0001" else
                    CLKIN1 when CLKSEL = "0010" else
                    CLKIN2 when CLKSEL = "0100" else
                    CLKIN3 when CLKSEL = "1000" else '0';
    process(dcsout,selforce_out,SELFORCE)
	begin
		if(SELFORCE = '0') then
			clk_out <= dcsout;
		elsif(SELFORCE = '1') then
			clk_out <= selforce_out;
		end if;
	end process;

    CLKOUT <= clk_out;

end Behavioral;

----------------------------DCE ------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DCE is
    PORT (
	 CLKOUT : OUT std_logic;	
	 CE : IN std_logic;	
	 CLKIN : IN std_logic
    );	
end DCE;

ARCHITECTURE Behavioral OF DCE IS
    SIGNAL ce_reg : std_logic;		
begin
	
    process (CLKIN, CE)
    begin
	    if (CLKIN = '0') then
            ce_reg <= CE;	
	    end if;
    end process;

    CLKOUT <= CLKIN and ce_reg;

end Behavioral;


------------------------------PLL---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all; 

entity PLL is
    GENERIC(
        FCLKIN : STRING := "100.0"; --frequency of the clkin(M)
        DYN_IDIV_SEL : STRING := "FALSE"; --TRUE:IDSEL; FALSE:IDIV_SEL
        IDIV_SEL : integer := 1; --Input divider IDIV, 1~64
        DYN_FBDIV_SEL : STRING := "FALSE";
        FBDIV_SEL : integer := 1; --Feedback divider FBDIV, 1~64
        
        DYN_ODIV0_SEL : STRING := "FALSE"; --TRUE:ODSEL0, FALSE:ODIV0_SEL
        ODIV0_SEL : integer := 8; --1~128,integer
        DYN_ODIV1_SEL : STRING := "FALSE"; --TRUE:ODSEL1, FALSE:ODIV1_SEL
        ODIV1_SEL : integer := 8; --1~128,integer
        DYN_ODIV2_SEL : STRING := "FALSE"; --TRUE:ODSEL2, FALSE:ODIV2_SEL
        ODIV2_SEL : integer := 8; --1~128,integer
        DYN_ODIV3_SEL : STRING := "FALSE"; --TRUE:ODSEL3, FALSE:ODIV3_SEL
        ODIV3_SEL : integer := 8; --1~128,integer
        DYN_ODIV4_SEL : STRING := "FALSE"; --TRUE:ODSEL4, FALSE:ODIV4_SEL
        ODIV4_SEL : integer := 8; --1~128,integer
        DYN_ODIV5_SEL : STRING := "FALSE"; --TRUE:ODSEL5, FALSE:ODIV5_SEL
        ODIV5_SEL : integer := 8; --1~128,integer
        DYN_ODIV6_SEL : STRING := "FALSE"; --TRUE:ODSEL6, FALSE:ODIV6_SEL
        ODIV6_SEL : integer := 8; --1~128,integer
        DYN_MDIV_SEL : STRING := "FALSE"; --TRUE:MDSEL, FALSE:MDIV_SEL
        MDIV_SEL : integer := 8; --1~128,integer
        MDIV_FRAC_SEL : integer := 0; --0~7,integer
        ODIV0_FRAC_SEL : integer := 0; --0~7,integer
     
        CLKOUT0_EN : STRING := "TRUE"; --"TRUE","FALSE"
        CLKOUT1_EN : STRING := "FALSE"; --"TRUE","FALSE"
        CLKOUT2_EN : STRING := "FALSE"; --"TRUE","FALSE"
        CLKOUT3_EN : STRING := "FALSE"; --"TRUE","FALSE"
        CLKOUT4_EN : STRING := "FALSE"; --"TRUE","FALSE"
        CLKOUT5_EN : STRING := "FALSE"; --"TRUE","FALSE"
        CLKOUT6_EN : STRING := "FALSE"; --"TRUE","FALSE"
         
        CLKFB_SEL : STRING := "INTERNAL"; -- "INTERNAL", "EXTERNAL";
        
        DYN_DT0_SEL : STRING := "FALSE"; --TRUE:DT0; FALSE:CLKOUT0_DT_DIR & CLKOUT0_DT_STEP
        DYN_DT1_SEL : STRING := "FALSE"; --TRUE:DT1; FALSE:CLKOUT1_DT_DIR & CLKOUT1_DT_STEP
        DYN_DT2_SEL : STRING := "FALSE"; --TRUE:DT2; FALSE:CLKOUT2_DT_DIR & CLKOUT2_DT_STEP
        DYN_DT3_SEL : STRING := "FALSE"; --TRUE:DT3; FALSE:CLKOUT3_DT_DIR & CLKOUT3_DT_STEP
        CLKOUT0_DT_DIR : bit := '1'; -- CLKOUT0 dutycycle adjust direction. '1': + ; '0': -
        CLKOUT1_DT_DIR : bit := '1'; -- CLKOUT1 dutycycle adjust direction. '1': + ; '0': -
        CLKOUT2_DT_DIR : bit := '1'; -- CLKOUT2 dutycycle adjust direction. '1': + ; '0': -
        CLKOUT3_DT_DIR : bit := '1'; -- CLKOUT3 dutycycle adjust direction. '1': + ; '0': -
        CLKOUT0_DT_STEP : integer := 0; -- 0,1,2,4; 50ps/step
        CLKOUT1_DT_STEP : integer := 0; -- 0,1,2,4; 50ps/step
        CLKOUT2_DT_STEP : integer := 0; -- 0,1,2,4; 50ps/step
        CLKOUT3_DT_STEP : integer := 0; -- 0,1,2,4; 50ps/step

        CLK0_IN_SEL  : bit := '0'; --ODIV0 input source select. 0:from VCO;1:from CLKIN
        CLK0_OUT_SEL : bit := '0'; --CLKOUT0 output select. 0:DIV0 output; 1:CLKIN
        CLK1_IN_SEL  : bit := '0'; --ODIV1 input source select. 0:from VCO;1:from CLKIN
        CLK1_OUT_SEL : bit := '0'; --CLKOUT1 output select. 0:DIV1 output; 1:CLKIN
        CLK2_IN_SEL  : bit := '0'; --ODIV2 input source select. 0:from VCO;1:from CLKIN
        CLK2_OUT_SEL : bit := '0'; --CLKOUT2 output select. 0:DIV2 output; 1:CLKIN
        CLK3_IN_SEL  : bit := '0'; --ODIV3 input source select. 0:from VCO;1:from CLKIN
        CLK3_OUT_SEL : bit := '0'; --CLKOUT3 output select. 0:DIV3 output; 1:CLKIN
        CLK4_IN_SEL  : bit_vector := "00"; --ODIV4 input source select. 00:from VCO;01:from CASCADE;10:from CLKIN
        CLK4_OUT_SEL : bit := '0'; --CLKOUT4 output select. 0:DIV4 output; 1:CLKIN
        CLK5_IN_SEL  : bit := '0'; --ODIV5 input source select. 0:from VCO;1:from CLKIN
        CLK5_OUT_SEL : bit := '0'; --CLKOUT5 output select. 0:DIV5 output; 1:CLKIN
        CLK6_IN_SEL  : bit := '0'; --ODIV6 input source select. 0:from VCO;1:from CLKIN
        CLK6_OUT_SEL : bit := '0'; --CLKOUT6 output select. 0:DIV6 output; 1:CLKIN

        DYN_DPA_EN : STRING := "FALSE"; --dynamic phaseshift adjustment Enable."TRUE","FALSE"

        CLKOUT0_PE_COARSE : integer := 0; --1; --0~127    
        CLKOUT0_PE_FINE : integer := 0; --0~7
        CLKOUT1_PE_COARSE : integer := 0; --1; --0~127       
        CLKOUT1_PE_FINE : integer := 0; --0~7
        CLKOUT2_PE_COARSE : integer := 0; --1; --0~127       
        CLKOUT2_PE_FINE : integer := 0; --0~7
        CLKOUT3_PE_COARSE : integer := 0; --1; --0~127       
        CLKOUT3_PE_FINE : integer := 0; --0~7
        CLKOUT4_PE_COARSE : integer := 0; --1; --0~127       
        CLKOUT4_PE_FINE : integer := 0; --0~7
        CLKOUT5_PE_COARSE : integer := 0; --1; --0~127       
        CLKOUT5_PE_FINE : integer := 0; --0~7
        CLKOUT6_PE_COARSE : integer := 0; --1; --0~127       
        CLKOUT6_PE_FINE : integer := 0; --0~7

        DYN_PE0_SEL : STRING := "FALSE"; --"TRUE": select dpa port as the dynamic control signal for ODIV0 phase shift. "FALSE":select CLKOUT0_PE_COARSE & CLKOUT0_PE_FINE as the static control signal for ODIV0 phase shift
        DYN_PE1_SEL : STRING := "FALSE"; --"TRUE": select dpa port as the dynamic control signal for ODIV1 phase shift. "FALSE":select CLKOUT1_PE_COARSE & CLKOUT1_PE_FINE as the static control signal for ODIV1 phase shift
        DYN_PE2_SEL : STRING := "FALSE"; --"TRUE": select dpa port as the dynamic control signal for ODIV2 phase shift. "FALSE":select CLKOUT2_PE_COARSE & CLKOUT2_PE_FINE as the static control signal for ODIV2 phase shift
        DYN_PE3_SEL : STRING := "FALSE"; --"TRUE": select dpa port as the dynamic control signal for ODIV3 phase shift. "FALSE":select CLKOUT3_PE_COARSE & CLKOUT3_PE_FINE as the static control signal for ODIV3 phase shift
        DYN_PE4_SEL : STRING := "FALSE"; --"TRUE": select dpa port as the dynamic control signal for ODIV4 phase shift. "FALSE":select CLKOUT4_PE_COARSE & CLKOUT4_PE_FINE as the static control signal for ODIV4 phase shift
        DYN_PE5_SEL : STRING := "FALSE"; --"TRUE": select dpa port as the dynamic control signal for ODIV5 phase shift. "FALSE":select CLKOUT5_PE_COARSE & CLKOUT5_PE_FINE as the static control signal for ODIV5 phase shift
        DYN_PE6_SEL : STRING := "FALSE"; --"TRUE": select dpa port as the dynamic control signal for ODIV6 phase shift. "FALSE":select CLKOUT6_PE_COARSE & CLKOUT6_PE_FINE as the static control signal for ODIV6 phase shift

        DE0_EN : STRING := "FALSE"; --"FALSE":fixed 50% duty cycle for case odiv0=2~128; "TRUE":select CLKOUT0_PE_COARSE & CLKOUT0_PE_FINE as duty edge when DYN_PE0_SEL="TRUE" for case ODIV0=2~128
        DE1_EN : STRING := "FALSE"; --"FALSE":fixed 50% duty cycle for case odiv1=2~128; "TRUE":select CLKOUT1_PE_COARSE & CLKOUT1_PE_FINE as duty edge when DYN_PE1_SEL="TRUE" for case ODIV1=2~128
        DE2_EN : STRING := "FALSE"; --"FALSE":fixed 50% duty cycle for case odiv2=2~128; "TRUE":select CLKOUT2_PE_COARSE & CLKOUT2_PE_FINE as duty edge when DYN_PE2_SEL="TRUE" for case ODIV2=2~128
        DE3_EN : STRING := "FALSE"; --"FALSE":fixed 50% duty cycle for case odiv3=2~128; "TRUE":select CLKOUT3_PE_COARSE & CLKOUT3_PE_FINE as duty edge when DYN_PE3_SEL="TRUE" for case ODIV3=2~128
        DE4_EN : STRING := "FALSE"; --"FALSE":fixed 50% duty cycle for case odiv4=2~128; "TRUE":select CLKOUT4_PE_COARSE & CLKOUT4_PE_FINE as duty edge when DYN_PE4_SEL="TRUE" for case ODIV4=2~128
        DE5_EN : STRING := "FALSE"; --"FALSE":fixed 50% duty cycle for case odiv5=2~128; "TRUE":select CLKOUT5_PE_COARSE & CLKOUT5_PE_FINE as duty edge when DYN_PE5_SEL="TRUE" for case ODIV5=2~128
        DE6_EN : STRING := "FALSE"; --"FALSE":fixed 50% duty cycle for case odiv6=2~128; "TRUE":select CLKOUT6_PE_COARSE & CLKOUT6_PE_FINE as duty edge when DYN_PE6_SEL="TRUE" for case ODIV6=2~128

        RESET_I_EN : STRING := "FALSE"; --"TRUE","FALSE". Enable RESET_I through the dedicated signal from ciu.
        RESET_O_EN : STRING := "FALSE"; --"TRUE","FALSE". Enable RESET_S through the dedicated signal from ciu.

        DYN_ICP_SEL : STRING := "FALSE"; --TRUE:ICPSEL; FALSE:ICP_SEL
        ICP_SEL : std_logic_vector(5 downto 0) := "XXXXXX";
        DYN_LPF_SEL : STRING := "FALSE"; --TRUE:LPFRES; FALSE:LPR_REF
        LPF_RES : std_logic_vector(2 downto 0) := "XXX";
        LPF_CAP : bit_vector := "00"; --00,C0 ;01,C1; 10,C2

        SSC_EN : STRING := "FALSE" --"FALSE","TRUE".ssc mode enable
	);
    PORT(
        CLKIN : IN std_logic;
        CLKFB : IN std_logic:='0';
        RESET,PLLPWD : IN std_logic:='0';
        RESET_I,RESET_O : IN std_logic:='0';
        IDSEL,FBDSEL : IN std_logic_vector(5 downto 0);
        ODSEL0, ODSEL1, ODSEL2, ODSEL3 : IN std_logic_vector(6 downto 0);
        ODSEL4, ODSEL5, ODSEL6, MDSEL : IN std_logic_vector(6 downto 0);
        MDSEL_FRAC, ODSEL0_FRAC : IN std_logic_vector(2 downto 0);
        DT0, DT1, DT2, DT3 : IN std_logic_vector(3 downto 0);
        ICPSEL : IN std_logic_vector(5 downto 0);
        LPFRES : IN std_logic_vector(2 downto 0);
        LPFCAP : IN std_logic_vector(1 downto 0);
        PSSEL : IN std_logic_vector(2 downto 0);
        PSDIR,PSPULSE : IN std_logic;
        ENCLK0,ENCLK1,ENCLK2,ENCLK3,ENCLK4,ENCLK5,ENCLK6 : IN std_logic;
        SSCPOL,SSCON : IN std_logic;
        SSCMDSEL : IN std_logic_vector(6 downto 0);
        SSCMDSEL_FRAC : IN std_logic_vector(2 downto 0);
        LOCK : OUT std_logic;
        CLKOUT0,CLKOUT1 : OUT std_logic;
        CLKOUT2,CLKOUT3 : OUT std_logic;
        CLKOUT4,CLKOUT5 : OUT std_logic;
        CLKOUT6,CLKFBOUT : OUT std_logic
    );
end PLL;

architecture Behavioral of PLL is
signal IDIV_dyn,FBDIV_dyn : integer;
signal ODIV0_dyn,ODIV1_dyn,ODIV2_dyn,ODIV3_dyn,ODIV4_dyn,ODIV5_dyn,ODIV6_dyn,MDIV_dyn,ODIV0_f_dyn,MDIV_f_dyn : integer;
signal IDIV_SEL_reg,FBDIV_SEL_reg : integer := 1;
signal ODIV0_SEL_reg,ODIV1_SEL_reg,ODIV2_SEL_reg,ODIV3_SEL_reg,ODIV4_SEL_reg,ODIV5_SEL_reg,ODIV6_SEL_reg,MDIV_SEL_reg,ODIV0_f_reg,MDIV_f_reg : integer;
signal IDIV_dyn_reg,FBDIV_dyn_reg : integer;
signal ODIV0_dyn_reg,ODIV1_dyn_reg,ODIV2_dyn_reg,ODIV3_dyn_reg,ODIV4_dyn_reg,ODIV5_dyn_reg,ODIV6_dyn_reg,MDIV_dyn_reg : integer;
signal div_dyn_change : std_logic;
type  clkin_arr  is array (4 downto 0) of time;
signal clkin_cycle : clkin_arr := (0.0000 ns, 0.0000 ns, 0.0000 ns, 0.0000 ns,0.0000 ns);
signal clkin_period,clkin_period1,vco_period,clkout0_period,clkout1_period,clkout2_period,clkout3_period,clkout4_period,clkout5_period,clkout6_period,clkfbout_period :  time := 2.0000 ns;
signal clk_effect,oclk_effect : std_logic := '0';
signal clkout0_half,clkout1_half,clkout2_half,clkout3_half,clkout4_half,clkout5_half,clkout6_half,clkfbout_half : time := 0.0000 ns;
signal clkout0_half_odd,clkout1_half_odd,clkout2_half_odd,clkout3_half_odd,clkout4_half_odd,clkout5_half_odd,clkout6_half_odd : time := 0.0000 ns;
signal clkfb_curtime,clkin_curtime,FB_dly,FB_dly0 : time := 0.0000 ns;
signal clk0_reg,clk1_reg,clk2_reg,clk3_reg,clk4_reg,clk5_reg,clk6_reg,clkfb_reg,clk0,clk1,clk2,clk3,clk4,clk5,clk6,clkfb_0 : std_logic := '0';
signal clkout_0,clkout0_ps,clk0_out,clkout_1,clkout1_ps,clk1_out,clkout_2,clkout2_ps,clk2_out,clkout_3,clkout3_ps,clk3_out,clkout_4,clkout4_ps,clk4_out,clkout_5,clkout5_ps,clk5_out,clkout_6,clkout6_ps,clk6_out,clkfb_out,clkout_fb : std_logic := '0';
signal lock_reg : std_logic := '0';

signal real_phase0,real_duty0,real_phase1,real_duty1,real_phase2,real_duty2,real_phase3,real_duty3,real_phase4,real_duty4,real_phase5,real_duty5,real_phase6,real_duty6 : real;
signal phase_value0,clkout0_duty,clkout1_duty,tclk0_duty,tclk1_duty : time := 0.0000 ns;
signal clkout0_duty_odd,clkout1_duty_odd,clkout2_duty_odd,clkout3_duty_odd,clkout4_duty_odd,clkout5_duty_odd,clkout6_duty_odd : time := 0.0000 ns;
signal phase_value1,phase_value2,phase_value3,clkout2_duty,clkout3_duty,phase_value4,phase_value5,phase_value6,clkout4_duty,clkout5_duty,clkout6_duty,tclk2_duty,tclk3_duty : time := 0.0000 ns;

signal fine_dyn_0,fine_dyn_1,fine_dyn_2,fine_dyn_3,fine_dyn_4,fine_dyn_5,fine_dyn_6 : std_logic_vector(2 downto 0) := "000";
signal coarse_dyn_0,coarse_dyn_1,coarse_dyn_2,coarse_dyn_3,coarse_dyn_4,coarse_dyn_5,coarse_dyn_6 : integer := 0;
signal ps_pulse_pre : std_logic;
signal clk0_dt_dir,clk1_dt_dir,clk2_dt_dir,clk3_dt_dir : std_logic;
signal clk0_dt_step,clk1_dt_step,clk2_dt_step,clk3_dt_step : integer;
signal fine_0,fine_1,fine_2,fine_3,fine_4,fine_5,fine_6 : integer;
signal coarse_0,coarse_1,coarse_2,coarse_3,coarse_4,coarse_5,coarse_6 : integer;
signal unit_duty,unit_phase,unit_div,real_fbdiv : real := 1.0;
signal real_odiv0,real_odiv0_f,real_odiv1,real_odiv2,real_odiv3,real_odiv4,real_odiv5,real_odiv6 : real := 1.0;

signal max_tlock : time := 50000 ns;
signal cnt_lock : integer := 0;
signal multi_clkin : integer;
signal clkin_init,fb_clk_init : std_logic := '1';
signal pssel_0_flag,pssel_1_flag,pssel_2_flag,pssel_3_flag,pssel_4_flag,pssel_5_flag,pssel_6_flag : std_logic := '0';
signal inner_reset:std_logic:='0';
signal clk0_dt_delay,clk1_dt_delay,clk2_dt_delay,clk3_dt_delay : time := 0.0000 ns;
signal clkout_dt_0,clkout_dt_1,clkout_dt_2,clkout_dt_3 : std_logic := '0';
signal rst,rst_p,rsto : std_logic := '0';
signal enclk_0,enclk_1,enclk_2,enclk_3,enclk_4,enclk_5,enclk_6 : std_logic;
signal cken0,cken1,cken2,cken3,cken4,cken5,cken6 : std_logic := '0';
signal reseti, reseto : std_logic := '0';
signal h_level_0,h_level_1,h_level_2,h_level_3,h_level_4,h_level_5,h_level_6 : integer := 0;
signal real_h_level_0,real_h_level_1,real_h_level_2,real_h_level_3,real_h_level_4,real_h_level_5,real_h_level_6 : real := 0.00000;

begin

    reseti <= RESET_I when (RESET_I_EN = "TRUE") else '0';
    reseto <= RESET_O when (RESET_O_EN = "TRUE") else '0';

    inner_reset <= RESET or PLLPWD or reseti;

    process(CLKIN, inner_reset)
    variable clkin_edge_pre :time := 0 ns;
    variable clkin_edge_cur :time := 0 ns;

    begin
        if(inner_reset = '1')then
            clk_effect <= '0';
            clkin_cycle(0) <= 0.0 ns;
        elsif(CLKIN'event and CLKIN = '1')then
            clkin_edge_cur := NOW;
            clkin_cycle(4) <= clkin_cycle(3);
	        clkin_cycle(3) <= clkin_cycle(2);
	        clkin_cycle(2) <= clkin_cycle(1);
            clkin_cycle(1) <= clkin_cycle(0);

            if(clkin_edge_pre /= 0 ns)then
                clkin_cycle(0) <= clkin_edge_cur - clkin_edge_pre;
            end if;

            clkin_edge_pre := clkin_edge_cur;

            if(clkin_edge_pre /= 0 ns) then
                if((clkin_cycle(0) = clkin_period) and (div_dyn_change = '0')) then
                    clk_effect <= '1';

                else
                    clk_effect <= '0';
                end if;
            end if;
        end if;
    end process;

    process(clkin_cycle(0),clkin_cycle(1),clkin_cycle(2),clkin_cycle(3),clkin_cycle(4),clkin_period) 
    variable clkin_period_tmp : time := 0.0 ns;
    begin
        clkin_period_tmp := clkin_cycle(0);
        if(clkin_period_tmp /= clkin_period) then
		    clkin_period1 <= (clkin_cycle(0) + clkin_cycle(1) + clkin_cycle(2) + clkin_cycle(3) + clkin_cycle(4))/5.0;
            clkin_period <= clkin_period1;
        end if;
    end process;

    IDIV_dyn <= 64 - conv_integer(IDSEL);
    FBDIV_dyn <= 64 - conv_integer(FBDSEL);

    ODIV0_dyn <= 128 - conv_integer(ODSEL0);
    ODIV1_dyn <= 128 - conv_integer(ODSEL1);
    ODIV2_dyn <= 128 - conv_integer(ODSEL2);
    ODIV3_dyn <= 128 - conv_integer(ODSEL3);
    ODIV4_dyn <= 128 - conv_integer(ODSEL4);
    ODIV5_dyn <= 128 - conv_integer(ODSEL5);
    ODIV6_dyn <= 128 - conv_integer(ODSEL6);
    MDIV_dyn <= 128 - conv_integer(MDSEL);
    MDIV_f_dyn <= 7 - conv_integer(MDSEL_FRAC);
    ODIV0_f_dyn <= 7 - conv_integer(ODSEL0_FRAC);

    IDIV_SEL_reg <= IDIV_dyn when (DYN_IDIV_SEL = "TRUE") else IDIV_SEL;
    FBDIV_SEL_reg <= FBDIV_dyn when (DYN_FBDIV_SEL = "TRUE") else FBDIV_SEL;
    ODIV0_SEL_reg <= ODIV0_dyn when (DYN_ODIV0_SEL = "TRUE") else ODIV0_SEL;
    ODIV1_SEL_reg <= ODIV1_dyn when (DYN_ODIV1_SEL = "TRUE") else ODIV1_SEL;
    ODIV2_SEL_reg <= ODIV2_dyn when (DYN_ODIV2_SEL = "TRUE") else ODIV2_SEL;
    ODIV3_SEL_reg <= ODIV3_dyn when (DYN_ODIV3_SEL = "TRUE") else ODIV3_SEL;
    ODIV4_SEL_reg <= ODIV4_dyn when (DYN_ODIV4_SEL = "TRUE") else ODIV4_SEL;
    ODIV5_SEL_reg <= ODIV5_dyn when (DYN_ODIV5_SEL = "TRUE") else ODIV5_SEL;
    ODIV6_SEL_reg <= ODIV6_dyn when (DYN_ODIV6_SEL = "TRUE") else ODIV6_SEL;
    MDIV_SEL_reg <= MDIV_dyn when (DYN_MDIV_SEL = "TRUE") else MDIV_SEL;
    ODIV0_f_reg <= ODIV0_f_dyn when (DYN_ODIV0_SEL = "TRUE") else ODIV0_FRAC_SEL;
    MDIV_f_reg <= MDIV_f_dyn when (DYN_MDIV_SEL = "TRUE") else MDIV_FRAC_SEL;

    process(CLKIN) 
    begin
        if(rising_edge(CLKIN)) then
            IDIV_dyn_reg <= IDIV_dyn;
            FBDIV_dyn_reg <= FBDIV_dyn;
            ODIV0_dyn_reg <= ODIV0_dyn;
            ODIV1_dyn_reg <= ODIV1_dyn;
            ODIV2_dyn_reg <= ODIV2_dyn;
            ODIV3_dyn_reg <= ODIV3_dyn;
            ODIV4_dyn_reg <= ODIV4_dyn;
            ODIV5_dyn_reg <= ODIV5_dyn;
            ODIV6_dyn_reg <= ODIV6_dyn;
            MDIV_dyn_reg <= MDIV_dyn;            
        end if;
    end process;

    process(IDIV_dyn_reg,IDIV_dyn,FBDIV_dyn_reg,FBDIV_dyn,ODIV0_dyn_reg,ODIV0_dyn,ODIV1_dyn_reg,ODIV1_dyn,ODIV2_dyn_reg,ODIV2_dyn,ODIV3_dyn_reg,ODIV3_dyn,ODIV4_dyn_reg,ODIV4_dyn,ODIV5_dyn_reg,ODIV5_dyn,ODIV6_dyn_reg,ODIV6_dyn,MDIV_dyn_reg,MDIV_dyn)
    begin
        if((IDIV_dyn_reg /= IDIV_dyn) or (FBDIV_dyn_reg /= FBDIV_dyn) or (ODIV0_dyn_reg /= ODIV0_dyn) or (ODIV1_dyn_reg /= ODIV1_dyn) or (ODIV2_dyn_reg /= ODIV2_dyn) or (ODIV3_dyn_reg /= ODIV3_dyn) or (ODIV4_dyn_reg /= ODIV4_dyn) or (ODIV5_dyn_reg /= ODIV5_dyn) or (ODIV6_dyn_reg /= ODIV6_dyn) or (MDIV_dyn_reg /= MDIV_dyn)) then
            div_dyn_change <= '1';
        else
            div_dyn_change <= '0';
        end if;
    end process;


    process(clkin_period, IDIV_SEL_reg, FBDIV_SEL_reg, ODIV0_SEL_reg, ODIV0_f_reg, MDIV_SEL_reg, MDIV_f_reg)
    begin
        real_fbdiv <= (real(FBDIV_SEL_reg));
        if(CLKFB_SEL = "INTERNAL") then
            vco_period <= ((clkin_period * real(IDIV_SEL_reg)) / real_fbdiv) / (real(MDIV_SEL_reg) + (real(MDIV_f_reg)/8.0));
        else
            if(ODIV0_SEL_reg = 1) then
                vco_period <= ((clkin_period * real(IDIV_SEL_reg)) / real_fbdiv) / (real(ODIV0_SEL_reg));
            else
                vco_period <= ((clkin_period * real(IDIV_SEL_reg)) / real_fbdiv) / (real(ODIV0_SEL_reg) + (real(ODIV0_f_reg)/8.0));
            end if;
        end if;

    end process;

    process(vco_period, ODIV0_SEL_reg,ODIV0_f_reg,clkin_period)
    begin
        real_odiv0 <= real(ODIV0_SEL_reg);
        real_odiv0_f <= real(ODIV0_f_reg);
        if (CLK0_IN_SEL = '0') then
            if(ODIV0_SEL_reg = 1) then
                clkout0_period <= (vco_period * real_odiv0);
            else
                clkout0_period <= (vco_period * (real_odiv0 + real_odiv0_f/8.0));
            end if;
        elsif (CLK0_IN_SEL = '1') then
            clkout0_period <= (clkin_period * real_odiv0);
        end if;
    end process;

    process(vco_period, ODIV1_SEL_reg,clkin_period)
    begin
        real_odiv1 <= real(ODIV1_SEL_reg);
        if (CLK1_IN_SEL = '0') then
            clkout1_period <= (vco_period * real_odiv1);
        elsif (CLK1_IN_SEL = '1') then
            clkout1_period <= (clkin_period * real_odiv1);
        end if;
    end process;

    process(vco_period, ODIV2_SEL_reg,clkin_period)
    begin
        real_odiv2 <= real(ODIV2_SEL_reg);
        if (CLK2_IN_SEL = '0') then
            clkout2_period <= (vco_period * real_odiv2);
        elsif (CLK2_IN_SEL = '1') then
            clkout2_period <= (clkin_period * real_odiv2);
        end if;
    end process;

    process(vco_period, ODIV3_SEL_reg,clkin_period)
    begin
        real_odiv3 <= real(ODIV3_SEL_reg);
        if (CLK3_IN_SEL = '0') then
            clkout3_period <= (vco_period * real_odiv3);
        elsif (CLK3_IN_SEL = '1') then
            clkout3_period <= (clkin_period * real_odiv3);
        end if;
    end process;

    process(vco_period, ODIV4_SEL_reg,clkout6_period,clkin_period)
    begin
        real_odiv4 <= real(ODIV4_SEL_reg);
        if (CLK4_IN_SEL = "00") then
            clkout4_period <= (vco_period * real_odiv4);
        elsif (CLK4_IN_SEL = "01") then
            clkout4_period <= (clkout6_period * real_odiv4);
        elsif (CLK4_IN_SEL = "10") then
            clkout4_period <= (clkin_period * real_odiv4);
        end if;
    end process;

    process(vco_period, ODIV5_SEL_reg,clkin_period)
    begin
        real_odiv5 <= real(ODIV5_SEL_reg);
        if (CLK5_IN_SEL = '0') then
            clkout5_period <= (vco_period * real_odiv5);
        elsif (CLK5_IN_SEL = '1') then
            clkout5_period <= (clkin_period * real_odiv5);
        end if;
    end process;

    process(vco_period, ODIV6_SEL_reg,clkin_period)
    begin
        real_odiv6 <= real(ODIV6_SEL_reg);
        if (CLK6_IN_SEL = '0') then
            clkout6_period <= (vco_period * real_odiv6);
        elsif (CLK6_IN_SEL = '1') then
            clkout6_period <= (clkin_period * real_odiv6);
        end if;
    end process;

    clkfbout_period <= (vco_period * (real(MDIV_SEL_reg) + (real(MDIV_f_reg)/8.0)));
    
    clkout0_half <= (clkout0_period / 2.0);
    clkout1_half <= (clkout1_period / 2.0);
    clkout2_half <= (clkout2_period / 2.0);
    clkout3_half <= (clkout3_period / 2.0);
    clkout4_half <= (clkout4_period / 2.0);
    clkout5_half <= (clkout5_period / 2.0);
    clkout6_half <= (clkout6_period / 2.0);
    clkfbout_half <= (clkfbout_period / 2.0);

    -- lock time
    rst <= RESET or PLLPWD or reseti or reseto;
    
    process(CLKIN, rst)
    begin
        if (rst = '1') then
            max_tlock <= 0.0 us;
        elsif(rising_edge(CLKIN)) then
            if((clkin_cycle(0) >= 2 ns) and (clkin_cycle(0) <= 40 ns)) then
                max_tlock <= 50000.0 ns;
            elsif ((clkin_cycle(0) > 40 ns) and (clkin_cycle(0) <= 500 ns)) then
                max_tlock <= 200000.0 ns;              
            end if;
        end if;
    end process;

    process(CLKIN, rst)
    begin
        if (rst = '1') then
            lock_reg <= '0';
            oclk_effect <= '0';
        elsif(rising_edge(CLKIN)) then
            if(clk_effect = '1') then
                cnt_lock <= cnt_lock + 1;

                if(cnt_lock > (max_tlock/clkin_period - 10)) then
                    oclk_effect <= '1';
                else
                    oclk_effect <= '0';
                end if;

                if(cnt_lock > (max_tlock/clkin_period)) then
                    lock_reg <= '1';
                else
                    lock_reg <= '0';
                end if;

            else
                oclk_effect <= '0';
                cnt_lock <= 0;
                lock_reg <= '0';           
            end if;
        end if;
    end process;

    LOCK <= '0' when (CLKFB_SEL = "EXTERNAL" and CLK0_IN_SEL = '1') else lock_reg;
    
    -- calculate CLKFB feedback delay
    process(CLKIN) 
    begin
        if (rising_edge(CLKIN)) then
            if (clkin_init = '1') then
                clkin_curtime <= NOW;
                clkin_init <= '0';
            end if;
        end if;
    end process;

    process(CLKFB) 
    begin
        if (rising_edge(CLKFB)) then
            if (fb_clk_init = '1') then
                clkfb_curtime <= NOW;
                fb_clk_init <= '0';
            end if;
        end if;
    end process;

    process(CLKFB, CLKIN)
    begin
        if ((clkfb_curtime > 0 ns) and (clkin_curtime > 0 ns)) then
            FB_dly0 <= clkfb_curtime - clkin_curtime;
            if ((FB_dly0 >= 0 ns) and (clkin_cycle(0) > 0 ns)) then
                --multi_clkin <= FB_dly0 / (clkin_cycle(0));
                --FB_dly <= clkin_cycle(0) - (FB_dly0 - (clkin_cycle(0)) * multi_clkin);
                FB_dly <= clkin_cycle(0) - (FB_dly0 - (clkin_cycle(0)) * (FB_dly0 / (clkin_cycle(0))));
            end if;
        end if;
    end process;

    process
    variable clk0_flag : std_logic := '1';
    begin
        if(oclk_effect = '0') then
            clk0_reg <= '0';
        else
            if(clk0_flag = '1') then
                clk0_reg <= '1';
                clk0_flag := '0';
            else
                wait for (clkout0_half); 
                clk0_reg <= not clk0_reg ;
            end if;
        end if;
        wait on oclk_effect,clk0_reg;
    end process;

    process
    variable clk1_flag : std_logic := '1';
    begin
        if(oclk_effect = '0') then
            clk1_reg <= '0';
        else
            if(clk1_flag = '1') then
                clk1_reg <= '1';
                clk1_flag := '0';
            else
                wait for (clkout1_half); 
                clk1_reg <= not clk1_reg ;
            end if;
        end if;
        wait on oclk_effect,clk1_reg;
    end process;

    process
    variable clk2_flag : std_logic := '1';
    begin
        if(oclk_effect = '0') then
            clk2_reg <= '0';
        else
            if(clk2_flag = '1') then
                clk2_reg <= '1';
                clk2_flag := '0';
            else
                wait for (clkout2_half);
                clk2_reg <= not clk2_reg ;
            end if;
        end if;
        wait on oclk_effect,clk2_reg;
    end process;

    process
    variable clk3_flag : std_logic := '1';
    begin
        if(oclk_effect = '0') then
            clk3_reg <= '0';
        else
            if(clk3_flag = '1') then
                clk3_reg <= '1';
                clk3_flag := '0';
            else
                wait for (clkout3_half); 
                clk3_reg <= not clk3_reg ;
            end if;
        end if;
        wait on oclk_effect,clk3_reg;
    end process;

    process
    variable clk4_flag : std_logic := '1';
    begin
        if(oclk_effect = '0') then
            clk4_reg <= '0';
        else
            if(clk4_flag = '1') then
                clk4_reg <= '1';
                clk4_flag := '0';
            else
                wait for (clkout4_half); 
                clk4_reg <= not clk4_reg ;
            end if;
        end if;
        wait on oclk_effect,clk4_reg;
    end process;

    process
    variable clk5_flag : std_logic := '1';
    begin
        if(oclk_effect = '0') then
            clk5_reg <= '0';
        else
            if(clk5_flag = '1') then
                clk5_reg <= '1';
                clk5_flag := '0';
            else
                wait for (clkout5_half); 
                clk5_reg <= not clk5_reg ;
            end if;
        end if;
        wait on oclk_effect,clk5_reg;
    end process;

    process
    variable clk6_flag : std_logic := '1';
    begin
        if(oclk_effect = '0') then
            clk6_reg <= '0';
        else
            if(clk6_flag = '1') then
                clk6_reg <= '1';
                clk6_flag := '0';
            else
                wait for (clkout6_half); 
                clk6_reg <= not clk6_reg ;
            end if;
        end if;
        wait on oclk_effect,clk6_reg;
    end process;

    process
    variable clkfb_flag : std_logic := '1';
    begin
        if(oclk_effect = '0') then
            clkfb_reg <= '0';
        else
            if(clkfb_flag = '1') then
                clkfb_reg <= '1';
                clkfb_flag := '0';
            else
                wait for (clkfbout_half); 
                clkfb_reg <= not clkfb_reg ;
            end if;
        end if;
        wait on oclk_effect,clkfb_reg;
    end process;


    process (clk0_reg, clk1_reg, clk2_reg, clk3_reg, clk4_reg, clk5_reg, clk6_reg, clkfb_reg, FB_dly)
    begin
        if (CLKFB_SEL = "INTERNAL") then
            clk0 <= clk0_reg;
            clk1 <= clk1_reg;
            clk2 <= clk2_reg;
            clk3 <= clk3_reg;
            clk4 <= clk4_reg;
            clk5 <= clk5_reg;
            clk6 <= clk6_reg;
            clkfb_0 <= clkfb_reg;
         else
            clk0 <= transport clk0_reg after (FB_dly);
            clk1 <= transport clk1_reg after (FB_dly);
            clk2 <= transport clk2_reg after (FB_dly);
            clk3 <= transport clk3_reg after (FB_dly);
            clk4 <= transport clk4_reg after (FB_dly);
            clk5 <= transport clk5_reg after (FB_dly);
            clk6 <= transport clk6_reg after (FB_dly);
            clkfb_0 <= transport clkfb_reg after (FB_dly);
         end if;
    end process;

    --dynamic phase shift
    process (PSPULSE)
    begin
        ps_pulse_pre <= PSPULSE;
    end process;

    process
    begin
        if(PSSEL = "000") then
            pssel_0_flag <= '1';
            pssel_1_flag <= '0';
            pssel_2_flag <= '0';
            pssel_3_flag <= '0';
            pssel_4_flag <= '0';
            pssel_5_flag <= '0';
            pssel_6_flag <= '0';
            wait for 1 ns;
            pssel_0_flag <= '0';
        elsif(PSSEL = "001") then
            pssel_0_flag <= '0';
            pssel_1_flag <= '1';
            pssel_2_flag <= '0';
            pssel_3_flag <= '0';
            pssel_4_flag <= '0';
            pssel_5_flag <= '0';
            pssel_6_flag <= '0';
            wait for 1 ns;
            pssel_1_flag <= '0';
        elsif(PSSEL = "010") then
            pssel_0_flag <= '0';
            pssel_1_flag <= '0';
            pssel_2_flag <= '1';
            pssel_3_flag <= '0';
            pssel_4_flag <= '0';
            pssel_5_flag <= '0';
            pssel_6_flag <= '0';
            wait for 1 ns;
            pssel_2_flag <= '0';
        elsif(PSSEL = "011") then
            pssel_0_flag <= '0';
            pssel_1_flag <= '0';
            pssel_2_flag <= '0';
            pssel_3_flag <= '1';
            pssel_4_flag <= '0';
            pssel_5_flag <= '0';
            pssel_6_flag <= '0';
            wait for 1 ns;
            pssel_3_flag <= '0';
        elsif(PSSEL = "100") then
            pssel_0_flag <= '0';
            pssel_1_flag <= '0';
            pssel_2_flag <= '0';
            pssel_3_flag <= '0';
            pssel_4_flag <= '1';
            pssel_5_flag <= '0';
            pssel_6_flag <= '0';
            wait for 1 ns;
            pssel_4_flag <= '0';
        elsif(PSSEL = "101") then
            pssel_0_flag <= '0';
            pssel_1_flag <= '0';
            pssel_2_flag <= '0';
            pssel_3_flag <= '0';
            pssel_4_flag <= '0';
            pssel_5_flag <= '1';
            pssel_6_flag <= '0';
            wait for 1 ns;
            pssel_5_flag <= '0';
        elsif(PSSEL = "110") then
            pssel_0_flag <= '0';
            pssel_1_flag <= '0';
            pssel_2_flag <= '0';
            pssel_3_flag <= '0';
            pssel_4_flag <= '0';
            pssel_5_flag <= '0';
            pssel_6_flag <= '1';
            wait for 1 ns;
            pssel_6_flag <= '0';
        end if;
        wait on PSSEL;
    end process;

    process(PSSEL,PSPULSE,PSDIR,ODIV0_SEL_reg,fine_dyn_0,coarse_dyn_0,ODIV1_SEL_reg,fine_dyn_1,coarse_dyn_1,ODIV2_SEL_reg,fine_dyn_2,coarse_dyn_2,ODIV3_SEL_reg,fine_dyn_3,coarse_dyn_3,ODIV4_SEL_reg,fine_dyn_4,coarse_dyn_4,ODIV5_SEL_reg,fine_dyn_5,coarse_dyn_5,ODIV6_SEL_reg,fine_dyn_6,coarse_dyn_6,pssel_0_flag,pssel_1_flag,pssel_2_flag,pssel_3_flag,pssel_4_flag,pssel_5_flag,pssel_6_flag)
    begin
    if (inner_reset = '1') then
        fine_dyn_0 <= (others=>'0');
        fine_dyn_1<= (others=>'0');
        fine_dyn_2 <= (others=>'0');
        fine_dyn_3 <= (others=>'0');
        fine_dyn_4<= (others=>'0');
        fine_dyn_5 <= (others=>'0');
        fine_dyn_6 <= (others=>'0');
        coarse_dyn_0 <= 0;
        coarse_dyn_1 <= 0;
        coarse_dyn_2 <= 0;
        coarse_dyn_3 <= 0;
        coarse_dyn_4 <= 0;
        coarse_dyn_5 <= 0;
        coarse_dyn_6 <= 0;
     else
        if (PSSEL = "000") then
            if(pssel_0_flag = '1') then
                fine_dyn_0 <= (others=>'0');
                coarse_dyn_0 <= 0;
            else
            if (PSPULSE = '0' and ps_pulse_pre = '1') then
                if (PSDIR = '0') then
                    if(ODIV0_SEL_reg = 1) then
                        coarse_dyn_0 <= 0;
                    else
                        if(fine_dyn_0 = "111") then
                            coarse_dyn_0 <= coarse_dyn_0 + 1;
                            if (coarse_dyn_0 = (ODIV0_SEL_reg-1)) then
                                coarse_dyn_0 <= 0;
                            end if;
                        end if;
                    end if;
                    fine_dyn_0 <= fine_dyn_0 + 1;

                else
                    if(ODIV0_SEL_reg = 1) then
                        coarse_dyn_0 <= 0;
                    else
                        if(fine_dyn_0 = "000") then
                            coarse_dyn_0 <= coarse_dyn_0 - 1;
                            if (coarse_dyn_0 = 0) then
                                coarse_dyn_0 <= (ODIV0_SEL_reg-1);
                            end if;
                        end if;
                    end if;
                    fine_dyn_0 <= fine_dyn_0 - 1;

                end if;
            end if;
            end if;
        elsif (PSSEL = "001") then
            if(pssel_1_flag = '1') then
                fine_dyn_1 <= (others=>'0');
                coarse_dyn_1 <= 0;
            else
            if (PSPULSE = '0' and ps_pulse_pre = '1') then
                if (PSDIR = '0') then
                    if(ODIV1_SEL_reg = 1) then
                        coarse_dyn_1 <= 0;
                    else
                        if(fine_dyn_1 = "111") then
                            coarse_dyn_1 <= coarse_dyn_1 + 1;
                            if (coarse_dyn_1 = (ODIV1_SEL_reg-1)) then
                                coarse_dyn_1 <= 0;
                            end if;
                        end if;
                    end if;
                    fine_dyn_1 <= fine_dyn_1 + 1;

                else
                    if(ODIV1_SEL_reg = 1) then
                        coarse_dyn_1 <= 0;
                    else
                        if(fine_dyn_1 = "000") then
                            coarse_dyn_1 <= coarse_dyn_1 - 1;
                            if (coarse_dyn_1 = 1) then
                                coarse_dyn_1 <= (ODIV1_SEL_reg-1);
                            end if;
                        end if;
                    end if;
                    fine_dyn_1 <= fine_dyn_1 - 1;
                end if;
            end if;
            end if;
        elsif (PSSEL = "010") then
            if(pssel_2_flag = '1') then
                fine_dyn_2 <= (others=>'0');
                coarse_dyn_2 <= 0;
            else
            if (PSPULSE = '0' and ps_pulse_pre = '1') then
                if (PSDIR = '0') then
                    if(ODIV2_SEL_reg = 1) then
                        coarse_dyn_2 <= 0;
                    else
                        if(fine_dyn_2 = "111") then
                            coarse_dyn_2 <= coarse_dyn_2 + 1;
                            if (coarse_dyn_2 = (ODIV2_SEL_reg-1)) then
                                coarse_dyn_2 <= 0;
                            end if;
                        end if;
                    end if;
                    fine_dyn_2 <= fine_dyn_2 + 1;

                else
                    if(ODIV2_SEL_reg = 1) then
                        coarse_dyn_2 <= 0;
                    else
                        if(fine_dyn_2 = "000") then
                            coarse_dyn_2 <= coarse_dyn_2 - 1;
                            if (coarse_dyn_2 = 1) then
                                coarse_dyn_2 <= (ODIV2_SEL_reg-1);
                            end if;
                        end if;
                    end if;
                    fine_dyn_2 <= fine_dyn_2 - 1;
                end if;
            end if;
            end if;
        elsif (PSSEL = "011") then
            if(pssel_3_flag = '1') then
                fine_dyn_3 <= (others=>'0');
                coarse_dyn_3 <= 0;
            else
            if (PSPULSE = '0' and ps_pulse_pre = '1') then
                if (PSDIR = '0') then
                    if(ODIV3_SEL_reg = 1) then
                        coarse_dyn_3 <= 0;
                    else
                        if(fine_dyn_3 = "111") then
                            coarse_dyn_3 <= coarse_dyn_3 + 1;
                            if (coarse_dyn_3 = (ODIV3_SEL_reg-1)) then
                                coarse_dyn_3 <= 0;
                            end if;
                        end if;
                    end if;
                    fine_dyn_3 <= fine_dyn_3 + 1;

                else
                    if(ODIV3_SEL_reg = 1) then
                        coarse_dyn_3 <= 0;
                    else
                        if(fine_dyn_3 = "000") then
                            coarse_dyn_3 <= coarse_dyn_3 - 1;
                            if (coarse_dyn_3 = 1) then
                                coarse_dyn_3 <= (ODIV3_SEL_reg-1);
                            end if;
                        end if;
                    end if;
                    fine_dyn_3 <= fine_dyn_3 - 1;
                end if;
            end if;
            end if;
        elsif (PSSEL = "100") then
            if(pssel_4_flag = '1') then
                fine_dyn_4 <= (others=>'0');
                coarse_dyn_4 <= 0;
            else
            if (PSPULSE = '0' and ps_pulse_pre = '1') then
                if (PSDIR = '0') then
                    if(ODIV4_SEL_reg = 1) then
                        coarse_dyn_4 <= 0;
                    else
                        if(fine_dyn_4 = "111") then
                            coarse_dyn_4 <= coarse_dyn_4 + 1;
                            if (coarse_dyn_4 = (ODIV4_SEL_reg-1)) then
                                coarse_dyn_4 <= 0;
                            end if;
                        end if;
                    end if;
                    fine_dyn_4 <= fine_dyn_4 + 1;

                else
                    if(ODIV4_SEL_reg = 1) then
                        coarse_dyn_4 <= 0;
                    else
                        if(fine_dyn_4 = "000") then
                            coarse_dyn_4 <= coarse_dyn_4 - 1;
                            if (coarse_dyn_4 = 1) then
                                coarse_dyn_4 <= (ODIV4_SEL_reg-1);
                            end if;
                        end if;
                    end if;
                    fine_dyn_4 <= fine_dyn_4 - 1;
                end if;
            end if;
            end if;
        elsif (PSSEL = "101") then
            if(pssel_5_flag = '1') then
                fine_dyn_5 <= (others=>'0');
                coarse_dyn_5 <= 0;
            else
            if (PSPULSE = '0' and ps_pulse_pre = '1') then
                if (PSDIR = '0') then
                    if(ODIV5_SEL_reg = 1) then
                        coarse_dyn_5 <= 0;
                    else
                        if(fine_dyn_5 = "111") then
                            coarse_dyn_5 <= coarse_dyn_5 + 1;
                            if (coarse_dyn_5 = (ODIV5_SEL_reg-1)) then
                                coarse_dyn_5 <= 0;
                            end if;
                        end if;
                    end if;
                    fine_dyn_5 <= fine_dyn_5 + 1;

                else
                    if(ODIV5_SEL_reg = 1) then
                        coarse_dyn_5 <= 0;
                    else
                        if(fine_dyn_5 = "000") then
                            coarse_dyn_5 <= coarse_dyn_5 - 1;
                            if (coarse_dyn_5 = 1) then
                                coarse_dyn_5 <= (ODIV5_SEL_reg-1);
                            end if;
                        end if;
                    end if;
                    fine_dyn_5 <= fine_dyn_5 - 1;
                end if;
            end if;
            end if;
        elsif (PSSEL = "110") then
            if(pssel_6_flag = '1') then
                fine_dyn_6 <= (others=>'0');
                coarse_dyn_6 <= 0;
            else
            if (PSPULSE = '0' and ps_pulse_pre = '1') then
                if (PSDIR = '0') then
                    if(ODIV6_SEL_reg = 1) then
                        coarse_dyn_6 <= 0;
                    else
                        if(fine_dyn_6 = "111") then
                            coarse_dyn_6 <= coarse_dyn_6 + 1;
                            if (coarse_dyn_6 = (ODIV6_SEL_reg-1)) then
                                coarse_dyn_6 <= 0;
                            end if;
                        end if;
                    end if;
                    fine_dyn_6 <= fine_dyn_6 + 1;

                else
                    if(ODIV6_SEL_reg = 1) then
                        coarse_dyn_6 <= 0;
                    else
                        if(fine_dyn_6 = "000") then
                            coarse_dyn_6 <= coarse_dyn_6 - 1;
                            if (coarse_dyn_6 = 1) then
                                coarse_dyn_6 <= (ODIV6_SEL_reg-1);
                            end if;
                        end if;
                    end if;
                    fine_dyn_6 <= fine_dyn_6 - 1;
                end if;
            end if;
            end if;
        end if;
    end if;
    end process;

    --enclk
    enclk_0 <= '1' when ((CLKOUT0_EN = "TRUE") and (ENCLK0 = '1')) else '0';
    enclk_1 <= '1' when ((CLKOUT1_EN = "TRUE") and (ENCLK1 = '1')) else '0';
    enclk_2 <= '1' when ((CLKOUT2_EN = "TRUE") and (ENCLK2 = '1')) else '0';
    enclk_3 <= '1' when ((CLKOUT3_EN = "TRUE") and (ENCLK3 = '1')) else '0';
    enclk_4 <= '1' when ((CLKOUT4_EN = "TRUE") and (ENCLK4 = '1')) else '0';
    enclk_5 <= '1' when ((CLKOUT5_EN = "TRUE") and (ENCLK5 = '1')) else '0';
    enclk_6 <= '1' when ((CLKOUT6_EN = "TRUE") and (ENCLK6 = '1')) else '0';

    rsto <= RESET or PLLPWD or reseto;

    process(clk0_out, rsto)
    begin
        if(rsto = '1') then
            cken0 <= '0';
        elsif(falling_edge(clk0_out)) then
            cken0 <= enclk_0;
        end if;
    end process;

    process(clk1_out, rsto)
    begin
        if(rsto = '1') then
            cken1 <= '0';
        elsif(falling_edge(clk1_out)) then
            cken1 <= enclk_1;
        end if;
    end process;

    process(clk2_out, rsto)
    begin
        if(rsto = '1') then
            cken2 <= '0';
        elsif(falling_edge(clk2_out)) then
            cken2 <= enclk_2;
        end if;
    end process;

    process(clk3_out, rsto)
    begin
        if(rsto = '1') then
            cken3 <= '0';
        elsif(falling_edge(clk3_out)) then
            cken3 <= enclk_3;
        end if;
    end process;

    process(clk4_out, rsto)
    begin
        if(rsto = '1') then
            cken4 <= '0';
        elsif(falling_edge(clk4_out)) then
            cken4 <= enclk_4;
        end if;
    end process;

    process(clk5_out, rsto)
    begin
        if(rsto = '1') then
            cken5 <= '0';
        elsif(falling_edge(clk5_out)) then
            cken5 <= enclk_5;
        end if;
    end process;

    process(clk6_out, rsto)
    begin
        if(rsto = '1') then
            cken6 <= '0';
        elsif(falling_edge(clk6_out)) then
            cken6 <= enclk_6;
        end if;
    end process;
    
    clk0_dt_dir <= TO_STDULOGIC(CLKOUT0_DT_DIR) when (DYN_DT0_SEL = "FALSE") else DT0(3);
    clk1_dt_dir <= TO_STDULOGIC(CLKOUT1_DT_DIR) when (DYN_DT1_SEL = "FALSE") else DT1(3);
    clk2_dt_dir <= TO_STDULOGIC(CLKOUT2_DT_DIR) when (DYN_DT2_SEL = "FALSE") else DT2(3);
    clk3_dt_dir <= TO_STDULOGIC(CLKOUT3_DT_DIR) when (DYN_DT3_SEL = "FALSE") else DT3(3);
    clk0_dt_step <= CLKOUT0_DT_STEP when (DYN_DT0_SEL = "FALSE") else (7 - conv_integer(DT0(2 downto 0)));
    clk1_dt_step <= CLKOUT1_DT_STEP when (DYN_DT1_SEL = "FALSE") else (7 - conv_integer(DT1(2 downto 0)));
    clk2_dt_step <= CLKOUT2_DT_STEP when (DYN_DT2_SEL = "FALSE") else (7 - conv_integer(DT2(2 downto 0)));
    clk3_dt_step <= CLKOUT3_DT_STEP when (DYN_DT3_SEL = "FALSE") else (7 - conv_integer(DT3(2 downto 0)));
    
    clk0_dt_delay <= (0.05 ns * clk0_dt_step);
    clk1_dt_delay <= (0.05 ns * clk1_dt_step);
    clk2_dt_delay <= (0.05 ns * clk2_dt_step);
    clk3_dt_delay <= (0.05 ns * clk3_dt_step);

    process(clkout0_duty, clkout1_duty, clkout2_duty, clkout3_duty, clk0_dt_dir, clk1_dt_dir, clk2_dt_dir, clk3_dt_dir, clk0_dt_step, clk1_dt_step, clk2_dt_step, clk3_dt_step)
    begin
        if (clk0_dt_dir = '1') then
            tclk0_duty <= clkout0_duty + clk0_dt_delay;
        else 
            tclk0_duty <= clkout0_duty - clk0_dt_delay;
        end if;

        if (clk1_dt_dir = '1') then
            tclk1_duty <= clkout1_duty + clk1_dt_delay;
	    else 
            tclk1_duty <= clkout1_duty - clk1_dt_delay;
        end if;

        if (clk2_dt_dir = '1') then
            tclk2_duty <= clkout2_duty + clk2_dt_delay;
        else 
            tclk2_duty <= clkout2_duty - clk2_dt_delay;
        end if;

        if (clk3_dt_dir = '1') then
            tclk3_duty <= clkout3_duty + clk3_dt_delay;
        else 
            tclk3_duty <= clkout3_duty - clk3_dt_delay;
        end if;
    end process; 

    --clkfbout
    process 
    begin
        if (rising_edge(clkfb_0)) then
            clkout_fb <= '1';
            wait for clkfbout_half;
            clkout_fb <= '0';
        end if;
        wait on clkfb_0;
    end process;

    rst_p <= RESET or PLLPWD;
    process (CLKIN, oclk_effect, clkout_fb, rst_p, reseto)
    begin
        if(rst_p = '1') then
            clkfb_out  <= '0';
        elsif(reseto = '1') then
            clkfb_out  <= '0';
        else
            clkfb_out <= clkout_fb;
        end if;
    end process;

    CLKFBOUT <= clkfb_out;

    --clkout0
    --phase_shift_value
    process(fine_dyn_0, coarse_dyn_0)
    begin
        if(DYN_PE0_SEL = "TRUE" and DYN_DPA_EN = "TRUE") then
            fine_0 <= conv_integer(fine_dyn_0);
            coarse_0 <= coarse_dyn_0;

        elsif(DYN_PE0_SEL = "FALSE") then
            fine_0 <= CLKOUT0_PE_FINE;
            coarse_0 <= CLKOUT0_PE_COARSE;            
        end if;
    end process;

    process(coarse_0, fine_0, ODIV0_SEL_reg, ODIV0_f_reg, clkout0_period,real_phase0)
    begin 
        real_phase0 <= (real(coarse_0) + (real(fine_0)/8.0));
        if(ODIV0_SEL_reg = 1) then
            phase_value0 <= clkout0_period * (real_phase0/real_odiv0);
        else 
            phase_value0 <= clkout0_period * (real_phase0/(real_odiv0 + real(ODIV0_f_reg)/8.0));
        end if;
    end process;

    --duty_cycle
    process(ODIV0_SEL_reg,clkout0_period,h_level_0)
    begin
        h_level_0 <= ODIV0_SEL_reg / 2;
        clkout0_duty_odd <= (clkout0_period * h_level_0 / ODIV0_SEL_reg);
    end process;

    process(clkout0_half, real_duty0, real_phase0, ODIV0_SEL_reg, clkout0_period, clkout0_duty_odd) 
    begin
        real_duty0 <= (real(CLKOUT0_PE_COARSE) + (real(CLKOUT0_PE_FINE) / 8.0));

        if(CLK0_IN_SEL = '1') then
            if(ODIV0_SEL_reg = 1) then
                clkout0_duty <= clkout0_half;
            else
                clkout0_duty <= clkout0_duty_odd;
            end if;
        elsif((DYN_PE0_SEL = "FALSE") or (DE0_EN = "FALSE")) then
            clkout0_duty <= clkout0_half;
        elsif((DYN_DPA_EN = "TRUE") and (DE0_EN = "TRUE")) then
            if(ODIV0_SEL_reg = 1) then
                clkout0_duty <= clkout0_half;
            else 
                if(real_duty0 > real_phase0) then
                    clkout0_duty <= (clkout0_period * (real_duty0 - real_phase0))/(real_odiv0 + real(ODIV0_f_reg)/8.0);
                elsif(real_duty0 < real_phase0) then
                    clkout0_duty <= (clkout0_period *((real_odiv0 + real(ODIV0_f_reg)/8.0) + (real_duty0 - real_phase0)))/(real_odiv0 + real(ODIV0_f_reg)/8.0); 
                end if;
            end if;
        end if;
    end process;

    process 
    begin
        if (rising_edge(clk0)) then
            clkout_0 <= '1';
            wait for tclk0_duty;
            clkout_0 <= '0';
        end if;
        wait on clk0;
    end process;

    process(clkout_0,clk0_dt_dir) 
    begin
        if(clk0_dt_dir = '1') then
            clkout_dt_0 <= clkout_0;
        else
            clkout_dt_0 <= transport clkout_0 after(clk0_dt_delay);
        end if;
    end process;

    process(clkout_dt_0)
    begin
        clkout0_ps <= transport clkout_dt_0 after (phase_value0);
    end process;
    
    process (CLKIN, oclk_effect, clkout0_ps, reseti, reseto, rst_p)
    begin
        if(rst_p = '1') then
            clk0_out  <= '0';
        elsif(reseti = '1' and CLK0_IN_SEL = '0') then
            clk0_out  <= '0';
        elsif(reseto = '1') then
            clk0_out  <= '0';
        elsif(CLK1_OUT_SEL = '0') then
            clk0_out <= clkout0_ps;
        end if;
    end process;

    process(CLKIN,clk0_out,cken0)
    begin
        if(CLK0_OUT_SEL = '1') then
            CLKOUT0 <= CLKIN;
        else 
            if(cken0 = '1') then
                CLKOUT0 <= clk0_out;
            else
                CLKOUT0 <= '0';
            end if;
        end if;
     end process;


    --clkout1
    --phase_shift_value
    process(fine_dyn_1, coarse_dyn_1)
    begin
        if(DYN_PE1_SEL = "TRUE" and DYN_DPA_EN = "TRUE") then
            fine_1 <= conv_integer(fine_dyn_1);
            coarse_1 <= coarse_dyn_1;

        elsif(DYN_PE1_SEL = "FALSE") then
            fine_1 <= CLKOUT1_PE_FINE;
            coarse_1 <= CLKOUT1_PE_COARSE;            
        end if;
    end process;

    process(coarse_1, fine_1, ODIV1_SEL_reg, clkout1_period,real_phase1)
    begin 
        real_phase1 <= (real(coarse_1) + (real(fine_1)/8.0));
        phase_value1 <= clkout1_period * (real_phase1/real_odiv1);
    end process;

    --duty_cycle
    process(ODIV1_SEL_reg,clkout1_period,h_level_1)
    begin
        h_level_1 <= ODIV1_SEL_reg / 2;
        clkout1_duty_odd <= (clkout1_period * h_level_1 / ODIV1_SEL_reg);
    end process;

    process(clkout1_half, real_duty1, real_phase1, ODIV1_SEL_reg, clkout1_period, clkout1_duty_odd) 
    begin
        real_duty1 <= (real(CLKOUT1_PE_COARSE) + (real(CLKOUT1_PE_FINE) / 8.0));

        if(CLK1_IN_SEL = '1') then
            if(ODIV1_SEL_reg = 1) then
                clkout1_duty <= clkout1_half;
            else
                clkout1_duty <= clkout1_duty_odd;
            end if;
        elsif((DYN_PE1_SEL = "FALSE") or (DE1_EN = "FALSE")) then
            clkout1_duty <= clkout1_half;
        elsif((DYN_DPA_EN = "TRUE") and (DE1_EN = "TRUE")) then
            if(ODIV1_SEL_reg = 1) then
                clkout1_duty <= clkout1_half;
            else 
                if(real_duty1 > real_phase1) then
                    clkout1_duty <= (clkout1_period * (real_duty1 - real_phase1))/(real_odiv1);
                elsif(real_duty1 < real_phase1) then
                    clkout1_duty <= (clkout1_period *(real_odiv1 + (real_duty1 - real_phase1)))/(real_odiv1); 
                end if;
            end if;
        end if;
    end process;

    process 
    begin
        if (rising_edge(clk1)) then
            clkout_1 <= '1';
            wait for tclk1_duty;
            clkout_1 <= '0';
        end if;
        wait on clk1;
    end process;

    process(clkout_1,clk1_dt_dir) 
    begin
        if(clk1_dt_dir = '1') then
            clkout_dt_1 <= clkout_1;
        else
            clkout_dt_1 <= transport clkout_1 after(clk1_dt_delay);
        end if;
    end process;

    process(clkout_dt_1)
    begin
        clkout1_ps <= transport clkout_dt_1 after (phase_value1);
    end process;

    process (CLKIN, oclk_effect, clkout1_ps, reseti, reseto, rst_p)
    begin
        if(rst_p = '1') then
            clk1_out  <= '0';
        elsif(reseti = '1' and CLK1_IN_SEL = '0') then
            clk1_out  <= '0';
        elsif(reseto = '1') then
            clk1_out  <= '0';
        elsif(CLK1_OUT_SEL = '0') then
            clk1_out <= clkout1_ps;
        end if;
    end process;

    process(CLKIN,clk1_out,cken1)
    begin
        if(CLK1_OUT_SEL = '1') then
            CLKOUT1 <= CLKIN;
        else 
            if(cken1 = '1') then
                CLKOUT1 <= clk1_out;
            else
                CLKOUT1 <= '0';
            end if;
        end if;
     end process;


    --clkout2
    --phase_shift_value
    process(fine_dyn_2, coarse_dyn_2)
    begin
        if(DYN_PE2_SEL = "TRUE" and DYN_DPA_EN = "TRUE") then
            fine_2 <= conv_integer(fine_dyn_2);
            coarse_2 <= coarse_dyn_2;

        elsif(DYN_PE2_SEL = "FALSE") then
            fine_2 <= CLKOUT2_PE_FINE;
            coarse_2 <= CLKOUT2_PE_COARSE;            
        end if;
    end process;

    process(coarse_2, fine_2, ODIV2_SEL_reg, clkout2_period,real_phase2)
    begin 
        real_phase2 <= (real(coarse_2) + (real(fine_2)/8.0));
        phase_value2 <= clkout2_period * (real_phase2/real_odiv2);
    end process;

    --duty_cycle
    process(ODIV2_SEL_reg,clkout2_period,h_level_2)
    begin
        h_level_2 <= ODIV2_SEL_reg / 2;
        clkout2_duty_odd <= (clkout2_period * h_level_2 / ODIV2_SEL_reg);
    end process;

    process(clkout2_half, real_duty2, real_phase2, ODIV2_SEL_reg, clkout2_period, clkout2_duty_odd) 
    begin
        real_duty2 <= (real(CLKOUT2_PE_COARSE) + (real(CLKOUT2_PE_FINE) / 8.0));

        if(CLK2_IN_SEL = '1') then
            if(ODIV2_SEL_reg = 1) then
                clkout2_duty <= clkout2_half;
            else
                clkout2_duty <= clkout2_duty_odd;
            end if;
        elsif((DYN_PE2_SEL = "FALSE") or (DE2_EN = "FALSE")) then
            clkout2_duty <= clkout2_half;
        elsif((DYN_DPA_EN = "TRUE") and (DE2_EN = "TRUE")) then
            if(ODIV2_SEL_reg = 1) then
                clkout2_duty <= clkout2_half;
            else 
                if(real_duty2 > real_phase2) then
                    clkout2_duty <= (clkout2_period * (real_duty2 - real_phase2))/(real_odiv2);
                elsif(real_duty2 < real_phase2) then
                    clkout2_duty <= (clkout2_period *(real_odiv2 + (real_duty2 - real_phase2)))/(real_odiv2); 
                end if;
            end if;
        end if;
    end process;

    process 
    begin
        if (rising_edge(clk2)) then
            clkout_2 <= '1';
            wait for tclk2_duty;
            clkout_2 <= '0';
        end if;
        wait on clk2;
    end process;

    process(clkout_2,clk2_dt_dir) 
    begin
        if(clk2_dt_dir = '1') then
            clkout_dt_2 <= clkout_2;
        else
            clkout_dt_2 <= transport clkout_2 after(clk2_dt_delay);
        end if;
    end process;

    process(clkout_dt_2)
    begin
        clkout2_ps <= transport clkout_dt_2 after (phase_value2);
    end process;

    process (CLKIN, oclk_effect, clkout2_ps, reseti, reseto, rst_p)
    begin
        if(rst_p = '1') then
            clk2_out  <= '0';
        elsif(reseti = '1' and CLK2_IN_SEL = '0') then
            clk2_out  <= '0';
        elsif(reseto = '1') then
            clk2_out  <= '0';
        elsif(CLK2_OUT_SEL = '0') then
            clk2_out <= clkout2_ps;
        end if;
    end process;

    process(CLKIN,clk2_out,cken2)
    begin
        if(CLK2_OUT_SEL = '1') then
            CLKOUT2 <= CLKIN;
        else 
            if(cken2 = '1') then
                CLKOUT2 <= clk2_out;
            else
                CLKOUT2 <= '0';
            end if;
        end if;
     end process;

    --clkout3
    --phase_shift_value
    process(fine_dyn_3, coarse_dyn_3)
    begin
        if(DYN_PE3_SEL = "TRUE" and DYN_DPA_EN = "TRUE") then
            fine_3 <= conv_integer(fine_dyn_3);
            coarse_3 <= coarse_dyn_3;

        elsif(DYN_PE3_SEL = "FALSE") then
            fine_3 <= CLKOUT3_PE_FINE;
            coarse_3 <= CLKOUT3_PE_COARSE;            
        end if;
    end process;

    process(coarse_3, fine_3, ODIV3_SEL_reg, clkout3_period,real_phase3)
    begin 
        real_phase3 <= (real(coarse_3) + (real(fine_3)/8.0));
        phase_value3 <= clkout3_period * (real_phase3/real_odiv3);
    end process;

    --duty_cycle
    process(ODIV3_SEL_reg,clkout3_period,h_level_3)
    begin
        h_level_3 <= ODIV3_SEL_reg / 2;
        clkout3_duty_odd <= (clkout3_period * h_level_3 / ODIV3_SEL_reg);
    end process;

    process(clkout3_half, real_duty3, real_phase3, ODIV3_SEL_reg, clkout3_period, clkout3_duty_odd) 
    begin
        real_duty3 <= (real(CLKOUT3_PE_COARSE) + (real(CLKOUT3_PE_FINE) / 8.0));

        if(CLK3_IN_SEL = '1') then
            if(ODIV3_SEL_reg = 1) then
                clkout3_duty <= clkout3_half;
            else
                clkout3_duty <= clkout3_duty_odd;
            end if;
        elsif((DYN_PE3_SEL = "FALSE") or (DE3_EN = "FALSE")) then
            clkout3_duty <= clkout3_half;
        elsif((DYN_DPA_EN = "TRUE") and (DE3_EN = "TRUE")) then
            if(ODIV3_SEL_reg = 1) then
                clkout3_duty <= clkout3_half;
            else 
                if(real_duty3 > real_phase3) then
                    clkout3_duty <= (clkout3_period * (real_duty3 - real_phase3))/(real_odiv3);
                elsif(real_duty3 < real_phase3) then
                    clkout3_duty <= (clkout3_period *(real_odiv3 + (real_duty3 - real_phase3)))/(real_odiv3); 
                end if;
            end if;
        end if;
    end process;

    process 
    begin
        if (rising_edge(clk3)) then
            clkout_3 <= '1';
            wait for tclk3_duty;
            clkout_3 <= '0';
        end if;
        wait on clk3;
    end process;

    process(clkout_3,clk3_dt_dir) 
    begin
        if(clk3_dt_dir = '1') then
            clkout_dt_3 <= clkout_3;
        else
            clkout_dt_3 <= transport clkout_3 after(clk3_dt_delay);
        end if;
    end process;

    process(clkout_dt_3)
    begin
        clkout3_ps <= transport clkout_dt_3 after (phase_value3);
    end process;

    process (CLKIN, oclk_effect, clkout3_ps, reseti, reseto, rst_p)
    begin
        if(rst_p = '1') then
            clk3_out  <= '0';
        elsif(reseti = '1' and CLK3_IN_SEL = '0') then
            clk3_out  <= '0';
        elsif(reseto = '1') then
            clk3_out  <= '0';
        elsif(CLK3_OUT_SEL = '0') then
            clk3_out <= clkout3_ps;
        end if;
    end process;

    process(CLKIN,clk3_out,cken3)
    begin
        if(CLK3_OUT_SEL = '1') then
            CLKOUT3 <= CLKIN;
        else 
            if(cken3 = '1') then
                CLKOUT3 <= clk3_out;
            else
                CLKOUT3 <= '0';
            end if;
        end if;
     end process;


    --clkout4
    --phase_shift_value
    process(fine_dyn_4, coarse_dyn_4)
    begin
        if(DYN_PE4_SEL = "TRUE" and DYN_DPA_EN = "TRUE") then
            fine_4 <= conv_integer(fine_dyn_4);
            coarse_4 <= coarse_dyn_4;

        elsif(DYN_PE4_SEL = "FALSE") then
            fine_4 <= CLKOUT4_PE_FINE;
            coarse_4 <= CLKOUT4_PE_COARSE;            
        end if;
    end process;

    process(coarse_4, fine_4, ODIV4_SEL_reg, clkout4_period,real_phase4)
    begin 
        real_phase4 <= (real(coarse_4) + (real(fine_4)/8.0));
        phase_value4 <= clkout4_period * (real_phase4/real_odiv4);
    end process;

    --duty_cycle
    process(ODIV4_SEL_reg,clkout4_period,h_level_4)
    begin
        h_level_4 <= ODIV4_SEL_reg / 2;
        clkout4_duty_odd <= (clkout4_period * h_level_4 / ODIV4_SEL_reg);
    end process;

    process(clkout4_half, real_duty4, real_phase4, ODIV4_SEL_reg, clkout4_period, clkout4_duty_odd) 
    begin
        real_duty4 <= (real(CLKOUT4_PE_COARSE) + (real(CLKOUT4_PE_FINE) / 8.0));

        if(CLK4_IN_SEL = "10" or CLK4_IN_SEL = "01") then
            if(ODIV4_SEL_reg = 1) then
                clkout4_duty <= clkout4_half;
            else
                clkout4_duty <= clkout4_duty_odd;
            end if;
        elsif((DYN_PE4_SEL = "FALSE") or (DE4_EN = "FALSE")) then
            clkout4_duty <= clkout4_half;
        elsif((DYN_DPA_EN = "TRUE") and (DE4_EN = "TRUE")) then
            if(ODIV4_SEL_reg = 1) then
                clkout4_duty <= clkout4_half;
            else 
                if(real_duty4 > real_phase4) then
                    clkout4_duty <= (clkout4_period * (real_duty4 - real_phase4))/(real_odiv4);
                elsif(real_duty4 < real_phase4) then
                    clkout4_duty <= (clkout4_period *(real_odiv4 + (real_duty4 - real_phase4)))/(real_odiv4); 
                end if;
            end if;
        end if;
    end process;

    process 
    begin
        if (rising_edge(clk4)) then
            clkout_4 <= '1';
            wait for clkout4_duty;
            clkout_4 <= '0';
        end if;
        wait on clk4;
    end process;

    process(clkout_4)
    begin
        clkout4_ps <= transport clkout_4 after (phase_value4);
    end process;

    process (CLKIN, oclk_effect, clkout4_ps, reseti, reseto, rst_p)
    begin
        if(rst_p = '1') then
            clk4_out  <= '0';
        elsif(reseti = '1' and CLK4_IN_SEL = "00") then
            clk4_out  <= '0';
        elsif(reseto = '1') then
            clk4_out  <= '0';
        elsif(CLK4_OUT_SEL = '0') then
            clk4_out <= clkout4_ps;
        end if;
    end process;

    process(CLKIN,clk4_out,cken4)
    begin
        if(CLK4_OUT_SEL = '1') then
            CLKOUT4 <= CLKIN;
        else 
            if(cken4 = '1') then
                CLKOUT4 <= clk4_out;
            else
                CLKOUT4 <= '0';
            end if;
        end if;
     end process;


    --clkout5
    --phase_shift_value
    process(fine_dyn_5, coarse_dyn_5)
    begin
        if(DYN_PE5_SEL = "TRUE" and DYN_DPA_EN = "TRUE") then
            fine_5 <= conv_integer(fine_dyn_5);
            coarse_5 <= coarse_dyn_5;

        elsif(DYN_PE5_SEL = "FALSE") then
            fine_5 <= CLKOUT5_PE_FINE;
            coarse_5 <= CLKOUT5_PE_COARSE;            
        end if;
    end process;

    process(coarse_5, fine_5, ODIV5_SEL_reg, clkout5_period,real_phase5)
    begin 
        real_phase5 <= (real(coarse_5) + (real(fine_5)/8.0));
        phase_value5 <= clkout5_period * (real_phase5/real_odiv5);
    end process;

    --duty_cycle
    process(ODIV5_SEL_reg,clkout5_period,h_level_5)
    begin
        h_level_5 <= ODIV5_SEL_reg / 2;
        clkout5_duty_odd <= (clkout5_period * h_level_5 / ODIV5_SEL_reg);
    end process;

    process(clkout5_half, real_duty5, real_phase5, ODIV5_SEL_reg, clkout5_period, clkout5_duty_odd) 
    begin
        real_duty5 <= (real(CLKOUT5_PE_COARSE) + (real(CLKOUT5_PE_FINE) / 8.0));

        if(CLK5_IN_SEL = '1') then
            if(ODIV5_SEL_reg = 1) then
                clkout5_duty <= clkout5_half;
            else
                clkout5_duty <= clkout5_duty_odd;
            end if;
        elsif((DYN_PE5_SEL = "FALSE") or (DE5_EN = "FALSE")) then
            clkout5_duty <= clkout5_half;
        elsif((DYN_DPA_EN = "TRUE") and (DE5_EN = "TRUE")) then
            if(ODIV5_SEL_reg = 1) then
                clkout5_duty <= clkout5_half;
            else 
                if(real_duty5 > real_phase5) then
                    clkout5_duty <= (clkout5_period * (real_duty5 - real_phase5))/(real_odiv5);
                elsif(real_duty5 < real_phase5) then
                    clkout5_duty <= (clkout5_period *(real_odiv5 + (real_duty5 - real_phase5)))/(real_odiv5); 
                end if;
            end if;
        end if;
    end process;

    process 
    begin
        if (rising_edge(clk5)) then
            clkout_5 <= '1';
            wait for clkout5_duty;
            clkout_5 <= '0';
        end if;
        wait on clk5;
    end process;

    process(clkout_5)
    begin
        clkout5_ps <= transport clkout_5 after (phase_value5);
    end process;

    process (CLKIN, oclk_effect, clkout5_ps, reseti, reseto, rst_p)
    begin
        if(rst_p = '1') then
            clk5_out  <= '0';
        elsif(reseti = '1' and CLK5_IN_SEL = '0') then
            clk5_out  <= '0';
        elsif(reseto = '1') then
            clk5_out  <= '0';
        elsif(CLK5_OUT_SEL = '0') then
            clk5_out <= clkout5_ps;
        end if;
    end process;

    process(CLKIN,clk5_out,cken5)
    begin
        if(CLK5_OUT_SEL = '1') then
            CLKOUT5 <= CLKIN;
        else 
            if(cken5 = '1') then
                CLKOUT5 <= clk5_out;
            else
                CLKOUT5 <= '0';
            end if;
        end if;
     end process;


    --clkout6
    --phase_shift_value
    process(fine_dyn_6, coarse_dyn_6)
    begin
        if(DYN_PE6_SEL = "TRUE" and DYN_DPA_EN = "TRUE") then
            fine_6 <= conv_integer(fine_dyn_6);
            coarse_6 <= coarse_dyn_6;

        elsif(DYN_PE6_SEL = "FALSE") then
            fine_6 <= CLKOUT6_PE_FINE;
            coarse_6 <= CLKOUT6_PE_COARSE;            
        end if;
    end process;

    process(coarse_6, fine_6, ODIV6_SEL_reg, clkout6_period,real_phase6)
    begin 
        real_phase6 <= (real(coarse_6) + (real(fine_6)/8.0));
        phase_value6 <= clkout6_period * (real_phase6/real_odiv6);
    end process;

    --duty_cycle
    process(ODIV6_SEL_reg,clkout6_period,h_level_6)
    begin
        h_level_6 <= ODIV6_SEL_reg / 2;
        clkout6_duty_odd <= (clkout6_period * h_level_6 / ODIV6_SEL_reg);
    end process;

    process(clkout6_half, real_duty6, real_phase6, ODIV6_SEL_reg, clkout6_period, clkout6_duty_odd) 
    begin
        real_duty6 <= (real(CLKOUT6_PE_COARSE) + (real(CLKOUT6_PE_FINE) / 8.0));

        if(CLK6_IN_SEL = '1') then
            if(ODIV6_SEL_reg = 1) then
                clkout6_duty <= clkout6_half;
            else
                clkout6_duty <= clkout6_duty_odd;
            end if;
        elsif((DYN_PE6_SEL = "FALSE") or (DE6_EN = "FALSE")) then
            clkout6_duty <= clkout6_half;
        elsif((DYN_DPA_EN = "TRUE") and (DE6_EN = "TRUE")) then
            if(ODIV6_SEL_reg = 1) then
                clkout6_duty <= clkout6_half;
            else 
                if(real_duty6 > real_phase6) then
                    clkout6_duty <= (clkout6_period * (real_duty6 - real_phase6))/(real_odiv6);
                elsif(real_duty6 < real_phase6) then
                    clkout6_duty <= (clkout6_period *(real_odiv6 + (real_duty6 - real_phase6)))/(real_odiv6); 
                end if;
            end if;
        end if;
    end process;

    process 
    begin
        if (rising_edge(clk6)) then
            clkout_6 <= '1';
            wait for clkout6_duty;
            clkout_6 <= '0';
        end if;
        wait on clk6;
    end process;

    process(clkout_6)
    begin
        clkout6_ps <= transport clkout_6 after (phase_value6);
    end process;

    process (CLKIN, oclk_effect, clkout6_ps, reseti, reseto, rst_p)
    begin
        if(rst_p = '1') then
            clk6_out  <= '0';
        elsif(reseti = '1' and CLK6_IN_SEL = '0') then
            clk6_out  <= '0';
        elsif(reseto = '1') then
            clk6_out  <= '0';
        elsif(CLK6_OUT_SEL = '0') then
            clk6_out <= clkout6_ps;
        end if;
    end process;

    process(CLKIN,clk6_out,cken6)
    begin
        if(CLK6_OUT_SEL = '1') then
            CLKOUT6 <= CLKIN;
        else 
            if(cken6 = '1') then
                CLKOUT6 <= clk6_out;
            else
                CLKOUT6 <= '0';
            end if;
        end if;
    end process;

end Behavioral;

------------------------------PLLA---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all; 

entity PLLA is
    generic(
        FCLKIN : string := "100.0"; --frequency of the clkin(M)
        IDIV_SEL : integer := 1; --Input divider IDIV, 1~64;
        FBDIV_SEL : integer := 1; --Feedback divider FBDIV, 1~64
        
        ODIV0_SEL : integer := 8; --1~128,integer
        ODIV1_SEL : integer := 8; --1~128,integer
        ODIV2_SEL : integer := 8; --1~128,integer
        ODIV3_SEL : integer := 8; --1~128,integer
        ODIV4_SEL : integer := 8; --1~128,integer
        ODIV5_SEL : integer := 8; --1~128,integer
        ODIV6_SEL : integer := 8; --1~128,integer
        MDIV_SEL : integer := 8; --2~128,integer
        MDIV_FRAC_SEL : integer := 0; --0~7,integer
        ODIV0_FRAC_SEL : integer := 0; --0~7,integer
     
        CLKOUT0_EN : string := "TRUE"; --"TRUE","FALSE"
        CLKOUT1_EN : string := "FALSE"; --"TRUE","FALSE"
        CLKOUT2_EN : string := "FALSE"; --"TRUE","FALSE"
        CLKOUT3_EN : string := "FALSE"; --"TRUE","FALSE"
        CLKOUT4_EN : string := "FALSE"; --"TRUE","FALSE"
        CLKOUT5_EN : string := "FALSE"; --"TRUE","FALSE"
        CLKOUT6_EN : string := "FALSE"; --"TRUE","FALSE"
         
        CLKFB_SEL : string := "INTERNAL"; -- "INTERNAL", "EXTERNAL";
        
        CLKOUT0_DT_DIR : bit := '1'; -- CLKOUT0 dutycycle adjust direction. '1': + ; '0': -
        CLKOUT1_DT_DIR : bit := '1'; -- CLKOUT1 dutycycle adjust direction. '1': + ; '0': -
        CLKOUT2_DT_DIR : bit := '1'; -- CLKOUT2 dutycycle adjust direction. '1': + ; '0': -
        CLKOUT3_DT_DIR : bit := '1'; -- CLKOUT3 dutycycle adjust direction. '1': + ; '0': -
        CLKOUT0_DT_STEP : integer := 0; -- 0,1,2,4; 50ps/step
        CLKOUT1_DT_STEP : integer := 0; -- 0,1,2,4; 50ps/step
        CLKOUT2_DT_STEP : integer := 0; -- 0,1,2,4; 50ps/step
        CLKOUT3_DT_STEP : integer := 0; -- 0,1,2,4; 50ps/step

        CLK0_IN_SEL  : bit := '0'; --ODIV0 input source select. 0:from VCO;1:from CLKIN
        CLK0_OUT_SEL : bit := '0'; --CLKOUT0 output select. 0:DIV0 output; 1:CLKIN
        CLK1_IN_SEL  : bit := '0'; --ODIV1 input source select. 0:from VCO;1:from CLKIN
        CLK1_OUT_SEL : bit := '0'; --CLKOUT1 output select. 0:DIV1 output; 1:CLKIN
        CLK2_IN_SEL  : bit := '0'; --ODIV2 input source select. 0:from VCO;1:from CLKIN
        CLK2_OUT_SEL : bit := '0'; --CLKOUT2 output select. 0:DIV2 output; 1:CLKIN
        CLK3_IN_SEL  : bit := '0'; --ODIV3 input source select. 0:from VCO;1:from CLKIN
        CLK3_OUT_SEL : bit := '0'; --CLKOUT3 output select. 0:DIV3 output; 1:CLKIN
        CLK4_IN_SEL  : bit_vector := "00"; --ODIV4 input source select. 00:from VCO;01:from CASCADE;10:from CLKIN
        CLK4_OUT_SEL : bit := '0'; --CLKOUT4 output select. 0:DIV4 output; 1:CLKIN
        CLK5_IN_SEL  : bit := '0'; --ODIV5 input source select. 0:from VCO;1:from CLKIN
        CLK5_OUT_SEL : bit := '0'; --CLKOUT5 output select. 0:DIV5 output; 1:CLKIN
        CLK6_IN_SEL  : bit := '0'; --ODIV6 input source select. 0:from VCO;1:from CLKIN
        CLK6_OUT_SEL : bit := '0'; --CLKOUT6 output select. 0:DIV6 output; 1:CLKIN

        DYN_DPA_EN : string := "FALSE"; --dynamic phaseshift adjustment Enable."TRUE","FALSE"

        CLKOUT0_PE_COARSE : integer := 0; --0~127    
        CLKOUT0_PE_FINE : integer := 0; --0~7
        CLKOUT1_PE_COARSE : integer := 0;  --0~127       
        CLKOUT1_PE_FINE : integer := 0; --0~7
        CLKOUT2_PE_COARSE : integer := 0;  --0~127       
        CLKOUT2_PE_FINE : integer := 0; --0~7
        CLKOUT3_PE_COARSE : integer := 0;  --0~127       
        CLKOUT3_PE_FINE : integer := 0; --0~7
        CLKOUT4_PE_COARSE : integer := 0;  --0~127       
        CLKOUT4_PE_FINE : integer := 0; --0~7
        CLKOUT5_PE_COARSE : integer := 0;  --0~127       
        CLKOUT5_PE_FINE : integer := 0; --0~7
        CLKOUT6_PE_COARSE : integer := 0;  --0~127       
        CLKOUT6_PE_FINE : integer := 0; --0~7

        DYN_PE0_SEL : string := "FALSE"; --"TRUE": select dpa port as the dynamic control signal for ODIV0 phase shift. "FALSE":select CLKOUT0_PE_COARSE & CLKOUT0_PE_FINE as the static control signal for ODIV0 phase shift
        DYN_PE1_SEL : string := "FALSE"; --"TRUE": select dpa port as the dynamic control signal for ODIV1 phase shift. "FALSE":select CLKOUT1_PE_COARSE & CLKOUT1_PE_FINE as the static control signal for ODIV1 phase shift
        DYN_PE2_SEL : string := "FALSE"; --"TRUE": select dpa port as the dynamic control signal for ODIV2 phase shift. "FALSE":select CLKOUT2_PE_COARSE & CLKOUT2_PE_FINE as the static control signal for ODIV2 phase shift
        DYN_PE3_SEL : string := "FALSE"; --"TRUE": select dpa port as the dynamic control signal for ODIV3 phase shift. "FALSE":select CLKOUT3_PE_COARSE & CLKOUT3_PE_FINE as the static control signal for ODIV3 phase shift
        DYN_PE4_SEL : string := "FALSE"; --"TRUE": select dpa port as the dynamic control signal for ODIV4 phase shift. "FALSE":select CLKOUT4_PE_COARSE & CLKOUT4_PE_FINE as the static control signal for ODIV4 phase shift
        DYN_PE5_SEL : string := "FALSE"; --"TRUE": select dpa port as the dynamic control signal for ODIV5 phase shift. "FALSE":select CLKOUT5_PE_COARSE & CLKOUT5_PE_FINE as the static control signal for ODIV5 phase shift
        DYN_PE6_SEL : string := "FALSE"; --"TRUE": select dpa port as the dynamic control signal for ODIV6 phase shift. "FALSE":select CLKOUT6_PE_COARSE & CLKOUT6_PE_FINE as the static control signal for ODIV6 phase shift

        DE0_EN : string := "FALSE"; --"FALSE":fixed 50% duty cycle for case odiv0=2~128; "TRUE":select CLKOUT0_PE_COARSE & CLKOUT0_PE_FINE as duty edge when DYN_PE0_SEL="TRUE" for case ODIV0=2~128
        DE1_EN : string := "FALSE"; --"FALSE":fixed 50% duty cycle for case odiv1=2~128; "TRUE":select CLKOUT1_PE_COARSE & CLKOUT1_PE_FINE as duty edge when DYN_PE1_SEL="TRUE" for case ODIV1=2~128
        DE2_EN : string := "FALSE"; --"FALSE":fixed 50% duty cycle for case odiv2=2~128; "TRUE":select CLKOUT2_PE_COARSE & CLKOUT2_PE_FINE as duty edge when DYN_PE2_SEL="TRUE" for case ODIV2=2~128
        DE3_EN : string := "FALSE"; --"FALSE":fixed 50% duty cycle for case odiv3=2~128; "TRUE":select CLKOUT3_PE_COARSE & CLKOUT3_PE_FINE as duty edge when DYN_PE3_SEL="TRUE" for case ODIV3=2~128
        DE4_EN : string := "FALSE"; --"FALSE":fixed 50% duty cycle for case odiv4=2~128; "TRUE":select CLKOUT4_PE_COARSE & CLKOUT4_PE_FINE as duty edge when DYN_PE4_SEL="TRUE" for case ODIV4=2~128
        DE5_EN : string := "FALSE"; --"FALSE":fixed 50% duty cycle for case odiv5=2~128; "TRUE":select CLKOUT5_PE_COARSE & CLKOUT5_PE_FINE as duty edge when DYN_PE5_SEL="TRUE" for case ODIV5=2~128
        DE6_EN : string := "FALSE"; --"FALSE":fixed 50% duty cycle for case odiv6=2~128; "TRUE":select CLKOUT6_PE_COARSE & CLKOUT6_PE_FINE as duty edge when DYN_PE6_SEL="TRUE" for case ODIV6=2~128

        RESET_I_EN : string := "FALSE"; --"TRUE","FALSE". Enable RESET_I through the dedicated signal from ciu.
        RESET_O_EN : string := "FALSE"; --"TRUE","FALSE". Enable RESET_S through the dedicated signal from ciu.

        ICP_SEL : std_logic_vector(5 downto 0) := "XXXXXX";
        LPF_RES : std_logic_vector(2 downto 0) := "XXX";
        LPF_CAP : bit_vector := "00"; --00,C0 ;01,C1; 10,C2

        SSC_EN : string := "FALSE" --"FALSE","TRUE".ssc mode enable
	);
    port(
        CLKIN : in std_logic;
        CLKFB : in std_logic:='0';
        RESET,PLLPWD : in std_logic:='0';
        RESET_I,RESET_O : in std_logic:='0';
        PSSEL : in std_logic_vector(2 downto 0);
        PSDIR,PSPULSE : in std_logic;
        SSCPOL,SSCON : in std_logic;
        SSCMDSEL : in std_logic_vector(6 downto 0);
        SSCMDSEL_FRAC : in std_logic_vector(2 downto 0);
        MDCLK : in std_logic;
        MDOPC : in std_logic_vector(1 downto 0);
        MDAINC : in std_logic;
        MDWDI : in std_logic_vector(7 downto 0);

        MDRDO : out std_logic_vector(7 downto 0);    
        LOCK : out std_logic;
        CLKOUT0,CLKOUT1 : out std_logic;
        CLKOUT2,CLKOUT3 : out std_logic;
        CLKOUT4,CLKOUT5 : out std_logic;
        CLKOUT6,CLKFBOUT : out std_logic
    );
end PLLA;
architecture Behavioral of PLLA is
signal IDIV_SEL_reg,FBDIV_SEL_reg : integer := 1;
signal ODIV0_SEL_reg,ODIV1_SEL_reg,ODIV2_SEL_reg,ODIV3_SEL_reg,ODIV4_SEL_reg,ODIV5_SEL_reg,ODIV6_SEL_reg,MDIV_SEL_reg,ODIV0_f_reg,MDIV_f_reg : integer;
type  clkin_arr  is array (4 downto 0) of time;
signal clkin_cycle : clkin_arr := (0.0000 ns, 0.0000 ns, 0.0000 ns, 0.0000 ns,0.0000 ns);
signal clkin_period,clkin_period1,vco_period,clkout0_period,clkout1_period,clkout2_period,clkout3_period,clkout4_period,clkout5_period,clkout6_period,clkfbout_period :  time := 2.0000 ns;
signal clk_effect,oclk_effect : std_logic := '0';
signal clkout0_half,clkout1_half,clkout2_half,clkout3_half,clkout4_half,clkout5_half,clkout6_half,clkfbout_half : time := 0.0000 ns;
signal clkout0_half_odd,clkout1_half_odd,clkout2_half_odd,clkout3_half_odd,clkout4_half_odd,clkout5_half_odd,clkout6_half_odd : time := 0.0000 ns;
signal clkfb_curtime,clkin_curtime,FB_dly,FB_dly0 : time := 0.0000 ns;
signal clk0_reg,clk1_reg,clk2_reg,clk3_reg,clk4_reg,clk5_reg,clk6_reg,clkfb_reg,clk0,clk1,clk2,clk3,clk4,clk5,clk6,clkfb_0 : std_logic := '0';
signal clkout_0,clkout0_ps,clk0_out,clkout_1,clkout1_ps,clk1_out,clkout_2,clkout2_ps,clk2_out,clkout_3,clkout3_ps,clk3_out,clkout_4,clkout4_ps,clk4_out,clkout_5,clkout5_ps,clk5_out,clkout_6,clkout6_ps,clk6_out,clkfb_out,clkout_fb : std_logic := '0';
signal lock_reg : std_logic := '0';

signal real_phase0,real_duty0,real_phase1,real_duty1,real_phase2,real_duty2,real_phase3,real_duty3,real_phase4,real_duty4,real_phase5,real_duty5,real_phase6,real_duty6 : real;
signal phase_value0,clkout0_duty,clkout1_duty,tclk0_duty,tclk1_duty : time := 0.0000 ns;
signal clkout0_duty_odd,clkout1_duty_odd,clkout2_duty_odd,clkout3_duty_odd,clkout4_duty_odd,clkout5_duty_odd,clkout6_duty_odd : time := 0.0000 ns;
signal phase_value1,phase_value2,phase_value3,clkout2_duty,clkout3_duty,phase_value4,phase_value5,phase_value6,clkout4_duty,clkout5_duty,clkout6_duty,tclk2_duty,tclk3_duty : time := 0.0000 ns;

signal fine_dyn_0,fine_dyn_1,fine_dyn_2,fine_dyn_3,fine_dyn_4,fine_dyn_5,fine_dyn_6 : std_logic_vector(2 downto 0) := "000";
signal coarse_dyn_0,coarse_dyn_1,coarse_dyn_2,coarse_dyn_3,coarse_dyn_4,coarse_dyn_5,coarse_dyn_6 : integer := 0;
signal ps_pulse_pre : std_logic;
signal clk0_dt_dir,clk1_dt_dir,clk2_dt_dir,clk3_dt_dir : std_logic;
signal clk0_dt_step,clk1_dt_step,clk2_dt_step,clk3_dt_step : integer;
signal fine_0,fine_1,fine_2,fine_3,fine_4,fine_5,fine_6 : integer;
signal coarse_0,coarse_1,coarse_2,coarse_3,coarse_4,coarse_5,coarse_6 : integer;
signal unit_duty,unit_phase,unit_div,real_fbdiv : real := 1.0;
signal real_odiv0,real_odiv0_f,real_odiv1,real_odiv2,real_odiv3,real_odiv4,real_odiv5,real_odiv6 : real := 1.0;

signal max_tlock : time := 50000 ns;
signal cnt_lock : integer := 0;
signal multi_clkin : integer;
signal clkin_init,fb_clk_init : std_logic := '1';
signal pssel_0_flag,pssel_1_flag,pssel_2_flag,pssel_3_flag,pssel_4_flag,pssel_5_flag,pssel_6_flag : std_logic := '0';
signal inner_reset:std_logic:='0';
signal clk0_dt_delay,clk1_dt_delay,clk2_dt_delay,clk3_dt_delay : time := 0.0000 ns;
signal clkout_dt_0,clkout_dt_1,clkout_dt_2,clkout_dt_3 : std_logic := '0';
signal rst,rst_p,rsto : std_logic := '0';
signal enclk_0,enclk_1,enclk_2,enclk_3,enclk_4,enclk_5,enclk_6 : std_logic;
signal cken0,cken1,cken2,cken3,cken4,cken5,cken6 : std_logic := '0';
signal reseti, reseto : std_logic := '0';
signal h_level_0,h_level_1,h_level_2,h_level_3,h_level_4,h_level_5,h_level_6 : integer := 0;
signal real_h_level_0,real_h_level_1,real_h_level_2,real_h_level_3,real_h_level_4,real_h_level_5,real_h_level_6 : real := 0.00000;

begin

    reseti <= RESET_I when (RESET_I_EN = "TRUE") else '0';
    reseto <= RESET_O when (RESET_O_EN = "TRUE") else '0';

    inner_reset <= RESET or PLLPWD or reseti;

    process(CLKIN, inner_reset)
    variable clkin_edge_pre :time := 0 ns;
    variable clkin_edge_cur :time := 0 ns;

    begin
        if(inner_reset = '1')then
            clk_effect <= '0';
            clkin_cycle(0) <= 0.0 ns;
        elsif(CLKIN'event and CLKIN = '1')then
            clkin_edge_cur := NOW;
            clkin_cycle(4) <= clkin_cycle(3);
	        clkin_cycle(3) <= clkin_cycle(2);
	        clkin_cycle(2) <= clkin_cycle(1);
            clkin_cycle(1) <= clkin_cycle(0);

            if(clkin_edge_pre /= 0 ns)then
                clkin_cycle(0) <= clkin_edge_cur - clkin_edge_pre;
            end if;

            clkin_edge_pre := clkin_edge_cur;

            if(clkin_edge_pre /= 0 ns) then
                if(clkin_cycle(0) = clkin_period) then
                    clk_effect <= '1';

                else
                    clk_effect <= '0';
                end if;
            end if;
        end if;
    end process;

    process(clkin_cycle(0),clkin_cycle(1),clkin_cycle(2),clkin_cycle(3),clkin_cycle(4),clkin_period) 
    variable clkin_period_tmp : time := 0.0 ns;
    begin
        clkin_period_tmp := clkin_cycle(0);
        if(clkin_period_tmp /= clkin_period) then
		    clkin_period1 <= (clkin_cycle(0) + clkin_cycle(1) + clkin_cycle(2) + clkin_cycle(3) + clkin_cycle(4))/5.0;
            clkin_period <= clkin_period1;
        end if;
    end process;

    IDIV_SEL_reg <= IDIV_SEL;
    FBDIV_SEL_reg <= FBDIV_SEL;
    ODIV0_SEL_reg <= ODIV0_SEL;
    ODIV1_SEL_reg <= ODIV1_SEL;
    ODIV2_SEL_reg <= ODIV2_SEL;
    ODIV3_SEL_reg <= ODIV3_SEL;
    ODIV4_SEL_reg <= ODIV4_SEL;
    ODIV5_SEL_reg <= ODIV5_SEL;
    ODIV6_SEL_reg <= ODIV6_SEL;
    MDIV_SEL_reg <= MDIV_SEL;
    ODIV0_f_reg <= ODIV0_FRAC_SEL;
    MDIV_f_reg <= MDIV_FRAC_SEL;

    process(clkin_period, IDIV_SEL_reg, FBDIV_SEL_reg, ODIV0_SEL_reg, ODIV0_f_reg, MDIV_SEL_reg, MDIV_f_reg)
    begin
        real_fbdiv <= (real(FBDIV_SEL_reg));
        if(CLKFB_SEL = "INTERNAL") then
            vco_period <= ((clkin_period * real(IDIV_SEL_reg)) / real_fbdiv) / (real(MDIV_SEL_reg) + (real(MDIV_f_reg)/8.0));
        else
            if(ODIV0_SEL_reg = 1) then
                vco_period <= ((clkin_period * real(IDIV_SEL_reg)) / real_fbdiv) / (real(ODIV0_SEL_reg));
            else
                vco_period <= ((clkin_period * real(IDIV_SEL_reg)) / real_fbdiv) / (real(ODIV0_SEL_reg) + (real(ODIV0_f_reg)/8.0));
            end if;
        end if;

    end process;

    process(vco_period, ODIV0_SEL_reg,ODIV0_f_reg,clkin_period)
    begin
        real_odiv0 <= real(ODIV0_SEL_reg);
        real_odiv0_f <= real(ODIV0_f_reg);
        if (CLK0_IN_SEL = '0') then
            if(ODIV0_SEL_reg = 1) then
                clkout0_period <= (vco_period * real_odiv0);
            else
                clkout0_period <= (vco_period * (real_odiv0 + real_odiv0_f/8.0));
            end if;
        elsif (CLK0_IN_SEL = '1') then
            clkout0_period <= (clkin_period * real_odiv0);
        end if;
    end process;

    process(vco_period, ODIV1_SEL_reg,clkin_period)
    begin
        real_odiv1 <= real(ODIV1_SEL_reg);
        if (CLK1_IN_SEL = '0') then
            clkout1_period <= (vco_period * real_odiv1);
        elsif (CLK1_IN_SEL = '1') then
            clkout1_period <= (clkin_period * real_odiv1);
        end if;
    end process;

    process(vco_period, ODIV2_SEL_reg,clkin_period)
    begin
        real_odiv2 <= real(ODIV2_SEL_reg);
        if (CLK2_IN_SEL = '0') then
            clkout2_period <= (vco_period * real_odiv2);
        elsif (CLK2_IN_SEL = '1') then
            clkout2_period <= (clkin_period * real_odiv2);
        end if;
    end process;

    process(vco_period, ODIV3_SEL_reg,clkin_period)
    begin
        real_odiv3 <= real(ODIV3_SEL_reg);
        if (CLK3_IN_SEL = '0') then
            clkout3_period <= (vco_period * real_odiv3);
        elsif (CLK3_IN_SEL = '1') then
            clkout3_period <= (clkin_period * real_odiv3);
        end if;
    end process;

    process(vco_period, ODIV4_SEL_reg,clkout6_period,clkin_period)
    begin
        real_odiv4 <= real(ODIV4_SEL_reg);
        if (CLK4_IN_SEL = "00") then
            clkout4_period <= (vco_period * real_odiv4);
        elsif (CLK4_IN_SEL = "01") then
            clkout4_period <= (clkout6_period * real_odiv4);
        elsif (CLK4_IN_SEL = "10") then
            clkout4_period <= (clkin_period * real_odiv4);
        end if;
    end process;

    process(vco_period, ODIV5_SEL_reg,clkin_period)
    begin
        real_odiv5 <= real(ODIV5_SEL_reg);
        if (CLK5_IN_SEL = '0') then
            clkout5_period <= (vco_period * real_odiv5);
        elsif (CLK5_IN_SEL = '1') then
            clkout5_period <= (clkin_period * real_odiv5);
        end if;
    end process;

    process(vco_period, ODIV6_SEL_reg,clkin_period)
    begin
        real_odiv6 <= real(ODIV6_SEL_reg);
        if (CLK6_IN_SEL = '0') then
            clkout6_period <= (vco_period * real_odiv6);
        elsif (CLK6_IN_SEL = '1') then
            clkout6_period <= (clkin_period * real_odiv6);
        end if;
    end process;

    clkfbout_period <= (vco_period * (real(MDIV_SEL_reg) + (real(MDIV_f_reg)/8.0)));
    
    clkout0_half <= (clkout0_period / 2.0);
    clkout1_half <= (clkout1_period / 2.0);
    clkout2_half <= (clkout2_period / 2.0);
    clkout3_half <= (clkout3_period / 2.0);
    clkout4_half <= (clkout4_period / 2.0);
    clkout5_half <= (clkout5_period / 2.0);
    clkout6_half <= (clkout6_period / 2.0);
    clkfbout_half <= (clkfbout_period / 2.0);

    -- lock time
    rst <= RESET or PLLPWD or reseti or reseto;
    
    process(CLKIN, rst)
    begin
        if (rst = '1') then
            max_tlock <= 0.0 us;
        elsif(rising_edge(CLKIN)) then
            if((clkin_cycle(0) >= 2 ns) and (clkin_cycle(0) <= 40 ns)) then
                max_tlock <= 50000.0 ns;
            elsif ((clkin_cycle(0) > 40 ns) and (clkin_cycle(0) <= 500 ns)) then
                max_tlock <= 200000.0 ns;              
            end if;
        end if;
    end process;

    process(CLKIN, rst)
    begin
        if (rst = '1') then
            lock_reg <= '0';
            oclk_effect <= '0';
        elsif(rising_edge(CLKIN)) then
            if(clk_effect = '1') then
                cnt_lock <= cnt_lock + 1;

                if(cnt_lock > (max_tlock/clkin_period - 10)) then
                    oclk_effect <= '1';
                else
                    oclk_effect <= '0';
                end if;

                if(cnt_lock > (max_tlock/clkin_period)) then
                    lock_reg <= '1';
                else
                    lock_reg <= '0';
                end if;

            else
                oclk_effect <= '0';
                cnt_lock <= 0;
                lock_reg <= '0';           
            end if;
        end if;
    end process;

    LOCK <= '0' when (CLKFB_SEL = "EXTERNAL" and CLK0_IN_SEL = '1') else lock_reg;
    
    -- calculate CLKFB feedback delay
    process(CLKIN) 
    begin
        if (rising_edge(CLKIN)) then
            if (clkin_init = '1') then
                clkin_curtime <= NOW;
                clkin_init <= '0';
            end if;
        end if;
    end process;

    process(CLKFB) 
    begin
        if (rising_edge(CLKFB)) then
            if (fb_clk_init = '1') then
                clkfb_curtime <= NOW;
                fb_clk_init <= '0';
            end if;
        end if;
    end process;

    process(CLKFB, CLKIN)
    begin
        if ((clkfb_curtime > 0 ns) and (clkin_curtime > 0 ns)) then
            FB_dly0 <= clkfb_curtime - clkin_curtime;
            if ((FB_dly0 >= 0 ns) and (clkin_cycle(0) > 0 ns)) then
                --multi_clkin <= FB_dly0 / (clkin_cycle(0));
                --FB_dly <= clkin_cycle(0) - (FB_dly0 - (clkin_cycle(0)) * multi_clkin);
                FB_dly <= clkin_cycle(0) - (FB_dly0 - (clkin_cycle(0)) * (FB_dly0 / (clkin_cycle(0))));
            end if;
        end if;
    end process;

    process
    variable clk0_flag : std_logic := '1';
    begin
        if(oclk_effect = '0') then
            clk0_reg <= '0';
        else
            if(clk0_flag = '1') then
                clk0_reg <= '1';
                clk0_flag := '0';
            else
                wait for (clkout0_half); 
                clk0_reg <= not clk0_reg ;
            end if;
        end if;
        wait on oclk_effect,clk0_reg;
    end process;

    process
    variable clk1_flag : std_logic := '1';
    begin
        if(oclk_effect = '0') then
            clk1_reg <= '0';
        else
            if(clk1_flag = '1') then
                clk1_reg <= '1';
                clk1_flag := '0';
            else
                wait for (clkout1_half); 
                clk1_reg <= not clk1_reg ;
            end if;
        end if;
        wait on oclk_effect,clk1_reg;
    end process;

    process
    variable clk2_flag : std_logic := '1';
    begin
        if(oclk_effect = '0') then
            clk2_reg <= '0';
        else
            if(clk2_flag = '1') then
                clk2_reg <= '1';
                clk2_flag := '0';
            else
                wait for (clkout2_half);
                clk2_reg <= not clk2_reg ;
            end if;
        end if;
        wait on oclk_effect,clk2_reg;
    end process;

    process
    variable clk3_flag : std_logic := '1';
    begin
        if(oclk_effect = '0') then
            clk3_reg <= '0';
        else
            if(clk3_flag = '1') then
                clk3_reg <= '1';
                clk3_flag := '0';
            else
                wait for (clkout3_half); 
                clk3_reg <= not clk3_reg ;
            end if;
        end if;
        wait on oclk_effect,clk3_reg;
    end process;

    process
    variable clk4_flag : std_logic := '1';
    begin
        if(oclk_effect = '0') then
            clk4_reg <= '0';
        else
            if(clk4_flag = '1') then
                clk4_reg <= '1';
                clk4_flag := '0';
            else
                wait for (clkout4_half); 
                clk4_reg <= not clk4_reg ;
            end if;
        end if;
        wait on oclk_effect,clk4_reg;
    end process;

    process
    variable clk5_flag : std_logic := '1';
    begin
        if(oclk_effect = '0') then
            clk5_reg <= '0';
        else
            if(clk5_flag = '1') then
                clk5_reg <= '1';
                clk5_flag := '0';
            else
                wait for (clkout5_half); 
                clk5_reg <= not clk5_reg ;
            end if;
        end if;
        wait on oclk_effect,clk5_reg;
    end process;

    process
    variable clk6_flag : std_logic := '1';
    begin
        if(oclk_effect = '0') then
            clk6_reg <= '0';
        else
            if(clk6_flag = '1') then
                clk6_reg <= '1';
                clk6_flag := '0';
            else
                wait for (clkout6_half); 
                clk6_reg <= not clk6_reg ;
            end if;
        end if;
        wait on oclk_effect,clk6_reg;
    end process;

    process
    variable clkfb_flag : std_logic := '1';
    begin
        if(oclk_effect = '0') then
            clkfb_reg <= '0';
        else
            if(clkfb_flag = '1') then
                clkfb_reg <= '1';
                clkfb_flag := '0';
            else
                wait for (clkfbout_half); 
                clkfb_reg <= not clkfb_reg ;
            end if;
        end if;
        wait on oclk_effect,clkfb_reg;
    end process;


    process (clk0_reg, clk1_reg, clk2_reg, clk3_reg, clk4_reg, clk5_reg, clk6_reg, clkfb_reg, FB_dly)
    begin
        if (CLKFB_SEL = "INTERNAL") then
            clk0 <= clk0_reg;
            clk1 <= clk1_reg;
            clk2 <= clk2_reg;
            clk3 <= clk3_reg;
            clk4 <= clk4_reg;
            clk5 <= clk5_reg;
            clk6 <= clk6_reg;
            clkfb_0 <= clkfb_reg;
         else
            clk0 <= transport clk0_reg after (FB_dly);
            clk1 <= transport clk1_reg after (FB_dly);
            clk2 <= transport clk2_reg after (FB_dly);
            clk3 <= transport clk3_reg after (FB_dly);
            clk4 <= transport clk4_reg after (FB_dly);
            clk5 <= transport clk5_reg after (FB_dly);
            clk6 <= transport clk6_reg after (FB_dly);
            clkfb_0 <= transport clkfb_reg after (FB_dly);
         end if;
    end process;

    --dynamic phase shift
    process (PSPULSE)
    begin
        ps_pulse_pre <= PSPULSE;
    end process;

    process
    begin
        if(PSSEL = "000") then
            pssel_0_flag <= '1';
            pssel_1_flag <= '0';
            pssel_2_flag <= '0';
            pssel_3_flag <= '0';
            pssel_4_flag <= '0';
            pssel_5_flag <= '0';
            pssel_6_flag <= '0';
            wait for 1 ns;
            pssel_0_flag <= '0';
        elsif(PSSEL = "001") then
            pssel_0_flag <= '0';
            pssel_1_flag <= '1';
            pssel_2_flag <= '0';
            pssel_3_flag <= '0';
            pssel_4_flag <= '0';
            pssel_5_flag <= '0';
            pssel_6_flag <= '0';
            wait for 1 ns;
            pssel_1_flag <= '0';
        elsif(PSSEL = "010") then
            pssel_0_flag <= '0';
            pssel_1_flag <= '0';
            pssel_2_flag <= '1';
            pssel_3_flag <= '0';
            pssel_4_flag <= '0';
            pssel_5_flag <= '0';
            pssel_6_flag <= '0';
            wait for 1 ns;
            pssel_2_flag <= '0';
        elsif(PSSEL = "011") then
            pssel_0_flag <= '0';
            pssel_1_flag <= '0';
            pssel_2_flag <= '0';
            pssel_3_flag <= '1';
            pssel_4_flag <= '0';
            pssel_5_flag <= '0';
            pssel_6_flag <= '0';
            wait for 1 ns;
            pssel_3_flag <= '0';
        elsif(PSSEL = "100") then
            pssel_0_flag <= '0';
            pssel_1_flag <= '0';
            pssel_2_flag <= '0';
            pssel_3_flag <= '0';
            pssel_4_flag <= '1';
            pssel_5_flag <= '0';
            pssel_6_flag <= '0';
            wait for 1 ns;
            pssel_4_flag <= '0';
        elsif(PSSEL = "101") then
            pssel_0_flag <= '0';
            pssel_1_flag <= '0';
            pssel_2_flag <= '0';
            pssel_3_flag <= '0';
            pssel_4_flag <= '0';
            pssel_5_flag <= '1';
            pssel_6_flag <= '0';
            wait for 1 ns;
            pssel_5_flag <= '0';
        elsif(PSSEL = "110") then
            pssel_0_flag <= '0';
            pssel_1_flag <= '0';
            pssel_2_flag <= '0';
            pssel_3_flag <= '0';
            pssel_4_flag <= '0';
            pssel_5_flag <= '0';
            pssel_6_flag <= '1';
            wait for 1 ns;
            pssel_6_flag <= '0';
        end if;
        wait on PSSEL;
    end process;

    process(PSSEL,PSPULSE,PSDIR,ODIV0_SEL_reg,fine_dyn_0,coarse_dyn_0,ODIV1_SEL_reg,fine_dyn_1,coarse_dyn_1,ODIV2_SEL_reg,fine_dyn_2,coarse_dyn_2,ODIV3_SEL_reg,fine_dyn_3,coarse_dyn_3,ODIV4_SEL_reg,fine_dyn_4,coarse_dyn_4,ODIV5_SEL_reg,fine_dyn_5,coarse_dyn_5,ODIV6_SEL_reg,fine_dyn_6,coarse_dyn_6,pssel_0_flag,pssel_1_flag,pssel_2_flag,pssel_3_flag,pssel_4_flag,pssel_5_flag,pssel_6_flag)
    begin
    if (inner_reset = '1') then
        fine_dyn_0 <= (others=>'0');
        fine_dyn_1<= (others=>'0');
        fine_dyn_2 <= (others=>'0');
        fine_dyn_3 <= (others=>'0');
        fine_dyn_4<= (others=>'0');
        fine_dyn_5 <= (others=>'0');
        fine_dyn_6 <= (others=>'0');
        coarse_dyn_0 <= 0;
        coarse_dyn_1 <= 0;
        coarse_dyn_2 <= 0;
        coarse_dyn_3 <= 0;
        coarse_dyn_4 <= 0;
        coarse_dyn_5 <= 0;
        coarse_dyn_6 <= 0;
     else
        if (PSSEL = "000") then
            if(pssel_0_flag = '1') then
                fine_dyn_0 <= (others=>'0');
                coarse_dyn_0 <= 0;
            else
            if (PSPULSE = '0' and ps_pulse_pre = '1') then
                if (PSDIR = '0') then
                    if(ODIV0_SEL_reg = 1) then
                        coarse_dyn_0 <= 0;
                    else
                        if(fine_dyn_0 = "111") then
                            coarse_dyn_0 <= coarse_dyn_0 + 1;
                            if (coarse_dyn_0 = (ODIV0_SEL_reg-1)) then
                                coarse_dyn_0 <= 0;
                            end if;
                        end if;
                    end if;
                    fine_dyn_0 <= fine_dyn_0 + 1;

                else
                    if(ODIV0_SEL_reg = 1) then
                        coarse_dyn_0 <= 0;
                    else
                        if(fine_dyn_0 = "000") then
                            coarse_dyn_0 <= coarse_dyn_0 - 1;
                            if (coarse_dyn_0 = 0) then
                                coarse_dyn_0 <= (ODIV0_SEL_reg-1);
                            end if;
                        end if;
                    end if;
                    fine_dyn_0 <= fine_dyn_0 - 1;

                end if;
            end if;
            end if;
        elsif (PSSEL = "001") then
            if(pssel_1_flag = '1') then
                fine_dyn_1 <= (others=>'0');
                coarse_dyn_1 <= 0;
            else
            if (PSPULSE = '0' and ps_pulse_pre = '1') then
                if (PSDIR = '0') then
                    if(ODIV1_SEL_reg = 1) then
                        coarse_dyn_1 <= 0;
                    else
                        if(fine_dyn_1 = "111") then
                            coarse_dyn_1 <= coarse_dyn_1 + 1;
                            if (coarse_dyn_1 = (ODIV1_SEL_reg-1)) then
                                coarse_dyn_1 <= 0;
                            end if;
                        end if;
                    end if;
                    fine_dyn_1 <= fine_dyn_1 + 1;

                else
                    if(ODIV1_SEL_reg = 1) then
                        coarse_dyn_1 <= 0;
                    else
                        if(fine_dyn_1 = "000") then
                            coarse_dyn_1 <= coarse_dyn_1 - 1;
                            if (coarse_dyn_1 = 1) then
                                coarse_dyn_1 <= (ODIV1_SEL_reg-1);
                            end if;
                        end if;
                    end if;
                    fine_dyn_1 <= fine_dyn_1 - 1;
                end if;
            end if;
            end if;
        elsif (PSSEL = "010") then
            if(pssel_2_flag = '1') then
                fine_dyn_2 <= (others=>'0');
                coarse_dyn_2 <= 0;
            else
            if (PSPULSE = '0' and ps_pulse_pre = '1') then
                if (PSDIR = '0') then
                    if(ODIV2_SEL_reg = 1) then
                        coarse_dyn_2 <= 0;
                    else
                        if(fine_dyn_2 = "111") then
                            coarse_dyn_2 <= coarse_dyn_2 + 1;
                            if (coarse_dyn_2 = (ODIV2_SEL_reg-1)) then
                                coarse_dyn_2 <= 0;
                            end if;
                        end if;
                    end if;
                    fine_dyn_2 <= fine_dyn_2 + 1;

                else
                    if(ODIV2_SEL_reg = 1) then
                        coarse_dyn_2 <= 0;
                    else
                        if(fine_dyn_2 = "000") then
                            coarse_dyn_2 <= coarse_dyn_2 - 1;
                            if (coarse_dyn_2 = 1) then
                                coarse_dyn_2 <= (ODIV2_SEL_reg-1);
                            end if;
                        end if;
                    end if;
                    fine_dyn_2 <= fine_dyn_2 - 1;
                end if;
            end if;
            end if;
        elsif (PSSEL = "011") then
            if(pssel_3_flag = '1') then
                fine_dyn_3 <= (others=>'0');
                coarse_dyn_3 <= 0;
            else
            if (PSPULSE = '0' and ps_pulse_pre = '1') then
                if (PSDIR = '0') then
                    if(ODIV3_SEL_reg = 1) then
                        coarse_dyn_3 <= 0;
                    else
                        if(fine_dyn_3 = "111") then
                            coarse_dyn_3 <= coarse_dyn_3 + 1;
                            if (coarse_dyn_3 = (ODIV3_SEL_reg-1)) then
                                coarse_dyn_3 <= 0;
                            end if;
                        end if;
                    end if;
                    fine_dyn_3 <= fine_dyn_3 + 1;

                else
                    if(ODIV3_SEL_reg = 1) then
                        coarse_dyn_3 <= 0;
                    else
                        if(fine_dyn_3 = "000") then
                            coarse_dyn_3 <= coarse_dyn_3 - 1;
                            if (coarse_dyn_3 = 1) then
                                coarse_dyn_3 <= (ODIV3_SEL_reg-1);
                            end if;
                        end if;
                    end if;
                    fine_dyn_3 <= fine_dyn_3 - 1;
                end if;
            end if;
            end if;
        elsif (PSSEL = "100") then
            if(pssel_4_flag = '1') then
                fine_dyn_4 <= (others=>'0');
                coarse_dyn_4 <= 0;
            else
            if (PSPULSE = '0' and ps_pulse_pre = '1') then
                if (PSDIR = '0') then
                    if(ODIV4_SEL_reg = 1) then
                        coarse_dyn_4 <= 0;
                    else
                        if(fine_dyn_4 = "111") then
                            coarse_dyn_4 <= coarse_dyn_4 + 1;
                            if (coarse_dyn_4 = (ODIV4_SEL_reg-1)) then
                                coarse_dyn_4 <= 0;
                            end if;
                        end if;
                    end if;
                    fine_dyn_4 <= fine_dyn_4 + 1;

                else
                    if(ODIV4_SEL_reg = 1) then
                        coarse_dyn_4 <= 0;
                    else
                        if(fine_dyn_4 = "000") then
                            coarse_dyn_4 <= coarse_dyn_4 - 1;
                            if (coarse_dyn_4 = 1) then
                                coarse_dyn_4 <= (ODIV4_SEL_reg-1);
                            end if;
                        end if;
                    end if;
                    fine_dyn_4 <= fine_dyn_4 - 1;
                end if;
            end if;
            end if;
        elsif (PSSEL = "101") then
            if(pssel_5_flag = '1') then
                fine_dyn_5 <= (others=>'0');
                coarse_dyn_5 <= 0;
            else
            if (PSPULSE = '0' and ps_pulse_pre = '1') then
                if (PSDIR = '0') then
                    if(ODIV5_SEL_reg = 1) then
                        coarse_dyn_5 <= 0;
                    else
                        if(fine_dyn_5 = "111") then
                            coarse_dyn_5 <= coarse_dyn_5 + 1;
                            if (coarse_dyn_5 = (ODIV5_SEL_reg-1)) then
                                coarse_dyn_5 <= 0;
                            end if;
                        end if;
                    end if;
                    fine_dyn_5 <= fine_dyn_5 + 1;

                else
                    if(ODIV5_SEL_reg = 1) then
                        coarse_dyn_5 <= 0;
                    else
                        if(fine_dyn_5 = "000") then
                            coarse_dyn_5 <= coarse_dyn_5 - 1;
                            if (coarse_dyn_5 = 1) then
                                coarse_dyn_5 <= (ODIV5_SEL_reg-1);
                            end if;
                        end if;
                    end if;
                    fine_dyn_5 <= fine_dyn_5 - 1;
                end if;
            end if;
            end if;
        elsif (PSSEL = "110") then
            if(pssel_6_flag = '1') then
                fine_dyn_6 <= (others=>'0');
                coarse_dyn_6 <= 0;
            else
            if (PSPULSE = '0' and ps_pulse_pre = '1') then
                if (PSDIR = '0') then
                    if(ODIV6_SEL_reg = 1) then
                        coarse_dyn_6 <= 0;
                    else
                        if(fine_dyn_6 = "111") then
                            coarse_dyn_6 <= coarse_dyn_6 + 1;
                            if (coarse_dyn_6 = (ODIV6_SEL_reg-1)) then
                                coarse_dyn_6 <= 0;
                            end if;
                        end if;
                    end if;
                    fine_dyn_6 <= fine_dyn_6 + 1;

                else
                    if(ODIV6_SEL_reg = 1) then
                        coarse_dyn_6 <= 0;
                    else
                        if(fine_dyn_6 = "000") then
                            coarse_dyn_6 <= coarse_dyn_6 - 1;
                            if (coarse_dyn_6 = 1) then
                                coarse_dyn_6 <= (ODIV6_SEL_reg-1);
                            end if;
                        end if;
                    end if;
                    fine_dyn_6 <= fine_dyn_6 - 1;
                end if;
            end if;
            end if;
        end if;
    end if;
    end process;

    --enclk
    enclk_0 <= '1' when (CLKOUT0_EN = "TRUE") else '0';
    enclk_1 <= '1' when (CLKOUT1_EN = "TRUE") else '0';
    enclk_2 <= '1' when (CLKOUT2_EN = "TRUE") else '0';
    enclk_3 <= '1' when (CLKOUT3_EN = "TRUE") else '0';
    enclk_4 <= '1' when (CLKOUT4_EN = "TRUE") else '0';
    enclk_5 <= '1' when (CLKOUT5_EN = "TRUE") else '0';
    enclk_6 <= '1' when (CLKOUT6_EN = "TRUE") else '0';

    rsto <= RESET or PLLPWD or reseto;

    process(clk0_out, rsto)
    begin
        if(rsto = '1') then
            cken0 <= '0';
        elsif(falling_edge(clk0_out)) then
            cken0 <= enclk_0;
        end if;
    end process;

    process(clk1_out, rsto)
    begin
        if(rsto = '1') then
            cken1 <= '0';
        elsif(falling_edge(clk1_out)) then
            cken1 <= enclk_1;
        end if;
    end process;

    process(clk2_out, rsto)
    begin
        if(rsto = '1') then
            cken2 <= '0';
        elsif(falling_edge(clk2_out)) then
            cken2 <= enclk_2;
        end if;
    end process;

    process(clk3_out, rsto)
    begin
        if(rsto = '1') then
            cken3 <= '0';
        elsif(falling_edge(clk3_out)) then
            cken3 <= enclk_3;
        end if;
    end process;

    process(clk4_out, rsto)
    begin
        if(rsto = '1') then
            cken4 <= '0';
        elsif(falling_edge(clk4_out)) then
            cken4 <= enclk_4;
        end if;
    end process;

    process(clk5_out, rsto)
    begin
        if(rsto = '1') then
            cken5 <= '0';
        elsif(falling_edge(clk5_out)) then
            cken5 <= enclk_5;
        end if;
    end process;

    process(clk6_out, rsto)
    begin
        if(rsto = '1') then
            cken6 <= '0';
        elsif(falling_edge(clk6_out)) then
            cken6 <= enclk_6;
        end if;
    end process;
    
    clk0_dt_dir <= TO_STDULOGIC(CLKOUT0_DT_DIR);
    clk1_dt_dir <= TO_STDULOGIC(CLKOUT1_DT_DIR);
    clk2_dt_dir <= TO_STDULOGIC(CLKOUT2_DT_DIR);
    clk3_dt_dir <= TO_STDULOGIC(CLKOUT3_DT_DIR);
    clk0_dt_step <= CLKOUT0_DT_STEP;
    clk1_dt_step <= CLKOUT1_DT_STEP;
    clk2_dt_step <= CLKOUT2_DT_STEP;
    clk3_dt_step <= CLKOUT3_DT_STEP;
    
    clk0_dt_delay <= (0.05 ns * clk0_dt_step);
    clk1_dt_delay <= (0.05 ns * clk1_dt_step);
    clk2_dt_delay <= (0.05 ns * clk2_dt_step);
    clk3_dt_delay <= (0.05 ns * clk3_dt_step);

    process(clkout0_duty, clkout1_duty, clkout2_duty, clkout3_duty, clk0_dt_dir, clk1_dt_dir, clk2_dt_dir, clk3_dt_dir, clk0_dt_step, clk1_dt_step, clk2_dt_step, clk3_dt_step)
    begin
        if (clk0_dt_dir = '1') then
            tclk0_duty <= clkout0_duty + clk0_dt_delay;
        else 
            tclk0_duty <= clkout0_duty - clk0_dt_delay;
        end if;

        if (clk1_dt_dir = '1') then
            tclk1_duty <= clkout1_duty + clk1_dt_delay;
	    else 
            tclk1_duty <= clkout1_duty - clk1_dt_delay;
        end if;

        if (clk2_dt_dir = '1') then
            tclk2_duty <= clkout2_duty + clk2_dt_delay;
        else 
            tclk2_duty <= clkout2_duty - clk2_dt_delay;
        end if;

        if (clk3_dt_dir = '1') then
            tclk3_duty <= clkout3_duty + clk3_dt_delay;
        else 
            tclk3_duty <= clkout3_duty - clk3_dt_delay;
        end if;
    end process; 

    --clkfbout
    process 
    begin
        if (rising_edge(clkfb_0)) then
            clkout_fb <= '1';
            wait for clkfbout_half;
            clkout_fb <= '0';
        end if;
        wait on clkfb_0;
    end process;

    rst_p <= RESET or PLLPWD;
    process (CLKIN, oclk_effect, clkout_fb, rst_p, reseto)
    begin
        if(rst_p = '1') then
            clkfb_out  <= '0';
        elsif(reseto = '1') then
            clkfb_out  <= '0';
        else
            clkfb_out <= clkout_fb;
        end if;
    end process;

    CLKFBOUT <= clkfb_out;

    --clkout0
    --phase_shift_value
    process(fine_dyn_0, coarse_dyn_0)
    begin
        if(DYN_PE0_SEL = "TRUE" and DYN_DPA_EN = "TRUE") then
            fine_0 <= conv_integer(fine_dyn_0);
            coarse_0 <= coarse_dyn_0;

        elsif(DYN_PE0_SEL = "FALSE") then
            fine_0 <= CLKOUT0_PE_FINE;
            coarse_0 <= CLKOUT0_PE_COARSE;            
        end if;
    end process;

    process(coarse_0, fine_0, ODIV0_SEL_reg, ODIV0_f_reg, clkout0_period,real_phase0)
    begin 
        real_phase0 <= (real(coarse_0) + (real(fine_0)/8.0));
        if(ODIV0_SEL_reg = 1) then
            phase_value0 <= clkout0_period * (real_phase0/real_odiv0);
        else 
            phase_value0 <= clkout0_period * (real_phase0/(real_odiv0 + real(ODIV0_f_reg)/8.0));
        end if;
    end process;

    --duty_cycle
    process(ODIV0_SEL_reg,clkout0_period,h_level_0)
    begin
        h_level_0 <= ODIV0_SEL_reg / 2;
        clkout0_duty_odd <= (clkout0_period * h_level_0 / ODIV0_SEL_reg);
    end process;

    process(clkout0_half, real_duty0, real_phase0, ODIV0_SEL_reg, clkout0_period, clkout0_duty_odd) 
    begin
        real_duty0 <= (real(CLKOUT0_PE_COARSE) + (real(CLKOUT0_PE_FINE) / 8.0));

        if(CLK0_IN_SEL = '1') then
            if(ODIV0_SEL_reg = 1) then
                clkout0_duty <= clkout0_half;
            else
                clkout0_duty <= clkout0_duty_odd;
            end if;
        elsif((DYN_PE0_SEL = "FALSE") or (DE0_EN = "FALSE")) then
            clkout0_duty <= clkout0_half;
        elsif((DYN_DPA_EN = "TRUE") and (DE0_EN = "TRUE")) then
            if(ODIV0_SEL_reg = 1) then
                clkout0_duty <= clkout0_half;
            else 
                if(real_duty0 > real_phase0) then
                    clkout0_duty <= (clkout0_period * (real_duty0 - real_phase0))/(real_odiv0 + real(ODIV0_f_reg)/8.0);
                elsif(real_duty0 < real_phase0) then
                    clkout0_duty <= (clkout0_period *((real_odiv0 + real(ODIV0_f_reg)/8.0) + (real_duty0 - real_phase0)))/(real_odiv0 + real(ODIV0_f_reg)/8.0); 
                end if;
            end if;
        end if;
    end process;

    process 
    begin
        if (rising_edge(clk0)) then
            clkout_0 <= '1';
            wait for tclk0_duty;
            clkout_0 <= '0';
        end if;
        wait on clk0;
    end process;

    process(clkout_0,clk0_dt_dir) 
    begin
        if(clk0_dt_dir = '1') then
            clkout_dt_0 <= clkout_0;
        else
            clkout_dt_0 <= transport clkout_0 after(clk0_dt_delay);
        end if;
    end process;

    process(clkout_dt_0)
    begin
        clkout0_ps <= transport clkout_dt_0 after (phase_value0);
    end process;
    
    process (CLKIN, oclk_effect, clkout0_ps, reseti, reseto, rst_p)
    begin
        if(rst_p = '1') then
            clk0_out  <= '0';
        elsif(reseti = '1' and CLK0_IN_SEL = '0') then
            clk0_out  <= '0';
        elsif(reseto = '1') then
            clk0_out  <= '0';
        elsif(CLK1_OUT_SEL = '0') then
            clk0_out <= clkout0_ps;
        end if;
    end process;

    process(CLKIN,clk0_out,cken0)
    begin
        if(CLK0_OUT_SEL = '1') then
            CLKOUT0 <= CLKIN;
        else 
            if(cken0 = '1') then
                CLKOUT0 <= clk0_out;
            else
                CLKOUT0 <= '0';
            end if;
        end if;
     end process;


    --clkout1
    --phase_shift_value
    process(fine_dyn_1, coarse_dyn_1)
    begin
        if(DYN_PE1_SEL = "TRUE" and DYN_DPA_EN = "TRUE") then
            fine_1 <= conv_integer(fine_dyn_1);
            coarse_1 <= coarse_dyn_1;

        elsif(DYN_PE1_SEL = "FALSE") then
            fine_1 <= CLKOUT1_PE_FINE;
            coarse_1 <= CLKOUT1_PE_COARSE;            
        end if;
    end process;

    process(coarse_1, fine_1, ODIV1_SEL_reg, clkout1_period,real_phase1)
    begin 
        real_phase1 <= (real(coarse_1) + (real(fine_1)/8.0));
        phase_value1 <= clkout1_period * (real_phase1/real_odiv1);
    end process;

    --duty_cycle
    process(ODIV1_SEL_reg,clkout1_period,h_level_1)
    begin
        h_level_1 <= ODIV1_SEL_reg / 2;
        clkout1_duty_odd <= (clkout1_period * h_level_1 / ODIV1_SEL_reg);
    end process;

    process(clkout1_half, real_duty1, real_phase1, ODIV1_SEL_reg, clkout1_period, clkout1_duty_odd) 
    begin
        real_duty1 <= (real(CLKOUT1_PE_COARSE) + (real(CLKOUT1_PE_FINE) / 8.0));

        if(CLK1_IN_SEL = '1') then
            if(ODIV1_SEL_reg = 1) then
                clkout1_duty <= clkout1_half;
            else
                clkout1_duty <= clkout1_duty_odd;
            end if;
        elsif((DYN_PE1_SEL = "FALSE") or (DE1_EN = "FALSE")) then
            clkout1_duty <= clkout1_half;
        elsif((DYN_DPA_EN = "TRUE") and (DE1_EN = "TRUE")) then
            if(ODIV1_SEL_reg = 1) then
                clkout1_duty <= clkout1_half;
            else 
                if(real_duty1 > real_phase1) then
                    clkout1_duty <= (clkout1_period * (real_duty1 - real_phase1))/(real_odiv1);
                elsif(real_duty1 < real_phase1) then
                    clkout1_duty <= (clkout1_period *(real_odiv1 + (real_duty1 - real_phase1)))/(real_odiv1); 
                end if;
            end if;
        end if;
    end process;

    process 
    begin
        if (rising_edge(clk1)) then
            clkout_1 <= '1';
            wait for tclk1_duty;
            clkout_1 <= '0';
        end if;
        wait on clk1;
    end process;

    process(clkout_1,clk1_dt_dir) 
    begin
        if(clk1_dt_dir = '1') then
            clkout_dt_1 <= clkout_1;
        else
            clkout_dt_1 <= transport clkout_1 after(clk1_dt_delay);
        end if;
    end process;

    process(clkout_dt_1)
    begin
        clkout1_ps <= transport clkout_dt_1 after (phase_value1);
    end process;

    process (CLKIN, oclk_effect, clkout1_ps, reseti, reseto, rst_p)
    begin
        if(rst_p = '1') then
            clk1_out  <= '0';
        elsif(reseti = '1' and CLK1_IN_SEL = '0') then
            clk1_out  <= '0';
        elsif(reseto = '1') then
            clk1_out  <= '0';
        elsif(CLK1_OUT_SEL = '0') then
            clk1_out <= clkout1_ps;
        end if;
    end process;

    process(CLKIN,clk1_out,cken1)
    begin
        if(CLK1_OUT_SEL = '1') then
            CLKOUT1 <= CLKIN;
        else 
            if(cken1 = '1') then
                CLKOUT1 <= clk1_out;
            else
                CLKOUT1 <= '0';
            end if;
        end if;
     end process;


    --clkout2
    --phase_shift_value
    process(fine_dyn_2, coarse_dyn_2)
    begin
        if(DYN_PE2_SEL = "TRUE" and DYN_DPA_EN = "TRUE") then
            fine_2 <= conv_integer(fine_dyn_2);
            coarse_2 <= coarse_dyn_2;

        elsif(DYN_PE2_SEL = "FALSE") then
            fine_2 <= CLKOUT2_PE_FINE;
            coarse_2 <= CLKOUT2_PE_COARSE;            
        end if;
    end process;

    process(coarse_2, fine_2, ODIV2_SEL_reg, clkout2_period,real_phase2)
    begin 
        real_phase2 <= (real(coarse_2) + (real(fine_2)/8.0));
        phase_value2 <= clkout2_period * (real_phase2/real_odiv2);
    end process;

    --duty_cycle
    process(ODIV2_SEL_reg,clkout2_period,h_level_2)
    begin
        h_level_2 <= ODIV2_SEL_reg / 2;
        clkout2_duty_odd <= (clkout2_period * h_level_2 / ODIV2_SEL_reg);
    end process;

    process(clkout2_half, real_duty2, real_phase2, ODIV2_SEL_reg, clkout2_period, clkout2_duty_odd) 
    begin
        real_duty2 <= (real(CLKOUT2_PE_COARSE) + (real(CLKOUT2_PE_FINE) / 8.0));

        if(CLK2_IN_SEL = '1') then
            if(ODIV2_SEL_reg = 1) then
                clkout2_duty <= clkout2_half;
            else
                clkout2_duty <= clkout2_duty_odd;
            end if;
        elsif((DYN_PE2_SEL = "FALSE") or (DE2_EN = "FALSE")) then
            clkout2_duty <= clkout2_half;
        elsif((DYN_DPA_EN = "TRUE") and (DE2_EN = "TRUE")) then
            if(ODIV2_SEL_reg = 1) then
                clkout2_duty <= clkout2_half;
            else 
                if(real_duty2 > real_phase2) then
                    clkout2_duty <= (clkout2_period * (real_duty2 - real_phase2))/(real_odiv2);
                elsif(real_duty2 < real_phase2) then
                    clkout2_duty <= (clkout2_period *(real_odiv2 + (real_duty2 - real_phase2)))/(real_odiv2); 
                end if;
            end if;
        end if;
    end process;

    process 
    begin
        if (rising_edge(clk2)) then
            clkout_2 <= '1';
            wait for tclk2_duty;
            clkout_2 <= '0';
        end if;
        wait on clk2;
    end process;

    process(clkout_2,clk2_dt_dir) 
    begin
        if(clk2_dt_dir = '1') then
            clkout_dt_2 <= clkout_2;
        else
            clkout_dt_2 <= transport clkout_2 after(clk2_dt_delay);
        end if;
    end process;

    process(clkout_dt_2)
    begin
        clkout2_ps <= transport clkout_dt_2 after (phase_value2);
    end process;

    process (CLKIN, oclk_effect, clkout2_ps, reseti, reseto, rst_p)
    begin
        if(rst_p = '1') then
            clk2_out  <= '0';
        elsif(reseti = '1' and CLK2_IN_SEL = '0') then
            clk2_out  <= '0';
        elsif(reseto = '1') then
            clk2_out  <= '0';
        elsif(CLK2_OUT_SEL = '0') then
            clk2_out <= clkout2_ps;
        end if;
    end process;

    process(CLKIN,clk2_out,cken2)
    begin
        if(CLK2_OUT_SEL = '1') then
            CLKOUT2 <= CLKIN;
        else 
            if(cken2 = '1') then
                CLKOUT2 <= clk2_out;
            else
                CLKOUT2 <= '0';
            end if;
        end if;
     end process;

    --clkout3
    --phase_shift_value
    process(fine_dyn_3, coarse_dyn_3)
    begin
        if(DYN_PE3_SEL = "TRUE" and DYN_DPA_EN = "TRUE") then
            fine_3 <= conv_integer(fine_dyn_3);
            coarse_3 <= coarse_dyn_3;

        elsif(DYN_PE3_SEL = "FALSE") then
            fine_3 <= CLKOUT3_PE_FINE;
            coarse_3 <= CLKOUT3_PE_COARSE;            
        end if;
    end process;

    process(coarse_3, fine_3, ODIV3_SEL_reg, clkout3_period,real_phase3)
    begin 
        real_phase3 <= (real(coarse_3) + (real(fine_3)/8.0));
        phase_value3 <= clkout3_period * (real_phase3/real_odiv3);
    end process;

    --duty_cycle
    process(ODIV3_SEL_reg,clkout3_period,h_level_3)
    begin
        h_level_3 <= ODIV3_SEL_reg / 2;
        clkout3_duty_odd <= (clkout3_period * h_level_3 / ODIV3_SEL_reg);
    end process;

    process(clkout3_half, real_duty3, real_phase3, ODIV3_SEL_reg, clkout3_period, clkout3_duty_odd) 
    begin
        real_duty3 <= (real(CLKOUT3_PE_COARSE) + (real(CLKOUT3_PE_FINE) / 8.0));

        if(CLK3_IN_SEL = '1') then
            if(ODIV3_SEL_reg = 1) then
                clkout3_duty <= clkout3_half;
            else
                clkout3_duty <= clkout3_duty_odd;
            end if;
        elsif((DYN_PE3_SEL = "FALSE") or (DE3_EN = "FALSE")) then
            clkout3_duty <= clkout3_half;
        elsif((DYN_DPA_EN = "TRUE") and (DE3_EN = "TRUE")) then
            if(ODIV3_SEL_reg = 1) then
                clkout3_duty <= clkout3_half;
            else 
                if(real_duty3 > real_phase3) then
                    clkout3_duty <= (clkout3_period * (real_duty3 - real_phase3))/(real_odiv3);
                elsif(real_duty3 < real_phase3) then
                    clkout3_duty <= (clkout3_period *(real_odiv3 + (real_duty3 - real_phase3)))/(real_odiv3); 
                end if;
            end if;
        end if;
    end process;

    process 
    begin
        if (rising_edge(clk3)) then
            clkout_3 <= '1';
            wait for tclk3_duty;
            clkout_3 <= '0';
        end if;
        wait on clk3;
    end process;

    process(clkout_3,clk3_dt_dir) 
    begin
        if(clk3_dt_dir = '1') then
            clkout_dt_3 <= clkout_3;
        else
            clkout_dt_3 <= transport clkout_3 after(clk3_dt_delay);
        end if;
    end process;

    process(clkout_dt_3)
    begin
        clkout3_ps <= transport clkout_dt_3 after (phase_value3);
    end process;

    process (CLKIN, oclk_effect, clkout3_ps, reseti, reseto, rst_p)
    begin
        if(rst_p = '1') then
            clk3_out  <= '0';
        elsif(reseti = '1' and CLK3_IN_SEL = '0') then
            clk3_out  <= '0';
        elsif(reseto = '1') then
            clk3_out  <= '0';
        elsif(CLK3_OUT_SEL = '0') then
            clk3_out <= clkout3_ps;
        end if;
    end process;

    process(CLKIN,clk3_out,cken3)
    begin
        if(CLK3_OUT_SEL = '1') then
            CLKOUT3 <= CLKIN;
        else 
            if(cken3 = '1') then
                CLKOUT3 <= clk3_out;
            else
                CLKOUT3 <= '0';
            end if;
        end if;
     end process;


    --clkout4
    --phase_shift_value
    process(fine_dyn_4, coarse_dyn_4)
    begin
        if(DYN_PE4_SEL = "TRUE" and DYN_DPA_EN = "TRUE") then
            fine_4 <= conv_integer(fine_dyn_4);
            coarse_4 <= coarse_dyn_4;

        elsif(DYN_PE4_SEL = "FALSE") then
            fine_4 <= CLKOUT4_PE_FINE;
            coarse_4 <= CLKOUT4_PE_COARSE;            
        end if;
    end process;

    process(coarse_4, fine_4, ODIV4_SEL_reg, clkout4_period,real_phase4)
    begin 
        real_phase4 <= (real(coarse_4) + (real(fine_4)/8.0));
        phase_value4 <= clkout4_period * (real_phase4/real_odiv4);
    end process;

    --duty_cycle
    process(ODIV4_SEL_reg,clkout4_period,h_level_4)
    begin
        h_level_4 <= ODIV4_SEL_reg / 2;
        clkout4_duty_odd <= (clkout4_period * h_level_4 / ODIV4_SEL_reg);
    end process;

    process(clkout4_half, real_duty4, real_phase4, ODIV4_SEL_reg, clkout4_period, clkout4_duty_odd) 
    begin
        real_duty4 <= (real(CLKOUT4_PE_COARSE) + (real(CLKOUT4_PE_FINE) / 8.0));

        if(CLK4_IN_SEL = "10" or CLK4_IN_SEL = "01") then
            if(ODIV4_SEL_reg = 1) then
                clkout4_duty <= clkout4_half;
            else
                clkout4_duty <= clkout4_duty_odd;
            end if;
        elsif((DYN_PE4_SEL = "FALSE") or (DE4_EN = "FALSE")) then
            clkout4_duty <= clkout4_half;
        elsif((DYN_DPA_EN = "TRUE") and (DE4_EN = "TRUE")) then
            if(ODIV4_SEL_reg = 1) then
                clkout4_duty <= clkout4_half;
            else 
                if(real_duty4 > real_phase4) then
                    clkout4_duty <= (clkout4_period * (real_duty4 - real_phase4))/(real_odiv4);
                elsif(real_duty4 < real_phase4) then
                    clkout4_duty <= (clkout4_period *(real_odiv4 + (real_duty4 - real_phase4)))/(real_odiv4); 
                end if;
            end if;
        end if;
    end process;

    process 
    begin
        if (rising_edge(clk4)) then
            clkout_4 <= '1';
            wait for clkout4_duty;
            clkout_4 <= '0';
        end if;
        wait on clk4;
    end process;

    process(clkout_4)
    begin
        clkout4_ps <= transport clkout_4 after (phase_value4);
    end process;

    process (CLKIN, oclk_effect, clkout4_ps, reseti, reseto, rst_p)
    begin
        if(rst_p = '1') then
            clk4_out  <= '0';
        elsif(reseti = '1' and CLK4_IN_SEL = "00") then
            clk4_out  <= '0';
        elsif(reseto = '1') then
            clk4_out  <= '0';
        elsif(CLK4_OUT_SEL = '0') then
            clk4_out <= clkout4_ps;
        end if;
    end process;

    process(CLKIN,clk4_out,cken4)
    begin
        if(CLK4_OUT_SEL = '1') then
            CLKOUT4 <= CLKIN;
        else 
            if(cken4 = '1') then
                CLKOUT4 <= clk4_out;
            else
                CLKOUT4 <= '0';
            end if;
        end if;
     end process;


    --clkout5
    --phase_shift_value
    process(fine_dyn_5, coarse_dyn_5)
    begin
        if(DYN_PE5_SEL = "TRUE" and DYN_DPA_EN = "TRUE") then
            fine_5 <= conv_integer(fine_dyn_5);
            coarse_5 <= coarse_dyn_5;

        elsif(DYN_PE5_SEL = "FALSE") then
            fine_5 <= CLKOUT5_PE_FINE;
            coarse_5 <= CLKOUT5_PE_COARSE;            
        end if;
    end process;

    process(coarse_5, fine_5, ODIV5_SEL_reg, clkout5_period,real_phase5)
    begin 
        real_phase5 <= (real(coarse_5) + (real(fine_5)/8.0));
        phase_value5 <= clkout5_period * (real_phase5/real_odiv5);
    end process;

    --duty_cycle
    process(ODIV5_SEL_reg,clkout5_period,h_level_5)
    begin
        h_level_5 <= ODIV5_SEL_reg / 2;
        clkout5_duty_odd <= (clkout5_period * h_level_5 / ODIV5_SEL_reg);
    end process;

    process(clkout5_half, real_duty5, real_phase5, ODIV5_SEL_reg, clkout5_period, clkout5_duty_odd) 
    begin
        real_duty5 <= (real(CLKOUT5_PE_COARSE) + (real(CLKOUT5_PE_FINE) / 8.0));

        if(CLK5_IN_SEL = '1') then
            if(ODIV5_SEL_reg = 1) then
                clkout5_duty <= clkout5_half;
            else
                clkout5_duty <= clkout5_duty_odd;
            end if;
        elsif((DYN_PE5_SEL = "FALSE") or (DE5_EN = "FALSE")) then
            clkout5_duty <= clkout5_half;
        elsif((DYN_DPA_EN = "TRUE") and (DE5_EN = "TRUE")) then
            if(ODIV5_SEL_reg = 1) then
                clkout5_duty <= clkout5_half;
            else 
                if(real_duty5 > real_phase5) then
                    clkout5_duty <= (clkout5_period * (real_duty5 - real_phase5))/(real_odiv5);
                elsif(real_duty5 < real_phase5) then
                    clkout5_duty <= (clkout5_period *(real_odiv5 + (real_duty5 - real_phase5)))/(real_odiv5); 
                end if;
            end if;
        end if;
    end process;

    process 
    begin
        if (rising_edge(clk5)) then
            clkout_5 <= '1';
            wait for clkout5_duty;
            clkout_5 <= '0';
        end if;
        wait on clk5;
    end process;

    process(clkout_5)
    begin
        clkout5_ps <= transport clkout_5 after (phase_value5);
    end process;

    process (CLKIN, oclk_effect, clkout5_ps, reseti, reseto, rst_p)
    begin
        if(rst_p = '1') then
            clk5_out  <= '0';
        elsif(reseti = '1' and CLK5_IN_SEL = '0') then
            clk5_out  <= '0';
        elsif(reseto = '1') then
            clk5_out  <= '0';
        elsif(CLK5_OUT_SEL = '0') then
            clk5_out <= clkout5_ps;
        end if;
    end process;

    process(CLKIN,clk5_out,cken5)
    begin
        if(CLK5_OUT_SEL = '1') then
            CLKOUT5 <= CLKIN;
        else 
            if(cken5 = '1') then
                CLKOUT5 <= clk5_out;
            else
                CLKOUT5 <= '0';
            end if;
        end if;
     end process;


    --clkout6
    --phase_shift_value
    process(fine_dyn_6, coarse_dyn_6)
    begin
        if(DYN_PE6_SEL = "TRUE" and DYN_DPA_EN = "TRUE") then
            fine_6 <= conv_integer(fine_dyn_6);
            coarse_6 <= coarse_dyn_6;

        elsif(DYN_PE6_SEL = "FALSE") then
            fine_6 <= CLKOUT6_PE_FINE;
            coarse_6 <= CLKOUT6_PE_COARSE;            
        end if;
    end process;

    process(coarse_6, fine_6, ODIV6_SEL_reg, clkout6_period,real_phase6)
    begin 
        real_phase6 <= (real(coarse_6) + (real(fine_6)/8.0));
        phase_value6 <= clkout6_period * (real_phase6/real_odiv6);
    end process;

    --duty_cycle
    process(ODIV6_SEL_reg,clkout6_period,h_level_6)
    begin
        h_level_6 <= ODIV6_SEL_reg / 2;
        clkout6_duty_odd <= (clkout6_period * h_level_6 / ODIV6_SEL_reg);
    end process;

    process(clkout6_half, real_duty6, real_phase6, ODIV6_SEL_reg, clkout6_period, clkout6_duty_odd) 
    begin
        real_duty6 <= (real(CLKOUT6_PE_COARSE) + (real(CLKOUT6_PE_FINE) / 8.0));

        if(CLK6_IN_SEL = '1') then
            if(ODIV6_SEL_reg = 1) then
                clkout6_duty <= clkout6_half;
            else
                clkout6_duty <= clkout6_duty_odd;
            end if;
        elsif((DYN_PE6_SEL = "FALSE") or (DE6_EN = "FALSE")) then
            clkout6_duty <= clkout6_half;
        elsif((DYN_DPA_EN = "TRUE") and (DE6_EN = "TRUE")) then
            if(ODIV6_SEL_reg = 1) then
                clkout6_duty <= clkout6_half;
            else 
                if(real_duty6 > real_phase6) then
                    clkout6_duty <= (clkout6_period * (real_duty6 - real_phase6))/(real_odiv6);
                elsif(real_duty6 < real_phase6) then
                    clkout6_duty <= (clkout6_period *(real_odiv6 + (real_duty6 - real_phase6)))/(real_odiv6); 
                end if;
            end if;
        end if;
    end process;

    process 
    begin
        if (rising_edge(clk6)) then
            clkout_6 <= '1';
            wait for clkout6_duty;
            clkout_6 <= '0';
        end if;
        wait on clk6;
    end process;

    process(clkout_6)
    begin
        clkout6_ps <= transport clkout_6 after (phase_value6);
    end process;

    process (CLKIN, oclk_effect, clkout6_ps, reseti, reseto, rst_p)
    begin
        if(rst_p = '1') then
            clk6_out  <= '0';
        elsif(reseti = '1' and CLK6_IN_SEL = '0') then
            clk6_out  <= '0';
        elsif(reseto = '1') then
            clk6_out  <= '0';
        elsif(CLK6_OUT_SEL = '0') then
            clk6_out <= clkout6_ps;
        end if;
    end process;

    process(CLKIN,clk6_out,cken6)
    begin
        if(CLK6_OUT_SEL = '1') then
            CLKOUT6 <= CLKIN;
        else 
            if(cken6 = '1') then
                CLKOUT6 <= clk6_out;
            else
                CLKOUT6 <= '0';
            end if;
        end if;
    end process;


end Behavioral;


-----------------SAMB---------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SAMB is
    generic(
		MODE : bit_vector := "00"
    );
    PORT (
    	 SPIAD : IN std_logic_vector(23 downto 0);
    	 LOAD : IN std_logic;
         ADWSEL : IN std_logic
    );
end SAMB;

architecture Behavioral of SAMB is
begin

end Behavioral;


-----------------OTP---------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity OTP is
    generic(
		MODE : bit := '0'
    );
    PORT (
    	 DOUT : OUT std_logic;
    	 READ : IN std_logic;
    	 SHIFT : IN std_logic
    );
end OTP;

architecture Behavioral of OTP is
begin

end Behavioral;

-----------------CMSER---------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CMSER is    
    PORT (
    	 RUNNING,CRCERR,CRCDONE : OUT std_logic;
    	 ECCCORR,ECCUNCORR : OUT std_logic;
    	 ERRLOC : OUT std_logic_vector(27 downto 0);
    	 ECCDEC,DSRRD,DSRWR : OUT std_logic;
    	 ASRRESET,ASRINC,REFCLK : OUT std_logic;
    	 CLK,ERRINJECT : IN std_logic;
    	 SEREN : IN std_logic_vector(2 downto 0);
    	 ERRINJLOC : IN std_logic_vector(6 downto 0)
    );
end CMSER;

architecture Behavioral of CMSER is
begin

end Behavioral;

-----------------CMSERA---------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CMSERA is    
    PORT (
    	 RUNNING,CRCERR,CRCDONE : OUT std_logic;
    	 ECCCORR,ECCUNCORR : OUT std_logic;
    	 ERR0LOC,ERR1LOC : OUT std_logic_vector(26 downto 0);
    	 ECCDEC,DSRRD,DSRWR : OUT std_logic;
    	 ASRRESET,ASRINC,REFCLK : OUT std_logic;
    	 CLK,ERR0INJECT,ERR1INJECT : IN std_logic;
    	 SEREN : IN std_logic_vector(2 downto 0);
    	 ERRINJ0LOC,ERRINJ1LOC : IN std_logic_vector(6 downto 0)
    );
end CMSERA;

architecture Behavioral of CMSERA is
begin

end Behavioral;


------------------------------ADCLRC---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ADCLRC is
        generic(
            DYN_BKEN  	     : string := "FALSE"; --"FALSE","TRUE"."TRUE",BUF_BK2_EN[0]&BUF_BK3_EN[0]=1
            BUF_SERDES_Q1_EN : bit_vector := "000";    --[1:0] does not support "11"
            BUF_BK2_EN       : bit_vector := "000000"; --[3:0] Only one bit can be 1 at the same time
            BUF_BK3_EN       : bit_vector := "000000"; --[3:0] Only one bit can be 1 at the same time
            BUF_BK4_EN       : bit_vector := "000000"; --[3:0] Only one bit can be 1 at the same time
            BUF_BK5_EN       : bit_vector:= "000000"; --[3:0] Only one bit can be 1 at the same time
            BUF_BK10_EN      : bit_vector := "00000";  --[3:1] Only one bit can be 1 at the same time
            BUF_BK11_EN      : bit_vector := "00000";  --[3:1] Only one bit can be 1 at the same time
            --Analog terminal option
            CLK_SEL          : bit := '0';      --Clock source selection. 0,PIOCLK_SEL，1,ciu_clk
            PIOCLK_SEL       : bit := '0';       --Clock source selection. 1/2 shared，0,mck_adc_clk_osc，1,io_clk
            VSEN_CTL         : bit_vector := "000";    --Input source selection 
            VSEN_CTL_SEL     : bit := '0';       --vsen_ctl source selection，0,VSEN_CTL，1,ciu_vsen_ctl
            ADC_MODE         : bit := '0';      --Mode selection
            DIV_CTL          : integer := 0;      --clock division，0:/1，1:/2，2:/4，3:/8，Clock after frequency division, 500kHz~8MHz
            --Digital terminal options
            SAMPLE_CNT_SEL   : integer := 4;      --total samples configuration, 0~4:64, 128, 256, 512, 1024 sampling points, and the other values are 2048 sampling points.The total number of samples shall be greater than 7 * sampling period, i.e.  SAMPLR_CNT_SEL >= RATE_CHANGE_CTRL-1
            RATE_CHANGE_CTRL : integer := 4
        );
        port(
            ADCINBK2A : in std_logic;       --input from bank2 IO, adc_in_b is the reference
            ADCINBK2B : in std_logic;        --input from bank2 IO, adc_in_b is the reference
            ADCINBK3A : in std_logic;        --input from bank3 IO, adc_in_b is the reference
            ADCINBK3B : in std_logic;        --input from bank3 IO, adc_in_b is the reference
            ADCINBK4A : in std_logic;        --input from bank4 IO, adc_in_b is the reference
            ADCINBK4B : in std_logic;        --input from bank4 IO, adc_in_b is the reference
            ADCINBK5A : in std_logic;        --input from bank5 IO, adc_in_b is the reference
            ADCINBK5B : in std_logic;        --input from bank5 IO, adc_in_b is the reference
            --control signal
            VSENCTL : in std_logic_vector(2 downto 0);     --Input source selection (ciu), from 0 to 7: adcv, adct, vdd09_0, vdd09_1, vdd18_0, vdd18_1, vdd33_0, vdd33_1	  
            ADCEN : in std_logic;          --Enable signal, active high
            CLK : in std_logic;           --clk input，1/2 shared
            DRSTN : in std_logic;          --0/1 shared, Digital part reset signal, active low
            ADCREQI : in std_logic;        --Measurement request signal, valid rising edge, asynchronous signal
            FSCAL_VALUE : in std_logic_vector(9 downto 0);
            OFFSET_VALUE : in std_logic_vector(11 downto 0);
            --output
            ADCRDY : out std_logic;          --The measurement completion signal, active high
            ADCVALUE : out std_logic_vector(13 downto 0) 
    );
end ADCLRC;
architecture Behavioral of ADCLRC is
begin

end Behavioral;

------------------------------ADCULC---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ADCULC is
        generic(
             DYN_BKEN 		  : string := "FALSE"; --"FALSE","TRUE"."TRUE",BUF_BK6_EN[0]&BUF_BK7_EN[0]=1
             --Input source selection
             BUF_VCC_EN       : bit := '0';       --ulc
             BUF_VCCM_EN      : bit := '0';       --ulc
             BUF_MIPI_M0_EN   : bit_vector := "000";     --ulc,[1:0] Only one bit can be 1 at the same time
             BUF_MIPI_M1_EN   : bit_vector := "000";     --ulc,[1:0] Only one bit can be 1 at the same time
             BUF_SERDES_Q0_EN : bit_vector := "000";     --ulc,[1:0] Only one bit can be 1 at the same time
             BUF_BK6_EN       : bit_vector := "000000";  --bk6,[3:0] Only one bit can be 1 at the same time
             BUF_BK7_EN       : bit_vector := "000000";  --bk7,[3:0] Only one bit can be 1 at the same time
             --Analog terminal option
             CLK_SEL          : bit := '0';       --Clock source selection. 0,PIOCLK_SEL，1,ciu_clk
             PIOCLK_SEL       : bit := '0';       --Clock source selection. 1/2 shared，0,mck_adc_clk_osc，1,io_clk
             VSEN_CTL         : bit_vector := "000";     --Input source selection 
             VSEN_CTL_SEL     : bit := '0';       --vsen_ctl source selection，0,VSEN_CTL，1,ciu_vsen_ctl
             ADC_MODE      	  : bit := '0';       --Mode selection
             DIV_CTL          : integer := 0;       --clock division，0:/1，1:/2，2:/4，3:/8，Clock after frequency division, 500kHz~8MHz
              
             --Digital terminal options
             SAMPLE_CNT_SEL   : integer := 4;       --total samples configuration, 0~4:64, 128, 256, 512, 1024 sampling points, and the other values are 2048 sampling points.The total number of samples shall be greater than 7 * sampling period, i.e.  SAMPLR_CNT_SEL >= RATE_CHANGE_CTRL-1
             RATE_CHANGE_CTRL : integer := 4       --Sampling period configuration, 0~4:4、8、16、32、64，other values are 128
        );
        port(
            --Voltage signal source, /mV
            ADCINBK6A : in std_logic;       --input from bank6 IO, adc_in_b is the reference
            ADCINBK6B : in std_logic;       --input from bank6 IO, adc_in_b is the reference
            ADCINBK7A : in std_logic;       --input from bank7 IO, adc_in_b is the reference
            ADCINBK7B : in std_logic;       --input from bank7 IO, adc_in_b is the reference
           
            --control signal
            VSENCTL : in std_logic_vector(2 downto 0);    --Input source selection(cib)，0~7: vtest, vdd09_0, vdd09_1, vdd09_2, vdd18_0, vdd18_1, reserved, vdd33
            ADCEN : in std_logic;         --Enable signal, active high
            CLK : in std_logic;         --clk input
            DRSTN : in std_logic;         --0/1 shared, Digital part reset signal, active low
            ADCREQI : in std_logic;      --Measurement request signal, valid rising edge, asynchronous signal
            FSCAL_VALUE : in std_logic_vector(9 downto 0);
            OFFSET_VALUE : in std_logic_vector(11 downto 0);
            ADCRDY : out std_logic;       --The measurement completion signal, active high
            ADCVALUE : out std_logic_vector(13 downto 0) --The measurement result output, signed number. In voltage mode,/2048 is the actual measured value; In temperature mode,/4 is the actual measured value
    );
end ADCULC;
architecture Behavioral of ADCULC is
begin

end Behavioral;

------------------------------ADC---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ADC is
        generic(
             --Analog terminal option
             CLK_SEL         	  : bit := '0';       --时钟源选择，0:osc(2.5MHz)，1:CLK
             DIV_CTL         	  : integer := 0;       --clock division，0:/1，1:/2，2:/4，3:/8，Clock after frequency division, 500kHz~8MHz
              --Input source selection
             BUF_EN          	  : bit_vector := "000000000000";
             BUF_BK0_VREF_EN 	  : bit := '0';   
             BUF_BK1_VREF_EN 	  : bit := '0';  
             BUF_BK2_VREF_EN 	  : bit := '0'; 
             BUF_BK3_VREF_EN 	  : bit := '0';  
             BUF_BK4_VREF_EN 	  : bit := '0';   
             BUF_BK5_VREF_EN 	  : bit := '0';   
             BUF_BK6_VREF_EN 	  : bit := '0';   
             BUF_BK7_VREF_EN 	  : bit := '0';   

              --Digital terminal options
             CSR_ADC_MODE      	  : bit := '1';        -- Mode selection
             CSR_VSEN_CTRL        : integer := 0;        -- signal source:vccx/vccio_*/vcc_reg -> 7, signal source:vcc_ext -> 4, others -> 0
             CSR_SAMPLE_CNT_SEL   : integer := 4;        -- total samples configuration, 0~4:64, 128, 256, 512, 1024 sampling points, and the other values are 2048 sampling points.The total number of samples shall be greater than 7 * sampling period, i.e.  SAMPLR_CNT_SEL >= RATE_CHANGE_CTRL-1
             CSR_RATE_CHANGE_CTRL : integer := 4;        -- Sampling period configuration, 0~4:4、8、16、32、64，other values are 128
             CSR_FSCAL            : integer := 730;     -- Parameter 1: temperature mode 510~948, typical value 730; Voltage mode 452~840, typical value 653
             CSR_OFFSET           : integer := -1180   -- Parameter 2, signed number, temperature mode - 1560~- 760, typical value - 1180; Voltage mode - 410~410, typical value 0

        );
        port(
            --control signal
            CLK : in std_logic;                --clk input
            VSENCTL : in std_logic_vector(2 downto 0);      --Input source selection (ciu), from 0 to 7: glo_left,glo_right,loc_left,vtest,vcc_rt,vccc_rt,vccm_rt,vccx_buf
            ADCMODE : in std_logic;            --Mode selection,0:temperature mode，1:voltage mode
            DRSTN : in std_logic;              --Digital part reset signal, active low
            ADCREQI : in std_logic;            --Measurement request signal, valid rising edge, asynchronous signal
            ADCRDY : out std_logic;           --The measurement completion signal, active high
            ADCVALUE : in std_logic_vector(13 downto 0);  --The measurement result output, signed number. In voltage mode,/2048 is the actual measured value; In temperature mode,/4 is the actual measured value
             --mdrp
            MDRP_CLK : in std_logic;               --mdrp clock
            MDRP_WDATA : in std_logic_vector(7 downto 0);       --mdrp write data
            MDRP_A_INC : in std_logic;             --mdrp self-increased address
            MDRP_OPCODE : in std_logic_vector(1 downto 0);      --mdrp opcode
            MDRP_RDATA : out std_logic_vector(7 downto 0);        --mdrp read data
            ADCEN : in std_logic               --Enable signal, active high
    );
end ADC;
architecture Behavioral of ADC is
begin

end Behavioral;


------------------------------MIPI_DPHY_RX---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;

entity MIPI_DPHY_RX is
    GENERIC(
        ALIGN_BYTE : bit_vector := "10111000";
        EN_CLKB1X  : bit := '1';
        EQ_ADPSEL_LANE0  : bit := '0';
        EQ_ADPSEL_LANE1  : bit := '0';
        EQ_ADPSEL_LANE2  : bit := '0';
        EQ_ADPSEL_LANE3  : bit := '0';
        EQ_ADPSEL_CK  : bit := '0';
        EQ_CS_LANE0 : bit_vector := "100";
        EQ_CS_LANE1 : bit_vector := "100";
        EQ_CS_LANE2 : bit_vector := "100";
        EQ_CS_LANE3 : bit_vector := "100";
        EQ_CS_CK : bit_vector := "100";
        EQ_PBIAS_LANE0 : bit_vector := "0100";
        EQ_PBIAS_LANE1 : bit_vector := "0100";
        EQ_PBIAS_LANE2 : bit_vector := "0100";
        EQ_PBIAS_LANE3 : bit_vector := "0100";
        EQ_PBIAS_CK : bit_vector := "0100";
        EQ_RS_LANE0 : bit_vector := "100";
        EQ_RS_LANE1 : bit_vector := "100";
        EQ_RS_LANE2 : bit_vector := "100";
        EQ_RS_LANE3 : bit_vector := "100";
        EQ_RS_CK : bit_vector := "100";
        EQ_ZLD_LANE0 : bit_vector := "1000";
        EQ_ZLD_LANE1 : bit_vector := "1000";
        EQ_ZLD_LANE2 : bit_vector := "1000";
        EQ_ZLD_LANE3 : bit_vector := "1000";
        EQ_ZLD_CK : bit_vector := "1000";

        HIGH_BW_LANE0  : bit := '1';
        HIGH_BW_LANE1  : bit := '1';
        HIGH_BW_LANE2  : bit := '1';
        HIGH_BW_LANE3  : bit := '1';
        HIGH_BW_CK  : bit := '1';
         
        HSRX_DLYCTL_CK : bit_vector := "0000000";
        HSRX_DLYCTL_LANE0 : bit_vector := "0000000";
        HSRX_DLYCTL_LANE1 : bit_vector := "0000000";
        HSRX_DLYCTL_LANE2 : bit_vector := "0000000";
        HSRX_DLYCTL_LANE3 : bit_vector := "0000000";
        HSRX_DLY_SEL : bit := '0';
        HSRX_DUTY_LANE0 : bit_vector := "1000";
        HSRX_DUTY_LANE1 : bit_vector := "1000";
        HSRX_DUTY_LANE2 : bit_vector := "1000";
        HSRX_DUTY_LANE3 : bit_vector := "1000";
        HSRX_DUTY_CK : bit_vector := "1000";
        HSRX_EN  : bit := '1';
        HSRX_EQ_EN_LANE0  : bit := '1';
        HSRX_EQ_EN_LANE1  : bit := '1';
        HSRX_EQ_EN_LANE2  : bit := '1';
        HSRX_EQ_EN_LANE3  : bit := '1';
        HSRX_EQ_EN_CK  : bit := '1';
        HSRX_IBIAS : bit_vector := "0011";
        HSRX_IMARG_EN  : bit := '1';
        MIPI_LANE0_EN  : bit := '0';
        MIPI_LANE1_EN  : bit := '0';
        MIPI_LANE2_EN  : bit := '0';
        MIPI_LANE3_EN  : bit := '0';
        MIPI_CK_EN  : bit := '1';
        HSRX_ODT_EN  : bit := '1';
        HSRX_ODT_TST : bit_vector := "0000";
        HSRX_ODT_TST_CK  : bit := '0';
        HSRX_STOP_EN  : bit := '0';
        HSRX_TST : bit_vector := "0000";
        HSRX_TST_CK  : bit := '0';
        HSRX_WAIT4EDGE  : bit := '0';
        HYST_NCTL : bit_vector := "01";
        HYST_PCTL : bit_vector := "01";
        LOW_LPRX_VTH  : bit := '0';
        LPRX_EN  : bit := '1';
        LPRX_TST : bit_vector := "0000";
        LPRX_TST_CK  : bit := '0';
        LPTX_EN  : bit := '1';
        LPTX_SW_LANE0 : bit_vector := "100";
        LPTX_SW_LANE1 : bit_vector := "100";
        LPTX_SW_LANE2 : bit_vector := "100";
        LPTX_SW_LANE3 : bit_vector := "100";
        LPTX_SW_CK : bit_vector := "100";
        LPTX_TST : bit_vector := "0000";
        LPTX_TST_CK  : bit := '0';
        MIPI_DIS_N  : bit := '1';
        PGA_BIAS_LANE0 : bit_vector := "1000";
        PGA_BIAS_LANE1 : bit_vector := "1000";
        PGA_BIAS_LANE2 : bit_vector := "1000";
        PGA_BIAS_LANE3 : bit_vector := "1000";
        PGA_BIAS_CK : bit_vector := "1000";
        PGA_GAIN_LANE0 : bit_vector := "1000";
        PGA_GAIN_LANE1 : bit_vector := "1000";
        PGA_GAIN_LANE2 : bit_vector := "1000";
        PGA_GAIN_LANE3 : bit_vector := "1000";
        PGA_GAIN_CK : bit_vector := "1000";
        RX_CLK1X_SYNC_SEL  : bit := '0';
        RX_ODT_TRIM_LANE0 : bit_vector := "0111";
        RX_ODT_TRIM_LANE1 : bit_vector := "0111";
        RX_ODT_TRIM_LANE2 : bit_vector := "0111";
        RX_ODT_TRIM_LANE3 : bit_vector := "0111";
        RX_ODT_TRIM_CK : bit_vector := "0111";
        STP_UNIT : bit_vector := "00";
        WALIGN_DVLD_SRC_SEL  : bit := '0';
        SYNC_CLK_SEL : bit := '1'
    );
    PORT(
        D0LN_DESKEW_DONE,D1LN_DESKEW_DONE,D2LN_DESKEW_DONE,D3LN_DESKEW_DONE : OUT std_logic;
        D0LN_HSRXD, D1LN_HSRXD, D2LN_HSRXD, D3LN_HSRXD : OUT std_logic_vector(15 downto 0);
        D0LN_HSRXD_VLD,D1LN_HSRXD_VLD,D2LN_HSRXD_VLD,D3LN_HSRXD_VLD : OUT std_logic;
        DI_LPRX0_N, DI_LPRX0_P, DI_LPRX1_N, DI_LPRX1_P, DI_LPRX2_N, DI_LPRX2_P, DI_LPRX3_N, DI_LPRX3_P : OUT std_logic;
        DI_LPRXCK_N, DI_LPRXCK_P : OUT std_logic;
        RX_CLK_O : OUT std_logic;
        DESKEW_ERROR : OUT std_logic;
        CK_N, CK_P, RX0_N, RX0_P, RX1_N, RX1_P, RX2_N, RX2_P, RX3_N, RX3_P : INOUT std_logic;
        BYTE_LENDIAN : IN std_logic;
        FIFO_RD_STD : IN std_logic_vector(2 downto 0);
        HSRX_STOP : IN std_logic;
        PWRON,RESET : IN std_logic;
        D0LN_HSRX_DREN,  D1LN_HSRX_DREN, D2LN_HSRX_DREN, D3LN_HSRX_DREN : IN std_logic;
        DESKEW_BY,DESKEW_EN_OEDGE : IN std_logic;
        DESKEW_HALF_OPENING : IN std_logic_vector(5 downto 0);
        DESKEW_LNSEL : IN std_logic_vector(2 downto 0);
        DESKEW_LSB_MODE : IN std_logic_vector(1 downto 0);
        DESKEW_M : IN std_logic_vector(2 downto 0);
        DESKEW_MTH : IN std_logic_vector(12 downto 0);
        DESKEW_MSET : IN std_logic_vector(6 downto 0);
        DESKEW_OCLKEDG_EN : IN std_logic;
        DESKEW_OWVAL : IN std_logic_vector(6 downto 0);
        DESKEW_REQ : IN std_logic;
        DO_LPTX0_N, DO_LPTX0_P, DO_LPTX1_N, DO_LPTX1_P, DO_LPTX2_N, DO_LPTX2_P, DO_LPTX3_N, DO_LPTX3_P : IN std_logic;
        DO_LPTXCK_N, DO_LPTXCK_P : IN std_logic;
        DRST_N : IN std_logic;
        EQCS_LANE0,EQCS_LANE1,EQCS_LANE2,EQCS_LANE3,EQCS_CK : IN std_logic_vector(2 downto 0);
        EQRS_LANE0,EQRS_LANE1,EQRS_LANE2,EQRS_LANE3,EQRS_CK : IN std_logic_vector(2 downto 0);
        HS_8BIT_MODE : IN std_logic;
        HSRX_DLYDIR_LANE0, HSRX_DLYDIR_LANE1,HSRX_DLYDIR_LANE2,HSRX_DLYDIR_LANE3,HSRX_DLYDIR_CK : IN std_logic;
        HSRX_DLYLDN_LANE0, HSRX_DLYLDN_LANE1,HSRX_DLYLDN_LANE2,HSRX_DLYLDN_LANE3,HSRX_DLYLDN_CK : IN std_logic;
        HSRX_DLYMV_LANE0, HSRX_DLYMV_LANE1,HSRX_DLYMV_LANE2,HSRX_DLYMV_LANE3,HSRX_DLYMV_CK : IN std_logic;
        HSRX_EN_CK : IN std_logic;
        HSRX_ODTEN_CK, HSRX_ODTEN_D0,  HSRX_ODTEN_D1, HSRX_ODTEN_D2, HSRX_ODTEN_D3 : IN std_logic;
        LALIGN_EN : IN std_logic;
        LPRX_EN_CK, LPRX_EN_D0, LPRX_EN_D1, LPRX_EN_D2, LPRX_EN_D3 : IN std_logic;
        LPTX_EN_CK, LPTX_EN_D0, LPTX_EN_D1, LPTX_EN_D2, LPTX_EN_D3 : IN std_logic;
        ONE_BYTE0_MATCH : IN std_logic; 
        RX_CLK_1X : IN std_logic;
        RX_INVERT : IN std_logic;
        WALIGN_BY : IN std_logic;
        WALIGN_DVLD : IN std_logic;
        WORD_LENDIAN : IN std_logic        
    );
    
end MIPI_DPHY_RX;

architecture Behavioral of MIPI_DPHY_RX is
begin

end Behavioral;

------------------------------MIPI_DPHY---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;

entity MIPI_DPHY is
    GENERIC(
        TX_PLLCLK : string := "NONE";
        RX_ALIGN_BYTE : bit_vector := "10111000";
        RX_HS_8BIT_MODE : bit := '0';
        RX_LANE_ALIGN_EN : bit := '0';
        TX_HS_8BIT_MODE : bit := '0';
        HSREG_EN_LN0 : bit := '0';
        HSREG_EN_LN1 : bit := '0';
        HSREG_EN_LN2 : bit := '0';
        HSREG_EN_LN3 : bit := '0';
        HSREG_EN_LNCK : bit := '0';
        LANE_DIV_SEL : bit_vector := "00";
        HSRX_EN : bit := '1';
        HSRX_LANESEL : bit_vector := "1111";
        HSRX_LANESEL_CK : bit := '1';
        HSTX_EN_LN0 : bit := '0';
        HSTX_EN_LN1 : bit := '0';
        HSTX_EN_LN2 : bit := '0';
        HSTX_EN_LN3 : bit := '0';
        HSTX_EN_LNCK : bit := '0';
        LPTX_EN_LN0 : bit := '1';
        LPTX_EN_LN1 : bit := '1';
        LPTX_EN_LN2 : bit := '1';
        LPTX_EN_LN3 : bit := '1';
        LPTX_EN_LNCK : bit := '1';
        TXDP_EN_LN0 : bit := '0';
        TXDP_EN_LN1 : bit := '0';
        TXDP_EN_LN2 : bit := '0';
        TXDP_EN_LN3 : bit := '0';
        TXDP_EN_LNCK : bit := '0';


        CKLN_DELAY_EN : bit := '0';
        CKLN_DELAY_OVR_VAL : bit_vector := "0000000";
        D0LN_DELAY_EN : bit := '0';
        D0LN_DELAY_OVR_VAL : bit_vector := "0000000";
        D0LN_DESKEW_BYPASS : bit := '0';
        D1LN_DELAY_EN : bit := '0';
        D1LN_DELAY_OVR_VAL : bit_vector := "0000000";
        D1LN_DESKEW_BYPASS : bit := '0';
        D2LN_DELAY_EN : bit := '0';
        D2LN_DELAY_OVR_VAL : bit_vector := "0000000";
        D2LN_DESKEW_BYPASS : bit := '0';
        D3LN_DELAY_EN : bit := '0';
        D3LN_DELAY_OVR_VAL : bit_vector := "0000000";
        D3LN_DESKEW_BYPASS : bit := '0';
        DESKEW_EN_LOW_DELAY : bit := '0';
        DESKEW_EN_ONE_EDGE : bit := '0';
        DESKEW_FAST_LOOP_TIME : bit_vector := "0000";
        DESKEW_FAST_MODE : bit := '0';
        DESKEW_HALF_OPENING : bit_vector := "010110";
        DESKEW_LSB_MODE : bit_vector := "00";
        DESKEW_M : bit_vector := "011";
        DESKEW_M_TH : bit_vector := "0000110100110";
        DESKEW_MAX_SETTING : bit_vector := "0100001";
        DESKEW_ONE_CLK_EDGE_EN : bit := '0';
        DESKEW_RST_BYPASS : bit := '0';
        RX_BYTE_LITTLE_ENDIAN : bit := '1';
        RX_CLK_1X_SYNC_SEL : bit := '0';
        RX_INVERT : bit := '0';
        RX_ONE_BYTE0_MATCH : bit := '0';
        RX_RD_START_DEPTH : bit_vector := "00001";
        RX_SYNC_MODE : bit := '0';
        RX_WORD_ALIGN_BYPASS : bit := '0';
        RX_WORD_ALIGN_DATA_VLD_SRC_SEL : bit := '0';
        RX_WORD_LITTLE_ENDIAN : bit := '1';
        TX_BYPASS_MODE : bit := '0';
        TX_BYTECLK_SYNC_MODE : bit := '0';
        TX_OCLK_USE_CIBCLK : bit := '0';
        TX_RD_START_DEPTH : bit_vector := "00000";
        TX_SYNC_MODE : bit := '0';
        TX_WORD_LITTLE_ENDIAN : bit := '1';
        EQ_CS_LANE0 : bit_vector := "100";
        EQ_CS_LANE1 : bit_vector := "100";
        EQ_CS_LANE2 : bit_vector := "100";
        EQ_CS_LANE3 : bit_vector := "100";
        EQ_CS_LANECK : bit_vector := "100";
        EQ_RS_LANE0 : bit_vector := "100";
        EQ_RS_LANE1 : bit_vector := "100";
        EQ_RS_LANE2 : bit_vector := "100";
        EQ_RS_LANE3 : bit_vector := "100";
        EQ_RS_LANECK : bit_vector := "100";
        HSCLK_LANE_LN0 : bit := '0';
        HSCLK_LANE_LN1 : bit := '0';
        HSCLK_LANE_LN2 : bit := '0';
        HSCLK_LANE_LN3 : bit := '0';
        HSCLK_LANE_LNCK : bit := '1';
        ALP_ED_EN_LANE0 : bit := '1';
        ALP_ED_EN_LANE1 : bit := '1';
        ALP_ED_EN_LANE2 : bit := '1';
        ALP_ED_EN_LANE3 : bit := '1';
        ALP_ED_EN_LANECK : bit := '1';
        ALP_ED_TST_LANE0 : bit := '0';
        ALP_ED_TST_LANE1 : bit := '0';
        ALP_ED_TST_LANE2 : bit := '0';
        ALP_ED_TST_LANE3 : bit := '0';
        ALP_ED_TST_LANECK : bit := '0';
        ALP_EN_LN0 : bit := '0';
        ALP_EN_LN1 : bit := '0';
        ALP_EN_LN2 : bit := '0';
        ALP_EN_LN3 : bit := '0';
        ALP_EN_LNCK : bit := '0';
        ALP_HYS_EN_LANE0 : bit := '1';
        ALP_HYS_EN_LANE1 : bit := '1';
        ALP_HYS_EN_LANE2 : bit := '1';
        ALP_HYS_EN_LANE3 : bit := '1';
        ALP_HYS_EN_LANECK : bit := '1';
        ALP_TH_LANE0 : bit_vector := "1000";
        ALP_TH_LANE1 : bit_vector := "1000";
        ALP_TH_LANE2 : bit_vector := "1000";
        ALP_TH_LANE3 : bit_vector := "1000";
        ALP_TH_LANECK : bit_vector := "1000";
        ANA_BYTECLK_PH : bit_vector := "00";
        BIT_REVERSE_LN0 : bit := '0';
        BIT_REVERSE_LN1 : bit := '0';
        BIT_REVERSE_LN2 : bit := '0';
        BIT_REVERSE_LN3 : bit := '0';
        BIT_REVERSE_LNCK : bit := '0';
        BYPASS_TXHCLKEN : bit := '1';
        BYPASS_TXHCLKEN_SYNC : bit := '0';
        BYTE_CLK_POLAR : bit := '0';
        BYTE_REVERSE_LN0 : bit := '0';
        BYTE_REVERSE_LN1 : bit := '0';
        BYTE_REVERSE_LN2 : bit := '0';
        BYTE_REVERSE_LN3 : bit := '0';
        BYTE_REVERSE_LNCK : bit := '0';
        EN_CLKB1X : bit := '1';
        EQ_PBIAS_LANE0 : bit_vector := "1000";
        EQ_PBIAS_LANE1 : bit_vector := "1000";
        EQ_PBIAS_LANE2 : bit_vector := "1000";
        EQ_PBIAS_LANE3 : bit_vector := "1000";
        EQ_PBIAS_LANECK : bit_vector := "1000";
        EQ_ZLD_LANE0 : bit_vector := "1000";
        EQ_ZLD_LANE1 : bit_vector := "1000";
        EQ_ZLD_LANE2 : bit_vector := "1000";
        EQ_ZLD_LANE3 : bit_vector := "1000";
        EQ_ZLD_LANECK : bit_vector := "1000";
        HIGH_BW_LANE0 : bit := '1';
        HIGH_BW_LANE1 : bit := '1';
        HIGH_BW_LANE2 : bit := '1';
        HIGH_BW_LANE3 : bit := '1';
        HIGH_BW_LANECK : bit := '1';
        HSREG_VREF_CTL : bit_vector := "100";
        HSREG_VREF_EN : bit := '1';
        HSRX_DLY_CTL_CK : bit_vector := "0000000";
        HSRX_DLY_CTL_LANE0 : bit_vector := "0000000";
        HSRX_DLY_CTL_LANE1 : bit_vector := "0000000";
        HSRX_DLY_CTL_LANE2 : bit_vector := "0000000";
        HSRX_DLY_CTL_LANE3 : bit_vector := "0000000";
        HSRX_DLY_SEL_LANE0 : bit := '0';
        HSRX_DLY_SEL_LANE1 : bit := '0';
        HSRX_DLY_SEL_LANE2 : bit := '0';
        HSRX_DLY_SEL_LANE3 : bit := '0';
        HSRX_DLY_SEL_LANECK : bit := '0';
        HSRX_DUTY_LANE0 : bit_vector := "1000";
        HSRX_DUTY_LANE1 : bit_vector := "1000";
        HSRX_DUTY_LANE2 : bit_vector := "1000";
        HSRX_DUTY_LANE3 : bit_vector := "1000";
        HSRX_DUTY_LANECK : bit_vector := "1000";
        HSRX_EQ_EN_LANE0 : bit := '1';
        HSRX_EQ_EN_LANE1 : bit := '1';
        HSRX_EQ_EN_LANE2 : bit := '1';
        HSRX_EQ_EN_LANE3 : bit := '1';
        HSRX_EQ_EN_LANECK : bit := '1';
        HSRX_IBIAS : bit_vector := "0011";
        HSRX_IBIAS_TEST_EN : bit := '0';
        HSRX_IMARG_EN : bit := '0';
        HSRX_ODT_EN : bit := '1';
        HSRX_ODT_TST : bit_vector := "0000";
        HSRX_ODT_TST_CK : bit := '0';
        HSRX_SEL : bit_vector := "0000";
        HSRX_STOP_EN : bit := '0';
        HSRX_TST : bit_vector := "0000";
        HSRX_TST_CK : bit := '0';
        HSRX_WAIT4EDGE : bit := '1';
        HYST_NCTL : bit_vector := "01";
        HYST_PCTL : bit_vector := "01";
        IBIAS_TEST_EN : bit := '0';
        LB_CH_SEL : bit := '0';
        LB_EN_LN0 : bit := '0';
        LB_EN_LN1 : bit := '0';
        LB_EN_LN2 : bit := '0';
        LB_EN_LN3 : bit := '0';
        LB_EN_LNCK : bit := '0';
        LB_POLAR_LN0 : bit := '0';
        LB_POLAR_LN1 : bit := '0';
        LB_POLAR_LN2 : bit := '0';
        LB_POLAR_LN3 : bit := '0';
        LB_POLAR_LNCK : bit := '0';
        LOW_LPRX_VTH : bit := '0';
        LPBK_DATA2TO1 : bit_vector := "0000";
        LPBK_DATA2TO1_CK : bit := '0';
        LPBK_EN : bit := '0';
        LPBK_SEL : bit_vector := "0000";
        LPBKTST_EN : bit_vector := "0000";
        LPBKTST_EN_CK : bit := '0';
        LPRX_EN : bit := '1';
        LPRX_TST : bit_vector := "0000";
        LPRX_TST_CK : bit := '0';
        LPTX_DAT_POLAR_LN0 : bit := '0';
        LPTX_DAT_POLAR_LN1 : bit := '0';
        LPTX_DAT_POLAR_LN2 : bit := '0';
        LPTX_DAT_POLAR_LN3 : bit := '0';
        LPTX_DAT_POLAR_LNCK : bit := '0';
        LPTX_NIMP_LN0 : bit_vector := "100";
        LPTX_NIMP_LN1 : bit_vector := "100";
        LPTX_NIMP_LN2 : bit_vector := "100";
        LPTX_NIMP_LN3 : bit_vector := "100";
        LPTX_NIMP_LNCK : bit_vector := "100";
        LPTX_PIMP_LN0 : bit_vector := "100";
        LPTX_PIMP_LN1 : bit_vector := "100";
        LPTX_PIMP_LN2 : bit_vector := "100";
        LPTX_PIMP_LN3 : bit_vector := "100";
        LPTX_PIMP_LNCK : bit_vector := "100";
        MIPI_PMA_DIS_N : bit := '1';
        PGA_BIAS_LANE0 : bit_vector := "1000";
        PGA_BIAS_LANE1 : bit_vector := "1000";
        PGA_BIAS_LANE2 : bit_vector := "1000";
        PGA_BIAS_LANE3 : bit_vector := "1000";
        PGA_BIAS_LANECK : bit_vector := "1000";
        PGA_GAIN_LANE0 : bit_vector := "1000";
        PGA_GAIN_LANE1 : bit_vector := "1000";
        PGA_GAIN_LANE2 : bit_vector := "1000";
        PGA_GAIN_LANE3 : bit_vector := "1000";
        PGA_GAIN_LANECK : bit_vector := "1000";
        RX_ODT_TRIM_LANE0 : bit_vector := "1000";
        RX_ODT_TRIM_LANE1 : bit_vector := "1000";
        RX_ODT_TRIM_LANE2 : bit_vector := "1000";
        RX_ODT_TRIM_LANE3 : bit_vector := "1000";
        RX_ODT_TRIM_LANECK : bit_vector := "1000";
        SLEWN_CTL_LN0 : bit_vector := "1111";
        SLEWN_CTL_LN1 : bit_vector := "1111";
        SLEWN_CTL_LN2 : bit_vector := "1111";
        SLEWN_CTL_LN3 : bit_vector := "1111";
        SLEWN_CTL_LNCK : bit_vector := "1111";
        SLEWP_CTL_LN0 : bit_vector := "1111";
        SLEWP_CTL_LN1 : bit_vector := "1111";
        SLEWP_CTL_LN2 : bit_vector := "1111";
        SLEWP_CTL_LN3 : bit_vector := "1111";
        SLEWP_CTL_LNCK : bit_vector := "1111";
        STP_UNIT : bit_vector := "01";
        TERMN_CTL_LN0 : bit_vector := "1000";
        TERMN_CTL_LN1 : bit_vector := "1000";
        TERMN_CTL_LN2 : bit_vector := "1000";
        TERMN_CTL_LN3 : bit_vector := "1000";
        TERMN_CTL_LNCK : bit_vector := "1000";
        TERMP_CTL_LN0 : bit_vector := "1000";
        TERMP_CTL_LN1 : bit_vector := "1000";
        TERMP_CTL_LN2 : bit_vector := "1000";
        TERMP_CTL_LN3 : bit_vector := "1000";
        TERMP_CTL_LNCK : bit_vector := "1000";
        TEST_EN_LN0  : bit := '0';
        TEST_EN_LN1  : bit := '0';
        TEST_EN_LN2  : bit := '0';
        TEST_EN_LN3  : bit := '0';
        TEST_EN_LNCK  : bit := '0';
        TEST_N_IMP_LN0  : bit := '0';
        TEST_N_IMP_LN1  : bit := '0';
        TEST_N_IMP_LN2  : bit := '0';
        TEST_N_IMP_LN3  : bit := '0';
        TEST_N_IMP_LNCK  : bit := '0';
        TEST_P_IMP_LN0  : bit := '0';
        TEST_P_IMP_LN1  : bit := '0';
        TEST_P_IMP_LN2  : bit := '0';
        TEST_P_IMP_LN3  : bit := '0';
        TEST_P_IMP_LNCK  : bit := '0'
    );
    PORT(
        D0LN_HSRXD, D1LN_HSRXD, D2LN_HSRXD, D3LN_HSRXD : OUT std_logic_vector(15 downto 0);
        D0LN_HSRXD_VLD,D1LN_HSRXD_VLD,D2LN_HSRXD_VLD,D3LN_HSRXD_VLD : OUT std_logic;
        D0LN_HSRX_DREN,  D1LN_HSRX_DREN, D2LN_HSRX_DREN, D3LN_HSRX_DREN : IN std_logic;
        DI_LPRX0_N, DI_LPRX0_P, DI_LPRX1_N, DI_LPRX1_P, DI_LPRX2_N, DI_LPRX2_P, DI_LPRX3_N, DI_LPRX3_P : OUT std_logic;
        DI_LPRXCK_N, DI_LPRXCK_P : OUT std_logic;
        CK_N, CK_P, D0_N, D0_P, D1_N, D1_P, D2_N, D2_P, D3_N, D3_P : INOUT std_logic;
        HSRX_STOP, HSTXEN_LN0, HSTXEN_LN1, HSTXEN_LN2, HSTXEN_LN3, HSTXEN_LNCK, LPTXEN_LN0, LPTXEN_LN1, LPTXEN_LN2, LPTXEN_LN3, LPTXEN_LNCK : IN std_logic;

        RX_CLK_O,TX_CLK_O : OUT std_logic;
        PWRON_RX, PWRON_TX, RESET, RX_CLK_1X, TX_CLK_1X : IN std_logic;
        TXDPEN_LN0, TXDPEN_LN1, TXDPEN_LN2, TXDPEN_LN3, TXDPEN_LNCK, TXHCLK_EN : IN std_logic;
        CKLN_HSTXD,D0LN_HSTXD,D1LN_HSTXD,D2LN_HSTXD,D3LN_HSTXD : IN std_logic_vector(15 downto 0);
        HSTXD_VLD : IN std_logic;
        CK0, CK90, CK180, CK270 : IN std_logic;
        DO_LPTX0_N, DO_LPTX1_N, DO_LPTX2_N, DO_LPTX3_N, DO_LPTXCK_N, DO_LPTX0_P, DO_LPTX1_P, DO_LPTX2_P, DO_LPTX3_P, DO_LPTXCK_P : IN std_logic;
        HSRX_EN_CK, HSRX_EN_D0, HSRX_EN_D1, HSRX_EN_D2, HSRX_EN_D3, HSRX_ODTEN_CK, HSRX_ODTEN_D0, HSRX_ODTEN_D1, HSRX_ODTEN_D2, HSRX_ODTEN_D3, LPRX_EN_CK, LPRX_EN_D0, LPRX_EN_D1, LPRX_EN_D2, LPRX_EN_D3 : IN std_logic;
        RX_DRST_N, TX_DRST_N, WALIGN_DVLD : IN std_logic;
                
        MRDATA : OUT std_logic_vector(7 downto 0);
        MA_INC, MCLK : IN std_logic;
        MOPCODE : IN std_logic_vector(1 downto 0);
        MWDATA : IN std_logic_vector(7 downto 0);

        
        ALPEDO_LANE0, ALPEDO_LANE1, ALPEDO_LANE2, ALPEDO_LANE3, ALPEDO_LANECK : OUT std_logic;
        D1LN_DESKEW_DONE,D2LN_DESKEW_DONE,D3LN_DESKEW_DONE,D0LN_DESKEW_DONE : OUT std_logic;
        D1LN_DESKEW_ERROR, D2LN_DESKEW_ERROR, D3LN_DESKEW_ERROR, D0LN_DESKEW_ERROR : OUT std_logic;
        D0LN_DESKEW_REQ, D1LN_DESKEW_REQ, D2LN_DESKEW_REQ, D3LN_DESKEW_REQ  : IN std_logic;
        HSRX_DLYDIR_LANE0, HSRX_DLYDIR_LANE1, HSRX_DLYDIR_LANE2, HSRX_DLYDIR_LANE3, HSRX_DLYDIR_LANECK : IN std_logic;
        HSRX_DLYLDN_LANE0, HSRX_DLYLDN_LANE1, HSRX_DLYLDN_LANE2, HSRX_DLYLDN_LANE3, HSRX_DLYLDN_LANECK : IN std_logic;
        HSRX_DLYMV_LANE0, HSRX_DLYMV_LANE1,  HSRX_DLYMV_LANE2, HSRX_DLYMV_LANE3, HSRX_DLYMV_LANECK : IN std_logic;
        ALP_EDEN_LANE0, ALP_EDEN_LANE1, ALP_EDEN_LANE2, ALP_EDEN_LANE3, ALP_EDEN_LANECK, ALPEN_LN0, ALPEN_LN1, ALPEN_LN2, ALPEN_LN3, ALPEN_LNCK : IN std_logic

    );
    
end MIPI_DPHY;

architecture Behavioral of MIPI_DPHY is
begin

end Behavioral;


------------------------------GTR12_PMAC---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all; 

entity GTR12_PMAC is
        port(            
            PL_EXIT                             : out std_logic_vector(3 downto 0);
            TL_FLR_REQ0                         : out std_logic_vector(64 downto 0);
            TL_FLR_ACK0                         : in std_logic_vector(64 downto 0);
            TL_FLR_REQ1                         : out std_logic_vector(64 downto 0);
            TL_FLR_ACK1                         : in std_logic_vector(64 downto 0);
            TL_FLR_REQ2                         : out std_logic_vector(64 downto 0);
            TL_FLR_ACK2                         : in std_logic_vector(64 downto 0);
            TL_FLR_REQ3                         : out std_logic_vector(64 downto 0);
            TL_FLR_ACK3                         : in std_logic_vector(64 downto 0);
            TL_CLOCK_FREQ                       : in std_logic_vector(21 downto 0);
            PL_WAKE_OEN                         : out std_logic;
            PL_WAKE_IN                          : in std_logic;
            PL_CLKREQ_OEN                       : out std_logic;
            PL_CLKREQ_IN                        : in std_logic;
            PL_LTSSM_ENABLE                     : in std_logic;
            TL_RX_SOP0                          : out std_logic;
            TL_RX_EOP0                          : out std_logic;
            TL_RX_DATA0                         : out std_logic_vector(255 downto 0);
            TL_RX_VALID0                        : out std_logic_vector(7 downto 0);
            TL_RX_PROT0                         : out std_logic_vector(31 downto 0);
            TL_RX_BARDEC0                       : out std_logic_vector(19 downto 0);
            TL_RX_MCHIT0                        : out std_logic_vector(15 downto 0);
            TL_RX_ERR0                          : out std_logic_vector(7 downto 0);
            TL_RX_MASKNP0                       : in std_logic;
            TL_RX_WAIT0                         : in std_logic;
            TL_TX_SOP0                          : in std_logic;
            TL_TX_EOP0                          : in std_logic;
            TL_TX_DATA0                         : in std_logic_vector(255 downto 0);
            TL_TX_VALID0                        : in std_logic_vector(7 downto 0);
            TL_TX_PROT0                         : in std_logic_vector(31 downto 0);
            TL_TX_STREAM0                       : in std_logic;
            TL_TX_ERR0                          : in std_logic_vector(7 downto 0);
            TL_TX_WAIT0                         : out std_logic;
            TL_TX_CREDITS0                      : out std_logic_vector(95 downto 0);
            TL_TX_PROTERR0                      : out std_logic_vector(31 downto 0);
            TL_TX_PROTACK0                      : in std_logic;
            TL_BRSW_IN                          : in std_logic_vector(7 downto 0);
            TL_BRSW_OUT                         : out std_logic_vector(7 downto 0);
            TL_INT_STATUS0                      : in std_logic;
            TL_INT_REQ0                         : in std_logic;
            TL_INT_MSINUM0                      : in std_logic_vector(4 downto 0);
            TL_INT_VFNUM0                       : in std_logic_vector(6 downto 0);
            TL_INT_ACK0                         : out std_logic;
            TL_INT_STATUS1                      : in std_logic;
            TL_INT_REQ1                         : in std_logic;
            TL_INT_MSINUM1                      : in std_logic_vector(4 downto 0);
            TL_INT_VFNUM1                       : in std_logic_vector(6 downto 0);
            TL_INT_ACK1                         : out std_logic;
            TL_INT_STATUS2                      : in std_logic;
            TL_INT_REQ2                         : in std_logic;
            TL_INT_MSINUM2                      : in std_logic_vector(4 downto 0);
            TL_INT_VFNUM2                       : in std_logic_vector(6 downto 0);
            TL_INT_ACK2                         : out std_logic;
            TL_INT_STATUS3                      : in std_logic;
            TL_INT_REQ3                         : in std_logic;
            TL_INT_MSINUM3                      : in std_logic_vector(4 downto 0);
            TL_INT_VFNUM3                       : in std_logic_vector(6 downto 0);
            TL_INT_ACK3                         : out std_logic;
            TL_INT_PINSTATE                     : out std_logic_vector(3 downto 0);
            TL_INT_PINCONTROL                   : in std_logic_vector(3 downto 0);
            TL_PM_EVENT0                        : in std_logic;
            TL_PM_DATA0                         : in std_logic_vector(9 downto 0);
            TL_PM_EVENT1                        : in std_logic;
            TL_PM_DATA1                         : in std_logic_vector(9 downto 0);
            TL_PM_EVENT2                        : in std_logic;
            TL_PM_DATA2                         : in std_logic_vector(9 downto 0);
            TL_PM_EVENT3                        : in std_logic;
            TL_PM_DATA3                         : in std_logic_vector(9 downto 0);
            TL_PM_CLKCONTROL                    : in std_logic;
            TL_PM_CLKSTATUS                     : out std_logic_vector(3 downto 0);
            TL_PM_BWCHANGE                      : in std_logic_vector(7 downto 0);
            TL_PM_TOCONTROL                     : in std_logic;
            TL_PM_TOSTATUS                      : out std_logic;
            TL_PM_AUXPWR                        : in std_logic;
            TL_PM_OBFFCONTROL                   : in std_logic_vector(3 downto 0);
            TL_PM_OBFFSTATUS                    : out std_logic_vector(3 downto 0);
            TL_REPORT_ERROR0                    : in std_logic_vector(38 downto 0);
            TL_REPORT_STATE0                    : in std_logic_vector(7 downto 0);
            TL_REPORT_CPLPENDING0               : in std_logic_vector(64 downto 0);
            TL_REPORT_HEADER0                   : in std_logic_vector(255 downto 0);
            TL_REPORT_ERROR1                    : in std_logic_vector(38 downto 0);
            TL_REPORT_STATE1                    : in std_logic_vector(7 downto 0);
            TL_REPORT_CPLPENDING1               : in std_logic_vector(64 downto 0);
            TL_REPORT_HEADER1                   : in std_logic_vector(255 downto 0);
            TL_REPORT_ERROR2                    : in std_logic_vector(38 downto 0);
            TL_REPORT_STATE2                    : in std_logic_vector(7 downto 0);
            TL_REPORT_CPLPENDING2               : in std_logic_vector(64 downto 0);
            TL_REPORT_HEADER2                   : in std_logic_vector(255 downto 0);
            TL_REPORT_ERROR3                    : in std_logic_vector(38 downto 0);
            TL_REPORT_STATE3                    : in std_logic_vector(7 downto 0);
            TL_REPORT_CPLPENDING3               : in std_logic_vector(64 downto 0);
            TL_REPORT_HEADER3                   : in std_logic_vector(255 downto 0);
            TL_REPORT_EVENT                     : out std_logic_vector(7 downto 0);
            TL_REPORT_HOTPLUG                   : in std_logic_vector(7 downto 0);
            TL_REPORT_TIMER                     : out std_logic_vector(3 downto 0);
            TL_REPORT_LATENCY                   : in std_logic_vector(32 downto 0);
            FABRIC_PL_NPOR                      : in std_logic;
            FABRIC_PL_RSTN                      : in std_logic;
            FABRIC_PL_RSTNP                     : in std_logic;
            FABRIC_PL_SRST                      : in std_logic;
            FABRIC_TL_NPOR                      : in std_logic;
            FABRIC_TL_RSTN                      : in std_logic;
            FABRIC_TL_RSTNP                     : in std_logic;
            FABRIC_TL_CRSTN                     : in std_logic;
            FABRIC_TL_SRST                      : in std_logic;
            FABRIC_TL_CRST                      : in std_logic;
            FABRIC_PL_PCLK_STOP                 : in std_logic;
            FABRIC_CTRL_GATE_TL_CLK             : in std_logic;
            PCIE_HALF_CLK                       : out std_logic;
            FABRIC_PHY_ACKLOCAL                 : in std_logic_vector(7 downto 0);
            FABRIC_PHY_ACKLOCAL_H               : in std_logic_vector(7 downto 0);
            FABRIC_PHY_INVALIDREQ               : out std_logic_vector(7 downto 0);
            FABRIC_PHY_INVALIDREQ_H             : out std_logic_vector(7 downto 0);
            FABRIC_PHY_REQLOCAL                 : out std_logic_vector(7 downto 0);
            FABRIC_PHY_REQLOCAL_H               : out std_logic_vector(7 downto 0);
            FABRIC_PHY_REQLOCALIDX              : out std_logic_vector(31 downto 0);
            FABRIC_PHY_REQLOCALIDX_H            : out std_logic_vector(31 downto 0);
            FABRIC_PHY_RXEQEVAL                 : out std_logic_vector(7 downto 0);
            FABRIC_PHY_RXEQEVAL_H               : out std_logic_vector(7 downto 0);
            FABRIC_PHY_RXEQINPROGRESS           : out std_logic_vector(7 downto 0);
            FABRIC_PHY_RXEQINPROGRESS_H         : out std_logic_vector(7 downto 0);
            FABRIC_PHY_RXPREHINT                : out std_logic_vector(23 downto 0);
            FABRIC_PHY_RXPREHINT_H              : out std_logic_vector(23 downto 0);
            FABRIC_PHY_TXDEEMPH                 : out std_logic_vector(15 downto 0);
            FABRIC_PHY_TXDEEMPH_H               : out std_logic_vector(15 downto 0);
            FABRIC_PL_BLOCKALIGNCONTROL         : out std_logic;
            FABRIC_PL_BLOCKALIGNCONTROL_H       : out std_logic;
            FABRIC_PL_PHYSTATUS                 : in std_logic_vector(7 downto 0);
            FABRIC_PL_PHYSTATUS_H               : in std_logic_vector(7 downto 0);
            FABRIC_PL_POWERDOWN                 : out std_logic_vector(1 downto 0);
            FABRIC_PL_POWERDOWN_H               : out std_logic_vector(1 downto 0);
            FABRIC_PL_RATE                      : out std_logic_vector(1 downto 0);
            FABRIC_PL_RATE_H                    : out std_logic_vector(1 downto 0);
            FABRIC_PL_RXDATA                    : in std_logic_vector(127 downto 0);
            FABRIC_PL_RXDATA_H                  : in std_logic_vector(127 downto 0);
            FABRIC_PL_RXDATAK                   : in std_logic_vector(15 downto 0);
            FABRIC_PL_RXDATAK_H                 : in std_logic_vector(15 downto 0);
            FABRIC_PL_RXDATAVALID               : in std_logic_vector(7 downto 0);
            FABRIC_PL_RXDATAVALID_H             : in std_logic_vector(7 downto 0);
            FABRIC_PL_RXELECIDLE                : in std_logic_vector(7 downto 0);
            FABRIC_PL_RXELECIDLE_H              : in std_logic_vector(7 downto 0);
            FABRIC_PL_RXPOLARITY                : out std_logic_vector(7 downto 0);
            FABRIC_PL_RXPOLARITY_H              : out std_logic_vector(7 downto 0);
            FABRIC_PL_RXSTANDBY                 : out std_logic_vector(7 downto 0);
            FABRIC_PL_RXSTANDBY_H               : out std_logic_vector(7 downto 0);
            FABRIC_PL_RXSTARTBLOCK              : in std_logic_vector(7 downto 0);
            FABRIC_PL_RXSTARTBLOCK_H            : in std_logic_vector(7 downto 0);
            FABRIC_PL_RXSTATUS                  : in std_logic_vector(23 downto 0);
            FABRIC_PL_RXSTATUS_H                : in std_logic_vector(23 downto 0);
            FABRIC_PL_RXSYNCHEADER              : in std_logic_vector(15 downto 0);
            FABRIC_PL_RXSYNCHEADER_H            : in std_logic_vector(15 downto 0);
            FABRIC_PL_RXVALID                   : in std_logic_vector(7 downto 0);
            FABRIC_PL_RXVALID_H                 : in std_logic_vector(7 downto 0);
            FABRIC_PL_TXCOMPLIANCE              : out std_logic_vector(7 downto 0);
            FABRIC_PL_TXCOMPLIANCE_H            : out std_logic_vector(7 downto 0);
            FABRIC_PL_TXDATA                    : out std_logic_vector(127 downto 0);
            FABRIC_PL_TXDATA_H                  : out std_logic_vector(127 downto 0);
            FABRIC_PL_TXDATAK                   : out std_logic_vector(15 downto 0);
            FABRIC_PL_TXDATAK_H                 : out std_logic_vector(15 downto 0);
            FABRIC_PL_TXDATAVALID               : out std_logic_vector(7 downto 0);
            FABRIC_PL_TXDATAVALID_H             : out std_logic_vector(7 downto 0);
            FABRIC_PL_TXDETECTRX                : out std_logic_vector(7 downto 0);
            FABRIC_PL_TXDETECTRX_H              : out std_logic_vector(7 downto 0);
            FABRIC_PL_TXELECIDLE                : out std_logic_vector(7 downto 0);
            FABRIC_PL_TXELECIDLE_H              : out std_logic_vector(7 downto 0);
            FABRIC_PL_TXMARGIN                  : out std_logic_vector(2 downto 0);
            FABRIC_PL_TXMARGIN_H                : out std_logic_vector(2 downto 0);
            FABRIC_PL_TXSTARTBLOCK              : out std_logic_vector(7 downto 0);
            FABRIC_PL_TXSTARTBLOCK_H            : out std_logic_vector(7 downto 0);
            FABRIC_PL_TXSWING                   : out std_logic;
            FABRIC_PL_TXSWING_H                 : out std_logic;
            FABRIC_PL_TXSYNCHEADER              : out std_logic_vector(15 downto 0);
            FABRIC_PL_TXSYNCHEADER_H            : out std_logic_vector(15 downto 0);
            FABRIC_PL_WIDTH                     : out std_logic_vector(1 downto 0);
            FABRIC_PL_WIDTH_H                   : out std_logic_vector(1 downto 0);
            FABRIC_TEST_BUS_MON                 : out std_logic_vector(31 downto 0);
            TL_CFGEXPADDR0                      : out std_logic_vector(18 downto 0);
            TL_CFGEXPADDR1                      : out std_logic_vector(18 downto 0);
            TL_CFGEXPADDR2                      : out std_logic_vector(18 downto 0);
            TL_CFGEXPADDR3                      : out std_logic_vector(18 downto 0);
            TL_CFGEXPRDATA0                     : in std_logic_vector(31 downto 0);
            TL_CFGEXPRDATA1                     : in std_logic_vector(31 downto 0);
            TL_CFGEXPRDATA2                     : in std_logic_vector(31 downto 0);
            TL_CFGEXPRDATA3                     : in std_logic_vector(31 downto 0);
            TL_CFGEXPREAD0                      : out std_logic;
            TL_CFGEXPREAD1                      : out std_logic;
            TL_CFGEXPREAD2                      : out std_logic;
            TL_CFGEXPREAD3                      : out std_logic;
            TL_CFGEXPSTRB0                      : out std_logic_vector(3 downto 0);
            TL_CFGEXPSTRB1                      : out std_logic_vector(3 downto 0);
            TL_CFGEXPSTRB2                      : out std_logic_vector(3 downto 0);
            TL_CFGEXPSTRB3                      : out std_logic_vector(3 downto 0);
            TL_CFGEXPVALID0                     : in std_logic;
            TL_CFGEXPVALID1                     : in std_logic;
            TL_CFGEXPVALID2                     : in std_logic;
            TL_CFGEXPVALID3                     : in std_logic;
            TL_CFGEXPWDATA0                     : out std_logic_vector(31 downto 0);
            TL_CFGEXPWDATA1                     : out std_logic_vector(31 downto 0);
            TL_CFGEXPWDATA2                     : out std_logic_vector(31 downto 0);
            TL_CFGEXPWDATA3                     : out std_logic_vector(31 downto 0);
            TL_CFGEXPWRITE0                     : out std_logic;
            TL_CFGEXPWRITE1                     : out std_logic;
            TL_CFGEXPWRITE2                     : out std_logic;
            TL_CFGEXPWRITE3                     : out std_logic;
            TLCFG_BUSDEV                        : out std_logic_vector(12 downto 0);
            --ports that are special
            TL_CLKP                             : in std_logic;
            PCIE_CLK                            : out std_logic;
            PMAC_LN_RSTN                        : out std_logic;
            Q0_CPLL0_OK_I                       : in std_logic;
            Q0_CPLL1_OK_I                       : in std_logic;
            Q0_CPLL2_OK_I                       : in std_logic;
            Q0_CPLL3_OK_I                       : in std_logic;
            Q1_CPLL0_OK_I                       : in std_logic;
            Q1_CPLL1_OK_I                       : in std_logic;
            Q1_CPLL2_OK_I                       : in std_logic;
            Q1_CPLL3_OK_I                       : in std_logic;
            FABRIC_PCLK_I                       : in std_logic;
            PCIE_DIV2_REG                       : out std_logic;
            PCIE_DIV4_REG                       : out std_logic;
            --ports for interconnection of hardwire
            INET_PMAC_Q0                        : inout std_logic_vector(531 downto 0);
            INET_PMAC_Q1                        : inout std_logic_vector(531 downto 0);
            INET_PMAC_TEST                      : inout std_logic_vector(780 downto 0);
            INET_PMAC_UPAR                      : inout std_logic_vector(5466 downto 0)
);
end GTR12_PMAC;
architecture Behavioral of GTR12_PMAC is
begin
end Behavioral;

------------------------------GTR12_QUAD---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all; 

entity GTR12_QUAD is
    generic(
        POSITION                     : string := "Q0"
    );
    port(
        LN0_TXM_O                    : out std_logic;
        LN0_TXP_O                    : out std_logic;
        LN1_TXM_O                    : out std_logic;
        LN1_TXP_O                    : out std_logic;
        LN2_TXM_O                    : out std_logic;
        LN2_TXP_O                    : out std_logic;
        LN3_TXM_O                    : out std_logic;
        LN3_TXP_O                    : out std_logic;
        LN0_RXM_I                    : in std_logic;
        LN0_RXP_I                    : in std_logic;
        LN1_RXM_I                    : in std_logic;
        LN1_RXP_I                    : in std_logic;
        LN2_RXM_I                    : in std_logic;
        LN2_RXP_I                    : in std_logic;
        LN3_RXM_I                    : in std_logic;
        LN3_RXP_I                    : in std_logic;
        FABRIC_CLK_LIFE_DIV_I        : in std_logic_vector(1 downto 0);
        FABRIC_CM0_RXCLK_OE_L_I      : in std_logic;
        FABRIC_CM0_RXCLK_OE_R_I      : in std_logic;
        FABRIC_LN0_RXDET_RESULT      : out std_logic;
        FABRIC_LN1_RXDET_RESULT      : out std_logic;
        FABRIC_LN2_RXDET_RESULT      : out std_logic;
        FABRIC_LN3_RXDET_RESULT      : out std_logic;
        FABRIC_PMA_CM0_DR_REFCLK_DET_O : out std_logic;
        FABRIC_PMA_CM1_DR_REFCLK_DET_O : out std_logic;
        FABRIC_PMA_PD_REFHCLK_I      : in std_logic;
        FABRIC_REFCLK1_INPUT_SEL_I   : in std_logic_vector(2 downto 0);
        FABRIC_REFCLK_INPUT_SEL_I    : in std_logic_vector(2 downto 0);
        FABRIC_REFCLK_OE_L_I         : in std_logic;
        FABRIC_REFCLK_OE_R_I         : in std_logic;
        FABRIC_REFCLK_OUTPUT_SEL_I   : in std_logic_vector(4 downto 0);
        REFCLKM0_I                   : in std_logic;
        REFCLKM1_I                   : in std_logic;
        REFCLKP0_I                   : in std_logic;
        REFCLKP1_I                   : in std_logic;
        FABRIC_BURN_IN_I             : in std_logic;
        FABRIC_CK_SOC_DIV_I          : in std_logic_vector(1 downto 0);
        FABRIC_CLK_REF_CORE_I        : in std_logic;
        FABRIC_CM1_LIFE_CLK_O        : out std_logic;
        FABRIC_CM_LIFE_CLK_O         : out std_logic;
        FABRIC_CMU1_CK_REF_O         : out std_logic;
        FABRIC_CMU1_OK_O             : out std_logic;
        FABRIC_CMU1_REFCLK_GATE_ACK_O: out std_logic;
        FABRIC_CMU1_REFCLK_GATE_I    : in std_logic;
        FABRIC_CMU_CK_REF_O          : out std_logic;
        FABRIC_CMU_OK_O              : out std_logic;
        FABRIC_CMU_REFCLK_GATE_ACK_O : out std_logic;
        FABRIC_CMU_REFCLK_GATE_I     : in std_logic;
        FABRIC_GLUE_MAC_INIT_INFO_I  : in std_logic;
        FABRIC_LANE0_CMU_CK_REF_O    : out std_logic;
        FABRIC_LANE1_CMU_CK_REF_O    : out std_logic;
        FABRIC_LANE2_CMU_CK_REF_O    : out std_logic;
        FABRIC_LANE3_CMU_CK_REF_O    : out std_logic;
        FABRIC_LN0_ASTAT_O           : out std_logic_vector(5 downto 0);
        FABRIC_LN0_BURN_IN_TOGGLE_O  : out std_logic;
        FABRIC_LN0_CTRL_I            : in std_logic_vector(42 downto 0);
        FABRIC_LN0_IDDQ_I            : in std_logic;
        FABRIC_LN0_PD_I              : in std_logic_vector(2 downto 0);
        FABRIC_LN0_PMA_RX_LOCK_O     : out std_logic;
        FABRIC_LN0_RATE_I            : in std_logic_vector(1 downto 0);
        FABRIC_LN0_RSTN_I            : in std_logic;
        FABRIC_LN0_RXDATA_O          : out std_logic_vector(87 downto 0);
        FABRIC_LN0_STAT_O            : out std_logic_vector(12 downto 0);
        FABRIC_LN0_TXDATA_I          : in std_logic_vector(79 downto 0);
        FABRIC_LN1_ASTAT_O           : out std_logic_vector(5 downto 0);
        FABRIC_LN1_BURN_IN_TOGGLE_O  : out std_logic;
        FABRIC_LN1_CTRL_I            : in std_logic_vector(42 downto 0);
        FABRIC_LN1_IDDQ_I            : in std_logic;
        FABRIC_LN1_PD_I              : in std_logic_vector(2 downto 0);
        FABRIC_LN1_PMA_RX_LOCK_O     : out std_logic;
        FABRIC_LN1_RATE_I            : in std_logic_vector(1 downto 0);
        FABRIC_LN1_RSTN_I            : in std_logic;
        FABRIC_LN1_RXDATA_O          : out std_logic_vector(87 downto 0);
        FABRIC_LN1_STAT_O            : out std_logic_vector(12 downto 0);
        FABRIC_LN1_TXDATA_I          : in std_logic_vector(79 downto 0);
        FABRIC_LN2_ASTAT_O           : out std_logic_vector(5 downto 0);
        FABRIC_LN2_BURN_IN_TOGGLE_O  : out std_logic;
        FABRIC_LN2_CTRL_I            : in std_logic_vector(42 downto 0);
        FABRIC_LN2_IDDQ_I            : in std_logic;
        FABRIC_LN2_PD_I              : in std_logic_vector(2 downto 0);
        FABRIC_LN2_PMA_RX_LOCK_O     : out std_logic;
        FABRIC_LN2_RATE_I            : in std_logic_vector(1 downto 0);
        FABRIC_LN2_RSTN_I            : in std_logic;
        FABRIC_LN2_RXDATA_O          : out std_logic_vector(87 downto 0);
        FABRIC_LN2_STAT_O            : out std_logic_vector(12 downto 0);
        FABRIC_LN2_TXDATA_I          : in std_logic_vector(79 downto 0);
        FABRIC_LN3_ASTAT_O           : out std_logic_vector(5 downto 0);
        FABRIC_LN3_BURN_IN_TOGGLE_O  : out std_logic;
        FABRIC_LN3_CTRL_I            : in std_logic_vector(42 downto 0);
        FABRIC_LN3_IDDQ_I            : in std_logic;
        FABRIC_LN3_PD_I              : in std_logic_vector(2 downto 0);
        FABRIC_LN3_PMA_RX_LOCK_O     : out std_logic;
        FABRIC_LN3_RATE_I            : in std_logic_vector(1 downto 0);
        FABRIC_LN3_RSTN_I            : in std_logic;
        FABRIC_LN3_RXDATA_O          : out std_logic_vector(87 downto 0);
        FABRIC_LN3_STAT_O            : out std_logic_vector(12 downto 0);
        FABRIC_LN3_TXDATA_I          : in std_logic_vector(79 downto 0);
        FABRIC_REFCLK_GATE_ACK_O     : out std_logic;
        FABRIC_REFCLK_GATE_I         : in std_logic;
        LANE0_PCS_RX_RST             : in std_logic;
        LANE1_PCS_RX_RST             : in std_logic;
        LANE2_PCS_RX_RST             : in std_logic;
        LANE3_PCS_RX_RST             : in std_logic;
        LANE0_ALIGN_TRIGGER          : in std_logic;
        LANE1_ALIGN_TRIGGER          : in std_logic;
        LANE2_ALIGN_TRIGGER          : in std_logic;
        LANE3_ALIGN_TRIGGER          : in std_logic;
        LANE0_CHBOND_START           : in std_logic;
        LANE1_CHBOND_START           : in std_logic;
        LANE2_CHBOND_START           : in std_logic;
        LANE3_CHBOND_START           : in std_logic;
        LANE0_ALIGN_LINK             : out std_logic;
        LANE0_K_LOCK                 : out std_logic;
        LANE0_DISP_ERR_O             : out std_logic_vector(1 downto 0);
        LANE0_DEC_ERR_O              : out std_logic_vector(1 downto 0);
        LANE0_CUR_DISP_O             : out std_logic_vector(1 downto 0);
        LANE1_ALIGN_LINK             : out std_logic;
        LANE1_K_LOCK                 : out std_logic;
        LANE1_DISP_ERR_O             : out std_logic_vector(1 downto 0);
        LANE1_DEC_ERR_O              : out std_logic_vector(1 downto 0);
        LANE1_CUR_DISP_O             : out std_logic_vector(1 downto 0);
        LANE2_ALIGN_LINK             : out std_logic;
        LANE2_K_LOCK                 : out std_logic;
        LANE2_DISP_ERR_O             : out std_logic_vector(1 downto 0);
        LANE2_DEC_ERR_O              : out std_logic_vector(1 downto 0);
        LANE2_CUR_DISP_O             : out std_logic_vector(1 downto 0);
        LANE3_ALIGN_LINK             : out std_logic;
        LANE3_K_LOCK                 : out std_logic;
        LANE3_DISP_ERR_O             : out std_logic_vector(1 downto 0);
        LANE3_DEC_ERR_O              : out std_logic_vector(1 downto 0);
        LANE3_CUR_DISP_O             : out std_logic_vector(1 downto 0);
        LANE0_PCS_TX_RST             : in std_logic;
        LANE1_PCS_TX_RST             : in std_logic;
        LANE2_PCS_TX_RST             : in std_logic;
        LANE3_PCS_TX_RST             : in std_logic;
        LANE0_FABRIC_RX_CLK          : in std_logic;
        LANE1_FABRIC_RX_CLK          : in std_logic;
        LANE2_FABRIC_RX_CLK          : in std_logic;
        LANE3_FABRIC_RX_CLK          : in std_logic;
        LANE0_FABRIC_C2I_CLK         : in std_logic;
        LANE1_FABRIC_C2I_CLK         : in std_logic;
        LANE2_FABRIC_C2I_CLK         : in std_logic;
        LANE3_FABRIC_C2I_CLK         : in std_logic;
        LANE0_PCS_RX_O_FABRIC_CLK    : out std_logic;
        LANE1_PCS_RX_O_FABRIC_CLK    : out std_logic;
        LANE2_PCS_RX_O_FABRIC_CLK    : out std_logic;
        LANE3_PCS_RX_O_FABRIC_CLK    : out std_logic;
        LANE0_FABRIC_TX_CLK          : in std_logic;
        LANE1_FABRIC_TX_CLK          : in std_logic;
        LANE2_FABRIC_TX_CLK          : in std_logic;
        LANE3_FABRIC_TX_CLK          : in std_logic;
        LANE0_PCS_TX_O_FABRIC_CLK    : out std_logic;
        LANE1_PCS_TX_O_FABRIC_CLK    : out std_logic;
        LANE2_PCS_TX_O_FABRIC_CLK    : out std_logic;
        LANE3_PCS_TX_O_FABRIC_CLK    : out std_logic;
        FABRIC_CMU0_CLK              : out std_logic;
        FABRIC_CMU1_CLK              : out std_logic;
        FABRIC_QUAD_CLK_RX           : out std_logic;
        LANE0_RX_IF_FIFO_RDEN        : in std_logic;
        LANE1_RX_IF_FIFO_RDEN        : in std_logic;
        LANE2_RX_IF_FIFO_RDEN        : in std_logic;
        LANE3_RX_IF_FIFO_RDEN        : in std_logic;
        LANE0_RX_IF_FIFO_RDUSEWD     : out std_logic_vector(4 downto 0);
        LANE0_RX_IF_FIFO_AEMPTY      : out std_logic;
        LANE0_RX_IF_FIFO_EMPTY       : out std_logic;
        LANE1_RX_IF_FIFO_RDUSEWD     : out std_logic_vector(4 downto 0);
        LANE1_RX_IF_FIFO_AEMPTY      : out std_logic;
        LANE1_RX_IF_FIFO_EMPTY       : out std_logic;
        LANE2_RX_IF_FIFO_RDUSEWD     : out std_logic_vector(4 downto 0);
        LANE2_RX_IF_FIFO_AEMPTY      : out std_logic;
        LANE2_RX_IF_FIFO_EMPTY       : out std_logic;
        LANE3_RX_IF_FIFO_RDUSEWD     : out std_logic_vector(4 downto 0);
        LANE3_RX_IF_FIFO_AEMPTY      : out std_logic;
        LANE3_RX_IF_FIFO_EMPTY       : out std_logic;
        LANE0_TX_IF_FIFO_WRUSEWD     : out std_logic_vector(4 downto 0);
        LANE0_TX_IF_FIFO_AFULL       : out std_logic;
        LANE0_TX_IF_FIFO_FULL        : out std_logic;
        LANE1_TX_IF_FIFO_WRUSEWD     : out std_logic_vector(4 downto 0);
        LANE1_TX_IF_FIFO_AFULL       : out std_logic;
        LANE1_TX_IF_FIFO_FULL        : out std_logic;
        LANE2_TX_IF_FIFO_WRUSEWD     : out std_logic_vector(4 downto 0);
        LANE2_TX_IF_FIFO_AFULL       : out std_logic;
        LANE2_TX_IF_FIFO_FULL        : out std_logic;
        LANE3_TX_IF_FIFO_WRUSEWD     : out std_logic_vector(4 downto 0);
        LANE3_TX_IF_FIFO_AFULL       : out std_logic;
        LANE3_TX_IF_FIFO_FULL        : out std_logic;
        FABRIC_CMU0_RESETN_I         : in std_logic;
        FABRIC_CMU0_PD_I             : in std_logic;
        FABRIC_CMU0_IDDQ_I           : in std_logic;
        FABRIC_CMU1_RESETN_I         : in std_logic;
        FABRIC_CMU1_PD_I             : in std_logic;
        FABRIC_CMU1_IDDQ_I           : in std_logic;
        FABRIC_PLL_CDN_I             : in std_logic;
        FABRIC_LN0_CPLL_RESETN_I     : in std_logic;
        FABRIC_LN0_CPLL_PD_I         : in std_logic;
        FABRIC_LN0_CPLL_IDDQ_I       : in std_logic;
        FABRIC_LN1_CPLL_RESETN_I     : in std_logic;
        FABRIC_LN1_CPLL_PD_I         : in std_logic;
        FABRIC_LN1_CPLL_IDDQ_I       : in std_logic;
        FABRIC_LN2_CPLL_RESETN_I     : in std_logic;
        FABRIC_LN2_CPLL_PD_I         : in std_logic;
        FABRIC_LN2_CPLL_IDDQ_I       : in std_logic;
        FABRIC_LN3_CPLL_RESETN_I     : in std_logic;
        FABRIC_LN3_CPLL_PD_I         : in std_logic;
        FABRIC_LN3_CPLL_IDDQ_I       : in std_logic;
        FABRIC_CM1_PD_REFCLK_DET_I   : in std_logic;
        FABRIC_CM0_PD_REFCLK_DET_I   : in std_logic;
        FABRIC_CLK_MON_O             : out std_logic;
        FABRIC_GEARFIFO_ERR_RPT      : out std_logic;
        FABRIC_LN0_CTRL_I_H          : in std_logic_vector(42 downto 0);
        FABRIC_LN0_PD_I_H            : in std_logic_vector(2 downto 0);
        FABRIC_LN0_RATE_I_H          : in std_logic_vector(1 downto 0);
        FABRIC_LN0_RX_VLD_OUT        : out std_logic;
        FABRIC_LN0_RXELECIDLE_O      : out std_logic;
        FABRIC_LN0_RXELECIDLE_O_H    : out std_logic;
        FABRIC_LN0_STAT_O_H          : out std_logic_vector(12 downto 0);
        FABRIC_LN0_TX_VLD_IN         : in std_logic;
        FABRIC_LN1_CTRL_I_H          : in std_logic_vector(42 downto 0);
        FABRIC_LN1_PD_I_H            : in std_logic_vector(2 downto 0);
        FABRIC_LN1_RATE_I_H          : in std_logic_vector(1 downto 0);
        FABRIC_LN1_RX_VLD_OUT        : out std_logic;
        FABRIC_LN1_RXELECIDLE_O      : out std_logic;
        FABRIC_LN1_RXELECIDLE_O_H    : out std_logic;
        FABRIC_LN1_STAT_O_H          : out std_logic_vector(12 downto 0);
        FABRIC_LN1_TX_VLD_IN         : in std_logic;
        FABRIC_LN2_CTRL_I_H          : in std_logic_vector(42 downto 0);
        FABRIC_LN2_PD_I_H            : in std_logic_vector(2 downto 0);
        FABRIC_LN2_RATE_I_H          : in std_logic_vector(1 downto 0);
        FABRIC_LN2_RX_VLD_OUT        : out std_logic;
        FABRIC_LN2_RXELECIDLE_O      : out std_logic;
        FABRIC_LN2_RXELECIDLE_O_H    : out std_logic;
        FABRIC_LN2_STAT_O_H          : out std_logic_vector(12 downto 0);
        FABRIC_LN2_TX_VLD_IN         : in std_logic;
        FABRIC_LN3_CTRL_I_H          : in std_logic_vector(42 downto 0);
        FABRIC_LN3_PD_I_H            : in std_logic_vector(2 downto 0);
        FABRIC_LN3_RATE_I_H          : in std_logic_vector(1 downto 0);
        FABRIC_LN3_RX_VLD_OUT        : out std_logic;
        FABRIC_LN3_RXELECIDLE_O      : out std_logic;
        FABRIC_LN3_RXELECIDLE_O_H    : out std_logic;
        FABRIC_LN3_STAT_O_H          : out std_logic_vector(12 downto 0);
        FABRIC_LN3_TX_VLD_IN         : in std_logic;
        FABRIC_POR_N_I               : in std_logic;
        FABRIC_QUAD_MCU_REQ_I        : in std_logic;
        --ports that are special
        CK_AHB_I                     : in std_logic;
        AHB_RSTN                     : in std_logic;
        TEST_DEC_EN                  : in std_logic;
        FABRIC_LANE0_CMU_OK_O        : out std_logic;
        FABRIC_LANE1_CMU_OK_O        : out std_logic;
        FABRIC_LANE2_CMU_OK_O        : out std_logic;
        FABRIC_LANE3_CMU_OK_O        : out std_logic;
        QUAD_PCIE_CLK                : in std_logic;
        PCIE_DIV2_REG                : in std_logic;
        PCIE_DIV4_REG                : in std_logic;
        PMAC_LN_RSTN                 : in std_logic;
        --ports for interconnection of hardwire
        INET_Q0_Q1                   : inout std_logic_vector(91 downto 0);
        INET_Q_PMAC                  : inout std_logic_vector(531 downto 0);
        INET_Q_TEST                  : inout std_logic_vector(227 downto 0);
        INET_Q_UPAR                  : inout std_logic_vector(420 downto 0) 
    );
end GTR12_QUAD;
architecture Behavioral of GTR12_QUAD is
begin
end Behavioral;

------------------------------GTR12_UPAR---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all; 

entity GTR12_UPAR is
        port(
            CSR_TCK                   : in std_logic;
            CSR_TMS                   : in std_logic;
            CSR_TDI                   : in std_logic;
            CSR_TDO                   : out std_logic;
            UPAR_CLK                  : in std_logic;
            UPAR_RST                  : in std_logic;
            SPI_CLK                   : in std_logic;
            UPAR_WREN_S               : in std_logic;
            UPAR_ADDR_S               : in std_logic_vector(23 downto 0);
            UPAR_WRDATA_S             : in std_logic_vector(31 downto 0);
            UPAR_RDEN_S               : in std_logic;
            UPAR_STRB_S               : in std_logic_vector(7 downto 0);
            UPAR_BUS_WIDTH_S          : in std_logic;
            UPAR_RDDATA_S             : out std_logic_vector(31 downto 0);
            UPAR_RDVLD_S              : out std_logic;
            UPAR_READY_S              : out std_logic;
            SPI_MOSI                  : in std_logic;
            SPI_MISO                  : out std_logic;
            SPI_SS                    : in std_logic;
            AHB_CLK_O                 : out std_logic;
            CSR_MODE                  : in std_logic_vector(4 downto 0);
            FABRIC_DFT_EDT_UPDATE     : in std_logic;
            FABRIC_DFT_IJTAG_CE       : in std_logic;
            FABRIC_DFT_IJTAG_RESET    : in std_logic;
            FABRIC_DFT_IJTAG_SE       : in std_logic;
            FABRIC_DFT_IJTAG_SEL      : in std_logic;
            FABRIC_DFT_IJTAG_SI       : in std_logic;
            FABRIC_DFT_IJTAG_TCK      : in std_logic;
            FABRIC_DFT_IJTAG_UE       : in std_logic;
            FABRIC_DFT_PLL_BYPASS_CLK : in std_logic;
            FABRIC_DFT_PLL_BYPASS_MODE: in std_logic;
            FABRIC_DFT_SCAN_CLK       : in std_logic;
            FABRIC_DFT_SCAN_EN        : in std_logic;
            FABRIC_DFT_SCAN_IN0       : in std_logic;
            FABRIC_DFT_SCAN_IN1       : in std_logic;
            FABRIC_DFT_SCAN_IN2       : in std_logic;
            FABRIC_DFT_SCAN_IN3       : in std_logic;
            FABRIC_DFT_SCAN_IN4       : in std_logic;
            FABRIC_DFT_SCAN_IN5       : in std_logic;
            FABRIC_DFT_SCAN_IN6       : in std_logic;
            FABRIC_DFT_SCAN_RSTN      : in std_logic;
            FABRIC_DFT_SHIFT_SCAN_EN  : in std_logic;
            --ports that are special
            QUAD_CFG_TEST_DEC_EN      : out std_logic;
            AHB_RSTN_O                : out std_logic;
            TL_CLKP_I                 : out std_logic;
            --ports for interconnection of hardwire
            INET_UPAR_PMAC            : inout std_logic_vector(5466 downto 0);
            INET_UPAR_Q0              : inout std_logic_vector(420 downto 0);
            INET_UPAR_Q1              : inout std_logic_vector(420 downto 0);
            INET_UPAR_TEST            : inout std_logic_vector(1328 downto 0)
    );
end GTR12_UPAR;
architecture Behavioral of GTR12_UPAR is
begin
end Behavioral;

------------------------------AE350_RAM---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity AE350_RAM is
        port(
			POR_N	: in std_logic;
			HW_RSTN	: in std_logic;
			CORE_CLK	: in std_logic;
			AHB_CLK	: in std_logic;
			APB_CLK	: in std_logic;
			RTC_CLK	: in std_logic;
			CORE_CE	: in std_logic;
			AXI_CE	: in std_logic;
			AHB_CE	: in std_logic;
			EXTM_HADDR	: in std_logic_vector(31 downto 0);
			EXTM_HBURST	: in std_logic_vector(2 downto 0);
			EXTM_HPROT	: in std_logic_vector(3 downto 0);
			EXTM_HRDATA	: out std_logic_vector(63 downto 0);
			EXTM_HREADY	: in std_logic;
			EXTM_HREADYOUT	: out std_logic;
			EXTM_HRESP	: out std_logic;
			EXTM_HSEL	: in std_logic;
			EXTM_HSIZE	: in std_logic_vector(2 downto 0);
			EXTM_HTRANS	: in std_logic_vector(1 downto 0);
			EXTM_HWDATA	: in std_logic_vector(63 downto 0);
			EXTM_HWRITE	: in std_logic;
			EMA	: in std_logic_vector(2 downto 0);
			EMAW	: in std_logic_vector(1 downto 0);
			EMAS	: in std_logic;
			RET1N	: in std_logic;
			RET2N	: in std_logic
            );
end AE350_RAM;
architecture Behavioral of AE350_RAM is
begin

end Behavioral;

------------------------------AE350_SOC---------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity AE350_SOC is
        port(
            POR_N	: in std_logic;
			HW_RSTN	: in std_logic;
			CORE_CLK	: in std_logic;
			DDR_CLK	: in std_logic;
			AHB_CLK	: in std_logic;
			APB_CLK	: in std_logic;
			DBG_TCK	: in std_logic;
			RTC_CLK	: in std_logic;
			CORE_CE	: in std_logic;
			AXI_CE	: in std_logic;
			DDR_CE	: in std_logic;
			AHB_CE	: in std_logic;
			APB_CE	: in std_logic_vector(7 downto 0);
			APB2AHB_CE	: in std_logic;
			SCAN_TEST	: in std_logic;
			SCAN_EN	: in std_logic;
			PRESETN	: out std_logic;
			HRESETN	: out std_logic;
			DDR_RSTN	: out std_logic;
			GP_INT	: in std_logic_vector(15 downto 0);
			DMA_REQ	: in std_logic_vector(7 downto 0);
			DMA_ACK	: out std_logic_vector(7 downto 0);
			CORE0_WFI_MODE	: out std_logic;
			WAKEUP_IN	: in std_logic;
			RTC_WAKEUP	: out std_logic;
			TEST_CLK	: in std_logic;
			TEST_MODE	: in std_logic;
			TEST_RSTN	: in std_logic;
			ROM_HADDR	: out std_logic_vector(31 downto 0);
			ROM_HRDATA	: in std_logic_vector(31 downto 0);
			ROM_HREADY	: in std_logic;
			ROM_HRESP	: in std_logic;
			ROM_HTRANS	: out std_logic_vector(1 downto 0);
			ROM_HWRITE	: out std_logic;
			APB_PADDR	: out std_logic_vector(31 downto 0);
			APB_PENABLE	: out std_logic;
			APB_PRDATA	: in std_logic_vector(31 downto 0);
			APB_PREADY	: in std_logic;
			APB_PSEL	: out std_logic;
			APB_PWDATA	: out std_logic_vector(31 downto 0);
			APB_PWRITE	: out std_logic;
			APB_PSLVERR	: in std_logic;
			APB_PPROT	: out std_logic_vector(2 downto 0);
			APB_PSTRB	: out std_logic_vector(3 downto 0);
			EXTS_HRDATA	: in std_logic_vector(31 downto 0);
			EXTS_HREADYIN	: in std_logic;
			EXTS_HRESP	: in std_logic;
			EXTS_HADDR	: out std_logic_vector(31 downto 0);
			EXTS_HBURST	: out std_logic_vector(2 downto 0);
			EXTS_HPROT	: out std_logic_vector(3 downto 0);
			EXTS_HSEL	: out std_logic;
			EXTS_HSIZE	: out std_logic_vector(2 downto 0);
			EXTS_HTRANS	: out std_logic_vector(1 downto 0);
			EXTS_HWDATA	: out std_logic_vector(31 downto 0);
			EXTS_HWRITE	: out std_logic;
			EXTM_HADDR	: in std_logic_vector(31 downto 0);
			EXTM_HBURST	: in std_logic_vector(2 downto 0);
			EXTM_HPROT	: in std_logic_vector(3 downto 0);
			EXTM_HRDATA	: out std_logic_vector(63 downto 0);
			EXTM_HREADY	: in std_logic;
			EXTM_HREADYOUT	: out std_logic;
			EXTM_HRESP	: out std_logic;
			EXTM_HSEL	: in std_logic;
			EXTM_HSIZE	: in std_logic_vector(2 downto 0);
			EXTM_HTRANS	: in std_logic_vector(1 downto 0);
			EXTM_HWDATA	: in std_logic_vector(63 downto 0);
			EXTM_HWRITE	: in std_logic;
			DDR_HADDR	: out std_logic_vector(31 downto 0);
			DDR_HBURST	: out std_logic_vector(2 downto 0);
			DDR_HPROT	: out std_logic_vector(3 downto 0);
			DDR_HRDATA	: in std_logic_vector(63 downto 0);
			DDR_HREADY	: in std_logic;
			DDR_HRESP	: in std_logic;
			DDR_HSIZE	: out std_logic_vector(2 downto 0);
			DDR_HTRANS	: out std_logic_vector(1 downto 0);
			DDR_HWDATA	: out std_logic_vector(63 downto 0);
			DDR_HWRITE	: out std_logic;
			TMS_IN	: in std_logic;
			TRST_IN	: in std_logic;
			TDI_IN	: in std_logic;
			TDO_OUT	: out std_logic;
			TDO_OE	: out std_logic;
			SPI2_HOLDN_IN	: in std_logic;
			SPI2_WPN_IN	: in std_logic;
			SPI2_CLK_IN	: in std_logic;
			SPI2_CSN_IN	: in std_logic;
			SPI2_MISO_IN	: in std_logic;
			SPI2_MOSI_IN	: in std_logic;
			SPI2_HOLDN_OUT	: out std_logic;
			SPI2_HOLDN_OE	: out std_logic;
			SPI2_WPN_OUT	: out std_logic;
			SPI2_WPN_OE	: out std_logic;
			SPI2_CLK_OUT	: out std_logic;
			SPI2_CLK_OE	: out std_logic;
			SPI2_CSN_OUT	: out std_logic;
			SPI2_CSN_OE	: out std_logic;
			SPI2_MISO_OUT	: out std_logic;
			SPI2_MISO_OE	: out std_logic;
			SPI2_MOSI_OUT	: out std_logic;
			SPI2_MOSI_OE	: out std_logic;
			I2C_SCL_IN	: in std_logic;
			I2C_SDA_IN	: in std_logic;
			I2C_SCL	: out std_logic;
			I2C_SDA	: out std_logic;
			UART1_TXD	: out std_logic;
			UART1_RTSN	: out std_logic;
			UART1_RXD	: in std_logic;
			UART1_CTSN	: in std_logic;
			UART1_DSRN	: in std_logic;
			UART1_DCDN	: in std_logic;
			UART1_RIN	: in std_logic;
			UART1_DTRN	: out std_logic;
			UART1_OUT1N	: out std_logic;
			UART1_OUT2N	: out std_logic;
			UART2_TXD	: out std_logic;
			UART2_RTSN	: out std_logic;
			UART2_RXD	: in std_logic;
			UART2_CTSN	: in std_logic;
			UART2_DCDN	: in std_logic;
			UART2_DSRN	: in std_logic;
			UART2_RIN	: in std_logic;
			UART2_DTRN	: out std_logic;
			UART2_OUT1N	: out std_logic;
			UART2_OUT2N	: out std_logic;
			CH0_PWM	: out std_logic;
			CH0_PWMOE	: out std_logic;
			CH1_PWM	: out std_logic;
			CH1_PWMOE	: out std_logic;
			CH2_PWM	: out std_logic;
			CH2_PWMOE	: out std_logic;
			CH3_PWM	: out std_logic;
			CH3_PWMOE	: out std_logic;
			GPIO_IN	: in std_logic_vector(31 downto 0);
			GPIO_OE	: out std_logic_vector(31 downto 0);
			GPIO_OUT	: out std_logic_vector(31 downto 0);
			SCAN_IN	: in std_logic_vector(19 downto 0);
			INTEG_TCK	: in std_logic;
			INTEG_TDI	: in std_logic;
			INTEG_TMS	: in std_logic;
			INTEG_TRST	: in std_logic;
			INTEG_TDO	: out std_logic;
			SCAN_OUT	: out std_logic_vector(19 downto 0);
			PGEN_CHAIN_I	: in std_logic;
			PRDYN_CHAIN_O	: out std_logic;
			EMA	: in std_logic_vector(2 downto 0);
			EMAW	: in std_logic_vector(1 downto 0);
			EMAS	: in std_logic;
			RET1N	: in std_logic;
			RET2N	: in std_logic
            );
end AE350_SOC;
architecture Behavioral of AE350_SOC is
begin

end Behavioral;


-----------------DQS---------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.glb.GSRO;

entity DQS is
	generic(
		FIFO_MODE_SEL : bit := '0';-- FIFO mode select: '0',DDR memory mode;'1': GDDR mode
		RD_PNTR : bit_vector := "000";--FIFO read pointer setting
		DQS_MODE : string := "X1"; -- "X1","X2_DDR2","X2_DDR3","X4","X2_DDR3_EXT"
        HWL : string := "false" --"true"; "false"
	);

	port (
		DQSIN,PCLK,FCLK,RESET : in std_logic;
		READ : in std_logic_vector(3 downto 0);
		RCLKSEL : in std_logic_vector(2 downto 0);
		DLLSTEP,WSTEP : in std_logic_vector(7 downto 0);
		RLOADN, RMOVE, RDIR, HOLD : in std_logic;
        WLOADN, WMOVE, WDIR : in std_logic;
        DQSR90, DQSW0, DQSW270 : out std_logic;
		RPOINT, WPOINT : out std_logic_vector(2 downto 0);
		RVALID,RBURST, RFLAG, WFLAG : out std_logic
	);
end DQS;

architecture Behavioral of DQS is

	begin

end Behavioral;	