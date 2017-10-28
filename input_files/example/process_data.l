*** PROCESS DATA AND VOLTAGE LEVELS

.LIB PROCESS_DATA

* Voltage levels
.PARAM supply_v = 0.8
.PARAM sram_v = 1.0
.PARAM sram_n_v = 0.0

* Gate length
.PARAM gate_length = 22n

* We have two supply rails, vdd and vdd_subckt.
* This allows us to measure power of a circuit under test without measuring the power of wave shaping and load circuitry
VSUPPLY vdd gnd supply_v
VSUBCKT vdd_subckt gnd supply_v

* SRAM voltages connecting to gates
VSRAM vsram gnd sram_v
VSRAM_N vsram_n gnd sram_n_v

* Device models
.LIB "C:\Users\ylxiao\Desktop\FDP_Optimizer\F100_backup\coffe_v1.1\coffe_v1.1\spice_models\ptm22hp.l" 22NM_HP

.ENDL PROCESS_DATA