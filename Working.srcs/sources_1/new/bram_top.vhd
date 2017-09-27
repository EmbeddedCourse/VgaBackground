--------------TOP------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bram_top is
  port (
         clk : in STD_LOGIC;
         rst : in STD_LOGIC;
         start_bram : in std_logic ;
         rst_bram : in std_logic ;
         rgb : out STD_LOGIC_VECTOR ( 2 downto 0 );
         BRAM_PORTA_en : in STD_LOGIC;
         BRAM_PORTA_we : in STD_LOGIC_VECTOR ( 0 to 0 )
);
end bram_top;

architecture Behavioral of bram_top is

 
    COMPONENT Address_counter_new is
        Port ( 
               clk : in std_logic;
               rst : in std_logic;
               start_bram : in std_logic ;
               rst_bram : in std_logic ;
               addr_bram : out std_logic_vector (18 downto 0) 
              );
      end COMPONENT;
      
      
      
      COMPONENT bram_wrapper is
        port (
          BRAM_PORTA_addr : in STD_LOGIC_VECTOR ( 18 downto 0 );
          BRAM_PORTA_clk : in STD_LOGIC;
          BRAM_PORTA_din : in STD_LOGIC_VECTOR ( 2 downto 0 );
          BRAM_PORTA_dout : out STD_LOGIC_VECTOR ( 2 downto 0 );
          BRAM_PORTA_en : in STD_LOGIC;
          BRAM_PORTA_we : in STD_LOGIC_VECTOR ( 0 to 0 )
        );
      end COMPONENT;
      
      
     --signals
        signal addr_bram :  std_logic_vector (18 downto 0) ;

begin
     
    Inst_Address_counter : Address_counter_new
        Port map ( 
               clk=>clk,
               rst=>rst,
               start_bram=>start_bram,
               rst_bram=>rst_bram,
               addr_bram=>addr_bram
              );
              
    Inst_bram_wrapper : bram_wrapper
                  Port map ( 
                         BRAM_PORTA_addr=>addr_bram,
                         BRAM_PORTA_clk=>clk,
                         BRAM_PORTA_din=>(others => '0'),
                         BRAM_PORTA_dout=>rgb,
                         BRAM_PORTA_en=>BRAM_PORTA_en,
                         BRAM_PORTA_we=>BRAM_PORTA_we
                        );              
end Behavioral;