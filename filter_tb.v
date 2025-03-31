module filter_tb;
    reg clk;
    reg rst_n;
    reg [18:0] FilterIn;
    reg ValidIn;
    wire [35:0] data_out;
    wire ValidOut;

    localparam NUM_DATA = 129;

    // Đọc dữ liệu từ file txt
    reg [18:0] input_data [0:NUM_DATA];  // Mảng lưu trữ 16 giá trị (theo số lượng dữ liệu trong file txt)
    integer i;
    integer fd;
    integer data_count;  // Biến đếm số lượng dữ liệu đã đọc

    // Instantiation của module filter
    filter uut (
        .clk(clk),
        .rst_n(rst_n),
        .FilterIn(FilterIn),
        .ValidIn(ValidIn),
        .data_out(data_out),
        .ValidOut(ValidOut)
    );

    // Clock generator
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // Toggle clock every 5 time units
    end

    // Reset logic
    initial begin
        rst_n = 0;
        #10 rst_n = 1;
    end

    // Đọc dữ liệu từ file .txt vào mảng input_data
    initial begin
        fd = $fopen("xn_19_binary.txt", "r");
        if (fd == 0) begin
            $display("Error: Could not open input file.");
            $finish;
        end

        // Đọc dữ liệu từ file vào mảng
        for (i = 0; i < NUM_DATA + 1; i = i + 1) begin
            $fscanf(fd, "%b\n", input_data[i]);  // Đọc giá trị dưới dạng số thực
        end

        $fclose(fd);
    end

    // Test logic: gửi dữ liệu vào FilterIn tại mỗi negedge clk
    initial begin
        // Reset filter
        FilterIn = 0;
        ValidIn = 0;
        data_count = 0;  // Bắt đầu đếm từ 0

        // Cấp tín hiệu đầu vào từ mảng input_data
        for (i = 0; i < NUM_DATA + 1; i = i + 1) begin
            #10;  // Đợi một chu kỳ clock

            // Cập nhật giá trị FilterIn từ mảng
            FilterIn = input_data[i];  
            ValidIn = 1;  // Giữ ValidIn bật trong suốt quá trình gửi dữ liệu

            // Kiểm tra nếu đã đọc hết số lượng dữ liệu trong file, tắt ValidIn ngay
            if (i == NUM_DATA) begin
                ValidIn = 0;  // Tắt ValidIn ngay sau khi truyền hết dữ liệu
            end
        end
    end

    initial begin
        
    end
endmodule
