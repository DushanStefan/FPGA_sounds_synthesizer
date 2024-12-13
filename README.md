# FPGA Sound Synthesizer
## Project Overview

This project is a digital sound generator system implemented on an FPGA. It integrates sound synthesis, VGA output, and 7-segment display control for an interactive musical experience. The goal is to create a platform that produces various musical notes based on user input, offering visual feedback on a VGA monitor and a 7-segment display. Users can select notes, octaves, and modes, which are converted into sound signals using Pulse Width Modulation (PWM). This synthesis method generates different tones by adjusting the output signal's frequency and duty cycle, which plays through an external speaker. The project also includes a VGA controller for real-time graphics that represent selected notes and modes, alongside a 7-segment display showing the current note, octave, and mode clearly. The FPGA design ensures real-time operation and synchronization between sound and display outputs, providing a seamless user experience.

## Key Features

- **Sound Synthesis with PWM (Pulse Width Modulation)**
- **VGA Display Output**
- **7-Segment Display Control**
- **Flexible Musical Input Parameters**
- **Clock Management**
- **Scalable Design**
- **Real-Time Operation**

## System Architecture

![Top Module Schematic](Documents/top_module_schematic.png)


### Components

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

### Input Interfaces

The input interfaces of the **Digital Sound Generator** allow users to define the musical characteristics, such as notes, octaves, and sound modes. These interfaces are essential for controlling the behavior of the system and enabling the generation of customized sound outputs. Below is an overview of the input interfaces and their functionalities:

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


### Output Interfaces

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


## Wave Modes

The **Digital Sound Generator** supports multiple wave modes, enabling users to produce a variety of sound tones and timbres. Each mode is designed to cater to different auditory preferences and musical needs. Below are the available wave modes:

1. **Sine Wave**  
   - **Description**: Produces a smooth and pure tone, often used in basic sound synthesis and testing audio equipment.  
   - **Characteristics**: A single frequency with no harmonics, resulting in a clean sound.

2. **Sawtooth Wave**  
   - **Description**: Generates a wave with a ramp-up and abrupt drop, creating a bright and sharp tone.  
   - **Characteristics**: Rich in harmonics, commonly used in electronic music and synthesizers.

3. **Triangle Wave**  
   - **Description**: Offers a linear rise and fall, creating a soft and mellow tone.  
   - **Characteristics**: Contains odd harmonics, with progressively less amplitude, giving a warm sound.

4. **Violin Timbre**  
   - **Description**: Simulates the sound of a violin, adding a rich and expressive character to the output.  
   - **Characteristics**: Mimics the harmonic spectrum and dynamics of a violin for musical applications.

5. **Saxophone Timbre**  
   - **Description**: Recreates the distinctive tonal quality of a saxophone, delivering a smooth and resonant sound.  
   - **Characteristics**: Includes dynamic harmonics and subtle variations to mimic a saxophone's acoustics.

6. **Flute Timbre**  
   - **Description**: Produces a sound resembling a flute, offering a light and airy tone.  
   - **Characteristics**: Features a simple harmonic structure with minimal overtones for a clear, melodic sound.

These wave modes provide versatility in sound generation, enabling a wide range of applications from basic testing to advanced musical synthesis.


## Visualization Details

The **Visualization Module** dynamically represents the input sound parameters on a VGA display. The visual output is structured as follows:

- **Horizontal Axis**: Represents the notes, spanning from C to B. Each note is mapped to a specific position along this axis.  
- **Vertical Axis**: Represents the octaves, ranging from 0 to 7. Higher octaves are displayed higher on the axis.  
- **Active Notes Highlighting**: Active notes are highlighted in **red**, making them easily distinguishable from inactive notes.  
- **Dynamic Color and Position**: The visual elements dynamically adjust their color and position based on the input values for notes, octaves, and modes.  

This visualization provides an intuitive and real-time representation of the system's audio output, enhancing user interaction and debugging capabilities.

## Usage

### Hardware Requirements

- **FPGA Development Board**: Required to deploy the VHDL-based design.
- **VGA Monitor**: Used to visualize notes and octaves.
- **Audio Output Device**: Listen to the generated sound signals.

### Usage

1. **Select Notes**: Use input switches to select the desired musical notes.
2. **Choose Octave Range**: Adjust the octave using the dedicated inputs.
3. **Select Wave Mode**: Configure the wave type to produce different timbres.
4. **Observe Output**: Listen to the generated audio and view the real-time visualization on the VGA display.

### Implementation Notes

- **Programming Language**: The system is implemented entirely in VHDL.
- **Standard Libraries**: Utilizes IEEE standard libraries for digital design.
- **Modular Design**: Organized with component-based architecture for ease of maintenance and scalability.
- **Real-Time Feedback**: Provides immediate audio and visual feedback based on user input.

### Future Improvements

- **Additional Wave Modes**: Extend the range of available waveforms for more sound variety.
- **Enhanced Visualization**: Improve the visual representation with more advanced graphics techniques.
- **Complex Audio Synthesis**: Incorporate sophisticated algorithms for richer and more diverse sound generation.


