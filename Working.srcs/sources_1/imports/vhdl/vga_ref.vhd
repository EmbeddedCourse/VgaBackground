library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use work.vga_ref_pack.all;

entity vga_ref is
	Port ( clk : in  std_logic;
		    rst : in  std_logic;
		    hs  : out std_logic;
		    vs  : out std_logic;
		    rgb_out : out std_logic_vector (11 downto 0)
		  );
end vga_ref;

architecture Behavioral of vga_ref is



component bram_top is
  port (
         clk : in STD_LOGIC;
         rst : in STD_LOGIC;
         start_bram : in std_logic ;
         rst_bram : in std_logic ;
         rgb : out STD_LOGIC_VECTOR ( 2 downto 0 );
         BRAM_PORTA_en : in STD_LOGIC;
         BRAM_PORTA_we : in STD_LOGIC_VECTOR ( 0 to 0 )
);
 end component;

component clk_wiz_0 is
 port (
  clk_in1   : in std_logic;
  clk_out1  : out std_logic;
  reset     : in std_logic;
  locked    : out std_logic
 );
 end component;

--	component Address_counter is
--         Port ( 
--            clk : in  std_logic;
--            rst : in std_logic;         
--            add_bram : out std_logic_vector (19 downto 0)
--            );
--     end component;
     
     
	component vga_controller_640_60 is
      port ( rst       : in  std_logic; 
             pixel_clk : in  std_logic; 
             HS        : out std_logic; 
             start_bram        : out std_logic; 
             rst_bram        : out std_logic; 
             VS        : out std_logic; 
             blank     : out std_logic; 
             hcount    : out std_logic_vector(10 downto 0); 
             vcount    : out std_logic_vector(10 downto 0)
			  );
   end component;
	
	
	-- General signals
	signal clk_sys	: std_logic; 
	signal clk_locked, rst_sys : std_logic;
	
	-- VGA module
	signal blank : std_logic;
	signal hcount,vcount : std_logic_vector(10 downto 0);
	
	--signal  add_bram :  std_logic_vector (19 downto 0);

	signal rgb,rgb_ram      : std_logic_vector(2 downto 0);
	signal start_bram, rst_bram : std_logic;
	-- signal        BRAM_PORTA_en_sig :  STD_LOGIC;

	--signal bram_delay_cur,bram_delay_next : std_logic_vector(1 downto 0);
   -- signal bram_sig : STD_LOGIC_VECTOR ( 2 downto 0 );
	

begin 

	rst_sys <= rst or (not clk_locked);		-- Release system reset when clock is stable
	
	
	-- Replicate the r g and b signals for nexys 4 board

	rgb_out(3)  <= rgb(0);
    rgb_out(2)  <= rgb(0);
	rgb_out(1)  <= rgb(0);
	rgb_out(0)  <= rgb(0);

	rgb_out(7)  <= rgb(1);
    rgb_out(6)  <= rgb(1);
	rgb_out(5)  <= rgb(1);
	rgb_out(4)  <= rgb(1);


	rgb_out(11)  <= rgb(2);
    rgb_out(10)  <= rgb(2);
	rgb_out(9)  <= rgb(2);
	rgb_out(8)  <= rgb(2);	
	
	
	
	Inst_clock_gen:
	clk_wiz_0
	port map (   clk_in1  	=> clk,
				 clk_out1 	=> clk_sys,			-- Don't touch! active high reset
				 reset    	=> rst,		-- Divided 50MHz input clock
				 locked     => clk_locked
				);
				
--	Inst_Address_counter:
--                Address_counter
--                port map (   clk      => clk,
--                             rst     => rst,           
--                             add_bram        => add_bram                              
--                            );	
                            
                      
	vgactrl640_60 : vga_controller_640_60
            port map ( pixel_clk => clk_sys,
                       rst			=> rst_sys,
                       blank		=> blank,
                       hcount		=> hcount,
                       hs			=> hs,
                       start_bram => start_bram,
                       rst_bram => rst_bram,
                       vcount		=> vcount,
                       vs			=> vs
                       );
    
     bram_top_inst : bram_top 
                         port map (
                                clk => clk_sys,
                                rst  => rst,
                                start_bram => start_bram,
                                rst_bram => rst_bram,
                                rgb => rgb_ram,
                                BRAM_PORTA_en => '1',
                               -- BRAM_PORTA_en => BRAM_PORTA_en_sig,
                                BRAM_PORTA_we => "0"
                       );
                        
				
	picture_display:process (clk_sys)
                 begin
                  if clk_sys = '1' and clk_sys'event then
                    if blank = '1' then
                                rgb <= (others => '0');  -- Have to be zeros during the blank period
                    else
                                rgb <= rgb_ram;   -- Background color                                        
                    end if;
                   end if;

                 end process;
                 
--	bramdelayseq:process (clk_sys,rst)
--                              begin
--                               if rst = '1' then
--                               bram_delay_cur <= (others => '0');  
--                               elsif clk_sys = '1' and clk_sys'event then
--                                bram_delay_cur <= bram_delay_next;   
--                               end if;
--                            end process;
                               
--      bramdelaycomb:process (bram_delay_cur)
--                                 begin
--                                  if bram_delay_cur <"111" then
--                                     bram_delay_next <= bram_delay_cur+1;
--                                     BRAM_PORTA_en_sig <='0' ;
--                                  else                   
--                                     bram_delay_next <= (others => '0');   
--                                     BRAM_PORTA_en_sig <='1' ;
--                                  end if; 
--                              end process;
                              
                              
                              
end Behavioral;
