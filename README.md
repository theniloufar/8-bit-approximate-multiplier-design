# Verilog-Based 8-Bit Approximate Multiplier

## Overview
This project implements a Verilog-based design of an 8-bit approximate multiplier, including both the datapath and control logic. The project simulates the behavior of reading two numbers from memory, shifting them for proper alignment, and computing their product. The design utilizes counters, shift registers, and RAM modules to perform the multiplication and store the results. A testbench is also included to verify the functionality of the system.

## Project Components
- **Datapath**: The datapath is responsible for handling the shifting and multiplication of input values from the RAM. The datapath manages multiple counters, shift registers, and performs arithmetic operations on 8-bit numbers.
- **Controller**: The control logic coordinates the flow of data between the RAM, registers, and the ALU. It manages the state transitions based on input signals such as `start`, `done`, and `wen`.
- **Testbench**: A simulation environment to verify the functionality of the design, including clock generation, reset signal management, and monitoring the output for correctness.

## Key Features
- **Shift Register**: A 16-bit shift register that shifts input numbers until their most significant bit (MSB) is 1.
- **Counter-Based Operations**: The design uses several counters to manage the state transitions, track the number of shifts, and limit operations to 8 shifts per number.
- **Multiplication Output**: The system multiplies two 8-bit numbers and stores the result in a 32-bit output RAM.
- **Testbench Simulation**: The testbench provides a 10ns clock cycle and runs simulations to verify the correctness of the design, ensuring proper data flow and correct multiplication outputs.

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/Verilog-Datapath-Controller-Multiplier.git
   ```
2. Navigate to the project directory:
   ```bash
   cd Verilog-Datapath-Controller-Multiplier
   ```
3. Compile the Verilog files using your preferred simulation software (e.g., ModelSim, Icarus Verilog):
   ```bash
   iverilog -o multiplier_top modules.v datapath2.v controller2.v TopLevel2.v TB.v
   vvp multiplier_top
   ```

## Usage

- **Verilog Modules**: The Verilog files contain the datapath (`datapath2.v`), controller (`controller2.v`), and testbench (`TB.v`).
- **Testbench**: Run the testbench to simulate the system and verify the results.

## Design Description
### Datapath
The datapath consists of:
- **RAM Input**: A RAM connected to a 4-bit counter for addressing, loading input numbers into shift registers.
- **Shift Register**: Shift registers align the input numbers by shifting left until the MSB is 1.
- **Multiplication**: The two aligned numbers are multiplied, and the result is stored in a 32-bit output RAM.
- **Zero Extension**: The multiplication result is zero-extended to fit into the 32-bit storage.

### Controller
The controller handles the following:
- **State Initialization**: Clears counters and starts the data loading process from RAM.
- **State Transition**: Controls the shifting, multiplication, and result storage through a series of states.
- **Completion**: Signals the end of the operation with the `done` signal.

### Testbench
The testbench ensures proper initialization and operation by:
- Generating a clock and reset signal.
- Starting the multiplication process.
- Monitoring the output RAM and the `done` signal.

## Simulation Results
The test cases in the testbench successfully verify the multiplication of different pairs of 8-bit numbers. The results are compared to expected outputs, confirming the correctness of the design.



 
