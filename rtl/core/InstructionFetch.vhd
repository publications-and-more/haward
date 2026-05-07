-- ( (c) Amlal El Mahrouss 2024-2025, licensed under Apache 2.0 )
-- ( This file handles the instruction fetch stage. )

LIBRARY IEEE;

USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE STD.textio.ALL;

ENTITY InstructionFetch IS
END InstructionFetch;

ARCHITECTURE InstructionFetchArch OF InstructionFetch IS

    TYPE IntFile IS FILE OF INTEGER;

    SIGNAL cpu_data_s : STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0');
    SIGNAL cpu_clk_s : STD_LOGIC := '0';
    SIGNAL cpu_opcode_s : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL cpu_funct3_s : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL cpu_funct7_s : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL cpu_reg_select_s : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL cpu_reg_select_r_s : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');

BEGIN

    HW_CLK_STAGE : ENTITY work.ClockCircuit PORT MAP(outgoing_cpu_clk => cpu_clk_s);

    --- Read and execute ROM.

    PROCESS
        FILE ROM : IntFile;

        VARIABLE v_cpu_logic_data : STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0');
        VARIABLE v_cpu_data : INTEGER := 0;
    BEGIN
        FILE_OPEN(ROM, "../../rom/src/ROM.bin", read_mode);

        WHILE NOT ENDFILE(ROM) LOOP
            WHILE (cpu_clk_s = '1') LOOP
                REPORT "ROM: DO NOT READ";

                WAIT FOR 60 ns;
            END LOOP;

            READ(ROM, v_cpu_data);

            REPORT "ROM: 0x" & to_hstring(to_signed(v_cpu_data, 32));

            v_cpu_logic_data := STD_LOGIC_VECTOR(TO_SIGNED(v_cpu_data, 32));

            cpu_data_s <= v_cpu_logic_data;

            WAIT FOR 60 ns;
        END LOOP;

        FILE_CLOSE(ROM);

        cpu_clk_s <= '0';

        WAIT FOR 60 ns;
    END PROCESS;


    HW_FETCH_STAGE : ENTITY work.InstructionDecode PORT MAP(
        cpu_clk => cpu_clk_s,
        cpu_data => cpu_data_s,
        cpu_opcode => cpu_opcode_s,
        cpu_funct3 => cpu_funct3_s,
        cpu_funct7 => cpu_funct7_s
        );

    HW_REGISTER_BANK : ENTITY work.GPRegisterBank PORT MAP(
        cpu_register_select => to_integer(unsigned(cpu_funct3_s)),
        cpu_register_data => cpu_data_s,
        cpu_clk => cpu_clk_s,
        cpu_register_ident => cpu_opcode_s
        );
END InstructionFetchArch;
