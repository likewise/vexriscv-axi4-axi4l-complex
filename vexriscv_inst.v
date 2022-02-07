`timescale 1ns/1ps 
/*
Without the debug plugin, the CPU will have a standard clk input and a reset input.

But with the debug plugin the situation is the following:
clk: as before, the clock which drives the whole CPU design, including the debug logic
reset: reset all the CPU states except the debug logic
debugReset: reset the debug logic of the CPU
debug_resetOut: a CPU output signal which allows the JTAG to reset the CPU + the memory interconnect + the peripherals
So here is the reset interconnect, in case you use the debug plugin:

                                VexRiscv
                            +------------------+
                            |                  |
toplevelReset >----+--------> debugReset       |
                   |        |                  |
                   |  +-----< debug_resetOut   |
                   |  |     |                  |
                   +--or>-+-> reset            |
                          | |                  |
                          | +------------------+
                          |
                          +-> Interconnect / Peripherals
*/

wire cpu_reset, reset_debug, debug_reset;

always @* begin
  // CPU can be reset either by SoC complex reset or from debug module
  cpu_reset <= soc_top_reset | debug_reset;
  // debug module is reset once the whole SoC complex is reset
  reset_debug <= soc_top_reset;
end

VexRiscvAxi4 cpu_inst                   (
  .clk                                  (cpu_clk), //  input               
  .reset                                (cpu_reset), //  input               
  .debugReset                           (reset_debug) //  input               
  .debug_resetOut                       (debug_reset), //  output              

  .timerInterrupt                       (cpu_timer_int), //  input               
  .externalInterrupt                    (cpu_ext_int), //  input               
  .softwareInterrupt                    (cpu_sw_int), //  input               
  
  .iBusAxi_ar_valid                     (cpui_arvalid), //  output              
  .iBusAxi_ar_ready                     (cpui_arready), //  input               
  .iBusAxi_ar_payload_addr              (cpui_araddr), //  output     [31:0]   
  .iBusAxi_ar_payload_id                (cpui_arid), //  output     [0:0]    
  .iBusAxi_ar_payload_region            (cpui_arregion), //  output     [3:0]    
  .iBusAxi_ar_payload_len               (cpui_arlen), //  output     [7:0]    
  .iBusAxi_ar_payload_size              (cpui_arsize), //  output     [2:0]    
  .iBusAxi_ar_payload_burst             (cpui_arburst), //  output     [1:0]    
  .iBusAxi_ar_payload_lock              (cpui_arlock), //  output     [0:0]    
  .iBusAxi_ar_payload_cache             (cpui_arcache), //  output     [3:0]    
  .iBusAxi_ar_payload_qos               (cpui_arqos), //  output     [3:0]    
  .iBusAxi_ar_payload_prot              (cpui_arprot), //  output     [2:0]    
  .iBusAxi_r_valid                      (cpui_rvalid), //  input               
  .iBusAxi_r_ready                      (cpui_rready), //  output              
  .iBusAxi_r_payload_data               (cpui_rdata), //  input      [31:0]   
  .iBusAxi_r_payload_id                 (cpui_rid), //  input      [0:0]    
  .iBusAxi_r_payload_resp               (cpui_rresp), //  input      [1:0]    
  .iBusAxi_r_payload_last               (cpui_rlast), //  input               

  .dBusAxi_aw_valid                     (cpud_awvalid), //  output              
  .dBusAxi_aw_ready                     (cpud_awready), //  input               
  .dBusAxi_aw_payload_addr              (cpud_awaddr), //  output     [31:0]   
  .dBusAxi_aw_payload_id                (cpud_awid), //  output     [0:0]    
  .dBusAxi_aw_payload_region            (cpud_awregion), //  output     [3:0]    
  .dBusAxi_aw_payload_len               (cpud_awlen), //  output     [7:0]    
  .dBusAxi_aw_payload_size              (cpud_awsize), //  output     [2:0]    
  .dBusAxi_aw_payload_burst             (cpud_awburst), //  output     [1:0]    
  .dBusAxi_aw_payload_lock              (cpud_awlock), //  output     [0:0]    

  .dBusAxi_aw_payload_cache             (cpud_awcache), //  output     [3:0]    
  .dBusAxi_aw_payload_qos               (cpud_awqos), //  output     [3:0]    
  .dBusAxi_aw_payload_prot              (cpud_awprot), //  output     [2:0]    
  .dBusAxi_w_valid                      (cpud_wvalid), //  output              
  .dBusAxi_w_ready                      (cpud_wready), //  input               
  .dBusAxi_w_payload_data               (cpud_wdata), //  output     [31:0]   
  .dBusAxi_w_payload_strb               (cpud_wstrb), //  output     [3:0]    
  .dBusAxi_w_payload_last               (cpud_wlast), //  output              
  .dBusAxi_b_valid                      (cpud_bvalid), //  input               
  .dBusAxi_b_ready                      (cpud_bready), //  output              
  .dBusAxi_b_payload_id                 (cpud_bid), //  input      [0:0]    
  .dBusAxi_b_payload_resp               (cpud_bresp), //  input      [1:0]    
  .dBusAxi_ar_valid                     (cpud_arvalid), //  output              
  .dBusAxi_ar_ready                     (cpud_arready), //  input               
  .dBusAxi_ar_payload_addr              (cpud_araddr), //  output     [31:0]   
  .dBusAxi_ar_payload_id                (cpud_arid), //  output     [0:0]    
  .dBusAxi_ar_payload_region            (cpud_arregion), //  output     [3:0]    
  .dBusAxi_ar_payload_len               (cpud_arlen), //  output     [7:0]    
  .dBusAxi_ar_payload_size              (cpud_arsize), //  output     [2:0]    
  .dBusAxi_ar_payload_burst             (cpud_arburst), //  output     [1:0]    
  .dBusAxi_ar_payload_lock              (cpud_arlock), //  output     [0:0]    
  .dBusAxi_ar_payload_cache             (cpud_arcache), //  output     [3:0]    
  .dBusAxi_ar_payload_qos               (cpud_arqos), //  output     [3:0]    
  .dBusAxi_ar_payload_prot              (cpud_arprot), //  output     [2:0]    
  .dBusAxi_r_valid                      (cpud_rvalid), //  input               
  .dBusAxi_r_ready                      (cpud_rready), //  output              
  .dBusAxi_r_payload_data               (cpud_rdata), //  input      [31:0]   
  .dBusAxi_r_payload_id                 (cpud_rid), //  input      [0:0]    
  .dBusAxi_r_payload_resp               (cpud_rresp), //  input      [1:0]    
  .dBusAxi_r_payload_last               (cpud_rlast), //  input               

  .jtag_tms             (cpu_jtag_tms), //  input               
  .jtag_tdi             (cpu_jtag_tdi), //  input               
  .jtag_tdo             (cpu_jtag_tdo), //  output              
  .jtag_tck             (cpu_jtag_tck) //  input               
);