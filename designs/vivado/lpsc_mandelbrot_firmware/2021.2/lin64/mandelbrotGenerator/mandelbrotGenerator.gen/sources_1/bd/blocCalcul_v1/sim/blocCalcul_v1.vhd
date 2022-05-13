--Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
--Date        : Fri May 13 10:58:32 2022
--Host        : Surface-2-Quent running 64-bit major release  (build 9200)
--Command     : generate_target blocCalcul_v1.bd
--Design      : blocCalcul_v1
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity blocCalcul_v1 is
  port (
    CLK_0 : in STD_LOGIC;
    c_imag : in STD_LOGIC_VECTOR ( 15 downto 0 );
    c_real : in STD_LOGIC_VECTOR ( 15 downto 0 );
    nextZ_imag : out STD_LOGIC_VECTOR ( 31 downto 0 );
    nextZ_real : out STD_LOGIC_VECTOR ( 31 downto 0 );
    z_imag : in STD_LOGIC_VECTOR ( 15 downto 0 );
    z_real : in STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of blocCalcul_v1 : entity is "blocCalcul_v1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=blocCalcul_v1,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=13,numReposBlks=13,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,da_clkrst_cnt=1,synth_mode=OOC_per_IP}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of blocCalcul_v1 : entity is "blocCalcul_v1.hwdef";
end blocCalcul_v1;

architecture STRUCTURE of blocCalcul_v1 is
  component blocCalcul_v1_mult_gen_0_0 is
  port (
    CLK : in STD_LOGIC;
    A : in STD_LOGIC_VECTOR ( 15 downto 0 );
    B : in STD_LOGIC_VECTOR ( 15 downto 0 );
    P : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component blocCalcul_v1_mult_gen_0_0;
  component blocCalcul_v1_mult_gen_0_1 is
  port (
    CLK : in STD_LOGIC;
    A : in STD_LOGIC_VECTOR ( 15 downto 0 );
    B : in STD_LOGIC_VECTOR ( 15 downto 0 );
    P : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component blocCalcul_v1_mult_gen_0_1;
  component blocCalcul_v1_c_addsub_0_0 is
  port (
    A : in STD_LOGIC_VECTOR ( 31 downto 0 );
    B : in STD_LOGIC_VECTOR ( 31 downto 0 );
    CLK : in STD_LOGIC;
    C_IN : in STD_LOGIC;
    S : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component blocCalcul_v1_c_addsub_0_0;
  component blocCalcul_v1_util_vector_logic_0_0 is
  port (
    Op1 : in STD_LOGIC_VECTOR ( 30 downto 0 );
    Res : out STD_LOGIC_VECTOR ( 30 downto 0 )
  );
  end component blocCalcul_v1_util_vector_logic_0_0;
  component blocCalcul_v1_c_addsub_0_1 is
  port (
    A : in STD_LOGIC_VECTOR ( 31 downto 0 );
    B : in STD_LOGIC_VECTOR ( 31 downto 0 );
    CLK : in STD_LOGIC;
    S : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component blocCalcul_v1_c_addsub_0_1;
  component blocCalcul_v1_c_addsub_0_2 is
  port (
    A : in STD_LOGIC_VECTOR ( 31 downto 0 );
    B : in STD_LOGIC_VECTOR ( 31 downto 0 );
    CLK : in STD_LOGIC;
    S : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component blocCalcul_v1_c_addsub_0_2;
  component blocCalcul_v1_mult_gen_0_2 is
  port (
    CLK : in STD_LOGIC;
    A : in STD_LOGIC_VECTOR ( 15 downto 0 );
    B : in STD_LOGIC_VECTOR ( 15 downto 0 );
    P : out STD_LOGIC_VECTOR ( 16 downto 0 )
  );
  end component blocCalcul_v1_mult_gen_0_2;
  component blocCalcul_v1_mult_gen_2_0 is
  port (
    CLK : in STD_LOGIC;
    A : in STD_LOGIC_VECTOR ( 16 downto 0 );
    B : in STD_LOGIC_VECTOR ( 15 downto 0 );
    P : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component blocCalcul_v1_mult_gen_2_0;
  component blocCalcul_v1_xlconstant_0_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component blocCalcul_v1_xlconstant_0_0;
  component blocCalcul_v1_xlconstant_0_1 is
  port (
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component blocCalcul_v1_xlconstant_0_1;
  component blocCalcul_v1_xlconcat_0_0 is
  port (
    In0 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    In1 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component blocCalcul_v1_xlconcat_0_0;
  component blocCalcul_v1_xlconcat_0_1 is
  port (
    In0 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    In1 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component blocCalcul_v1_xlconcat_0_1;
  component blocCalcul_v1_xlconstant_0_2 is
  port (
    dout : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component blocCalcul_v1_xlconstant_0_2;
  signal A_0_2 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal CLK_0_1 : STD_LOGIC;
  signal In1_0_1 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal In1_1_1 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal c_addsub_0_S : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal c_addsub_1_S : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal c_addsub_2_S : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal mult_gen_0_P : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal mult_gen_1_P : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal mult_gen_2_P : STD_LOGIC_VECTOR ( 16 downto 0 );
  signal mult_gen_3_P : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal util_vector_logic_0_Res : STD_LOGIC_VECTOR ( 30 downto 0 );
  signal xlconcat_0_dout : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xlconcat_1_dout : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xlconstant_0_dout : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal xlconstant_1_dout : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xlconstant_2_dout : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal z_imag_1 : STD_LOGIC_VECTOR ( 15 downto 0 );
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of CLK_0 : signal is "xilinx.com:signal:clock:1.0 CLK.CLK_0 CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of CLK_0 : signal is "XIL_INTERFACENAME CLK.CLK_0, CLK_DOMAIN blocCalcul_v1_CLK_0, FREQ_HZ 10000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
  attribute X_INTERFACE_INFO of nextZ_imag : signal is "xilinx.com:signal:data:1.0 DATA.NEXTZ_IMAG DATA";
  attribute X_INTERFACE_PARAMETER of nextZ_imag : signal is "XIL_INTERFACENAME DATA.NEXTZ_IMAG, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value data} bitwidth {attribs {resolve_type generated dependency bitwidth format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type generated dependency signed format bool minimum {} maximum {}} value TRUE}}}} DATA_WIDTH 32}";
  attribute X_INTERFACE_INFO of nextZ_real : signal is "xilinx.com:signal:data:1.0 DATA.NEXTZ_REAL DATA";
  attribute X_INTERFACE_PARAMETER of nextZ_real : signal is "XIL_INTERFACENAME DATA.NEXTZ_REAL, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value data} bitwidth {attribs {resolve_type generated dependency bitwidth format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type generated dependency signed format bool minimum {} maximum {}} value TRUE}}}} DATA_WIDTH 32}";
  attribute X_INTERFACE_INFO of z_imag : signal is "xilinx.com:signal:data:1.0 DATA.Z_IMAG DATA";
  attribute X_INTERFACE_PARAMETER of z_imag : signal is "XIL_INTERFACENAME DATA.Z_IMAG, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of z_real : signal is "xilinx.com:signal:data:1.0 DATA.Z_REAL DATA";
  attribute X_INTERFACE_PARAMETER of z_real : signal is "XIL_INTERFACENAME DATA.Z_REAL, LAYERED_METADATA undef";
begin
  A_0_2(15 downto 0) <= z_real(15 downto 0);
  CLK_0_1 <= CLK_0;
  In1_0_1(15 downto 0) <= c_imag(15 downto 0);
  In1_1_1(15 downto 0) <= c_real(15 downto 0);
  nextZ_imag(31 downto 0) <= c_addsub_2_S(31 downto 0);
  nextZ_real(31 downto 0) <= c_addsub_1_S(31 downto 0);
  z_imag_1(15 downto 0) <= z_imag(15 downto 0);
c_addsub_0: component blocCalcul_v1_c_addsub_0_0
     port map (
      A(31 downto 0) => mult_gen_1_P(31 downto 0),
      B(31) => '0',
      B(30 downto 0) => util_vector_logic_0_Res(30 downto 0),
      CLK => CLK_0_1,
      C_IN => xlconstant_1_dout(0),
      S(31 downto 0) => c_addsub_0_S(31 downto 0)
    );
c_addsub_1: component blocCalcul_v1_c_addsub_0_1
     port map (
      A(31 downto 0) => c_addsub_0_S(31 downto 0),
      B(31 downto 0) => xlconcat_0_dout(31 downto 0),
      CLK => CLK_0_1,
      S(31 downto 0) => c_addsub_1_S(31 downto 0)
    );
c_addsub_2: component blocCalcul_v1_c_addsub_0_2
     port map (
      A(31 downto 0) => mult_gen_3_P(31 downto 0),
      B(31 downto 0) => xlconcat_1_dout(31 downto 0),
      CLK => CLK_0_1,
      S(31 downto 0) => c_addsub_2_S(31 downto 0)
    );
mult_gen_0: component blocCalcul_v1_mult_gen_0_0
     port map (
      A(15 downto 0) => z_imag_1(15 downto 0),
      B(15 downto 0) => z_imag_1(15 downto 0),
      CLK => CLK_0_1,
      P(31 downto 0) => mult_gen_0_P(31 downto 0)
    );
mult_gen_1: component blocCalcul_v1_mult_gen_0_1
     port map (
      A(15 downto 0) => A_0_2(15 downto 0),
      B(15 downto 0) => A_0_2(15 downto 0),
      CLK => CLK_0_1,
      P(31 downto 0) => mult_gen_1_P(31 downto 0)
    );
mult_gen_2: component blocCalcul_v1_mult_gen_0_2
     port map (
      A(15 downto 0) => A_0_2(15 downto 0),
      B(15 downto 0) => xlconstant_0_dout(15 downto 0),
      CLK => CLK_0_1,
      P(16 downto 0) => mult_gen_2_P(16 downto 0)
    );
mult_gen_3: component blocCalcul_v1_mult_gen_2_0
     port map (
      A(16 downto 0) => mult_gen_2_P(16 downto 0),
      B(15 downto 0) => z_imag_1(15 downto 0),
      CLK => CLK_0_1,
      P(31 downto 0) => mult_gen_3_P(31 downto 0)
    );
util_vector_logic_0: component blocCalcul_v1_util_vector_logic_0_0
     port map (
      Op1(30 downto 0) => mult_gen_0_P(30 downto 0),
      Res(30 downto 0) => util_vector_logic_0_Res(30 downto 0)
    );
xlconcat_0: component blocCalcul_v1_xlconcat_0_0
     port map (
      In0(15 downto 0) => xlconstant_2_dout(15 downto 0),
      In1(15 downto 0) => In1_1_1(15 downto 0),
      dout(31 downto 0) => xlconcat_0_dout(31 downto 0)
    );
xlconcat_1: component blocCalcul_v1_xlconcat_0_1
     port map (
      In0(15 downto 0) => xlconstant_2_dout(15 downto 0),
      In1(15 downto 0) => In1_0_1(15 downto 0),
      dout(31 downto 0) => xlconcat_1_dout(31 downto 0)
    );
xlconstant_0: component blocCalcul_v1_xlconstant_0_0
     port map (
      dout(15 downto 0) => xlconstant_0_dout(15 downto 0)
    );
xlconstant_1: component blocCalcul_v1_xlconstant_0_1
     port map (
      dout(31 downto 0) => xlconstant_1_dout(31 downto 0)
    );
xlconstant_2: component blocCalcul_v1_xlconstant_0_2
     port map (
      dout(15 downto 0) => xlconstant_2_dout(15 downto 0)
    );
end STRUCTURE;
