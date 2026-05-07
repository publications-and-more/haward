-- ( (c) Amlal El Mahrouss 2024-2025, licensed under Apache 2.0 )
-- ( This file handles the interrupt register. )

LIBRARY IEEE;

USE IEEE.std_logic_1164.ALL;

-- Interrupt unity entity
ENTITY InterruptRegister IS

    PORT (
        cpu_incoming_irq : IN STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
        cpu_incoming_nmi : IN STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
        cpu_incoming_clk : IN STD_LOGIC := '1';
        cpu_outgoing_rst : OUT STD_LOGIC := '0';
        cpu_incoming_code_level : IN STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
        cpu_outgoing_ip : OUT STD_LOGIC_VECTOR(57 DOWNTO 0) := (OTHERS => '0')
    );

END InterruptRegister;

-- Interrupt unit body.
ARCHITECTURE InterruptRegisterArch OF InterruptRegister IS

    -- Standard IRQ
    SIGNAL signal_irq : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');

    -- NMI irq
    SIGNAL signal_nmi_irq : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');

    SIGNAL signal_ivt_ip : STD_LOGIC_VECTOR(57 DOWNTO 0) := (OTHERS => '0');

BEGIN

    InterruptRegisterPro : PROCESS
    BEGIN
        signal_irq <= cpu_incoming_irq;
        signal_nmi_irq <= cpu_incoming_nmi;

        cpu_outgoing_ip <= signal_ivt_ip;

        REPORT "HT: IRQ: " & to_hstring(signal_irq);

        WAIT ON cpu_incoming_clk;
    END PROCESS; -- InterruptRegisterPro

END InterruptRegisterArch; -- InterruptRegisterArch
