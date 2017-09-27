-------- ADDRESS COUNTER-----------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Address_counter_new is
  Port ( 
         clk : in std_logic;
         rst : in std_logic;
         start_bram : in std_logic ;
         rst_bram : in std_logic ;
         addr_bram : out std_logic_vector (18 downto 0) 
        );
end Address_counter_new;

architecture Behavioral of Address_counter_new is

signal address_count_reg,address_count_next : std_logic_vector (18 downto 0) ;

signal bram_delay_cur,bram_delay_next : std_logic_vector(2 downto 0);


begin



  seq : process(clk,rst)
            begin
                  if rst ='1' then
                     address_count_reg<=(others => '0');
                     bram_delay_cur <= (others => '0');  
                 elsif clk'event and clk='1' then
                     address_count_reg<=address_count_next;
                      bram_delay_cur <= bram_delay_next;   
                 end if;
    end process;


  comb : process(start_bram,rst_bram,address_count_reg,bram_delay_cur)
            begin
                bram_delay_next <= bram_delay_cur;
                address_count_next<=address_count_reg;                
                addr_bram<=address_count_reg;
                       if start_bram ='1' and rst_bram ='0' then
                           --  if bram_delay_cur <"001" then
                                 --    address_count_next<=address_count_reg;
                                   --  bram_delay_next <= bram_delay_cur+1;
--                              else 
                                     address_count_next<=address_count_reg+1;                        
--                                     bram_delay_next <= (others => '0');   
--                              end if; 
                 
                       elsif start_bram ='0' and rst_bram ='0' then                 
                                      address_count_next<=address_count_reg; 
                        elsif start_bram ='0' and rst_bram ='1' then
                                      address_count_next<=(others => '0');
                        else
                                      address_count_next<=address_count_reg; 
                        end if;             
    end process;
                

                   
      
                  
end Behavioral;