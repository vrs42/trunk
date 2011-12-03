library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity PDP8mem is
    Port (
       clk      : in std_logic;
       reset    : in std_logic;

       MEMrd    : in  std_logic;
       MEMwr    : in  std_logic;
       MEMdone  : out std_logic;
       MEMaddr  : in  std_logic_vector (0 to 14);
       MEMwdata : in  std_logic_vector (0 to 11);
       MEMrdata : out std_logic_vector (0 to 11)
    );
end PDP8mem;

architecture rtl of PDP8mem is
   signal we : std_logic;

   signal dout0 : std_logic_vector (0 to 11);
   signal dout1 : std_logic_vector (0 to 11);
   signal dout2 : std_logic_vector (0 to 11);
   signal dout3 : std_logic_vector (0 to 11);
   signal dout4 : std_logic_vector (0 to 11);
   signal dout5 : std_logic_vector (0 to 11);
   signal dout6 : std_logic_vector (0 to 11);
   signal dout7 : std_logic_vector (0 to 11);

   signal ena0 : std_logic;
   signal ena1 : std_logic;
   signal ena2 : std_logic;
   signal ena3 : std_logic;
   signal ena4 : std_logic;
   signal ena5 : std_logic;
   signal ena6 : std_logic;
   signal ena7 : std_logic;

   signal MEMpending : std_logic;

  component RAMB16_S4
    generic (
      INIT_00, INIT_01, INIT_02, INIT_03, 
      INIT_04, INIT_05, INIT_06, INIT_07,
      INIT_08, INIT_09, INIT_0A, INIT_0B,
      INIT_0C, INIT_0D, INIT_0E, INIT_0F,
      INIT_10, INIT_11, INIT_12, INIT_13, 
      INIT_14, INIT_15, INIT_16, INIT_17,
      INIT_18, INIT_19, INIT_1A, INIT_1B,
      INIT_1C, INIT_1D, INIT_1E, INIT_1F,
      INIT_20, INIT_21, INIT_22, INIT_23, 
      INIT_24, INIT_25, INIT_26, INIT_27,
      INIT_28, INIT_29, INIT_2A, INIT_2B,
      INIT_2C, INIT_2D, INIT_2E, INIT_2F,
      INIT_30, INIT_31, INIT_32, INIT_33, 
      INIT_34, INIT_35, INIT_36, INIT_37,
      INIT_38, INIT_39, INIT_3A, INIT_3B,
      INIT_3C, INIT_3D, INIT_3E, INIT_3F : bit_vector (255 downto 0)
        := x"0000000000000000000000000000000000000000000000000000000000000000"
    );

    port (
      clk, we, en, ssr : in std_logic;
      addr : in std_logic_vector(11 downto 0);
      di : in std_logic_vector(3 downto 0);
      do : out std_logic_vector(3 downto 0)
    );
  end component RAMB16_S4;


begin
--
-- This image has the console version of RIM at 7756, 
-- the BIN loader at 7777, and Focal 1969 at 0200.  
-- (This would be a fairly typical core image for a 
-- system with just a console and 4K of memory.)
-- If the console input were working, it would allow
-- use of Focal and loading of diagnostics or other
-- software from the console.
--
RAM00 : RAMB16_S4
 generic map (
  INIT_00=>x"0000000000055527f000d4d00000000000800070000005006f068000d0005bb0",
  INIT_01=>x"f8000000054114331440545125411131546666ccb44800ffffff0ff000fff0ff",
  INIT_02=>x"26af319a99af2299f9726629f2294aa996296629960a9109962662926266e62b",
  INIT_03=>x"22444fbb6ee2f9f02ef02e9fa99622a99962e2e2aa9996e929f20296af2290ae",
  INIT_04=>x"01b6309091999a63a93af26eaf3091999362e9af20909929beee0555faaa9a23",
  INIT_05=>x"25220005ba47362643e0b82a4736282463e0b8e7e28e630b9f2e2620b8e728e6",
  INIT_06=>x"a9af2b6a2a63a93f26eaf3af22999f2a94990193af299902a29bf22962999f11",
  INIT_07=>x"0000112b7d99b9af20b4f2026e00be44f62e3af2eaf3630b44bfb9af242b3990",
  INIT_08=>x"9499e2939929e290d96339929f2293943a9a9e29bf4f4f262949900000000000",
  INIT_09=>x"0214f22111222be9fc3ec9399f2299a59ffaf992bf205d31963f949091909493",
  INIT_0a=>x"2099946962726629990a992e92a6299a913994a939a639e4929239a402966ec3",
  INIT_0b=>x"0000002022522beaccc0bc6cacce9be4b63632af2af36436e2f0a9209966e2a9",
  INIT_0c=>x"4724726229f2e2234a22af2e3af2e26269963962a9aa3996202a399969009000",
  INIT_0d=>x"12262222b6362b660c829b4f22bf26224f220040ffa9bf220b44af2e362b0d19",
  INIT_0e=>x"20d0909f262ee2af2e26f22629f9af22afeaf2262900a939aaa9699292929201",
  INIT_0f=>x"00000000b4899c493899a2e2a3996a099662091aaaa9962096292af9a63bf226",
  INIT_10=>x"62e2af2294b9c0b99f2e32630b4f22bf220000003b8620ce99f2095900000000",
  INIT_11=>x"55555555555b9b39690aa47362262e262262e262ea2722f2e26af36273eaf2e2",
  INIT_12=>x"2f80b66e24faf362afaf3e26262620b62a63a93f249629a627629f22aaa90555",
  INIT_13=>x"2b626e27f27273e0ffaeee26e63b22af22602a40a2a6ef2af2ae8b9f2262af22",
  INIT_14=>x"92b92af22f0b92292eaf2264a62600b962829280920b2af0cac0f000040c11c1",
  INIT_15=>x"000000000000b6e69f60009bf22e2672a40a82be8f02af2f20262bf22f2e20a2",
  INIT_16=>x"60b266af206660bc2e2ecc6cac629f2af2262af0cac620e276caf36cac6e6f00",
  INIT_17=>x"299926af34992ce62626a47e62e62462acaf2c62e06bc620e272a6c2af2caf3c",
  INIT_18=>x"993499999966263bf2e2620a7af2035b60362e6eaf203a4e6292bf2e2af2a629",
  INIT_19=>x"000000000000000000000000000000000000000000000000a065a22292901949",
  INIT_1a=>x"445406f038eeb0391138354104108388506f8435354308506fdc301006000000",
  INIT_1b=>x"38ebab1a207fecb18506fe3e448ecccb8d448206fe8b104888c3eb81db8ecc44",
  INIT_1c=>x"8207fb85ecc448207f85dcc448207f2e8ebab1a1eb18507fb338ebab1a207fe0",
  INIT_1d=>x"bbbbba482c8117f85841b38517f825423048517ff65417f8b15308507f85ec44",
  INIT_1e=>x"81857fbcdbcdc846b48e4057ff6417f8cf6417feba482c8188340b348eb8117f",
  INIT_1f=>x"0000000000000000fef45450fbc18938391945384148557fbcdca3b48257feb1",
  INIT_20=>x"0000000000000000000000000000000000000000000000000000000000000000",
  INIT_21=>x"0000000000000000000000000000000000000000000000000000000000000000",
  INIT_22=>x"0000000000000000000000000000000000000000000000000000000000000000",
  INIT_23=>x"cdccc62500000000000000000000000000000000000000000000000000000000",
  INIT_24=>x"c4ccccccccca5a7272af2eaf2ea7272afcceafe00caec2c2afcece6282a47edc",
  INIT_25=>x"b34396498005c456915122cc4b6222f82a47262622faf82c19cc5555555af22a",
  INIT_26=>x"0aab070d9b462202861c290c2560c2d9d51de9690d8969f20000000000000000",
  INIT_27=>x"0e7f450350b6f96f350ab06929290c2928d91900000a040040550a500b0a4f34",
  INIT_28=>x"897e6663e626e0d719afbf205d99f9f29aaab051d9b49b6e0d719af205d968f2",
  INIT_29=>x"000000000be900950939f84f19f65fe8f05f88ff70b03929292929292928d51d",
  INIT_2a=>x"282828280c8c6090c409af204096e20c9af204c840ce990c696e9bf2af2040c9",
  INIT_2b=>x"000000000000000000000061a09a5fcbbf2e5f00000000676067606760b9b408",
  INIT_2c=>x"eef2af22af2e45a47af23526e262362ef2af2ef2e62eaf2260af262fe2609260",
  INIT_2d=>x"b9f2620a6ea4834929ea3a6ea462ebb490000ccf0f0a62ea92a482fe2af226e2",
  INIT_2e=>x"8662626201ffffa02bf22bf22a99f4862ab9bf220b8af2296eaf2af226666660",
  INIT_2f=>x"0000bb46e26e26eef2e0b62e622e622e622e0b6e26e26e26e20000b286662888",
  INIT_30=>x"9262a479fe43e4247eaf2af3a49626e26277ae099a2e099af2faf269922f2920",
  INIT_31=>x"0000000000000000b920bcbfbbbcfff0f00f05b928f2e62af242922f26ef292b",
  INIT_32=>x"66f0050a62e0d89ae0d89afbf2019622999af220d999626e3979af229af229f0",
  INIT_33=>x"890b62af0c6e1b8b622fcf26e6e200b4bf228a4a4af2620000000000e1bebbf6",
  INIT_34=>x"736262e62a2d10ba47362626af362af0ee262e463af026202602af026bf366e0",
  INIT_35=>x"deddbdbdeeea9aa4909f9af909599f266eaf9090909a6666af2a9999a9900aa4",
  INIT_36=>x"af2b4a4962eaa48af2af226ef26af2e2bf2f2f2af2f20b6efe26efe26e2e0d0d",
  INIT_37=>x"0bb46e26e26eef2e0a666eb0b2964f4a408626eaf290b0b62626262bf2f2abf2",
  INIT_38=>x"0000b6862626209209209272092092726a092092720920927266668f82e0f000",
  INIT_39=>x"b9f20b6efe26efe26e2e0eeeedbbf29fbf26ef202620db898f8ee29f2b499400",
  INIT_3a=>x"f22e622e9f62660ff0000eab54bf732e473e262e36e2a46e2eaf26e2e6266bf0",
  INIT_3b=>x"0ebb9fef20db6b89a62e9afe2af2f2f2890b626262a46eb6262a46e26e2e626a",
  INIT_3c=>x"f00000006b6a0c9bfeef2e2af2e2af2e262e02609af2f26662e4f6eef29f20c9",
  INIT_3d=>x"000000000000000000b29200b92e88ee8e98ee260bcaf2af2299a8282828200a",
  INIT_3e=>x"2e80acacb26cac00c0a6202bf4f202af2ae4af2860ffffff20000000000000af",
  INIT_3f=>x"a0a67fcaceafeecacc000ab2eee20af47ca2226af8a86862626a8622ff62cccf"
 )
    port map (clk => clk,
              en => ena0, 
              we => we, 
              ssr => '0', 
              addr(11 downto 0) => MEMaddr(3 to 14),
              di(3 downto 0) => MEMwdata(0 to 3),
              do(3 downto 0) => dout0(0 to 3) );

RAM01 : RAMB16_S4
 generic map (
  INIT_00=>x"88d88800080bb0eff000d0800000000000f000f0000000008004f00004008000",
  INIT_01=>x"8f0000000d3ce1540fac163dc4b6537500868680c61083fff756b3fb07f8cac0",
  INIT_02=>x"1172186767ba436607033037a3561bf77016105669a863366153056909140157",
  INIT_03=>x"67000e8c301fa73431a43470e76332e776330242ee76730627a2f2f1da437090",
  INIT_04=>x"08b1006368676931b71be310b2136867700106bc3360661680040ddd088290e6",
  INIT_05=>x"3d53988eef300340eea0dc4e30034c4d0da03c200dc23d0c79160000bc203c23",
  INIT_06=>x"b6be361a1931b71c310b21aa43666a3b61677f6090f666338f66a43611766388",
  INIT_07=>x"cccd881e0f66e6fa10eea3433240dcdd0202dda32e400d0cccc0c7ca8c3cf670",
  INIT_08=>x"61677f6866177f601010866172d3706289696ff6f01e14214a0978ddcdccdccc",
  INIT_09=>x"7a98488881022582020832867ad362c0654c36616e2051d10103616068606168",
  INIT_0a=>x"b36661431003303766b86632338236696f066185868305016a6306927f612af7",
  INIT_0b=>x"aaaaaacbbcebbe8e2120502fedf02ccc3333c0da3e400cc32320c6b3663003b6",
  INIT_0c=>x"11c11313179060182a31ca321be12113c2a30b239799f6633539f666378a78ba",
  INIT_0d=>x"8aa2aa9a3301552d0ded0dded3dc22d3da43000045d6ca430611aac200160150",
  INIT_0e=>x"5050026a2bd042cc2211c5112707fc52da0a224157f8a706ed97266862626208",
  INIT_0f=>x"dadaaaaa508778760877e342ef66292651152619edf762106d162f07a206a211",
  INIT_10=>x"2120ba4361b600a67a220920099e529c5200000099a1509002c92606b8babdab",
  INIT_11=>x"7a9974979a5e6e96330be10002010203320122012c131291611d23351107a125",
  INIT_12=>x"0cd0a1001a0a2111b9b20630115150613931871c31703671353572438997d79c",
  INIT_13=>x"af13300023133100aed00411210de3ca43351e10c4b40a4da1b2db6a4133c23e",
  INIT_14=>x"33b33b24320a641618a48111a14140963ea364a5630858241810f000000aee88",
  INIT_15=>x"000000000000d3236a06f27d90060303e30dd5c0d253dae2ee33ee24e23240b3",
  INIT_16=>x"b0bb1bb61055500084804a10a01b7a1ea8bb5a241a1bb40bb0292b0292808700",
  INIT_17=>x"366643f21166422bbbb1e2000b224035e0da003da0db0bb40bbbd02bca00cab0",
  INIT_18=>x"6c1166666610cc16a12113d939a0435a343002329a453a30306aac1208a37656",
  INIT_19=>x"0000000000000000000000000000000000000000000000002042a14363501016",
  INIT_1a=>x"302c9dc6a06734cc20c014c5cd650d9229bc6ec00188c6289cb72c8e08000000",
  INIT_1b=>x"02db7711690cda71929fcd22202db62b3a20249ecd6a4c8921becb30bb3c7920",
  INIT_1c=>x"24d4cdb23662024c3cb2f6a2024b2c622db7711ac6192b2c7802db77116a1c2a",
  INIT_1d=>x"b3b3b782433018c100252c8217c2408624c6216c702c05c6a555ca2d5cb27620",
  INIT_1e=>x"1512ccb76b7623e4782c862bc70e5ac1760e3acdb7824330b18cc28c2db3029c",
  INIT_1f=>x"0000000000000000cd782c50cb7ebe82de5dac90c40623ecb7a27878243dcd77",
  INIT_20=>x"0000000000000000000000000000000000000000000000000000000000000000",
  INIT_21=>x"0000000000000000000000000000000000000000000000000000000000000000",
  INIT_22=>x"0000000000000000000000000000000000000000000000000000000000000000",
  INIT_23=>x"0f6367fe00000000000000000000000000000000000000000000000000000000",
  INIT_24=>x"22000000002cfcf8f4cafebafeceeeeacde4ca0006c86f6f9a78720fff820cfe",
  INIT_25=>x"f11163e3000ad0b087d066cc8e1ee4cffd20e0e25fce2ff016021111111cc52b",
  INIT_26=>x"0dd50bcb05122d0cddbddbcdbbdcdcbbbbbb00d20bc01dc20000000000000000",
  INIT_27=>x"021fd10a102cf1cfa101e0dbebfbfdfbffbbb00000070000001c0e70e2066f0f",
  INIT_28=>x"e0e0222e2201a0ee90bc52209e02c722ccdc9099909fd9fa099909c209901fc2",
  INIT_29=>x"000000000fa200080dd6fc9ffefc5f84fc4f40fef0909ededededeeeeeeee9e9",
  INIT_2a=>x"cdededddddddcd00ddc0bc20cd01210d0ac20cdcddd0020dc01225c28e20dcd0",
  INIT_2b=>x"000000000000000000000070d0df1f643f200f000000009e409e409e4052510d",
  INIT_2c=>x"284de61dea281dd3dbcdddd323d3d3d84db418412d1a94ddd5a22dd2211562d0",
  INIT_2d=>x"f2c2220fd2fdd0864d8c0cd2ed1128ddd000066f0f0add2c64c1d4c01ea11121",
  INIT_2e=>x"cc2222220e6523a539eb39c439b7acbc2a979ab30899ab3b229a492b32c22220",
  INIT_2f=>x"0000ee220220220542c0dcc022202220222c0cc0c2022022420000bcd222ccdc",
  INIT_30=>x"ee0eb20e001e01e200bceb2eae52ee620eee920e08100e09ee29421e6ddc26d0",
  INIT_31=>x"0000000000000000e6407b03bccbfff69abfc28d2e2222ec4d226d4c122416d8",
  INIT_32=>x"66f0000a11201b0b001b0bc821010112cccaac3010cc2c12cccc9a43c8a43ca0",
  INIT_33=>x"660d35d240128fee65fa02f16f2f0860e9f0eded1fc1e40000000002dec79836",
  INIT_34=>x"00240220cbc700ba200240cbb2bbbb2404b0228229abb22b42848a5bb82822c0",
  INIT_35=>x"7444dee9d068f8ebf2636f3626067a22b2e4226262682222da28ffff8ff128b2",
  INIT_36=>x"cc299bdd222bbdebc8bcddd2488b22229a22222ca222082412224122222c0404",
  INIT_37=>x"dee220220220142c0e222771d2e2202e2192e20ee2e0e09222222229e8c2c9c2",
  INIT_38=>x"000082c2b2c2c0e20e20e2e20e20e2e2bb0e20e2e20e20e2e2bbccecd200ff8f",
  INIT_39=>x"f2c20e2412224122222c08abd5de222ce2222c2252200dceecd0227a2c2e2200",
  INIT_3a=>x"1220a22450aba80ef00004a8aa81aaa0aaa4aaa28a0a8aa0a491aa0a4aaaa820",
  INIT_3b=>x"077ffc2420ed2dffe2265fc42fa22222ff0b2a282dbad0b282aba808a0a82a2c",
  INIT_3c=>x"4000000005290b05c024b22bab22bab2222a0bbb0bab2bbbbb0b1b01427c20b0",
  INIT_3d=>x"000000000000000000e164e0d638ee00e06e0011040da0ca4366cd1d1d3d5009",
  INIT_3e=>x"82ecb0b0b881b1008398aa89e94eb89a89289ecb800000008000000000000070",
  INIT_3f=>x"c0eff11f10e4041e11000bee004f0d8888c8ef8d1eb9ebf8d88c9beec88a8010"
 )
    port map ( clk => clk,
               en => ena0,
               we => we,
               ssr => '0',
               addr(11 downto 0) => MEMaddr(3 to 14),
               di(3 downto 0) => MEMwdata(4 to 7),
               do(3 downto 0) => dout0(4 to 7) );

RAM02 : RAMB16_S4
 generic map (
  INIT_00=>x"daf37c050d16ecc000004430000000000080000001000700d20f800000b43330",
  INIT_01=>x"8900000006204dbfb0225d51c2cccf517ff06000dd800f7bd3200fefff001e02",
  INIT_02=>x"22f8290fe500e66580872806054c69210bd50fa660af6cb7a7a28a95b66012fe",
  INIT_03=>x"208c0002540b06067004706801577ca615774c6ca015174f7606a79e28a600a1",
  INIT_04=>x"09e2bf454806d578938005819825460639930d38553f322cb66605550050003b",
  INIT_05=>x"55fd7fa0c399b9f9cc00c8f59b99f8fc9c00980b118091086891bbb0f80b9809",
  INIT_06=>x"4998516b3f78b38058198340e695b077d6c67b7b38e852d68e818e65236dcac8",
  INIT_07=>x"4963c8de2e7ae540e0448947914010118ca01406108aa100000801f820607800",
  INIT_08=>x"0836cf7a0286ff70878ba02860d60307155859f778a8a85a90bf4a21d75c4137",
  INIT_09=>x"fed4332c30b11e0b8fb03ba060e62b1534318328105058b878b8484f480f383a",
  INIT_0a=>x"9e79560478872806dca459f03f4a7c5b9b375638b026b91e9d26306ee976e013",
  INIT_0b=>x"043125a19208bc0f1660e1626ad0bc0c9999ca40908aacc9168066997a2810b6",
  INIT_0c=>x"88f88198960b15917188581181891880fbf1b0e1f21678511266785626d24dbc",
  INIT_0d=>x"8bba69a199b2fe4808887bb876b8cc66b0d600007005f0c60188c0f1998108f7",
  INIT_0e=>x"50507440dc9aad88d1440144c682381c38178c98f6fa44703a74d5212e2d2c0c",
  INIT_0f=>x"b8eafdb0eb162747b162364ec785e2449e8543803a345d403082d582ddb18d48",
  INIT_10=>x"f30f70e6562d207560c1bcdb0dd00cd01c0300002778508079894453ddbced9c",
  INIT_11=>x"dc54af85e8bd9d3864038a9a8f8aa0800fa30f9309a9af8a13a7899b530f831b",
  INIT_12=>x"688020f1328603537868917933b5b0190573f33053580cf90b0d60a6b2f48792",
  INIT_13=>x"b09001880150050010caaa1001f8e6b83662150058d0180606e08c98066de86f",
  INIT_14=>x"3f53fe8e68029ba9b080baababba60596e279222f70c3d86ed9060000018ff2c",
  INIT_15=>x"000000000000d201f040f06d0851b181f204d220d029a8c0ec99bd81a86180ce",
  INIT_16=>x"606ece78c0000001041014faa9c260c082223686e69537155e4585e251180d00",
  INIT_17=>x"fb9917f822b91604353c9f80830f5e7322b0e176006e143714463e66c0e21041",
  INIT_18=>x"5c889595950fde81881980c99806198111988020f0329220989910718c02fa69",
  INIT_19=>x"00000000000000000000000000000000000000000000000090d2b8989f808789",
  INIT_1a=>x"d40598d00f761c36051c9c633506859104ad21e91517f20add99c1fd0f000000",
  INIT_1b=>x"124415000e3d221000b5d22fd4247ec319d486acd21245f014b0491fb2141ea4",
  INIT_1c=>x"8607d380be9d4866cd80be9d486cfd2f246130009200023d8392451400081d2d",
  INIT_1d=>x"424292586b1fe1dfe1c807c092d2e1500c82046d1605f9d12240f00a2d50be94",
  INIT_1e=>x"243d4d50c40ce1950589508bd060a8d2bd6022d252586b1fbf59f0592422f8ad",
  INIT_1f=>x"0000000000000000d2150500d400b0f72039053151c20c8d80ce1f058621d21d",
  INIT_20=>x"0000000000000000000000000000000000000000000000000000000000000000",
  INIT_21=>x"0000000000000000000000000000000000000000000000000000000000000000",
  INIT_22=>x"0000000000000000000000000000000000000000000000000000000000000000",
  INIT_23=>x"a2af2e8100000000000000000000000000000000000000000000000000000000",
  INIT_24=>x"1f000000006c1b3a40a864587c7b9a8609416812f180161568907008923fc0a6",
  INIT_25=>x"988f0142227c2416f051eb7bc7dfe4890bf9d9cf0684890210168888888988f6",
  INIT_26=>x"462e0ded7eb4450e16d66e26fd6568eddede075b0db7b4850000000000000000",
  INIT_27=>x"0a7d3706f0c6bc4f3f04c06dde0e366e9cedd7000003002001d511673caffc2a",
  INIT_28=>x"f7e1765e045b00eef740e850fe798685ee22c0ded7c2a3200ddf71850fd7b385",
  INIT_29=>x"00000000030900cb06d494ec96d1de9be7ff00f2f0c0de6e9ecefe2e5e8befed",
  INIT_2a=>x"e66626e6a622e27022a71850e27b0b0275850a2626207b0667b09e05d0502e27",
  INIT_2b=>x"00000000000000000000007c50e19d8c492d1400000000de81de82de83e9eb02",
  INIT_2c=>x"100bd0bde8a0be19e588ee5919e999700638a00b0ba088bdb218ad681aa2fac0",
  INIT_2d=>x"99858503c02cec092a0bcbc0bcbb00eda0000c867a5aee03923ae581a38aba1b",
  INIT_2e=>x"da1526370e056b026703678a68660c7bc7717826007085668010908468c75460",
  INIT_2f=>x"0000cc03832821808100baa45154626473700da4a54564674700007ab123bdbd",
  INIT_30=>x"93c884c780b60b24c14828865c743c04c865500a79b1047c810784bb9ec059d0",
  INIT_31=>x"0000000000000000c9b099077abd96c4cdd3520a5c04050d0f459e90b518b9b0",
  INIT_32=>x"76d00046bb008976108d71008b087bb742660160877448b1535610d6228c6600",
  INIT_33=>x"4f0163286ef09333a6f0c0df0d0d0a1b20eb3434a40f350000000003decb70b8",
  INIT_34=>x"dcffc00d3b3b002dfcdffc4258224787662d0000098230026004e83220803700",
  INIT_35=>x"3756bfc3d4b161b260483084445360532028b4403431765450517b9a185f31ef",
  INIT_36=>x"40033823000b12f503d8e221033b841038382819868503518056180671700b0d",
  INIT_37=>x"fff478768658085004654b9746a758647730831b8490c0373625140303046304",
  INIT_38=>x"00004717f60516a35a24a1975a64a593c34a23a1963a22a195ef01b84010fdaf",
  INIT_39=>x"b9880b1180121802313000e1d04681986858001544401318b041106811779800",
  INIT_3a=>x"0154e62078d0c00940000260cc00ccb4ccc0dca10d8c8db8e000bc8c0dfbc080",
  INIT_3b=>x"0b96581850fd4d6e74407084538687856d017c605d7dd41506c7d040c4c06e54",
  INIT_3c=>x"30000000de47087e0110a161091510814440088c758e8dba97088880846850c7",
  INIT_3d=>x"0000000000000000078a9be079f0888a84f866aa04220ec0e695e7d79707b008",
  INIT_3e=>x"d1305e890cce2900188bfec68681cc80a70af800a0222222a0000000000000f2",
  INIT_3f=>x"10eee0c796f866ef9a00623d666e0a0ee1dddeee03d6d0ecebdb61ab04bfcca2"
 )
    port map ( clk => clk,
               en => ena0,
               we => we,
               ssr => '0',
               addr(11 downto 0) => MEMaddr(3 to 14),
               di(3 downto 0) => MEMwdata(8 to 11),
               do(3 downto 0) => dout0(8 to 11) );


  RAM10 : RAMB16_S4
    generic map ( INIT_00 => x"000000000000000000000000000000000000000000000000000000000000aa4e" )
    port map ( clk => clk,
               en => ena1,
               we => we,
               ssr => '0',
               addr(11 downto 0) => MEMaddr(3 to 14),
               di(3 downto 0) => MEMwdata(0 to 3),
               do(3 downto 0) => dout1(0 to 3) );

  RAM11 : RAMB16_S4
    generic map ( INIT_00 => x"0000000000000000000000000000000000000000000000000000000000000040" )
    port map ( clk => clk,
               en => ena1,
               we => we,
               ssr => '0',
               addr(11 downto 0) => MEMaddr(3 to 14),
               di(3 downto 0) => MEMwdata(4 to 7),
               do(3 downto 0) => dout1(4 to 7) );

  RAM12 : RAMB16_S4
    generic map ( INIT_00 => x"0000000000000000000000000000000000000000000000000000000000000111" )
    port map ( clk => clk,
               en => ena1,
               we => we,
               ssr => '0',
               addr(11 downto 0) => MEMaddr(3 to 14),
               di(3 downto 0) => MEMwdata(8 to 11),
               do(3 downto 0) => dout1(8 to 11) );


  RAM20 : RAMB16_S4
    generic map ( INIT_00 => x"000000000000000000000000000000000000000000000000000000000000aa4e" )
    port map ( clk => clk,
               en => ena2,
               we => we,
               ssr => '0',
               addr(11 downto 0) => MEMaddr(3 to 14),
               di(3 downto 0) => MEMwdata(0 to 3),
               do(3 downto 0) => dout2(0 to 3) );

  RAM21 : RAMB16_S4
    generic map ( INIT_00 => x"0000000000000000000000000000000000000000000000000000000000000040" )
    port map ( clk => clk,
               en => ena2,
               we => we,
               ssr => '0',
               addr(11 downto 0) => MEMaddr(3 to 14),
               di(3 downto 0) => MEMwdata(4 to 7),
               do(3 downto 0) => dout2(4 to 7) );

  RAM22 : RAMB16_S4
    generic map ( INIT_00 => x"0000000000000000000000000000000000000000000000000000000000000111" )
    port map ( clk => clk,
               en => ena2,
               we => we,
               ssr => '0',
               addr(11 downto 0) => MEMaddr(3 to 14),
               di(3 downto 0) => MEMwdata(8 to 11),
               do(3 downto 0) => dout2(8 to 11) );


  RAM30 : RAMB16_S4
    generic map ( INIT_00 => x"000000000000000000000000000000000000000000000000000000000000aa4e" )
    port map ( clk => clk,
               en => ena3,
               we => we,
               ssr => '0',
               addr(11 downto 0) => MEMaddr(3 to 14),
               di(3 downto 0) => MEMwdata(0 to 3),
               do(3 downto 0) => dout3(0 to 3) );

  RAM31 : RAMB16_S4
    generic map ( INIT_00 => x"0000000000000000000000000000000000000000000000000000000000000040" )
    port map ( clk => clk,
               en => ena3,
               we => we,
               ssr => '0',
               addr(11 downto 0) => MEMaddr(3 to 14),
               di(3 downto 0) => MEMwdata(4 to 7),
               do(3 downto 0) => dout3(4 to 7) );

  RAM32 : RAMB16_S4
    generic map ( INIT_00 => x"0000000000000000000000000000000000000000000000000000000000000111" )
    port map ( clk => clk,
               en => ena3,
               we => we,
               ssr => '0',
               addr(11 downto 0) => MEMaddr(3 to 14),
               di(3 downto 0) => MEMwdata(8 to 11),
               do(3 downto 0) => dout3(8 to 11) );

  RAM40 : RAMB16_S4
    generic map ( INIT_00 => x"00000000000000000000000000000000000000000000000000000000000000fb" )
    port map (clk => clk,
              en => ena4, 
              we => we, 
              ssr => '0', 
              addr(11 downto 0) => MEMaddr(3 to 14),
              di(3 downto 0) => MEMwdata(0 to 3),
              do(3 downto 0) => dout4(0 to 3) );

  RAM41 : RAMB16_S4
    generic map ( INIT_00 => x"00000000000000000000000000000000000000000000000000000000000000C0" )
    port map ( clk => clk,
               en => ena4,
               we => we,
               ssr => '0',
               addr(11 downto 0) => MEMaddr(3 to 14),
               di(3 downto 0) => MEMwdata(4 to 7),
               do(3 downto 0) => dout4(4 to 7) );

  RAM42 : RAMB16_S4
    generic map ( INIT_00 => x"0000000000000000000000000000000000000000000000000000000000000001" )
    port map ( clk => clk,
               en => ena4,
               we => we,
               ssr => '0',
               addr(11 downto 0) => MEMaddr(3 to 14),
               di(3 downto 0) => MEMwdata(8 to 11),
               do(3 downto 0) => dout4(8 to 11) );


  RAM50 : RAMB16_S4
    generic map ( INIT_00 => x"000000000000000000000000000000000000000000000000000000000000aa4e" )
    port map ( clk => clk,
               en => ena5,
               we => we,
               ssr => '0',
               addr(11 downto 0) => MEMaddr(3 to 14),
               di(3 downto 0) => MEMwdata(0 to 3),
               do(3 downto 0) => dout5(0 to 3) );

  RAM51 : RAMB16_S4
    generic map ( INIT_00 => x"0000000000000000000000000000000000000000000000000000000000000040" )
    port map ( clk => clk,
               en => ena5,
               we => we,
               ssr => '0',
               addr(11 downto 0) => MEMaddr(3 to 14),
               di(3 downto 0) => MEMwdata(4 to 7),
               do(3 downto 0) => dout5(4 to 7) );

  RAM52 : RAMB16_S4
    generic map ( INIT_00 => x"0000000000000000000000000000000000000000000000000000000000000111" )
    port map ( clk => clk,
               en => ena5,
               we => we,
               ssr => '0',
               addr(11 downto 0) => MEMaddr(3 to 14),
               di(3 downto 0) => MEMwdata(8 to 11),
               do(3 downto 0) => dout5(8 to 11) );


  RAM60 : RAMB16_S4
    generic map ( INIT_00 => x"000000000000000000000000000000000000000000000000000000000000aa4e" )
    port map ( clk => clk,
               en => ena6,
               we => we,
               ssr => '0',
               addr(11 downto 0) => MEMaddr(3 to 14),
               di(3 downto 0) => MEMwdata(0 to 3),
               do(3 downto 0) => dout6(0 to 3) );

  RAM61 : RAMB16_S4
    generic map ( INIT_00 => x"0000000000000000000000000000000000000000000000000000000000000040" )
    port map ( clk => clk,
               en => ena6,
               we => we,
               ssr => '0',
               addr(11 downto 0) => MEMaddr(3 to 14),
               di(3 downto 0) => MEMwdata(4 to 7),
               do(3 downto 0) => dout6(4 to 7) );

  RAM62 : RAMB16_S4
    generic map ( INIT_00 => x"0000000000000000000000000000000000000000000000000000000000000111" )
    port map ( clk => clk,
               en => ena6,
               we => we,
               ssr => '0',
               addr(11 downto 0) => MEMaddr(3 to 14),
               di(3 downto 0) => MEMwdata(8 to 11),
               do(3 downto 0) => dout6(8 to 11) );


  RAM70 : RAMB16_S4
    generic map ( INIT_00 => x"000000000000000000000000000000000000000000000000000000000000aa4e" )
    port map ( clk => clk,
               en => ena7,
               we => we,
               ssr => '0',
               addr(11 downto 0) => MEMaddr(3 to 14),
               di(3 downto 0) => MEMwdata(0 to 3),
               do(3 downto 0) => dout7(0 to 3) );

  RAM71 : RAMB16_S4
    generic map ( INIT_00 => x"0000000000000000000000000000000000000000000000000000000000000040" )
    port map ( clk => clk,
               en => ena7,
               we => we,
               ssr => '0',
               addr(11 downto 0) => MEMaddr(3 to 14),
               di(3 downto 0) => MEMwdata(4 to 7),
               do(3 downto 0) => dout7(4 to 7) );

  RAM72 : RAMB16_S4
    generic map ( INIT_00 => x"0000000000000000000000000000000000000000000000000000000000000111" )
    port map ( clk => clk,
               en => ena7,
               we => we,
               ssr => '0',
               addr(11 downto 0) => MEMaddr(3 to 14),
               di(3 downto 0) => MEMwdata(8 to 11),
               do(3 downto 0) => dout7(8 to 11) );

rdwr : process (clk, reset) is
begin
  if reset = '0' then
         MEMpending <= '0';

         ena0 <= '0';
         ena1 <= '0';
         ena2 <= '0';
         ena3 <= '0';
         ena4 <= '0';
         ena5 <= '0';
         ena6 <= '0';
         ena7 <= '0';
         we <= '0';
--         MEMdone <= 'Z';
--         MEMrdata <= (others => 'Z');
         MEMdone <= '1';
	      MEMrdata <= (others => '1');

  elsif clk'event AND (clk = '0') then
    if MEMpending = '1' then
      MEMdone <= '0';
      if ena0 = '1' then
        MEMrdata <= dout0;
      elsif ena1 = '1' then
        MEMrdata <= dout1;
      elsif ena2 = '1' then
        MEMrdata <= dout2;
      elsif ena3 = '1' then
        MEMrdata <= dout3;
      elsif ena4 = '1' then
        MEMrdata <= dout4;
      elsif ena5 = '1' then
        MEMrdata <= dout5;
      elsif ena6 = '1' then
        MEMrdata <= dout6;
      elsif ena7 = '1' then
        MEMrdata <= dout7;
      else
        MEMrdata <= o"7402";
      end if;

      we <= '0';

      if (MEMrd and MEMwr) = '1' then
          MEMpending <= '0';
	       ena0 <= '0';
	       ena1 <= '0';
	       ena2 <= '0';
	       ena3 <= '0';
	       ena4 <= '0';
	       ena5 <= '0';
	       ena6 <= '0';
	       ena7 <= '0';
--          MEMdone  <= 'Z';
--          MEMrdata <= (others => 'Z');
          MEMdone  <= '1';
          MEMrdata <= (others => '1');
      end if;
    elsif ((MEMrd xor MEMwr) = '1') then
            case MEMaddr(0 to 2) is
            when "000" =>
               ena0 <= '1';
            when "001" =>
               ena1 <= '1';
            when "010" =>
               ena2 <= '1';
            when "011" =>
               ena3 <= '1';
            when "100" =>
               ena4 <= '1';
            when "101" =>
               ena5 <= '1';
            when "110" =>
               ena6 <= '1';
            when "111" =>
               ena7 <= '1';
            when others =>
               null;
            end case;

            MEMpending <= '1';
            we <= not MEMwr;
    end if;
  end if;
end process rdwr;

end architecture rtl;

