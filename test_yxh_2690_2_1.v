`timescale 1ns/1ns  // 时间单位/时间精度

module test_yxh_2690_2_1;
    // 定义输入输出信号
    reg A;
    reg B;
    reg SEL;
    wire L; 
	yxh_2690_2_1 mux(
	.A(A),
	.B(B), 
	.SEL(SEL), 
	.L(L));
    // 驱动输入信号的initial块
		initial begin
        // 初始状态：0ps时，A=0，B=0，SEL=0
			A = 0;
			B = 0;
			SEL = 0;
        //每20ns A取反一次
			forever #20 A = ~A;
		end
		initial begin
			forever #40 B = ~B;
		end
		initial begin
			forever #80 SEL = ~SEL;
		end
		initial begin
			#1000 $finish;
		end
endmodule