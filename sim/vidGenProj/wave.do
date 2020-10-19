onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group DUT /edge_detection_top_tb/DUT/S_HRESET
add wave -noupdate -group DUT /edge_detection_top_tb/DUT/S_HSYNC
add wave -noupdate -group DUT /edge_detection_top_tb/DUT/S_HBACK
add wave -noupdate -group DUT /edge_detection_top_tb/DUT/S_HACT
add wave -noupdate -group DUT /edge_detection_top_tb/DUT/S_HFRONT
add wave -noupdate -group DUT /edge_detection_top_tb/DUT/S_VRESET
add wave -noupdate -group DUT /edge_detection_top_tb/DUT/S_VSYNC
add wave -noupdate -group DUT /edge_detection_top_tb/DUT/S_VBACK_START
add wave -noupdate -group DUT /edge_detection_top_tb/DUT/S_VBACK
add wave -noupdate -group DUT /edge_detection_top_tb/DUT/S_VACT
add wave -noupdate -group DUT /edge_detection_top_tb/DUT/S_VFRONT
add wave -noupdate -group DUT /edge_detection_top_tb/DUT/I_RST
add wave -noupdate -group DUT /edge_detection_top_tb/DUT/I_PCLK
add wave -noupdate -group DUT /edge_detection_top_tb/DUT/I_PIX_DATA
add wave -noupdate -group DUT /edge_detection_top_tb/DUT/I_TP_EN
add wave -noupdate -group DUT /edge_detection_top_tb/DUT/I_HS_END
add wave -noupdate -group DUT /edge_detection_top_tb/DUT/I_HBP_END
add wave -noupdate -group DUT /edge_detection_top_tb/DUT/I_HACT_END
add wave -noupdate -group DUT /edge_detection_top_tb/DUT/I_HFP_END
add wave -noupdate -group DUT /edge_detection_top_tb/DUT/I_VS_END
add wave -noupdate -group DUT /edge_detection_top_tb/DUT/I_VBP_END
add wave -noupdate -group DUT /edge_detection_top_tb/DUT/I_VACT_END
add wave -noupdate -group DUT /edge_detection_top_tb/DUT/I_VFP_END
add wave -noupdate -group DUT /edge_detection_top_tb/DUT/I_VRST
add wave -noupdate -group DUT /edge_detection_top_tb/DUT/O_DE
add wave -noupdate -group DUT /edge_detection_top_tb/DUT/O_HS
add wave -noupdate -group DUT /edge_detection_top_tb/DUT/O_VS
add wave -noupdate -group DUT /edge_detection_top_tb/DUT/O_HCNT
add wave -noupdate -group DUT /edge_detection_top_tb/DUT/O_VCNT
add wave -noupdate -group DUT /edge_detection_top_tb/DUT/O_PIX_DATA
add wave -noupdate -group DUT /edge_detection_top_tb/DUT/n_hs_done
add wave -noupdate -group DUT /edge_detection_top_tb/DUT/n_hbp_done
add wave -noupdate -group DUT /edge_detection_top_tb/DUT/n_hact_done
add wave -noupdate -group DUT /edge_detection_top_tb/DUT/n_hfp_done
add wave -noupdate -group DUT /edge_detection_top_tb/DUT/n_vs_done
add wave -noupdate -group DUT /edge_detection_top_tb/DUT/n_vbp_done
add wave -noupdate -group DUT /edge_detection_top_tb/DUT/n_vact_done
add wave -noupdate -group DUT /edge_detection_top_tb/DUT/n_vfp_done
add wave -noupdate -group DUT /edge_detection_top_tb/DUT/n_hctr
add wave -noupdate -group DUT /edge_detection_top_tb/DUT/n_vctr
add wave -noupdate -group DUT /edge_detection_top_tb/DUT/n_hstate
add wave -noupdate -group DUT /edge_detection_top_tb/DUT/n_vstate
add wave -noupdate -group DUT /edge_detection_top_tb/DUT/q_hs_done
add wave -noupdate -group DUT /edge_detection_top_tb/DUT/q_hbp_done
add wave -noupdate -group DUT /edge_detection_top_tb/DUT/q_hact_done
add wave -noupdate -group DUT /edge_detection_top_tb/DUT/q_hfp_done
add wave -noupdate -group DUT /edge_detection_top_tb/DUT/q_vs_done
add wave -noupdate -group DUT /edge_detection_top_tb/DUT/q_vbp_done
add wave -noupdate -group DUT /edge_detection_top_tb/DUT/q_vact_done
add wave -noupdate -group DUT /edge_detection_top_tb/DUT/q_vfp_done
add wave -noupdate -group DUT /edge_detection_top_tb/DUT/q_hctr
add wave -noupdate -group DUT /edge_detection_top_tb/DUT/q_vctr
add wave -noupdate -group DUT /edge_detection_top_tb/DUT/q_hstate
add wave -noupdate -group DUT /edge_detection_top_tb/DUT/q_vstate
add wave -noupdate -group DUT /edge_detection_top_tb/DUT/n_hde
add wave -noupdate -group DUT /edge_detection_top_tb/DUT/n_vde
add wave -noupdate -group DUT /edge_detection_top_tb/DUT/n_hsync
add wave -noupdate -group DUT /edge_detection_top_tb/DUT/n_vsync
add wave -noupdate -group DUT /edge_detection_top_tb/DUT/n_hrst
add wave -noupdate -group DUT /edge_detection_top_tb/DUT/n_vrst
add wave -noupdate -group DUT /edge_detection_top_tb/DUT/n_hsDly
add wave -noupdate -group DUT /edge_detection_top_tb/DUT/n_deDly
add wave -noupdate -group DUT /edge_detection_top_tb/DUT/n_de
add wave -noupdate -group DUT /edge_detection_top_tb/DUT/n_tstpat
add wave -noupdate -group DUT /edge_detection_top_tb/DUT/n_pix_data
add wave -noupdate -group DUT /edge_detection_top_tb/DUT/q_hde
add wave -noupdate -group DUT /edge_detection_top_tb/DUT/q_vde
add wave -noupdate -group DUT /edge_detection_top_tb/DUT/q_hsync
add wave -noupdate -group DUT /edge_detection_top_tb/DUT/q_vsync
add wave -noupdate -group DUT /edge_detection_top_tb/DUT/q_hrst
add wave -noupdate -group DUT /edge_detection_top_tb/DUT/q_vrst
add wave -noupdate -group DUT /edge_detection_top_tb/DUT/q_hsDly
add wave -noupdate -group DUT /edge_detection_top_tb/DUT/q_deDly
add wave -noupdate -group DUT /edge_detection_top_tb/DUT/q_de
add wave -noupdate -group DUT /edge_detection_top_tb/DUT/q_tstpat
add wave -noupdate -group DUT /edge_detection_top_tb/DUT/q_pix_data
add wave -noupdate -group TB /edge_detection_top_tb/VGA_HACT
add wave -noupdate -group TB /edge_detection_top_tb/VGA_HFP
add wave -noupdate -group TB /edge_detection_top_tb/VGA_HSW
add wave -noupdate -group TB /edge_detection_top_tb/VGA_HBP
add wave -noupdate -group TB /edge_detection_top_tb/VGA_VACT
add wave -noupdate -group TB /edge_detection_top_tb/VGA_VFP
add wave -noupdate -group TB /edge_detection_top_tb/VGA_VSW
add wave -noupdate -group TB /edge_detection_top_tb/VGA_VBP
add wave -noupdate -group TB /edge_detection_top_tb/VGA_HS_END
add wave -noupdate -group TB /edge_detection_top_tb/VGA_HBP_END
add wave -noupdate -group TB /edge_detection_top_tb/VGA_HACT_END
add wave -noupdate -group TB /edge_detection_top_tb/VGA_HFP_END
add wave -noupdate -group TB /edge_detection_top_tb/VGA_VS_END
add wave -noupdate -group TB /edge_detection_top_tb/VGA_VBP_END
add wave -noupdate -group TB /edge_detection_top_tb/VGA_VACT_END
add wave -noupdate -group TB /edge_detection_top_tb/VGA_VFP_END
add wave -noupdate -group TB /edge_detection_top_tb/in_vector_file_name
add wave -noupdate -group TB /edge_detection_top_tb/out_vector_1_file_name
add wave -noupdate -group TB /edge_detection_top_tb/out_vector_2_file_name
add wave -noupdate -group TB /edge_detection_top_tb/pixel_input_data
add wave -noupdate -group TB /edge_detection_top_tb/pixel_output_data
add wave -noupdate -group TB /edge_detection_top_tb/pixel_vidgen_output_data
add wave -noupdate -group TB /edge_detection_top_tb/vid_x
add wave -noupdate -group TB /edge_detection_top_tb/vid_y
add wave -noupdate -group TB /edge_detection_top_tb/o_vid_x
add wave -noupdate -group TB /edge_detection_top_tb/o_vid_y
add wave -noupdate -group TB /edge_detection_top_tb/reset
add wave -noupdate -group TB /edge_detection_top_tb/clk_100
add wave -noupdate -group TB /edge_detection_top_tb/clk_pix
add wave -noupdate -group TB /edge_detection_top_tb/o_clk_pix
add wave -noupdate -group TB /edge_detection_top_tb/istrb_clk_100
add wave -noupdate -group TB /edge_detection_top_tb/istrb_clk_pix
add wave -noupdate -group TB /edge_detection_top_tb/i_de
add wave -noupdate -group TB /edge_detection_top_tb/i_vs
add wave -noupdate -group TB /edge_detection_top_tb/i_hs
add wave -noupdate -group TB /edge_detection_top_tb/o_de
add wave -noupdate -group TB /edge_detection_top_tb/o_vs
add wave -noupdate -group TB /edge_detection_top_tb/o_hs
add wave -noupdate -group TB /edge_detection_top_tb/i_pix_data
add wave -noupdate -group TB /edge_detection_top_tb/o_pix_data
add wave -noupdate -group TB /edge_detection_top_tb/o_vidgen_pix
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 284
configure wave -valuecolwidth 199
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {27205 ps}
