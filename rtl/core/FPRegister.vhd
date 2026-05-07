-- ( (c) Amlal El Mahrouss 2024-2025, licensed under Apache 2.0 )
-- ( This file handles the floating point registers. )

LIBRARY IEEE;

USE IEEE.std_logic_1164.ALL;

-- Interrupt unity entity
ENTITY FPRegister IS

    PORT (
        cpu_ingoing_mantissa : IN STD_LOGIC_VECTOR(57 DOWNTO 0) := (OTHERS => '0');
        cpu_ingoing_exponent : IN STD_LOGIC_VECTOR(27 DOWNTO 0) := (OTHERS => '0');
        cpu_ingoing_sign : IN STD_LOGIC := '0';
        cpu_ingoing_config : IN NATURAL := 0;
        cpu_ingoing_ident : IN NATURAL := 0;
        cpu_incoming_clk : IN STD_LOGIC := '1';
        cpu_ingoing_mag : IN STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0')
    );

END FPRegister;

-- Interrupt unit body.
ARCHITECTURE FPRegisterArch OF FPRegister IS

    -- Standard mantissa.
    SIGNAL signal_mantissa : STD_LOGIC_VECTOR(57 DOWNTO 0) := (OTHERS => '0');
    -- Standard exponent.
    SIGNAL signal_exponent : STD_LOGIC_VECTOR(27 DOWNTO 0) := (OTHERS => '0');
    -- Sign bit.
    SIGNAL signal_sign : STD_LOGIC := '0';
    -- Circuit reset.
    SIGNAL signal_reset : STD_LOGIC := '1';
    -- Needed to tell which register we want to store the value.
    SIGNAL signal_ident : NATURAL := 0;

BEGIN

    FPRegisterPro : PROCESS
    BEGIN
        IF (signal_reset = '1') THEN
            signal_ident <= cpu_ingoing_config;
        END IF;

        IF (cpu_ingoing_ident = signal_ident AND cpu_ingoing_mag = X"23") THEN
            signal_mantissa <= cpu_ingoing_mantissa;
            signal_exponent <= cpu_ingoing_exponent;
            signal_sign <= cpu_ingoing_sign;

            REPORT "GP: DATA: 0x" & to_hstring(signal_exponent) & "." & to_hstring(signal_mantissa);
        END IF;

        WAIT ON cpu_incoming_clk;
    END PROCESS; -- FPRegisterPro

END FPRegisterArch; -- FPRegisterArch
