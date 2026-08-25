`include "apb_master.v"  // Include the master module
`include "apb_slave.v"   // Include the slave module

module apb_top (
    input wire pclk,                    // Clock signal
    input wire presetn,                 // Active-low reset
    input wire transfer,                // Signal to start transfer
    input wire read,                    // Read control signal
    input wire write,                   // Write control signal
    input wire [8:0] apb_write_paddr,   // Write address from master
    input wire [7:0] apb_write_data,    // Write data from master
    input wire [8:0] apb_read_paddr,    // Read address from master
    output wire pslverr,                // Slave error signal
    output wire [7:0] apb_read_data_out // Data output during read
);

    // Internal wires to connect master and slaves
    wire penable;                 // Enable signal
    wire pwrite;                  // Write control signal
    wire [8:0] paddr;             // Address bus
    wire [7:0] pwdata;            // Write data bus
    wire [7:0] prdata1, prdata2;  // Read data from slaves
    wire [7:0] prdata_mux;        // Multiplexed read data
    wire pready1, pready2, pready; // Ready signals
    wire pslverr1, pslverr2;      // Error signals from slaves
    wire psel1, psel2;            // Slave select signals

    // Multiplex read data based on active slave selection
    assign prdata_mux = psel2 ? prdata2 : prdata1;

    // Combine error signals from slaves
    assign pslverr = (psel1 && pslverr1) || (psel2 && pslverr2);

    // Combine ready signals from slaves
    assign pready = (psel1 && pready1) || (psel2 && pready2);

    // Master instance
    apb_master master_inst (
        .presetn(presetn),
        .pclk(pclk),
        .transfer(transfer),
        .read(read),
        .write(write),
        .apb_write_paddr(apb_write_paddr),
        .apb_read_paddr(apb_read_paddr),
        .apb_write_data(apb_write_data),
        .pready(pready),
        .pslverr(pslverr),
        .prdata(prdata_mux), // Pass multiplexed read data to master
        .psel1(psel1),
        .psel2(psel2),
        .penable(penable),
        .paddr(paddr),
        .pwrite(pwrite),
        .pwdata(pwdata),
        .apb_read_data_out(apb_read_data_out)
    );

    // Slave 1 instance
    apb_slave slave1_inst (
        .pclk(pclk),
        .presetn(presetn),
        .psel(psel1),
        .penable(penable),
        .pwrite(pwrite),
        .paddr(paddr[7:0]), // Addressing within slave 1 memory range
        .pwdata(pwdata),
        .prdata(prdata1),
        .pready(pready1),
        .pslverr(pslverr1)
    );

    // Slave 2 instance
    apb_slave slave2_inst (
        .pclk(pclk),
        .presetn(presetn),
        .psel(psel2),
        .penable(penable),
        .pwrite(pwrite),
        .paddr(paddr[7:0]), // Addressing within slave 2 memory range
        .pwdata(pwdata),
        .prdata(prdata2),
        .pready(pready2),
        .pslverr(pslverr2)
    );

endmodule
