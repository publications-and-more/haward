-- ( (c) Amlal El Mahrouss 2024-2025, licensed under Apache 2.0 )
-- ( This file handles the hardware thread register. )

LIBRARY IEEE;

USE IEEE.std_logic_1164.ALL;
USE std.textio.ALL;

ENTITY ThreadRegister IS

    PORT (

        -- address to fetch on.
        cpu_incoming_ip : IN STD_LOGIC_VECTOR(57 DOWNTO 0) := (OTHERS => '0');
        cpu_incoming_clk_signal : IN STD_LOGIC := '1'

    );

END ThreadRegister;

ARCHITECTURE ThreadRegisterArch OF ThreadRegister IS

    SIGNAL cpu_signal_reset : STD_LOGIC := '1';

    SIGNAL cpu_signal_ip : STD_LOGIC_VECTOR(57 DOWNTO 0) := (OTHERS => '0');
    SIGNAL cpu_signal_reset_ip : STD_LOGIC_VECTOR(57 DOWNTO 0) := (OTHERS => '0');

BEGIN

    ThreadRegisterPro : PROCESS
    BEGIN
        cpu_signal_ip <= cpu_incoming_ip;

        IF cpu_signal_reset = '1' THEN
            cpu_signal_ip <= cpu_signal_reset_ip;
        END IF;

        REPORT "HT: " & to_hstring(cpu_signal_ip);

        WAIT ON cpu_incoming_clk_signal;
    END PROCESS; -- ThreadRegisterPro

END ThreadRegisterArch; -- ThreadRegister
