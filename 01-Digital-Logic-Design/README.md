# Module 01: Digital Logic Design (DLD)

This directory contains schematic implementations, logic optimizations, and modular circuit designs completed during the **Digital Logic Design** module of the USTP IC Design & Functional Verification program. 

The module covers the progression from foundational Boolean minimization to complex synchronous digital subsystems, including finite state machines, cascading counters, and a multi-stage digital clock.

---

## 📑 Weekly Breakdown & Circuit Index

### Week 01: Boolean Algebra & Karnaugh Mapping (K-Map)
Focused on logic simplification using algebraic identities, 3-to-5 variable Karnaugh maps, don't-care conditions, and gate-level implementation:
* **Exercise 1:** Simplification & schematic realization of 3-variable SOP expression $F(A,B,C) = A\bar{B}C + \bar{A}BC + \bar{A}\bar{B}C + \bar{A}\bar{B}\bar{C} + A\bar{B}\bar{C}$.
* **Exercise 2:** K-Map minimization for minterms $F(X,Y,Z) = \Sigma m(1, 2, 3, 5)$.
* **Exercise 3:** Product-of-Sums (POS) logic reduction and standard gate synthesis.
* **Exercise 4:** 4-variable boolean minimization: $F(A,B,C,D) = \bar{B}\bar{C}\bar{D} + \bar{A}B\bar{C}\bar{D} + \dots + A\bar{B}C\bar{D}$.
* **Exercise 5:** 4-variable K-Map optimization with Don't Care states: $F(W,X,Y,Z) = \Sigma m(1,2,5,6,9,10,13,14) + \Sigma d(0,3,7,11,15)$.
* **Exercise 6:** 5-variable logic expression reduction and gate-level optimization.

---

### Week 02: Combinational Logic Circuits & Arithmetic Units
Design and hierarchical integration of basic and complex combinational arithmetic logic blocks:
* **Adders & Subtractors:**
  * Half Adder & Full Adder using basic discrete logic gates.
  * Full Adder synthesized using 2 Half Adders + OR gate.
  * 4-Bit Ripple Carry Adder (RCA) cascading full adder stages.
  * Half Subtractor & Full Subtractor design (Difference & Borrow logic).
* **Arithmetic Logic Unit (ALU):**
  * 1-Bit Multi-operation ALU integrated with a Multiplexer (MUX) for dynamic operation selection (AND, OR, Addition, Subtraction).
* **Decoders & Challenge Circuits:**
  * BCD to 7-Segment Display Decoder.
  * Printing Job Priority Controller (Priority Encoder application).
  * Industrial Process Line Control Logic.
  * 2-Bit Magnitude Comparator ($AB \text{ vs } CD$ for Less, Equal, Greater).
  * Automated Automotive Engine Safety Interlock System.

---

### Week 03: Sequential Logic, Counters & Shift Registers
Implementation of clocked sequential elements, state transitions, counting sequences, and serial/parallel data transfers:
* **Synchronous & Asynchronous Counters:**
  * MOD-10 Decade Counter ($0 \to 9$) with synchronous reset feedback.
  * MOD-6 Counter ($0 \to 5$).
  * 3-Bit Gray Code Counter using JK Flip-Flops.
  * 3-Bit Gray Code Counter using D Flip-Flops.
  * 4-Bit Asynchronous (Ripple) Counter using JK Flip-Flops.
  * 3-Bit Up Counter using JK and D Flip-Flops.
* **Finite State Machines:**
  * Mealy State Machine sequence detector/controller.
* **Shift Register Topologies:**
  * Serial-In Serial-Out (SISO).
  * Serial-In Parallel-Out (SIPO).
  * Parallel-In Serial-Out (PISO) with MUX load/shift control.
  * Parallel-In Parallel-Out (PIPO) – 4-bit & 8-bit configurations.
  * 4-Bit & 5-Bit Ring Counters.
  * 4-Bit & 5-Bit Johnson (Twisted Ring) Counters.
  * Bidirectional Universal Circular Shift Register (Left/Right shift with MUX selection).

---

### Week 04: Advanced FSMs, Modular Cascades & Digital Clock System
Architectural integration of multi-stage sequential systems and complete digital controllers:
* **FSM Modeling:**
  * Sequence controller modeling comparing Mealy and Moore state machine behavior.
* **Synchronous vs Asynchronous Decade Counters:**
  * MOD-10 Asynchronous Decade Counter.
  * MOD-10 Synchronous Decade Counter.
* **Cascaded Systems:**
  * Cascaded MOD-100 Asynchronous Counter ($10 \times 10$ decade cascade).
  * Cascaded MOD-100 Synchronous Counter.
  * MOD-6 (Minutes/Seconds tens-place) Counter.
  * MOD-2 & MOD-10 (Hours-stage) Synchronous Counter Units.
* **System Integration — 24-Hour Digital Clock:**
  * Integrated multi-stage cascaded architecture for **Hours, Minutes, and Seconds**.
  * Connected MOD-10 and MOD-6 stages for Seconds ($00 \to 59$) and Minutes ($00 \to 59$).
  * Integrated MOD-24 boundary reset logic for the Hours stage ($00 \to 23$) driving 7-Segment display decoders.

---

## 🗂️ Directory Layout

```text
01-Digital-Logic-Design/
├── Week-01-Boolean-Algebra-and-KMap/
│   ├── Circuits/               # week_1_dld_Ali_Irfan.circ
│   └── Docs/                   # WEEK 1 DLD ALI IRFAN.pdf
├── Week-02-Combinational-Logic-and-ALU/
│   ├── Circuits/               # week_2_DLD_Ali_Irfan.circ
│   └── Docs/                   # WEEK2_DLD_ALI_IRFAN.pdf
├── Week-03-Sequential-Logic-and-Counters/
│   ├── Circuits/               # WEEK3_DLD_ALI_IRFAN.circ
│   └── Docs/                   # WEEK3_DLD_ALI_IRFAN.pdf
├── Week-04-FSM-and-Digital-Clock/
│   ├── Circuits/               # WEEK4_DLD_ALI_IRFAN.circ
│   └── Docs/                   # WEEK4_DLD_ALI_IRFAN.pdf
└── README.md                   # Module documentation & breakdown
