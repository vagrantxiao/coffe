.TITLE Switch block multiplexer

********************************************************************************
** Include libraries, parameters and other
********************************************************************************

.LIB "../includes.l" INCLUDES

********************************************************************************
** Setup and input
********************************************************************************

.TRAN 1p 4n SWEEP DATA=sweep_data
.OPTIONS BRIEF=1

* Input signal
VIN n_in gnd PULSE (0 supply_v 0 0 0 2n 4n)

********************************************************************************
** Measurement
********************************************************************************

* inv_sb_mux_1 delay
.MEASURE TRAN meas_inv_sb_mux_1_tfall TRIG V(Xrouting_wire_load_1.Xrouting_wire_load_tile_1.Xsb_mux_on_out.n_in) VAL='supply_v/2' RISE=1
+    TARG V(Xrouting_wire_load_1.Xrouting_wire_load_tile_1.Xsb_mux_on_out.Xsb_mux_driver.n_1_1) VAL='supply_v/2' FALL=1
.MEASURE TRAN meas_inv_sb_mux_1_trise TRIG V(Xrouting_wire_load_1.Xrouting_wire_load_tile_1.Xsb_mux_on_out.n_in) VAL='supply_v/2' FALL=1
+    TARG V(Xrouting_wire_load_1.Xrouting_wire_load_tile_1.Xsb_mux_on_out.Xsb_mux_driver.n_1_1) VAL='supply_v/2' RISE=1

* inv_sb_mux_2 delays
.MEASURE TRAN meas_inv_sb_mux_2_tfall TRIG V(Xrouting_wire_load_1.Xrouting_wire_load_tile_1.Xsb_mux_on_out.n_in) VAL='supply_v/2' FALL=1
+    TARG V(Xrouting_wire_load_2.Xrouting_wire_load_tile_1.Xsb_mux_on_out.n_in) VAL='supply_v/2' FALL=1
.MEASURE TRAN meas_inv_sb_mux_2_trise TRIG V(Xrouting_wire_load_1.Xrouting_wire_load_tile_1.Xsb_mux_on_out.n_in) VAL='supply_v/2' RISE=1
+    TARG V(Xrouting_wire_load_2.Xrouting_wire_load_tile_1.Xsb_mux_on_out.n_in) VAL='supply_v/2' RISE=1

* Total delays
.MEASURE TRAN meas_total_tfall TRIG V(Xrouting_wire_load_1.Xrouting_wire_load_tile_1.Xsb_mux_on_out.n_in) VAL='supply_v/2' FALL=1
+    TARG V(Xrouting_wire_load_2.Xrouting_wire_load_tile_1.Xsb_mux_on_out.n_in) VAL='supply_v/2' FALL=1
.MEASURE TRAN meas_total_trise TRIG V(Xrouting_wire_load_1.Xrouting_wire_load_tile_1.Xsb_mux_on_out.n_in) VAL='supply_v/2' RISE=1
+    TARG V(Xrouting_wire_load_2.Xrouting_wire_load_tile_1.Xsb_mux_on_out.n_in) VAL='supply_v/2' RISE=1

********************************************************************************
** Circuit
********************************************************************************

Xsb_mux_on_1 n_in n_1_1 vsram vsram_n vdd gnd sb_mux_on

Xrouting_wire_load_1 n_1_1 n_2_1 n_hang_1 vsram vsram_n vdd gnd routing_wire_load

Xrouting_wire_load_2 n_2_1 n_3_1 n_hang_2 vsram vsram_n vdd gnd routing_wire_load

.END