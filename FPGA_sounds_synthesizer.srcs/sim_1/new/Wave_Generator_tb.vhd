library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity Wave_Generator_tb is
end;

architecture bench of Wave_Generator_tb is

  component Wave_Generator
      Port ( Trigger : in STD_LOGIC;
             Mode : in STD_LOGIC_VECTOR(2 downto 0); 
             Freq_Count : in STD_LOGIC_VECTOR (15 downto 0);
             Wave_Gen_Clock : in STD_LOGIC;
             Wave : out STD_LOGIC_VECTOR (9 downto 0));
  end component;

  signal Trigger: STD_LOGIC := '0';
  signal Mode: STD_LOGIC_VECTOR(2 downto 0) := "000"; -- Default to sine wave
  signal Freq_Count: STD_LOGIC_VECTOR (15 downto 0) := "0010111010101001"; -- Default to C3
  signal Wave_Gen_Clock: STD_LOGIC := '0';
  signal Wave: STD_LOGIC_VECTOR (9 downto 0);

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean := false;

begin

  uut: Wave_Generator port map (
    Trigger        => Trigger,
    Mode           => Mode,
    Freq_Count     => Freq_Count,
    Wave_Gen_Clock => Wave_Gen_Clock,
    Wave           => Wave
  );

  -- Stimulus process to test all wave types
  stimulus: process
  begin
    -- Initialize Trigger and other signals
    Trigger <= '0';
    wait for 5 ns;

    -- Test Sine Wave
    Trigger <= '1';
    Mode <= "000"; -- Sine wave mode
    Freq_Count <= "0010111010101001"; -- C3 frequency
    wait for 10 ms; -- Observe the waveform for a sufficient duration

    -- Test Sawtooth Wave
    Mode <= "001"; -- Sawtooth wave mode
    wait for 10 ms;

    -- Test Triangle Wave
    Mode <= "010"; -- Triangle wave mode
    wait for 10 ms;

    -- Test Violin Wave
    Mode <= "011"; -- Violin wave mode
    wait for 10 ms;

    -- Test Sax Wave
    Mode <= "100"; -- Sax wave mode
    wait for 10 ms;

    -- Test Flute Wave
    Mode <= "101"; -- Flute wave mode
    wait for 10 ms;

    -- Reset Trigger
    Trigger <= '0';
    stop_the_clock <= true;
    wait;
  end process;

  -- Clock generation process
  clocking: process
  begin
    while not stop_the_clock loop
      Wave_Gen_Clock <= '0', '1' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
  end process;

end bench;
