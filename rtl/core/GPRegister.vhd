-- ( (c) Amlal El Mahrouss 2024-2026, licensed under Apache 2.0 )
-- ( This file handles the general purpose register entity. )

LIBRARY IEEE;

USE IEEE.std_logic_1164.ALL;

-- Interrupt unit entity
ENTITY GPRegister IS

    PORT (
        cpu_ingoing_data : IN STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0');
        cpu_ingoing_id : IN NATURAL := 0;
        cpu_ingoing_config : IN NATURAL := 0;
        cpu_incoming_clk : IN STD_LOGIC := '1';
        cpu_ingoing_mag : IN STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0')
    );

END GPRegister;

-- Interrupt unit body.
ARCHITECTURE GPRegisterArch OF GPRegister IS

    -- Standard IRQ
    SIGNAL signal_data : STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0');
    SIGNAL signal_reset : STD_LOGIC := '1';
    SIGNAL signal_ident : NATURAL := 0;

BEGIN

    GPRegisterPro : PROCESS
    BEGIN
        IF (signal_reset = '1') THEN
            signal_ident <= cpu_ingoing_config;
            signal_reset <= '0';
        END IF;

        IF (cpu_ingoing_id = signal_ident AND cpu_ingoing_mag = X"23") THEN
            IF (signal_ident /= 0) THEN
                signal_data <= cpu_ingoing_data;
                REPORT "GP: DATA: 0x" & to_hstring(signal_data);
                REPORT "GP: ID DST: " & integer'image(signal_ident);
            ELSE
                REPORT "GP: ZERO_REG";
            END IF;
        END IF;

        WAIT ON cpu_incoming_clk;
    END PROCESS; -- GPRegisterPro

END GPRegisterArch; -- GPRegisterArch
