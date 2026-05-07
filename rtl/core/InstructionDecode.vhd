-- ( (c) Amlal El Mahrouss 2024-2025, licensed under Apache 2.0 )
-- ( This file handles the decode stage. )

LIBRARY IEEE;

USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY InstructionDecode IS
	PORT (
		cpu_clk : IN STD_LOGIC := '1';
		cpu_data : IN STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0');
		cpu_opcode : OUT STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
		cpu_funct3 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
		cpu_funct7 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0')
	);
END InstructionDecode;

ARCHITECTURE InstructionDecodeArch OF InstructionDecode IS
BEGIN

	InstructionDecodePro : PROCESS
	BEGIN
		cpu_opcode(7 DOWNTO 0) <= cpu_data(7 DOWNTO 0);
		cpu_funct3(7 DOWNTO 0) <= cpu_data(15 DOWNTO 8);
		cpu_funct7(7 DOWNTO 0) <= cpu_data(23 DOWNTO 16);

		REPORT "HT: DECODE: OPCODE: " & to_hstring(cpu_opcode) & ", FUNCT3: " & to_hstring(cpu_funct3) & ", FUNCT7: " & to_hstring(cpu_funct7);
		WAIT ON cpu_clk;
	END PROCESS; -- InstructionDecodePro

END InstructionDecodeArch; -- InstructionDecodeArch
