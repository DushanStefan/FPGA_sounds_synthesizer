# FPGA Sound Synthesizer

**Digital Sound Generator System on FPGA with VGA and 7-Segment Display Integration**

---

### Description of the Project Idea
This project is a digital sound generator system implemented on an FPGA. It integrates sound synthesis, VGA output, and 7-segment display control for an interactive musical experience. The goal is to create a platform that produces various musical notes based on user input, offering visual feedback on a VGA monitor and a 7-segment display. Users can select notes, octaves, and modes, which are converted into sound signals using Pulse Width Modulation (PWM). This synthesis method generates different tones by adjusting the output signal's frequency and duty cycle, which plays through an external speaker. The project also includes a VGA controller for real-time graphics that represent selected notes and modes, alongside a 7-segment display showing the current note, octave, and mode clearly. The FPGA design ensures real-time operation and synchronization between sound and display outputs, providing a seamless user experience.

---

### Development Methodology, Tools Used, and Testing Strategy
- **Methodology:** Modular design approach with each functional block implemented and tested independently before system integration.
- **Tools Used:**
  - Xilinx Vivado for synthesis and implementation.
  - Basys3 FPGA development board for hardware implementation.
  - External VGA monitor and speakers for output verification.
- **Testing Strategy:**
  - Unit testing of individual modules such as clock generation, PWM, and VGA controller.
  - Functional testing with input vectors for all features.
  - Hardware testing to verify real-time functionality.

---

### Overall Design / Modular Architecture of the System

#### Input Interfaces

The input interfaces of the **Digital Sound Generator** allow users to define the musical characteristics, such as notes, octaves, and sound modes. These interfaces are essential for controlling the behavior of the system and enabling the generation of customized sound outputs. Below is an overview of the input interfaces and their functionalities

1. **Notes**  
   - **Type**: 12-bit vector  
   - **Description**: Each bit in the 12-bit vector corresponds to one of the 12 musical notes in an octave, ranging from **C** to **B**. When a specific bit is set to `1`, the system interprets it as the activation of the respective note.  
   - **Functionality**: Enables users to select the musical notes they want to play. Multiple notes can be activated simultaneously for chord synthesis.

2. **Octaves**  
   - **Type**: 3-bit vector  
   - **Description**: Represents the octave range, allowing users to specify which octave (0–7) the selected notes belong to.  
   - **Functionality**: Changes the pitch of the notes, shifting them higher or lower across octaves. This ensures versatility in creating sounds ranging from bass to treble.  

3. **Modes**  
   - **Type**: 5-bit vector  
   - **Description**: Each bit or combination of bits corresponds to a specific wave type or sound mode, such as **sine**, **square**, **triangle**, or custom waves.  
   - **Functionality**: Defines the waveform used for sound synthesis, allowing the user to change the tonal quality and texture of the generated sound.

These input interfaces work in unison to provide a rich and flexible platform for audio synthesis, enabling users to produce dynamic musical compositions through simple and intuitive control signals.


#### Output Interfaces

The **Digital Sound Generator** provides multiple output interfaces to deliver audio and visual feedback to users. These outputs are crucial for interpreting the system's functionality and engagingly presenting the results. Below are the details of each output interface:

1. **Audio Output**  
   - **Type**: Pulse Width Modulation (PWM) signal  
   - **Description**: The system generates sound by producing a PWM signal, which is then fed to a speaker. The frequency and waveform of the signal are determined by the selected notes, octaves, and modes.  
   - **Functionality**: Converts digital inputs into audible sound, enabling real-time audio synthesis.  

2. **7-Segment Display**  
   - **Type**: 4-digit display  
   - **Description**: Displays information such as the current note, octave, and mode selection. Each digit represents a specific parameter to provide an overview of the system's current state.  
   - **Functionality**: Offers a user-friendly way to monitor the system's operation and ensure accurate input selection.  

3. **VGA Output**  
   - **Components**:  
     - **Horizontal Sync (hsync)**: Synchronizes the display's horizontal scan.  
     - **Vertical Sync (vsync)**: Synchronizes the display's vertical refresh rate.  
     - **RGB Color Signals**: 4-bit per channel for red, green, and blue colors, allowing the generation of up to 4,096 unique colors.  
   - **Description**: Provides a graphical representation of the sound synthesis process, displaying information like waveforms, notes, and modes on a VGA monitor.  
   - **Functionality**: Enhances the user experience by offering a visual representation of audio outputs and system activity.

These output interfaces collectively enable users to interact with the system effectively, delivering both auditory and visual feedback for a comprehensive experience.

#### System Architecture

![Top Module Schematic](Documents/top_module_schematic.png)


##### Components

1. **Wave Generator (`Wave_Generator.vhd`):**
   - Generates different waveforms
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


---

### Simulations and Results
- **Simulations Conducted:**
  - Functional simulation of wave generation in different modes (sine, sawtooth, triangle, etc.).
  - VGA controller simulation to verify synchronization and active area rendering.
- **Results:**
  - Verified timing and output correctness in simulation.
  - Observed accurate waveforms for audio signals.

---

### Hardware Implementation and Results
- **Input/Output Mapping:**
  - Inputs: Switches for selecting notes, octaves, and wave modes.
  - Outputs: Audio signal (via PWM), VGA display, and 7-segment display.
- **Results:**
  - Successful audio playback for selected notes.
  - Clear VGA visualization with red-highlighted active notes.
  - Correct real-time data display on 7-segment displays.

---

### Hardware Description
- **GitHub Repository:** [Link to Repository](https://github.com/DushanStefan/FPGA_sounds_synthesizer)
- **Code Organization:**
  - `srcs/sources_1/new` - Contains all VHDL source files.
  - `srcs/sim_1/new/` - Testbench files for simulation.
  - `srcs/constrs_1/new/` - XDC files for pin mapping.

---

### Module-Wise RTL Schematics
- Vga Controller module
  ![Top Module Schematic](Documents/Vga_controller_module.png)
- Segment Divider Module
  ![Top Module Schematic](Documents/Segment_divider_module.png)
- Wave Summation Module
  ![Top Module Schematic](Documents/Wave_summation_module.png)

---

### Constraints and Timing Analysis
- **Constraints:**
  - XDC file used for mapping input switches and output pins.
- **Timing Analysis:**
  - Met all timing requirements with no violations.

---

### Discussion
The project successfully demonstrated the synthesis of audio signals with real-time visualization and data display. The modular design ensured scalability and ease of debugging. Challenges included tuning the VGA synchronization and ensuring minimal jitter in audio signals.

---

### Pending Unresolved Issues and Proposed Resolutions
- **Issues:**
  - Limited wave modes currently implemented.
  - Occasional flicker in VGA display at certain frequencies.
- **Proposed Resolutions:**
  - Extend wave mode library with additional complex timbres.
  - Optimize the VGA controller for stability.

---

### Future Prospects
- Integrate MIDI input for advanced sound control.
- Add more sophisticated audio synthesis algorithms.
- Enhance VGA visualization with dynamic animations.

---

### References
- Element14 Community. (n.d.). *Building FPGA-based music instrument synthesis: A simple test bench solution*. Retrieved December 14, 2024, from [https://community.element14.com/challenges-projects/project14/musictime/b/blog/posts/building-fpga-based-music-instrument-synthesis-a-simple-test-bench-solution](https://community.element14.com/challenges-projects/project14/musictime/b/blog/posts/building-fpga-based-music-instrument-synthesis-a-simple-test-bench-solution)
- Digilent. (n.d.). *Basys 3 reference manual*. Retrieved December 14, 2024, from [https://digilent.com/reference/programmable-logic/basys-3/reference-manual?srsltid=AfmBOorIo4y9iTcDXtzfjdwfg7c7GRB07hIPlkTTn2yKmJZE8aBkN8qJ](https://digilent.com/reference/programmable-logic/basys-3/reference-manual?srsltid=AfmBOorIo4y9iTcDXtzfjdwfg7c7GRB07hIPlkTTn2yKmJZE8aBkN8qJ)
- GitHub. (n.d.). *FPGA-Synthesizer*. Retrieved December 14, 2024, from [https://github.com/kiran2s/FPGA-Synthesizer](https://github.com/kiran2s/FPGA-Synthesizer)


