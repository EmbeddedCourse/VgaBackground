--Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2016.1 (win64) Build 1538259 Fri Apr  8 15:45:27 MDT 2016
--Date        : Wed Sep 27 11:08:19 2017
--Host        : fox-19 running 64-bit major release  (build 9200)
--Command     : generate_target bram_wrapper.bd
--Design      : bram_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bram_wrapper is
  port (
    BRAM_PORTA_addr : in STD_LOGIC_VECTOR ( 18 downto 0 );
    BRAM_PORTA_clk : in STD_LOGIC;
    BRAM_PORTA_din : in STD_LOGIC_VECTOR ( 2 downto 0 );
    BRAM_PORTA_dout : out STD_LOGIC_VECTOR ( 2 downto 0 );
    BRAM_PORTA_en : in STD_LOGIC;
    BRAM_PORTA_we : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end bram_wrapper;

architecture STRUCTURE of bram_wrapper is
  component bram is
  port (
    BRAM_PORTA_addr : in STD_LOGIC_VECTOR ( 18 downto 0 );
    BRAM_PORTA_clk : in STD_LOGIC;
    BRAM_PORTA_din : in STD_LOGIC_VECTOR ( 2 downto 0 );
    BRAM_PORTA_dout : out STD_LOGIC_VECTOR ( 2 downto 0 );
    BRAM_PORTA_en : in STD_LOGIC;
    BRAM_PORTA_we : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component bram;
begin
bram_i: component bram
     port map (
      BRAM_PORTA_addr(18 downto 0) => BRAM_PORTA_addr(18 downto 0),
      BRAM_PORTA_clk => BRAM_PORTA_clk,
      BRAM_PORTA_din(2 downto 0) => BRAM_PORTA_din(2 downto 0),
      BRAM_PORTA_dout(2 downto 0) => BRAM_PORTA_dout(2 downto 0),
      BRAM_PORTA_en => BRAM_PORTA_en,
      BRAM_PORTA_we(0) => BRAM_PORTA_we(0)
    );
end STRUCTURE;
