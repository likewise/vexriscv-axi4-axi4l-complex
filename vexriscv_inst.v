// Generator : SpinalHDL v1.6.1    git head : 3bf789d53b1b5a36974196e2d591342e15ddf28c
// Component : VexRiscvAxi4
// Git hash  : 7d9a50357ffb37d3bf5125a61245a9f69d5ff76c

`timescale 1ns/1ps 

VexRiscvAxi4 cpu_inst (
  .debug_resetOut(cpu_), //  output              
  .timerInterrupt(cpu_), //  input               
  .externalInterrupt(cpu_), //  input               
  .softwareInterrupt(cpu_), //  input               
  
  .iBusAxi_ar_valid(cpu_arvalid), //  output              
  .iBusAxi_ar_ready(cpu_arready), //  input               
  .iBusAxi_ar_payload_addr(cpu_araddr), //  output     [31:0]   
  .iBusAxi_ar_payload_id(cpu_arid), //  output     [0:0]    
  .iBusAxi_ar_payload_region(cpu_arregion), //  output     [3:0]    
  .iBusAxi_ar_payload_len(cpu_arlen), //  output     [7:0]    
  .iBusAxi_ar_payload_size(cpu_arsize), //  output     [2:0]    
  .iBusAxi_ar_payload_burst(cpu_arburst), //  output     [1:0]    
  .iBusAxi_ar_payload_lock(cpu_arlock), //  output     [0:0]    
  .iBusAxi_ar_payload_cache(cpu_arcache), //  output     [3:0]    
  .iBusAxi_ar_payload_qos(cpu_arqos), //  output     [3:0]    
  .iBusAxi_ar_payload_prot(cpu_arprot), //  output     [2:0]    
  .iBusAxi_r_valid(cpu_rvalid), //  input               
  .iBusAxi_r_ready(cpu_rready), //  output              
  .iBusAxi_r_payload_data(cpu_rdata), //  input      [31:0]   
  .iBusAxi_r_payload_id(cpu_rid), //  input      [0:0]    
  .iBusAxi_r_payload_resp(cpu_rresp), //  input      [1:0]    
  .iBusAxi_r_payload_last(cpu_rlast), //  input               

  .dBusAxi_aw_valid(cpud_awvalid), //  output              
  .dBusAxi_aw_ready(cpud_awready), //  input               
  .dBusAxi_aw_payload_addr(cpud_awaddr), //  output     [31:0]   
  .dBusAxi_aw_payload_id(cpud_awid), //  output     [0:0]    
  .dBusAxi_aw_payload_region(cpud_awregion), //  output     [3:0]    
  .dBusAxi_aw_payload_len(cpud_awlen), //  output     [7:0]    
  .dBusAxi_aw_payload_size(cpud_awsize), //  output     [2:0]    
  .dBusAxi_aw_payload_burst(cpud_awburst), //  output     [1:0]    
  .dBusAxi_aw_payload_lock(cpud_awlock), //  output     [0:0]    
  .dBusAxi_aw_payload_cache(cpud_), //  output     [3:0]    
  .dBusAxi_aw_payload_qos(cpud_), //  output     [3:0]    
  .dBusAxi_aw_payload_prot(cpud_), //  output     [2:0]    
  .dBusAxi_w_valid(cpud_), //  output              
  .dBusAxi_w_ready(cpud_), //  input               
  .dBusAxi_w_payload_data(cpud_), //  output     [31:0]   
  .dBusAxi_w_payload_strb(cpud_), //  output     [3:0]    
  .dBusAxi_w_payload_last(cpud_), //  output              
  .dBusAxi_b_valid(cpud_), //  input               
  .dBusAxi_b_ready(cpud_), //  output              
  .dBusAxi_b_payload_id(cpud_), //  input      [0:0]    
  .dBusAxi_b_payload_resp(cpud_), //  input      [1:0]    
  .dBusAxi_ar_valid(cpud_), //  output              
  .dBusAxi_ar_ready(cpud_), //  input               
  .dBusAxi_ar_payload_addr(cpud_), //  output     [31:0]   
  .dBusAxi_ar_payload_id(cpud_), //  output     [0:0]    
  .dBusAxi_ar_payload_region(cpud_), //  output     [3:0]    
  .dBusAxi_ar_payload_len(cpud_), //  output     [7:0]    
  .dBusAxi_ar_payload_size(cpud_), //  output     [2:0]    
  .dBusAxi_ar_payload_burst(cpud_), //  output     [1:0]    
  .dBusAxi_ar_payload_lock(cpud_), //  output     [0:0]    
  .dBusAxi_ar_payload_cache(cpud_), //  output     [3:0]    
  .dBusAxi_ar_payload_qos(cpud_), //  output     [3:0]    
  .dBusAxi_ar_payload_prot(cpud_), //  output     [2:0]    
  .dBusAxi_r_valid(cpud_), //  input               
  .dBusAxi_r_ready(cpud_), //  output              
  .dBusAxi_r_payload_data(cpud_), //  input      [31:0]   
  .dBusAxi_r_payload_id(cpud_), //  input      [0:0]    
  .dBusAxi_r_payload_resp(cpud_), //  input      [1:0]    
  .dBusAxi_r_payload_last(cpud_), //  input               

  .jtag_tms(cpu_), //  input               
  .jtag_tdi(cpu_), //  input               
  .jtag_tdo(cpu_), //  output              
  .jtag_tck(cpu_), //  input               
  .clk(cpu_), //  input               
  .reset(cpu_), //  input               
  .debugReset //  input               
);