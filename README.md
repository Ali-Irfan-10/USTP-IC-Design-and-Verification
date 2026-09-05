# Semiconductor Upskilling Training Program (USTP) — Digital IC Design & Verification

An extensive, industry-aligned semiconductor engineering portfolio documenting hands-on laboratory work, synthesizable RTL architectures, industrial bus interconnects, and ASIC signoffs.

This work was executed under the **Semiconductor Upskilling Training Program in Digital IC Design & Verification**, a national initiative by the **Pakistan Software Export Board (PSEB)** and **Ministry of IT & Telecom (Tech Nation Pakistan)**, led by **NED University of Engineering & Technology** in academic collaboration with **UIT University** and **Sir Syed University of Engineering & Technology (SSUET)**.

---

## 🏛️ Program Tracks & Modular Architecture

The training program was structured into 7 rigorous tracks spanning front-end RTL design, industrial protocol modeling, object-oriented functional verification, and back-end physical design:

| **Module Directory**                 | **Track Title**                        | **Technical Scope & Implementations**                                                                                                                       | **Status**      |
| ------------------------------------ | -------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------- |
| **`01-Digital-Logic-Design/`**       | **Digital Logic Design (DLD)**         | Gate-level minimization, K-Maps, arithmetic units, Mealy/Moore FSMs, multi-stage cascaded counters, and 24-hour digital clock.                              | **Completed**   |
| **`02-RTL-with-Verilog/`**           | **RTL Modeling & FPGA Flow**           | Synthesizable Verilog-2001, parameterized synchronous FIFOs, pipelined ALUs/multipliers, VGA timing controller, and open-source F4PGA flow on Arty A7-100T. | **Completed**   |
| **`03-Industrial-Protocols/`**       | **SoC Interconnects & Buses**          | System architecture and verification of **AMBA AHB-Lite**, **AMBA APB**, **AMBA AXI4-Lite**, **DMA** controllers, and 4-phase handshaking.                  | **Completed**   |
| **`04-Data-Structures-OOP-C++/`**    | **C++ Hardware Simulation**            | Object-oriented programming, set-associative cache simulators, memory subsystem modeling, and performance evaluation.                                       | **In Progress** |
| **`05-SystemVerilog-Verification/`** | **Advanced Verification (SV)**         | SystemVerilog OOP testbenches, interfaces, clocking blocks, Constrained Random Verification (CRV), and Assertions (SVA).                                    | **In Progress** |
| **`06-UVM-Verification/`**           | **Universal Verification Methodology** | Standard UVM testbench architecture: sequences, drivers, monitors, agents, scoreboards, and functional coverage models.                                     | **Coming Soon** |
| **`07-ASIC-Physical-Design/`**       | **RTL-to-GDSII Physical Flow**         | LibreLane/OpenLane flow, floorplanning, PDN generation, CTS, detailed routing, multi-corner STA signoff, Magic DRC, and Netgen LVS.                         | **Coming Soon** |

---

## 🛠️ EDA Tools & Technology Stack

### HDLs & Verification

* Verilog-2001
* SystemVerilog (IEEE 1800)
* UVM (IEEE 1800.2)
* C++17

### Logic Simulation & Debug

* Siemens QuestaSim
* ModelSim
* Icarus Verilog
* GTKWave

### FPGA Prototyping

* Digilent Arty A7-100T
* Xilinx Artix-7 `xc7a100tcsg324-1`
* F4PGA / SymbiFlow
* Xilinx Vivado

### ASIC Physical Design Flow

* LibreLane / OpenLane
* Yosys — RTL Synthesis
* OpenROAD — Place & Route, CTS, and STA
* Magic — DRC
* Netgen — LVS
* KLayout — Layout Visualization

### Target Process Node

**SkyWater 130nm High-Density CMOS**

```text
sky130_fd_sc_hd
```

---

## 📂 Repository Navigation

```text
USTP-IC-Design-and-Verification/
│
├── 01-Digital-Logic-Design/
│   ├── Week-01-Boolean-Algebra-and-KMap/
│   ├── Week-02-Combinational-Logic-and-ALU/
│   ├── Week-03-Sequential-Logic-and-Counters/
│   └── Week-04-FSM-and-Digital-Clock/
│
├── 02-RTL-with-Verilog/
│   ├── Week-01-Combinational-Building-Blocks/
│   ├── Week-02-Sequential-Units-and-Arithmetic/
│   ├── Week-03-FSM-and-Synchronous-FIFO/
│   └── Week-04-VGA-Controller/
│
├── 03-Industrial-Protocols/
│   ├── AMBA-AHB/
│   ├── AMBA-APB/
│   ├── AMBA-AXI-Lite/
│   ├── DMA/
│   └── Handshaking-Protocol/
│
├── 04-ASIC-Physical-Design/
│   ├── MACRO-MMP/
│   ├── RV32I-Physical-Design/
│   ├── SPM/
│   └── UART-Controller/
│
├── 05-SystemVerilog-Verification/
│
├── 06-UVM-Verification/
│
├── .gitignore
└── README.md
```

---

## 🔬 Core Engineering Areas

This portfolio covers practical work across multiple layers of the digital IC design stack:

* **Digital Logic Design**
* **RTL Design & Modeling**
* **Finite State Machine Design**
* **Synchronous FIFO Architecture**
* **Arithmetic & Pipelined Datapaths**
* **FPGA Prototyping**
* **AMBA Bus Protocols**
* **SoC Interconnect Architecture**
* **DMA-Based Data Movement**
* **SystemVerilog Functional Verification**
* **UVM-Based Verification**
* **C++ Hardware Simulation**
* **ASIC Physical Design**
* **RTL-to-GDSII Implementation**
* **Static Timing Analysis**
* **DRC & LVS Signoff**

---

## 📊 Design & Verification Flow

```text
Specification
      │
      ▼
Digital Logic Design
      │
      ▼
RTL Architecture
      │
      ▼
Verilog / SystemVerilog
      │
      ├──────────────► Simulation & Debugging
      │                       │
      │                       ▼
      │                Functional Verification
      │
      ▼
FPGA Prototyping
      │
      ▼
ASIC Synthesis
      │
      ▼
Floorplanning
      │
      ▼
Power Distribution Network
      │
      ▼
Clock Tree Synthesis
      │
      ▼
Placement & Routing
      │
      ▼
Static Timing Analysis
      │
      ▼
DRC / LVS / Antenna Checks
      │
      ▼
Final GDSII
```

---

## 🎯 Program Objectives

The portfolio is focused on developing practical semiconductor engineering skills through progressive hands-on implementation.

Key objectives include:

* Building a strong foundation in digital logic and computer architecture.
* Developing synthesizable RTL using industry-standard HDL practices.
* Understanding and implementing standard SoC communication protocols.
* Learning simulation-based functional verification methodologies.
* Exploring object-oriented and constrained-random verification concepts.
* Understanding FPGA prototyping and hardware validation.
* Learning open-source ASIC physical design methodologies.
* Taking RTL designs through synthesis, place-and-route, timing analysis, DRC, LVS, and GDSII generation.

---

## 🚀 Highlights

* Industry-oriented **Digital IC Design & Verification** training.
* Hands-on implementation of synthesizable RTL architectures.
* Practical experience with **AMBA AHB-Lite, APB, and AXI4-Lite** protocols.
* FPGA prototyping using **Digilent Arty A7-100T**.
* Simulation and waveform-based debugging using **QuestaSim**.
* Exposure to **SystemVerilog and UVM verification methodologies**.
* Open-source ASIC implementation using **LibreLane/OpenLane and OpenROAD**.
* Physical verification using **Magic DRC and Netgen LVS**.
* Layout inspection and analysis using **KLayout**.
* Targeting the **SkyWater 130nm CMOS process**.

---

## 👨‍💻 Author

**Ali Irfan**

*Computer Systems Engineering | Digital IC Design & Verification*

* **Focus Areas:** RTL Design, On-Chip Bus Interconnects, AMBA Protocols, SystemVerilog Verification, FPGA Prototyping, and Open-Source ASIC Physical Design Flows.
* **Core Technical Stack:** Verilog HDL, SystemVerilog, QuestaSim, LibreLane/OpenROAD, SkyWater 130nm PDK, KLayout, C++, and Linux EDA Environments.
* **Engineering Interests:** Digital IC Architecture, SoC Interconnects, Memory Systems, Processor Design, Functional Verification, and RTL-to-GDSII Implementation.

🧠 *This portfolio represents hands-on engineering work, continuous learning, and practical exploration of industry-relevant digital hardware design and verification workflows.*

⭐ *If you find these implementations useful, feel free to give the repository a star!*
