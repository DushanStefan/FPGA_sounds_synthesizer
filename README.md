# FPGA Sound Synthesizer
## Project Overview

This FPGA project is a comprehensive music visualization and synthesis system that combines audio generation, visual representation, and display output. The system allows users to play and visualize musical notes across different octaves and wave modes.

## Key Features

- Multi-wave audio synthesis
- 7-segment display output
- VGA video visualization
- Octave and note selection
- Multiple wave modes (Sine, Saw, Triangle, Violin, Saxophone, Flute)

## System Architecture

### Components

1. **Wave Generator (`Wave_Generator.vhd`):**
   - Generates different wave forms
   - Supports 6 wave modes: Sine, Saw, Triangle, Violin, Saxophone, Flute
   - 64-point wave tables for each instrument
   - Configurable frequency and trigger

2. **Wave Summation (`Wave_Summation.vhd`):**
   - Combines multiple note waves
   - Supports 12 simultaneous notes
   - PWM audio output generation
   - Octave and mode selection

3. **VGA Controller (`vga_controller.vhd`, `vga_synch.vhd`, `vga_draw.vhd`):**
   - Generates VGA synchronization signals
   - Draws note visualization
   - Color-coded note representation
   - Supports different octaves and notes

4. **7-Segment Display (`Segment_Driver.vhd`, `Segment_Decoder.vhd`):**
   - Multiplexed 4-digit display
   - Shows current octave and note information
   - Dynamic display refresh

5. **Clock Divider (`Clock_Divider.vhd`):**
   - Generates slower clock signals
   - Enables display multiplexing

## Input Interfaces

- **Notes:** 12-bit vector (one bit per note from C to B)
- **Octaves:** 3-bit vector (0-7 octave range)
- **Modes:** 5-bit vector (selects wave type)

## Output Interfaces

- **Audio Output:** PWM signal
- **7-Segment Display:** 4 digits
- **VGA Output:** 
  - Horizontal and vertical sync
  - RGB color signals (4-bit per channel)

## Wave Modes

1. Sine Wave
2. Sawtooth Wave
3. Triangle Wave
4. Violin Timbre
5. Saxophone Timbre
6. Flute Timbre

## Visualization Details

- Horizontal axis represents notes
- Vertical axis represents octaves
- Red highlighting indicates active notes
- Dynamic color and position based on input

## Hardware Requirements

- FPGA Development Board
- VGA Monitor
- Audio Output Device

## Usage

1. Select desired notes using input switches
2. Choose octave range
3. Select wave mode
4. Observe audio generation and VGA visualization

## Implementation Notes

- Implemented in VHDL
- Uses IEEE standard libraries
- Modular design with component-based architecture
- Supports real-time audio and visual feedback

## Future Improvements

- Implement additional wave modes
- Enhanced visualization techniques
- More complex audio synthesis algorithms

## Limitations

- Fixed 64-point wave tables
- Limited to 12 simultaneous notes
- Single octave visualization at a time

## License

[Specify your project's license here]

## Contributors

[List project contributors]
