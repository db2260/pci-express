module LMC_tb();

	reg [2:0]GEN = 1;
	reg [4:0]LANESNUMBER;
	reg clk, reset;
	reg [511:0]LMCIn;
	reg [63:0]descramblerDataK;
	wire [511:0]LMCData;
	wire LMCValid;
	wire [63:0]LMCDataK;

	LMC #(.GEN1_PIPEWIDTH(8)) lmc(.clk(clk), .reset(reset), .GEN(GEN), .descramblerSyncHeader(2'b00), .descramblerDataValid(16'hFFFF), .LANESNUMBER(LANESNUMBER), 
									.LMCIn(LMCIn), .descramblerDataK(descramblerDataK), .LMCValid(LMCValid), .LMCDataK(LMCDataK), .LMCData(LMCData));

    always
	begin
		#50
		clk = ~clk;
	end

	always@(posedge clk)
		$monitor ("%0dns: \$monitor:GEN = %d LANESNUMBER = %d descramblerDataK = %h LMCDataK = %b LMCIn = %h LMCData = %h", $stime, GEN, LANESNUMBER, descramblerDataK, LMCDataK, LMCIn, LMCData);

	initial 
	begin
		//==== initialize clk ====
		clk = 1;
		//==== reset ====
		reset = 0;
		#50
		reset = 1;
		#50;
		//=== PIPEWIDTH = 8 & any LANESNUMBER===
		GEN = 1;
		LANESNUMBER = 8;
		descramblerDataK = 64'b1111_0000_1010_0110_1001_0011_1000_0111_1111_0000_1111_1011_0110_1001_0011_1000;
		LMCIn = 512'h01_05_0A_0E__02_06_0B_0F__03_07_0C_1A__04_08_0D_1B__05_09_0E_1C__06_10_0F_1D__07_11_1A_1E__08_12_1B_1F__09_13_1C_0E__10_14_1D_2A__11_15_1E_2B__12_16_1F_2C__13_17_2A_2D__14_18_2B_2E__15_19_2C_2F__16_20_2D_3A;
		#100;
		//=== PIPEWIDTH = 16 & LANESNUMBER = 1===
		GEN = 2;
		LANESNUMBER = 1;
		LMCIn = 512'h01_05_0A_0E__02_06_0B_0F__03_07_0C_1A__04_08_0D_1B__05_09_0E_1C__06_10_0F_1D__07_11_1A_1E__08_12_1B_1F__09_13_1C_0E__10_14_1D_2A__11_15_1E_2B__12_16_1F_2C__13_17_2A_2D__14_18_2B_2E__15_19_2C_2F__16_20_2D_3A;
		#100;
		//=== PIPEWIDTH = 16 & LANESNUMBER = 2===
		LANESNUMBER = 2;
		LMCIn = 512'h01_05_0A_0E__02_06_0B_0F__03_07_0C_1A__04_08_0D_1B__05_09_0E_1C__06_10_0F_1D__07_11_1A_1E__08_12_1B_1F__09_13_1C_0E__10_14_1D_2A__11_15_1E_2B__12_16_1F_2C__13_17_2A_2D__14_18_2B_2E__15_19_2C_2F__16_20_2D_3A;
		#100;
		//=== PIPEWIDTH = 16 & LANESNUMBER = 4===
		LANESNUMBER = 4;
		LMCIn = 512'h01_05_0A_0E__02_06_0B_0F__03_07_0C_1A__04_08_0D_1B__05_09_0E_1C__06_10_0F_1D__07_11_1A_1E__08_12_1B_1F__09_13_1C_0E__10_14_1D_2A__11_15_1E_2B__12_16_1F_2C__13_17_2A_2D__14_18_2B_2E__15_19_2C_2F__16_20_2D_3A;
		#100;
		//=== PIPEWIDTH = 16 & LANESNUMBER = 8===
		LANESNUMBER = 8;
		LMCIn = 512'h01_05_0A_0E__02_06_0B_0F__03_07_0C_1A__04_08_0D_1B__05_09_0E_1C__06_10_0F_1D__07_11_1A_1E__08_12_1B_1F__09_13_1C_0E__10_14_1D_2A__11_15_1E_2B__12_16_1F_2C__13_17_2A_2D__14_18_2B_2E__15_19_2C_2F__16_20_2D_3A;
		#100;
		//=== PIPEWIDTH = 16 & LANESNUMBER = 16===
		LANESNUMBER = 16;
		LMCIn = 512'h01_05_0A_0E__02_06_0B_0F__03_07_0C_1A__04_08_0D_1B__05_09_0E_1C__06_10_0F_1D__07_11_1A_1E__08_12_1B_1F__09_13_1C_0E__10_14_1D_2A__11_15_1E_2B__12_16_1F_2C__13_17_2A_2D__14_18_2B_2E__15_19_2C_2F__16_20_2D_3A;
		#100;
		//=== PIPEWIDTH = 32 & LANESNUMBER = 1===
		GEN = 3;
		LANESNUMBER = 1;
		LMCIn = 512'h01_05_0A_0E__02_06_0B_0F__03_07_0C_1A__04_08_0D_1B__05_09_0E_1C__06_10_0F_1D__07_11_1A_1E__08_12_1B_1F__09_13_1C_0E__10_14_1D_2A__11_15_1E_2B__12_16_1F_2C__13_17_2A_2D__14_18_2B_2E__15_19_2C_2F__16_20_2D_3A;
		#100;
		//=== PIPEWIDTH = 32 & LANESNUMBER = 2===
		LANESNUMBER = 2;
		LMCIn = 512'h01_05_0A_0E__02_06_0B_0F__03_07_0C_1A__04_08_0D_1B__05_09_0E_1C__06_10_0F_1D__07_11_1A_1E__08_12_1B_1F__09_13_1C_0E__10_14_1D_2A__11_15_1E_2B__12_16_1F_2C__13_17_2A_2D__14_18_2B_2E__15_19_2C_2F__16_20_2D_3A;
		#100;
		//=== PIPEWIDTH = 32 & LANESNUMBER = 4===
		LANESNUMBER = 4;
		LMCIn = 512'h01_05_0A_0E__02_06_0B_0F__03_07_0C_1A__04_08_0D_1B__05_09_0E_1C__06_10_0F_1D__07_11_1A_1E__08_12_1B_1F__09_13_1C_0E__10_14_1D_2A__11_15_1E_2B__12_16_1F_2C__13_17_2A_2D__14_18_2B_2E__15_19_2C_2F__16_20_2D_3A;
		#100;
		//=== PIPEWIDTH = 32 & LANESNUMBER = 8===
		LANESNUMBER = 8;
		LMCIn = 512'h01_05_0A_0E__02_06_0B_0F__03_07_0C_1A__04_08_0D_1B__05_09_0E_1C__06_10_0F_1D__07_11_1A_1E__08_12_1B_1F__09_13_1C_0E__10_14_1D_2A__11_15_1E_2B__12_16_1F_2C__13_17_2A_2D__14_18_2B_2E__15_19_2C_2F__16_20_2D_3A;
		#100;
		//=== PIPEWIDTH = 32 & LANESNUMBER = 16===
		LANESNUMBER = 16;
		LMCIn = 512'h01_05_0A_0E__02_06_0B_0F__03_07_0C_1A__04_08_0D_1B__05_09_0E_1C__06_10_0F_1D__07_11_1A_1E__08_12_1B_1F__09_13_1C_0E__10_14_1D_2A__11_15_1E_2B__12_16_1F_2C__13_17_2A_2D__14_18_2B_2E__15_19_2C_2F__16_20_2D_3A;
		#100;
		LMCIn = 0;
	end
		

endmodule
