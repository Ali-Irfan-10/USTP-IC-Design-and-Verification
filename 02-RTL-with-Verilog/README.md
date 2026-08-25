# Module 02: RTL Design with Verilog & FPGA Implementation

This module contains synthesizable RTL modules, behavioral testbenches, and open-source FPGA implementation flows developed using **Verilog HDL**. 

All designs are functionally verified using **Siemens QuestaSim** and physically synthesized, placed, and routed targeting the **Digilent Arty A7-100T (Xilinx Artix-7 `xc7a100tcsg324-1`)** and **Zybo** platforms via the **SymbiFlow / F4PGA** toolchain.

---

## 🛠️ Toolchain & Hardware Environment

* **HDL:** Verilog-2001
* **Simulation & Verification:** Siemens QuestaSim 2021.2_1 (Waveform analysis & stimulus generation)
* **FPGA Synthesis & Place-and-Route:** F4PGA / SymbiFlow open-source flow (`symbiflow_synth`, `symbiflow_place`)
* **Build Automation:** Custom Makefiles & `flow.json` configuration pipelines
* **Target Hardware:** Digilent Arty A7-100T FPGA (`xc7a100tcsg324-1`)
* **Pin Constraints:** Xilinx Design Constraints (`arty.xdc`)

---

## 📑 Laboratory Implementations

### Lab 01: Combinational Logic Building Blocks
RTL modeling and hardware constraint mapping for core combinational blocks:
* **1:4 Demultiplexer (`demux1_4`):** Select-line routed single data input broadcast.
* **2:4 & 3:8 Binary Decoders (`decoder2_4`, `decoder3_8`):** Enable-controlled binary-to-one-hot decoding.
* **4:2 Standard & Priority Encoders (`encoder4_2`, `pencoder4_2`):** Valid-bit signaled priority encoder evaluating active request lines.
* **2-Bit Magnitude Comparator (`comparator`):** Evaluates Greater (`gt`), Less (`lt`), and Equal (`eq`) conditions.

### Lab 02: Sequential Building Blocks, Multi-Bit ALU & Pipelined Math
Synchronous state elements, arithmetic execution engines, and multi-stage pipelined datapaths:
* **JK Flip-Flop with Synchronous Reset (`jkff_sync_reset`):** Clock-edge synchronized clear and toggle logic.
* **T Flip-Flop with Asynchronous Reset (`tff_async_reset`):** Immediate reset assert with edge-triggered toggle control.
* **8-Bit Universal Shift Register (`shift_reg_8bit`):** Features parallel load (`load`), shift enable (`enable`), and serial input (`sin`).
* **4-Bit Up/Down Counter (`up_down_counter_4bit`):** Directional counting sequence with synchronous enable.
* **32-Bit Registered ALU (`modified_alu32_register`):** Pipelined input registers performing Addition, Subtraction, Logic ops (AND, OR, XOR, NAND, NOR, XNOR), Bit Shifts (Logical Left/Right), and Increments.
* **32-Bit 2-Stage Pipelined Multiplier (`modified_pipelined_multiplier32`):** Registered input and partial product pipeline generating a 64-bit output product.

### Lab 03: Finite State Machines & Synchronous FIFO Buffer
Real-world sequential controller modeling and queue management:
* **Modified Traffic Light Controller:** Multi-state Moore FSM with pedestrian crosswalk interrupt handling.
* **Mealy Vending Machine Controller:** Coin intake ($5, $10, $15, $20) state machine dispensing goods and returning change.
* **Synchronous FIFO (`modified_synchronous_fifo`):** Circular dual-pointer memory array with parameterized depth, status flags (`full`, `empty`, `almost_full`, `almost_empty`), and concurrent read/write arbitration.

### Lab 04: VGA Controller
Digital video subsystem and memory interface:
* **640x480 @ 60Hz VGA Timing Generator:** Active display timing, horizontal/vertical sync pulses (`hsync`, `vsync`), and porch generation.
* **Clock Management Network:** Xilinx Clock Wizard / PLL wrapper scaling 100MHz system clock to 25MHz VGA pixel clock.

---

## ⚡ FPGA Build & Run Flow (F4PGA)

Each module directory contains a dedicated `Makefile`, `flow.json`, and physical pin assignment constraint (`arty.xdc`).

To synthesize and generate the bitstream for any target module:
```bash
# 1. Activate F4PGA Conda environment
export F4PGA_INSTALL_DIR=~/opt/f4pga
export FPGA_FAM="xc7"
source "$F4PGA_INSTALL_DIR/$FPGA_FAM/conda/etc/profile.d/conda.sh"
conda activate xc7

# 2. Build target module
TARGET="arty_100" make -C <module_folder_name>

---

## 👨‍💻 Author

**Ali Irfan**

Computer Engineering | Digital IC Design & Verification

Passionate about **RTL Design, Digital IC Design, Functional Verification, FPGA Development, and ASIC Design Flows**.

Experienced with **Verilog HDL, SystemVerilog, QuestaSim, FPGA-based design, AMBA protocols, and RTL-to-GDSII workflows** using open-source ASIC tools.

This repository represents practical engineering work, hands-on learning, and continuous development in **digital hardware design and verification**.

⭐ If you find this repository useful, consider giving it a star.
