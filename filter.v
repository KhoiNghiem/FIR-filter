module filter #(
    parameter DATA_WIDTH = 16
) 
(
    input                               clk,
    input                               rst_n,
    input   signed [DATA_WIDTH-1:0]     FilterIn,
    input                               ValidIn,
    output reg signed [32:0]           data_out,
    output reg                         ValidOut
);

localparam signed [16:0] h1     =   17'b00000001010110111; 
localparam signed [16:0] h2     =   17'b00000000011111101;
localparam signed [16:0] h3     =   17'b11111101100110010;
localparam signed [16:0] h4     =   17'b11111010111110110;
localparam signed [16:0] h5     =   17'b11111100100110101;
localparam signed [16:0] h6     =   17'b00000101000001001;
localparam signed [16:0] h7     =   17'b00010010100001000;
localparam signed [16:0] h8     =   17'b00011111001011110;
localparam signed [16:0] h9     =   17'b00100100010111110;
localparam signed [16:0] h10    =   17'b00011111001011110;
localparam signed [16:0] h11    =   17'b00010010100001000;
localparam signed [16:0] h12    =   17'b00000101000001001;
localparam signed [16:0] h13    =   17'b11111100100110101;
localparam signed [16:0] h14    =   17'b11111010111110110;
localparam signed [16:0] h15    =   17'b11111101100110010; 
localparam signed [16:0] h16    =   17'b00000000011111101;
localparam signed [16:0] h17    =   17'b00000001010110111;


reg signed [15:0] data_in_0;

wire signed [15:0] data_in_delay_0_0;


wire signed [32:0] data_in_delay_1;
wire signed [32:0] data_in_delay_2;
wire signed [32:0] data_in_delay_3;
wire signed [32:0] data_in_delay_4;
wire signed [32:0] data_in_delay_5;
wire signed [32:0] data_in_delay_6;
wire signed [32:0] data_in_delay_7;
wire signed [32:0] data_in_delay_8;
wire signed [32:0] data_in_delay_9;
wire signed [32:0] data_in_delay_10;
wire signed [32:0] data_in_delay_11;
wire signed [32:0] data_in_delay_12;
wire signed [32:0] data_in_delay_13;
wire signed [32:0] data_in_delay_14;
wire signed [32:0] data_in_delay_15;
wire signed [32:0] data_in_delay_16;


wire signed [32:0] mul1;
wire signed [32:0] mul2;
wire signed [32:0] mul3;    
wire signed [32:0] mul4;
wire signed [32:0] mul5;
wire signed [32:0] mul6;    
wire signed [32:0] mul7;
wire signed [32:0] mul8;
wire signed [32:0] mul9;
wire signed [32:0] mul10;
wire signed [32:0] mul11;
wire signed [32:0] mul12;
wire signed [32:0] mul13;
wire signed [32:0] mul14;
wire signed [32:0] mul15;
wire signed [32:0] mul16;
wire signed [32:0] mul17;


wire signed [32:0] add1;
wire signed [32:0] add2;
wire signed [32:0] add3;
wire signed [32:0] add4;
wire signed [32:0] add5;
wire signed [32:0] add6;
wire signed [32:0] add7;
wire signed [32:0] add8;
wire signed [32:0] add9;
wire signed [32:0] add10;
wire signed [32:0] add11;
wire signed [32:0] add12;
wire signed [32:0] add13;
wire signed [32:0] add14;
wire signed [32:0] add15;
wire signed [32:0] add16;

reg [4:0] num_taps_and_delay;



always @(negedge clk or negedge rst_n) begin
    if (!rst_n) begin
        data_in_0 <= 0;
    end else if (ValidIn) begin
        data_in_0 <= FilterIn;
    end else begin
        data_in_0 <= 0;
    end
end


always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        ValidOut <= 0;
        data_out <= 0;
        num_taps_and_delay <= 0;
    end else if (ValidIn) begin
        ValidOut <= 1;
        data_out <= add16;
        num_taps_and_delay <= 5'd17;
    end else if (num_taps_and_delay > 1) begin
        num_taps_and_delay <= num_taps_and_delay - 1;
        ValidOut <= 1;
        data_out <= add16;
    end else begin
        ValidOut <= 0;
        data_out <= 0;
    end
end


// dff #(19) dff_input_1 (.clk(clk), .rst_n(rst_n), .d(data_in_0), .q(data_in_delay_0_0));


dff dff_0 (.clk(clk), .rst_n(rst_n), .d(mul1), .q(data_in_delay_1));

dff dff_1 (.clk(clk), .rst_n(rst_n), .d(add1), .q(data_in_delay_2));

dff dff_2 (.clk(clk), .rst_n(rst_n), .d(add2), .q(data_in_delay_3));

dff dff_3 (.clk(clk), .rst_n(rst_n), .d(add3), .q(data_in_delay_4));

dff dff_4 (.clk(clk), .rst_n(rst_n), .d(add4), .q(data_in_delay_5));

dff dff_5 (.clk(clk), .rst_n(rst_n), .d(add5), .q(data_in_delay_6));

dff dff_6 (.clk(clk), .rst_n(rst_n), .d(add6), .q(data_in_delay_7));

dff dff_7 (.clk(clk), .rst_n(rst_n), .d(add7), .q(data_in_delay_8));

dff dff_8 (.clk(clk), .rst_n(rst_n), .d(add8), .q(data_in_delay_9));

dff dff_9 (.clk(clk), .rst_n(rst_n), .d(add9), .q(data_in_delay_10));

dff dff_10 (.clk(clk), .rst_n(rst_n), .d(add10), .q(data_in_delay_11));

dff dff_11 (.clk(clk), .rst_n(rst_n), .d(add11), .q(data_in_delay_12));

dff dff_12 (.clk(clk), .rst_n(rst_n), .d(add12), .q(data_in_delay_13));

dff dff_13 (.clk(clk), .rst_n(rst_n), .d(add13), .q(data_in_delay_14));

dff dff_14 (.clk(clk), .rst_n(rst_n), .d(add14), .q(data_in_delay_15));

dff dff_15 (.clk(clk), .rst_n(rst_n), .d(add15), .q(data_in_delay_16));



assign mul1     = data_in_0 * h17; 
assign mul2     = data_in_0 * h16;
assign mul3     = data_in_0 * h15;
assign mul4     = data_in_0 * h14;
assign mul5     = data_in_0 * h13;
assign mul6     = data_in_0 * h12; 
assign mul7     = data_in_0 * h11;
assign mul8     = data_in_0 * h10;
assign mul9     = data_in_0 * h9;
assign mul10    = data_in_0 * h8;
assign mul11    = data_in_0 * h7; 
assign mul12    = data_in_0 * h6;
assign mul13    = data_in_0 * h5;
assign mul14    = data_in_0 * h4;
assign mul15    = data_in_0 * h3;
assign mul16    = data_in_0 * h2;
assign mul17    = data_in_0 * h1;


assign add1 = data_in_delay_1 + mul2;
assign add2 = data_in_delay_2 + mul3;
assign add3 = data_in_delay_3 + mul4;
assign add4 = data_in_delay_4 + mul5;
assign add5 = data_in_delay_5 + mul6;
assign add6 = data_in_delay_6 + mul7;
assign add7 = data_in_delay_7 + mul8;
assign add8 = data_in_delay_8 + mul9;
assign add9 = data_in_delay_9 + mul10;
assign add10 = data_in_delay_10 + mul11;
assign add11 = data_in_delay_11 + mul12;
assign add12 = data_in_delay_12 + mul13;
assign add13 = data_in_delay_13 + mul14;
assign add14 = data_in_delay_14 + mul15;
assign add15 = data_in_delay_15 + mul16;
assign add16 = data_in_delay_16 + mul17;



endmodule