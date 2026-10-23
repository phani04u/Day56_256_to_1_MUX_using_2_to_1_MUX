`timescale 1ns / 1ps
module mux_256(
    input [255:0] I,
    input [7:0] S,
    output Y );
wire [127:0] W1; wire [63:0]  W2;wire [31:0]  W3;
wire [15:0]  W4;wire [7:0]   W5;wire [3:0]   W6;wire [1:0]   W7;
genvar i;
generate
    // Stage 1: 256 -> 128
    for (i = 0; i < 128; i = i + 1) begin : STAGE1
        mux2 M1 (
            .I(I[i*2 +: 2]),
            .S(S[0]),
            .Y(W1[i])
        )
    end
    // Stage 2: 128 -> 64
    for (i = 0; i < 64; i = i + 1) begin : STAGE2
        mux2 M2 (
            .I(W1[i*2 +: 2]),
            .S(S[1]),
            .Y(W2[i])
        );
    end
    // Stage 3: 64 -> 32
    for (i = 0; i < 32; i = i + 1) begin : STAGE3
        mux2 M3 (
            .I(W2[i*2 +: 2]),
            .S(S[2]),
            .Y(W3[i])
        );
    end
  // Stage 4: 32 -> 16
    for (i = 0; i < 16; i = i + 1) begin : STAGE4
        mux2 M4 (
            .I(W3[i*2 +: 2]),
            .S(S[3]),
            .Y(W4[i])
        );
    end
    // Stage 5: 16 -> 8
    for (i = 0; i < 8; i = i + 1) begin : STAGE5
        mux2 M5 (
            .I(W4[i*2 +: 2]),
            .S(S[4]),
            .Y(W5[i])
        );
    end
    // Stage 6: 8 -> 4
    for (i = 0; i < 4; i = i + 1) begin : STAGE6
        mux2 M6 (
            .I(W5[i*2 +: 2]),
            .S(S[5]),
            .Y(W6[i])
        );
    end
    // Stage 7: 4 -> 2
    for (i = 0; i < 2; i = i + 1) begin : STAGE7
        mux2 M7 (
            .I(W6[i*2 +: 2]),
            .S(S[6]),
            .Y(W7[i])
        );
    end
    // Stage 8: 2 -> 1
    mux2 M8 (
        .I(W7),
        .S(S[7]),
        .Y(Y)
    );
endgenerate
endmodule