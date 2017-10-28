*** BASIC SUBCIRCUITS

.LIB BASIC_SUBCIRCUITS

******************************************************************************************
* Interconnect wire
******************************************************************************************
.SUBCKT wire n_in n_out Rw=1 Cw=1
CWIRE_1 n_in gnd Cw
RWIRE_1 n_in n_out Rw
CWIRE_2 n_out gnd Cw
.ENDS


******************************************************************************************
* Pass-transistor
******************************************************************************************
.SUBCKT ptran n_in n_out n_gate n_gnd Wn=45n
MNPASS n_in n_gate n_out n_gnd nmos L=gate_length W=Wn
.ENDS


******************************************************************************************
* Transmission gate
******************************************************************************************
.SUBCKT tgate n_in n_out n_gate_nmos n_gate_pmos n_vdd n_gnd Wn=45n Wp=45n
MNTGATE n_in n_gate_nmos n_out n_gnd nmos L=gate_length W=Wn
MPTGATE n_in n_gate_pmos n_out n_vdd pmos L=gate_length W=Wp
.ENDS


******************************************************************************************
* Level-restorer PMOS
******************************************************************************************
.SUBCKT rest n_pull n_gate n_vdd n_gnd Wp=45n
MPREST n_pull n_gate n_vdd n_vdd pmos L=gate_length W=Wp
.ENDS


******************************************************************************************
* Inverter
******************************************************************************************
.SUBCKT inv n_in n_out n_vdd n_gnd Wn=45n Wp=45n
MNDOWN n_out n_in n_gnd n_gnd nmos L=gate_length W=Wn
MPUP n_out n_in n_vdd n_vdd pmos L=gate_length W=Wp
.ENDS


.ENDL BASIC_SUBCIRCUITS