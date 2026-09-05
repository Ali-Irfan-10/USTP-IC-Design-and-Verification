# Module 04: ASIC Physical Design (RTL-to-GDSII)

This module covers the complete physical design flow from Verilog RTL to clean sign-off GDSII layouts. All designs are implemented on the open-source **SkyWater 130nm (`sky130A`)** process node using automated RTL-to-GDSII physical implementation flows driven by **LibreLane / OpenLane**.

---

## 🛠 Flow & EDA Toolchain

The physical design workflow transitions through timing-driven synthesis, floorplanning, placement, clock tree synthesis, routing, and physical verification sign-off:

* **PDK:** SkyWater 130nm (`sky130A`) with high-density standard cells (`sky130_fd_sc_hd`)
* **Flow Runner:** LibreLane / OpenLane
* **Synthesis & Logic Optimization:** Yosys & ABC
* **Floorplanning, Placement & CTS:** OpenROAD (TritonCTS)
* **Routing:** FastRoute (Global Routing) & TritonRoute (Detailed Routing)
* **Static Timing Analysis (STA):** OpenSTA
* **Physical Verification & Sign-off:** Magic (DRC) & Netgen (LVS)
* **Layout Inspection:** KLayout

---

## 📂 Sub-Projects Overview

Each folder in this directory contains the RTL sources, constraints (`.sdc`), flow configuration (`config.yaml`), testbenches, and final verification layouts for individual implementations:

* **[MACRO-MMP](./MACRO-MMP/)**  
  Multi-Macro Placement (MMP) hierarchical ASIC design integrating two hardened **SPM (Serial-Parallel Multiplier) macros** side-by-side into a top-level chip with macro floorplanning, power rings, and inter-macro routing.

* **[SPM](./SPM/)**  
  A 32-bit Serial-Parallel Multiplier utilizing pipelined delayed serial adders, verified functionally and hardened into a standalone clean hard macro / GDSII layout.

* **[RV32I-Physical-Design](./RV32I-Physical-Design/)**  
  Full RTL-to-GDSII hardening of a 32-bit single-cycle RISC-V (RV32I) processor core with timing closure and DRC/LVS sign-off.

* **[UART-Controller-RTL-to-GDSII](./UART-Controller-RTL-to-GDSII/)**  
  Full-duplex UART transceiver with an integrated baud-rate generator hardened into a standard cell ASIC layout.

---

