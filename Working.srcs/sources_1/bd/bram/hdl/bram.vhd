--Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2016.1 (win64) Build 1538259 Fri Apr  8 15:45:27 MDT 2016
--Date        : Wed Sep 27 11:08:19 2017
--Host        : fox-19 running 64-bit major release  (build 9200)
--Command     : generate_target bram.bd
--Design      : bram
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bram is
  port (
    BRAM_PORTA_addr : in STD_LOGIC_VECTOR ( 18 downto 0 );
    BRAM_PORTA_clk : in STD_LOGIC;
    BRAM_PORTA_din : in STD_LOGIC_VECTOR ( 2 downto 0 );
    BRAM_PORTA_dout : out STD_LOGIC_VECTOR ( 2 downto 0 );
    BRAM_PORTA_en : in STD_LOGIC;
    BRAM_PORTA_we : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of bram : entity is "bram,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=bram,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=Global}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of bram : entity is "bram.hwdef";
end bram;

architecture STRUCTURE of bram is
  component bram_blk_mem_gen_0_0 is
  port (
    clka : in STD_LOGIC;
    ena : in STD_LOGIC;
    wea : in STD_LOGIC_VECTOR ( 0 to 0 );
    addra : in STD_LOGIC_VECTOR ( 18 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 2 downto 0 );
    douta : out STD_LOGIC_VECTOR ( 2 downto 0 )
  );
  end component bram_blk_mem_gen_0_0;
  signal BRAM_PORTA_1_ADDR : STD_LOGIC_VECTOR ( 18 downto 0 );
  signal BRAM_PORTA_1_CLK : STD_LOGIC;
  signal BRAM_PORTA_1_DIN : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal BRAM_PORTA_1_DOUT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal BRAM_PORTA_1_EN : STD_LOGIC;
  signal BRAM_PORTA_1_WE : STD_LOGIC_VECTOR ( 0 to 0 );
begin
  BRAM_PORTA_1_ADDR(18 downto 0) <= BRAM_PORTA_addr(18 downto 0);
  BRAM_PORTA_1_CLK <= BRAM_PORTA_clk;
  BRAM_PORTA_1_DIN(2 downto 0) <= BRAM_PORTA_din(2 downto 0);
  BRAM_PORTA_1_EN <= BRAM_PORTA_en;
  BRAM_PORTA_1_WE(0) <= BRAM_PORTA_we(0);
  BRAM_PORTA_dout(2 downto 0) <= BRAM_PORTA_1_DOUT(2 downto 0);
blk_mem_gen_0: component bram_blk_mem_gen_0_0
     port map (
      addra(18 downto 0) => BRAM_PORTA_1_ADDR(18 downto 0),
      clka => BRAM_PORTA_1_CLK,
      dina(2 downto 0) => BRAM_PORTA_1_DIN(2 downto 0),
      douta(2 downto 0) => BRAM_PORTA_1_DOUT(2 downto 0),
      ena => BRAM_PORTA_1_EN,
      wea(0) => BRAM_PORTA_1_WE(0)
    );
end STRUCTURE;
