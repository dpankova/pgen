module pgen_top ( 
		  input OSC_50_B3B,
		  input KEY_0,
		  output [3:0] LED
		  );
   wire 		       clk_20MHz;
   
   MyPLL mypll_inst (
		     .refclk   (OSC_50_B3B),   //  refclk.clk
		     .rst      (!KEY_0),      //   reset.reset
		     .outclk_0 (clk_20MHz), // outclk0.clk
		     .locked   ()    //  locked.export
		     );
   

   // Pulse Generator 1
   wire 		       sync;
   assign LED[1] = sync;
   pgen #(	  
		  .P_CLK_FREQ_HZ(20000000),
		  .P_FREQ_HZ(2000000),
		  .P_DUTY_CYCLE_PERCENT(20),
		  .P_PHASE_DEG(360) 
		  )
   i1 (   
	  // port map - connection between master ports and signals/registers   
	  .pls(LED[0]),
	  .sync_out(sync),
	  .rst_n(KEY_0),
	  .sync_in(1'b0),
	  .clk(clk_20MHz)
	  );

   // Pulse generator 2
   pgen #(	  
		  .P_CLK_FREQ_HZ(20000000),
		  .P_FREQ_HZ(2000000),
		  .P_DUTY_CYCLE_PERCENT(20),
		  .P_PHASE_DEG(180)  
		  )
   i2 (   
	  // port map - connection between master ports and signals/registers   
	  .pls(LED[2]),
	  .sync_out(LED[3]),
	  .rst_n(KEY_0),
	  .sync_in(sync),
	  .clk(clk_20MHz)
	  );

endmodule
