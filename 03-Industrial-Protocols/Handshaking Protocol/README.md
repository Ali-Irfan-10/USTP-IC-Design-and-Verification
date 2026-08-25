# Handshake Protocol in Verilog

A synchronous Master-Slave handshake flow control module interfaced with a 4-register bank (`reg0`–`reg3`) written in Verilog HDL.

## Features
- **Write Mode (`read_write = 1`)**: Synchronously writes `data_in` to the selected register on `posedge clk` when both `valid_m` and `ready_s` are asserted.
- **Read Mode (`read_write = 0`)**: Routes the selected register data to `data_out` and asserts `valid_s` when `ready_m` is high.
- **Addressing (`sel`)**: 2-bit select line to address 4 independent 8-bit registers.

## Signal Overview

| Signal | Type | Description |
| :--- | :---: | :--- |
| `clk` | Input | System Clock |
| `read_write` | Input | Operation Select (`1`: Write, `0`: Read) |
| `valid_m` / `ready_m` | Input | Master Valid & Ready signals |
| `ready_s` / `valid_s` | In / Out | Slave Ready & Valid signals |
| `sel[1:0]` | Input | Register Select (`00` to `11`) |
| `data_in[7:0]` | Input | Write data bus |
| `data_out[7:0]` | Output | Read data bus |

## Testbench Summary
The testbench (`tb_handshake_protocol.v`) verifies:
1. Writing `0xAA` into `reg0` and `0xBB` into `reg1`.
2. Reading back data from `reg0` and `reg1` via the handshake interface.

---

## 👨‍💻 Author

**Ali Irfan**

Computer Engineering | Digital IC Design & Verification

Passionate about **RTL Design, Digital IC Design, Functional Verification, FPGA Development, and ASIC Design Flows**.

Experienced with **Verilog HDL, SystemVerilog, QuestaSim, FPGA-based design, AMBA protocols, and RTL-to-GDSII workflows** using open-source ASIC tools.

This repository represents practical engineering work, hands-on learning, and continuous development in **digital hardware design and verification**.

⭐ If you find this repository useful, consider giving it a star.

