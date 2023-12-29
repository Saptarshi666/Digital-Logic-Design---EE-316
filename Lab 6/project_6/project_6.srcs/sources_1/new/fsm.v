`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/16/2021 04:32:45 PM
// Design Name: 
// Module Name: fsm
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module fsm(
    input [1:0] mode,
    input[7:0] preset,
    input start_stop,
    input reset,
    output  reg[3:0] ones,tens,tenth,hundred,
    input clk
    );
    reg[3:0] state;
    reg[1:0] next_state;
    reg start_stop1 = 0;
    reg[3:0] temp_one;
    reg[3:0] temp_ten;
 always @(posedge clk)
 begin
   case(start_stop)
     1'b 1 : start_stop1 <=  ~start_stop1;
  endcase
  end   
 always @(*)
 begin
   case(state)
        3'b000: begin
                if(mode == 2'b00)
                    next_state = 3'b001;
                else if(mode == 2'b01)
                    next_state = 3'b010;
                else if(mode == 2'b10)
                    next_state = 3'b011;
                else if(mode == 2'b11)
                    next_state = 3'b100;
                else if(reset)
                    next_state = 3'b000;  
                end
        3'b001: begin
                if(mode == 2'b00)
                    next_state = 3'b001;
                else if(mode == 2'b01)
                    next_state = 3'b010;
                else if(mode == 2'b10)
                    next_state = 3'b011;
                else if(mode == 2'b11)
                    next_state = 3'b100;
                else if(reset)
                    next_state = 3'b000;    
               end
        3'b010: begin
                if(mode == 2'b00)
                    next_state = 3'b001;
                else if(mode == 2'b01)
                    next_state = 3'b010;
                else if(mode == 2'b10)
                    next_state = 3'b011;
                else if(mode == 2'b11)
                    next_state = 3'b100;
                else if(reset)
                    next_state = 3'b000;    
               end       
        3'b011: begin
                if(mode == 2'b00)
                    next_state = 3'b001;
                else if(mode == 2'b01)
                    next_state = 3'b010;
                else if(mode == 2'b10)
                    next_state = 3'b011;
                else if(mode == 2'b11)
                    next_state = 3'b100;
                else if(reset)
                    next_state = 3'b000;    
                end
         3'b100: begin
                if(mode == 2'b00)
                    next_state = 3'b001;
                else if(mode == 2'b01)
                    next_state = 3'b010;
                else if(mode == 2'b10)
                    next_state = 3'b011;
                else if(mode == 2'b11)
                    next_state = 3'b100;
                else if(reset)
                    next_state = 3'b000;    
                end                
    endcase
  end
  always @(posedge clk or posedge reset)
  begin
    case(state)
        3'b000 :begin
                 ones <= 4'b0000;
                 tens <= 4'b0000;
                 tenth <= 4'b0000;
                 hundred <= 4'b0000;
          end
         3'b001 : begin
                  ones <= 4'b0000;
                 tens <= 4'b0000;
                 tenth <= 4'b0000;
                 hundred <= 4'b0000;
                 if(start_stop1 == 1'b1)
                    begin 
                     if(tens != 4'b1001)
                        begin
                          if (ones != 4'b1001)
                          begin
                               if(tenth != 4'b1001)
                                    begin
                                       if(hundred != 4'b1001)
                                            hundred <= hundred +1;
                                       else
                                       begin hundred <= 4'b0000;
                                         tenth <= tenth +1;   
                                       end
                                    end
                                else
                                    begin
                                        tenth <= 4'b0000;
                                        hundred <= 4'b0000;
                                        ones <= ones +1;
                                    end        
                              end
                             else
                                    begin
                                        tenth <= 4'b0000;
                                        hundred <= 4'b0000;
                                        ones <= 4'b0000;
                                        tens <= tens +1;
                                    end    
                        end
                        else if ( ones != 4'b1001)
                                begin
                               if(tenth != 4'b1001)
                                    begin
                                       if(hundred != 4'b1001)
                                            hundred <= hundred +1;
                                       else
                                       begin hundred <= 4'b0000;
                                         tenth <= tenth +1;   
                                       end
                                    end
                                else
                                    begin
                                        tenth <= 4'b0000;
                                        hundred <= 4'b0000;
                                        ones <= ones +1;
                                    end        
                              end
                         else if (tenth != 4'b1001)
                              begin
                                       if(hundred != 4'b1001)
                                            hundred <= hundred +1;
                                       else
                                       begin hundred <= 4'b0000;
                                         tenth <= tenth +1;   
                                       end
                                    end
                          else  if(hundred != 4'b1001)
                                            hundred <= hundred +1;                        
                    end
                 else if(reset == 1'b1)
                     begin
                      tens <= 4'b0000;
                      ones <= 4'b0000;
                      tenth <= 4'b0000;
                      hundred <= 4'b0000;
                      end     
                  end   
         3'b010:begin
                temp_one <= {preset[3],preset[2],preset[1],preset[0]};
                temp_ten <= {preset[7],preset[6],preset[5],preset[4]};
                if(temp_one <= 4'b1001)
                    ones <= temp_one;
                if(temp_ten <= 4'b1001)
                    tens <= temp_ten;
                 tenth <= 4'b0000;
                 hundred <= 4'b0000;
                   if(start_stop1 == 1'b1)
                    begin 
                     if(tens != 4'b1001)
                        begin
                          if (ones != 4'b1001)
                          begin
                               if(tenth != 4'b1001)
                                    begin
                                       if(hundred != 4'b1001)
                                            hundred <= hundred +1;
                                       else
                                       begin hundred <= 4'b0000;
                                         tenth <= tenth +1;   
                                       end
                                    end
                                else
                                    begin
                                        tenth <= 4'b0000;
                                        hundred <= 4'b0000;
                                        ones <= ones +1;
                                    end        
                              end
                             else
                                    begin
                                        tenth <= 4'b0000;
                                        hundred <= 4'b0000;
                                        ones <= 4'b0000;
                                        tens <= tens +1;
                                    end    
                        end
                        else if ( ones != 4'b1001)
                                begin
                               if(tenth != 4'b1001)
                                    begin
                                       if(hundred != 4'b1001)
                                            hundred <= hundred +1;
                                       else
                                       begin hundred <= 4'b0000;
                                         tenth <= tenth +1;   
                                       end
                                    end
                                else
                                    begin
                                        tenth <= 4'b0000;
                                        hundred <= 4'b0000;
                                        ones <= ones +1;
                                    end        
                              end
                         else if (tenth != 4'b1001)
                              begin
                                       if(hundred != 4'b1001)
                                            hundred <= hundred +1;
                                       else
                                       begin hundred <= 4'b0000;
                                         tenth <= tenth +1;   
                                       end
                                    end
                          else  if(hundred != 4'b1001)
                                            hundred <= hundred +1;                        
                    end
                 else if(reset == 1'b1)
                     begin
                      tens <= 4'b0000;
                      ones <= 4'b0000;
                      tenth <= 4'b0000;
                      hundred <= 4'b0000;
                      end      
                end
                3'b011 : begin
                 ones <= 4'b1001;
                 tens <= 4'b1001;
                 tenth <= 4'b1001;
                 hundred <= 4'b1001;
                 if(start_stop1 == 1'b1)
                    begin 
                     if(tens != 4'b0000)
                        begin
                          if (ones != 4'b0000)
                          begin
                               if(tenth != 4'b0000)
                                    begin
                                       if(hundred != 4'b0000)
                                            hundred <= hundred -1;
                                       else
                                       begin hundred <= 4'b1001;
                                         tenth <= tenth -1;   
                                       end
                                    end
                                else
                                    begin
                                        tenth <= 4'b1001;
                                        hundred <= 4'b1001;
                                        ones <= ones -1;
                                    end        
                              end
                             else
                                    begin
                                        tenth <= 4'b1001;
                                        hundred <= 4'b1001;
                                        ones <= 4'b1001;
                                        tens <= tens -1;
                                    end    
                        end
                        else if ( ones != 4'b0000)
                                begin
                               if(tenth != 4'b0000)
                                    begin
                                       if(hundred != 4'b0000)
                                            hundred <= hundred -1;
                                       else
                                       begin hundred <= 4'b1001;
                                         tenth <= tenth -1;   
                                       end
                                    end
                                else
                                    begin
                                        tenth <= 4'b1001;
                                        hundred <= 4'b1001;
                                        ones <= ones -1;
                                    end        
                              end
                         else if (tenth != 4'b0000)
                              begin
                                       if(hundred != 4'b0000)
                                            hundred <= hundred -1;
                                       else
                                       begin hundred <= 4'b1001;
                                         tenth <= tenth -1;   
                                       end
                                    end
                          else  if(hundred != 4'b1001)
                                            hundred <= hundred -1;                        
                    end
                 else if(reset == 1'b1)
                     begin
                      tens <= 4'b1001;
                      ones <= 4'b1001;
                      tenth <= 4'b1001;
                      hundred <= 4'b1001;
                      end   
          end
       3'b100:begin
                temp_one <= {preset[3],preset[2],preset[1],preset[0]};
                temp_ten <= {preset[7],preset[6],preset[5],preset[4]};
                if(temp_one <= 4'b1001)
                    ones <= temp_one;
                if(temp_ten <= 4'b1001)
                    tens <= temp_ten;
                 tenth <= 4'b0000;
                 hundred <= 4'b0000;
                   if(start_stop1 == 1'b1)
                    begin 
                     if(tens != 4'b0000)
                        begin
                          if (ones != 4'b0000)
                          begin
                               if(tenth != 4'b0000)
                                    begin
                                       if(hundred != 4'b0000)
                                            hundred <= hundred -1;
                                       else
                                       begin hundred <= 4'b0000;
                                         tenth <= tenth -1;   
                                       end
                                    end
                                else
                                    begin
                                        tenth <= 4'b1001;
                                        hundred <= 4'b1001;
                                        ones <= ones -1;
                                    end        
                              end
                             else
                                    begin
                                        tenth <= 4'b1001;
                                        hundred <= 4'b1001;
                                        ones <= 4'b1001;
                                        tens <= tens -1;
                                    end    
                        end
                        else if ( ones != 4'b0000)
                                begin
                               if(tenth != 4'b0000)
                                    begin
                                       if(hundred != 4'b0000)
                                            hundred <= hundred -1;
                                       else
                                       begin hundred <= 4'b1001;
                                         tenth <= tenth -1;   
                                       end
                                    end
                                else
                                    begin
                                        tenth <= 4'b1001;
                                        hundred <= 4'b1001;
                                        ones <= ones -1;
                                    end        
                              end
                         else if (tenth != 4'b0000)
                              begin
                                       if(hundred != 4'b0000)
                                            hundred <= hundred -1;
                                       else
                                       begin hundred <= 4'b1001;
                                         tenth <= tenth -1;   
                                       end
                                    end
                          else  if(hundred != 4'b0000)
                                            hundred <= hundred -1;                        
                    end
                 else if(reset == 1'b1)
                     begin
                      tens <= 4'b1001;
                      ones <= 4'b1001;
                      tenth <= 4'b1001;
                      hundred <= 4'b1001;
                      end   
              end                   
          endcase
          end
always @(posedge clk or posedge reset) begin
    if(reset) state <= 3'b000;
    else state <= next_state;
end                    
endmodule
