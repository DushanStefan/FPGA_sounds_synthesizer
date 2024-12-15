
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity vga_draw is
  Port (
    vidon  : in  std_logic;
    clk    : in  std_logic;
    notes  : in  std_logic_vector(11 downto 0);
    hc     : in  std_logic_vector(10 downto 0);
    vc     : in  std_logic_vector(10 downto 0);
    red    : out std_logic_vector(3 downto 0);
    blue   : out std_logic_vector(3 downto 0);
     octaves : in std_logic_vector(2 downto 0);
    green  : out std_logic_vector(3 downto 0)
  );
end vga_draw;

architecture Behavioral of vga_draw is
  -- Screen constants
  constant cell_width  : integer := 100;
  constant cell_height : integer := 80;
  constant screen_cols : integer := 14; -- Number of columns in the grid
  constant screen_rows : integer := 12; -- Number of rows in the grid
  constant hbp         : integer := 248; -- Horizontal back porch
  constant vbp         : integer := 38;  -- Vertical back porch

begin

process(vidon, hc, vc, notes)
  variable row, col : integer;
  variable row_pixel : integer;
begin
  -- Default color output
  red <= "0000";
  blue <= "0000";
  green <= "0000";

  if vidon = '1' then
    -- Calculate the row and column based on the pixel position
    col := (to_integer(unsigned(hc)) - hbp) / cell_width;
    row_pixel := (to_integer(unsigned(vc)) - vbp) mod cell_height;
    row := (to_integer(unsigned(vc)) - vbp) / cell_height;

    -- Ensure we are within the grid bounds
    if col >= 0 and col < screen_cols and row >= 0 and row < screen_rows then
      -- Black line for row separation
      if row_pixel < 2 then
        -- Always set the separator line to black
        red <= "0000";
        green <= "0000";
        blue <= "0000";
      else
        -- Color cells based on "notes" and "octaves"
        if notes(row mod 12) = '1' and (octaves = "001") then
          red <= "1111";  -- Highlighted cell color
          green <= "0000";
          blue <= "0000";
        elsif notes(row mod 12) = '1' and (octaves = "010") then
          red <= "0000";  -- Highlighted cell color
          green <= "1111";
          blue <= "0000";
        elsif notes(row mod 12) = '1' and (octaves = "011") then
          red <= "0000";  -- Highlighted cell color
          green <= "0000";
          blue <= "1111";
        elsif notes(row mod 12) = '1' and (octaves = "100") then
          red <= "1111";  -- Highlighted cell color
          green <= "1111";
          blue <= "0000";
        elsif notes(row mod 12) = '1' and (octaves = "101") then
          red <= "1111";  -- Highlighted cell color
          green <= "1010";
          blue <= "0000";
        elsif notes(row mod 12) = '1' and (octaves = "110") then
          red <= "1000";  -- Highlighted cell color
          green <= "0000";
          blue <= "1000";
        elsif notes(row mod 12) = '1' and (octaves = "111") then
          red <= "1111";  -- Highlighted cell color
          green <= "0000";
          blue <= "1111";
        else
          red <= "1111";  -- Default grid cell color
          green <= "1111";
          blue <= "1111";
        end if;
      end if;
    end if;
  end if;
end process;


end Behavioral;