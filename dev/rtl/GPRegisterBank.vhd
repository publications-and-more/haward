-- ( (c) Amlal El Mahrouss 2024-2025, licensed under Apache 2.0 )
-- ( This file handles the Register bank (GP). )

LIBRARY IEEE;

USE IEEE.std_logic_1164.ALL;

ENTITY GPRegisterBank IS
  PORT (
    cpu_register_select : IN NATURAL := 0;
    cpu_register_data : IN STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0');
    cpu_clk : IN STD_LOGIC;
    cpu_register_ident : IN STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0')
  );
END GPRegisterBank;

ARCHITECTURE GPRegisterBankArch OF GPRegisterBank IS

BEGIN

  -- gp registers entities

  HW_R0 : ENTITY work.GPRegister PORT MAP(
    cpu_ingoing_data => cpu_register_data,
    cpu_ingoing_config => 0,
    cpu_ingoing_id=>cpu_register_select,
    cpu_incoming_clk => cpu_clk,
    cpu_ingoing_mag => cpu_register_ident
    );

  HW_R1 : ENTITY work.GPRegister PORT MAP(
    cpu_ingoing_data => cpu_register_data,
    cpu_ingoing_config => 1,
    cpu_ingoing_id=>cpu_register_select,
    cpu_incoming_clk => cpu_clk,
    cpu_ingoing_mag => cpu_register_ident);

  HW_R2 : ENTITY work.GPRegister PORT MAP(
    cpu_ingoing_data => cpu_register_data,
    cpu_ingoing_config => 2,
    cpu_ingoing_id=>cpu_register_select,
    cpu_incoming_clk => cpu_clk,
    cpu_ingoing_mag => cpu_register_ident);

  HW_R3 : ENTITY work.GPRegister PORT MAP(
      cpu_ingoing_data => cpu_register_data,
      cpu_ingoing_config => 3,
      cpu_ingoing_id=>cpu_register_select,
      cpu_incoming_clk => cpu_clk,
      cpu_ingoing_mag => cpu_register_ident);

  HW_R4 : ENTITY work.GPRegister PORT MAP(
        cpu_ingoing_data => cpu_register_data,
        cpu_ingoing_config => 4,
        cpu_ingoing_id=>cpu_register_select,
        cpu_incoming_clk => cpu_clk,
        cpu_ingoing_mag => cpu_register_ident);

  HW_R5 : ENTITY work.GPRegister PORT MAP(
    cpu_ingoing_data => cpu_register_data,
    cpu_ingoing_config => 5,
    cpu_ingoing_id=>cpu_register_select,
    cpu_incoming_clk => cpu_clk,
    cpu_ingoing_mag => cpu_register_ident);

  HW_R6 : ENTITY work.GPRegister PORT MAP(
    cpu_ingoing_data => cpu_register_data,
    cpu_ingoing_config => 6,
    cpu_ingoing_id=>cpu_register_select,
    cpu_incoming_clk => cpu_clk,
    cpu_ingoing_mag => cpu_register_ident);

  HW_R7 : ENTITY work.GPRegister PORT MAP(
    cpu_ingoing_data => cpu_register_data,
    cpu_ingoing_config => 7,
    cpu_ingoing_id=>cpu_register_select,
    cpu_incoming_clk => cpu_clk,
    cpu_ingoing_mag => cpu_register_ident);

  HW_R8 : ENTITY work.GPRegister PORT MAP(
    cpu_ingoing_data => cpu_register_data,
    cpu_ingoing_config => 8,
    cpu_ingoing_id=>cpu_register_select,
    cpu_incoming_clk => cpu_clk,
    cpu_ingoing_mag => cpu_register_ident);

  HW_R9 : ENTITY work.GPRegister PORT MAP(
    cpu_ingoing_data => cpu_register_data,
    cpu_ingoing_config => 9,
    cpu_ingoing_id=>cpu_register_select,
    cpu_incoming_clk => cpu_clk,
    cpu_ingoing_mag => cpu_register_ident);

  HW_R10 : ENTITY work.GPRegister PORT MAP(
    cpu_ingoing_data => cpu_register_data,
    cpu_ingoing_config => 10,
    cpu_ingoing_id=>cpu_register_select,
    cpu_incoming_clk => cpu_clk,
    cpu_ingoing_mag => cpu_register_ident);

  HW_R11 : ENTITY work.GPRegister PORT MAP(
    cpu_ingoing_data => cpu_register_data,
    cpu_ingoing_config => 11,
    cpu_ingoing_id=>cpu_register_select,
    cpu_incoming_clk => cpu_clk,
    cpu_ingoing_mag => cpu_register_ident);

  HW_R12 : ENTITY work.GPRegister PORT MAP(
    cpu_ingoing_data => cpu_register_data,
    cpu_ingoing_config => 12,
    cpu_ingoing_id=>cpu_register_select,
    cpu_incoming_clk => cpu_clk,
    cpu_ingoing_mag => cpu_register_ident);

  HW_R13 : ENTITY work.GPRegister PORT MAP(
    cpu_ingoing_data => cpu_register_data,
    cpu_ingoing_config => 13,
    cpu_ingoing_id=>cpu_register_select,
    cpu_incoming_clk => cpu_clk,
    cpu_ingoing_mag => cpu_register_ident);

  HW_R14 : ENTITY work.GPRegister PORT MAP(
    cpu_ingoing_data => cpu_register_data,
    cpu_ingoing_config => 14,
    cpu_ingoing_id=>cpu_register_select,
    cpu_incoming_clk => cpu_clk,
    cpu_ingoing_mag => cpu_register_ident);

  HW_R15 : ENTITY work.GPRegister PORT MAP(
    cpu_ingoing_data => cpu_register_data,
    cpu_ingoing_config => 15,
    cpu_ingoing_id=>cpu_register_select,
    cpu_incoming_clk => cpu_clk,
    cpu_ingoing_mag => cpu_register_ident);

  HW_R16 : ENTITY work.GPRegister PORT MAP(
    cpu_ingoing_data => cpu_register_data,
    cpu_ingoing_config => 16,
    cpu_ingoing_id=>cpu_register_select,
    cpu_incoming_clk => cpu_clk,
    cpu_ingoing_mag => cpu_register_ident);

  HW_R17 : ENTITY work.GPRegister PORT MAP(
    cpu_ingoing_data => cpu_register_data,
    cpu_ingoing_config => 17,
    cpu_ingoing_id=>cpu_register_select,
    cpu_incoming_clk => cpu_clk,
    cpu_ingoing_mag => cpu_register_ident);

  HW_R18 : ENTITY work.GPRegister PORT MAP(
    cpu_ingoing_data => cpu_register_data,
    cpu_ingoing_config => 18,
    cpu_incoming_clk => cpu_clk,
    cpu_ingoing_mag => cpu_register_ident);

  HW_R19 : ENTITY work.GPRegister PORT MAP(
    cpu_ingoing_data => cpu_register_data,
    cpu_ingoing_config => 19,
    cpu_ingoing_id=>cpu_register_select,
    cpu_incoming_clk => cpu_clk,
    cpu_ingoing_mag => cpu_register_ident);

  -- End of register banks.

END GPRegisterBankArch; -- GPRegisterBankArch
