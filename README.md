# 1 实验描述
通过门级、三态门、数据流、行为级四种 Verilog HDL 描述方式实现2 选 1 多路选择器，完成代码编写、逻辑综合、RTL 电路查看、Modelsim 仿真、FPGA 硬件下载验证，对比不同描述风格的代码、电路与仿真结果的异同。
# 2 代码(2.1)
## 2.1 顶层文件

```Verilog

module yxh_2690_2_1(A, B, SEL, L);
input A, B, SEL; //定义输入信号
output L; //定义输出信号
wire selnot, A1, B1 ; //定义内部节点信号数据类型
not U1(selnot, SEL);
and U2(A1, A, selnot);
and U3(B1, B, SEL);
or U4(L, A1, B1);
endmodule

```
## 2.2测试文件

```Verilog

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

```
# 3 仿真波形

# 4 引脚分配
