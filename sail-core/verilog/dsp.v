

module dsp(A, B, output_add, output_sub, carry_out);

    input [31:0] A;
    input [31:0] B;

    output wire [31:0] output_add;
    output wire [31:0] output_sub;
    output wire carry_out;


    SB_MAC16 i_sbmac16_add
	(
		.A(A[31 : 16]),
		.B(A[15 : 0]),
		.C(B[31 : 16]),
		.D(B[15 : 0]),
		.O(output_add),
		.CLK(),
		.CE(1'b0),
		.IRSTTOP(1'b0),
		.IRSTBOT(1'b0),
		.ORSTTOP(1'b0),
		.ORSTBOT(1'b0),
		.AHOLD(1'b0),
		.BHOLD(1'b0),
		.CHOLD(1'b0),
		.DHOLD(1'b0),
		.OHOLDTOP(1'b0),
		.OHOLDBOT(1'b0),
		.OLOADTOP(1'b0),
		.OLOADBOT(1'b0),
		.ADDSUBTOP(1'b0),
		.ADDSUBBOT(1'b0),
		.CO(),
		.CI(1'b0),
		.ACCUMCI(1'b0),
		.ACCUMCO(),
		.SIGNEXTIN(1'b0),
		.SIGNEXTOUT()
	);

	SB_MAC16 i_sbmac16_sub
	(
		.A(B[31 : 16]),
		.B(B[15 : 0]),
		.C(A[31 : 16]),
		.D(A[15 : 0]),
		.O(output_sub),
		.CLK(),
		.CE(1'b0),
		.IRSTTOP(1'b0),
		.IRSTBOT(1'b0),
		.ORSTTOP(1'b0),
		.ORSTBOT(1'b0),
		.AHOLD(1'b0),
		.BHOLD(1'b0),
		.CHOLD(1'b0),
		.DHOLD(1'b0),
		.OHOLDTOP(1'b0),
		.OHOLDBOT(1'b0),
		.OLOADTOP(1'b0),
		.OLOADBOT(1'b0),
		.ADDSUBTOP(1'b1),
		.ADDSUBBOT(1'b1),
		.CO(carry_out),
		.CI(1'b0),
		.ACCUMCI(1'b0),
		.ACCUMCO(),
		.SIGNEXTIN(1'b0),
		.SIGNEXTOUT()
	);

	defparam i_sbmac16_add.NEG_TRIGGER = 1'b0;
	defparam i_sbmac16_add.C_REG = 1'b0;
	defparam i_sbmac16_add.A_REG = 1'b0;
	defparam i_sbmac16_add.B_REG = 1'b0;
	defparam i_sbmac16_add.D_REG = 1'b0;

	defparam i_sbmac16_add.TOP_8x8_MULT_REG = 1'b0;
	defparam i_sbmac16_add.BOT_8x8_MULT_REG = 1'b0;
	defparam i_sbmac16_add.PIPELINE_16x16_MULT_REG1 = 1'b0;
	defparam i_sbmac16_add.PIPELINE_16x16_MULT_REG2 = 1'b0;

	defparam i_sbmac16_add.TOPOUTPUT_SELECT = 2'b00;
	defparam i_sbmac16_add.TOPADDSUB_LOWERINPUT = 2'b00;
	defparam i_sbmac16_add.TOPADDSUB_UPPERINPUT = 1'b1;
	defparam i_sbmac16_add.TOPADDSUB_CARRYSELECT = 2'b10;
	defparam i_sbmac16_add.BOTOUTPUT_SELECT = 2'b00;
	defparam i_sbmac16_add.BOTADDSUB_LOWERINPUT = 2'b00;
	defparam i_sbmac16_add.BOTADDSUB_UPPERINPUT = 1'b1;
	defparam i_sbmac16_add.BOTADDSUB_CARRYSELECT = 2'b00;
	defparam i_sbmac16_add.MODE_8x8 = 1'b1;
	defparam i_sbmac16_add.A_SIGNED = 1'b0;
	defparam i_sbmac16_add.B_SIGNED = 1'b0;

	defparam i_sbmac16_sub.NEG_TRIGGER = 1'b0;
	defparam i_sbmac16_sub.C_REG = 1'b0;
	defparam i_sbmac16_sub.A_REG = 1'b0;
	defparam i_sbmac16_sub.B_REG = 1'b0;
	defparam i_sbmac16_sub.D_REG = 1'b0;

	defparam i_sbmac16_sub.TOP_8x8_MULT_REG = 1'b0;
	defparam i_sbmac16_sub.BOT_8x8_MULT_REG = 1'b0;
	defparam i_sbmac16_sub.PIPELINE_16x16_MULT_REG1 = 1'b0;
	defparam i_sbmac16_sub.PIPELINE_16x16_MULT_REG2 = 1'b0;

	defparam i_sbmac16_sub.TOPOUTPUT_SELECT = 2'b00;
	defparam i_sbmac16_sub.TOPADDSUB_LOWERINPUT = 2'b00;
	defparam i_sbmac16_sub.TOPADDSUB_UPPERINPUT = 1'b1;
	defparam i_sbmac16_sub.TOPADDSUB_CARRYSELECT = 2'b10;
	defparam i_sbmac16_sub.BOTOUTPUT_SELECT = 2'b00;
	defparam i_sbmac16_sub.BOTADDSUB_LOWERINPUT = 2'b00;
	defparam i_sbmac16_sub.BOTADDSUB_UPPERINPUT = 1'b1;
	defparam i_sbmac16_sub.BOTADDSUB_CARRYSELECT = 2'b00;
	defparam i_sbmac16_sub.MODE_8x8 = 1'b1;
	defparam i_sbmac16_sub.A_SIGNED = 1'b0;
	defparam i_sbmac16_sub.B_SIGNED = 1'b0;


endmodule