library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity Gpu_top_tb is
end;

architecture bench of Gpu_top_tb is


  component vga_ref is
      Port ( clk : in  std_logic;
              rst : in  std_logic;
              hs  : out std_logic;
              vs  : out std_logic;
              rgb_out : out std_logic_vector (11 downto 0)
            );
  end component;
  
  signal clk : std_logic:='0';
  signal rst: std_logic;
  signal hs: STD_LOGIC;
  signal vs: STD_LOGIC;
  signal rgb_out: STD_LOGIC_VECTOR ( 11 downto 0 ) ;

begin

  uut: vga_ref port map ( clk                         => clk,
                          rst                         => rst,
                          hs                       => hs,
                          vs                       => vs,
                          rgb_out                         => rgb_out );



  clk       <= not(clk) after 5 ns;                 
  rst <= '1', '0' after 4 ns;

                
end;