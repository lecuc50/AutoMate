*** settings ***
Resource  ../Root_path.resource
Resource    ${root}Resources/HHS/Keywords.resource
Suite Setup     Open Com port and set Interface    ${interface_name}    ${COMPORT}      ${reading_mode}
*** Variables ***
${current_directory}         ${data_source}\\Quick_Test

*** test cases ***
GS1 Digital Link Transmit Mode 1 + GS1 2D Transmit Format = Send Complete
    [Documentation]  GS1 Digital Link Transmit Mode 1 + GS1 2D Transmit Format = Send Complete
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                           Expected result
    Send  $S,CGDTM01,CGDTF00,CAIEN01,Ar                     $>,>,>,>
    Read  EAN8_95200125                                     ]E495200125
    Read  UPCE_01234558                                     ]E00012345000058
    Read  UPCA_012345000058                                 ]E00012345000058
    Read  UPCA_270d_012345000058                            ]E00952110000022
    Read  EAN13_9521101530018                               ]E09521101530018
    Read  GS1DataBarOmnidirectional_00012345000058          ]e00100012345000058
    Read  GS1DataBarTruncated_00012345000058                ]e00100012345000058
    Read  GS1DataBarStackedOmnidirectional_0100012345000058  ]e00100012345000058
    Read  GS1DataBarStackedOmnidirectional_0100804305000150    ]e00100804305000150
    Read  GS1DataBarStackedOmnidirectional_0109322288224376  ]e00109322288224376
    Read  GS1DataBarExpanded_0100012345000058               ]e00100012345000058
    Read  GS1DataBarExpandedStacked_0109521101530018        ]e00109521101530018
    Read  GS1DataBarExpandedStacked_0100012345000058        ]e0010001234500005817270101
    Read  GS1DataBarExpandedStacked_AI_17_01_0100012345000058        ]e0172701010100012345000058
    Read  GS1DataBarExpandedStacked_AI_01_10_0100012345000058    ]e0010001234500005810123
    Read  DataBarExpStacked_AI_01_10_010001234500005810aBc      ]e0010001234500005810aBc
    Read  DataBarExpStacked_AI_01_21_0100012345000058       ]e0010001234500005821987
    Read  DataBarExpStacked_AI_01_3202_0100012345000058     ]e001000123450000583202001234
    Read  DataBarExpStacked_AI_01_8007_01000123450000588007TEST  ]e001000123450000588007TEST
    Read  DataBarExpStacked_AI_01_11_17_10_21_16_01000123450000581121010117270101101232198716250101   ]e00100012345000058112101011727010110123{GS}21987{GS}16250101
    Read  ITF14_00012345000058                              ]I100012345000058
    Read  GS1128_0100012345000058                           ]C10100012345000058
    Read  GS1128_AI_01_17_0100012345000058                  ]C1010001234500005817270101
    Read  GS1128_AI_17_01_00012345000058                    ]C11727010101000123450000581
    Read  GS1128_AI_01_10_00012345000058                    ]C1010001234500005810123
    Read  GS1128_AI_01_10_010001234500005810aBc             ]C1010001234500005810aBc
    Read  GS1128_AI_01_21_010001234500005821987             ]C1010001234500005821987
    Read  GS1128_01000123450000583202001234                 ]C101000123450000583202001234
    Read  GS1128_AI_01_8007_01000123450000588007TEST        ]C101000123450000588007TEST
    Read  GS1128_AI_01_11_17_10_21_16                       ]C10100012345000058112101011727010110123{GS}21987{GS}16250101
    Read  GS1DL_SSCC_GS1128                                 ]C142087109 OR/ ]C1911528 OR/ ]C100000521775138957172
    Read  GS1DL_DMNotGS1DL_1234ABCD                         ${EMPTY}
    Read  GS1DL_QRNotGS1DL                                  ${EMPTY}
    Read  GS1DL_GTIN12-GS1DM_0100012345000058               ]d20100012345000058
    Read  GS1DL_GTIN12-QRURI_0100012345000058               ]Q100012345000058
    Read  GS1DL_GTIN12-DMURI_0100012345000058               ]d100012345000058


TC12xx _ Mode 1 + Send GS1 Element String Format of 2D and/or Digital Watermark Label(s) minus Web Address
    [Documentation]  "Test Ideas from ref.gs1.org/test-suites/2d-barcodes-in-retail/ Test 01
    ...  Baseline linear reference GTIN-8 control barcode: EAN-8
    ...  Barcode data 00000095200125: GTIN-8"
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                           Expected result
    Send  $S,CGDTM01,CGDTF01,CAIEN01,Ar                     $>,>,>,>
    Read  GS1DL_GTIN13-QRURI_0109521101530018               ]Q30109521101530018
    Read  GS1DL_GTIN13-DMURI_0109521101530018               ]d20109521101530018
    Read  GS1DL_GTIN13-QRURI-2DReverse_0109521101530018     ]Q30109521101530018
    Read  GS1DL_GTIN12-GS1DM-2DReverse_0100012345000058     ]d20100012345000058
    Read  GS1DL_DMNotGS1DL_123456789123                     ${EMPTY}
    Read  GS1DL_QRNotGS1DL_123456789123                     ${EMPTY}

TC13xx _ Mode 1 + Transmit Only GTIN Portion of 2D and/or Digital Watermark Label(s)
    [Documentation]  CI_GS1_DIGITAL_LINK_TRANSMIT_MODE  03=Mode 2 - Prefer 2D GS1 label
    ...  CI_GS1_DIGITAL_LINK_2D_TRANSMIT_FORMAT GDTF02=Send the content as GS1 Databar-14
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                           Expected result
    Send  $S,CGDTM01,CGDTF02,CAIEN01,Ar                     $>,>,>,>
    Read  EAN8_95200125                                     ]E495200002
    Read  EAN13_9521101530018                               ]E09521101530018
    Read  GS1DL_GTIN14_DataBarExpStacked_0110012345000055        ]e00110012345000055
    Read  GS1DL_GTIN14-ITF14_0110012345000055               ]I110012345000055

TC21xx _ Mode 2 + Send Complete GS1 2D or DWM labels including Wed Address
    [Documentation]  CI_GS1_DIGITAL_LINK_2D_TRANSMIT_FORMAT GDTF02=Send the content as GS1 Databar-14
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                           Expected result
    Send  $S,CGDTM03,CGDTF00,CAIEN01,Ar                     $>,>,>,>
    Read  GS1DL_GTIN13-EAN13-QRNotGS1DL-Mid-45d             ]E09521207301154
    Read  GS1DL_GTIN13-EAN13-DMNotGS1DL-Near-270d-90d       ]E09521832001160
    Read  GS1DL_GS1DM-DMNotGS1DL-Near-315d                  ]d21009521618311630000000000000000
    Read  GS1DL_GTIN12-GS1DM-AI-01-17_010001234500005817270101  ]d2010001234500005817270101
    Read  GS1DL_GTIN12-GS1DM-AI-17-01_172701010100012345000058   ]d21727010101000123450000581
    Read  GS1DL_GTIN12-GS1DM-AI-01-10_010001234500005810123     ]d2010001234500005810123
    Read  GS1DL_GTIN12-GS1DM-AI-01-10_010001234500005810aBc     ]d2010001234500005810aBc
    Read  GS1DL_GTIN12-GS1DM-AI-01-21_010001234500005821987     ]d2010001234500005821987
    Read  GS1DL_GTIN12-GS1DM-AI-01-3202_01000123450000583202001234  ]d201000123450000583202001234
    Read  GS1DL_GTIN12-GS1DM-AI-01-8007_01000123450000588007TEST   ]d201000123450000588007TEST
    Read  GS1DL_GTIN12-GS1DM-AI-01-11-17-10-21-16           ]d20100012345000058112101011727010110123{GS}21987{GS}16250101
    Read  GS1DL_GTIN12-QRURI-AI-01-17_010001234500005817270101  ]Q1https://example.com/01/00012345000058?17=270101
    Read  GS1DL_GTIN12-QRURI-AI-01-10                       ]Q1https://example.com/01/00012345000058/10/123
    Read  GS1DL_GTIN12-QRURI-AI-01-10_010001234500005810aBc  ]Q1https://example.com/01/00012345000058/10/aBc
    Read  GS1DL_GTIN12-QRURI-AI-01-21_0100012345000058 21987  ]Q1https://example.com/01/00012345000058/21/987
    Read  GS1DL_GTIN12-QRURI-AI-01-3202_01000123450000583202001234  ]Q1https://example.com/01/00012345000058?3202=001234
    Read  GS1DL_GTIN12-QRURI-AI-01-8007_01000123450000588007TEST  ]Q1https://example.com/01/00012345000058?8007=TEST
    Read  GS1DL_GTIN12-QRURI-AI-01-10-21-11-16-17   ]Q1https://example.com/01/00012345000058/10/123/21/987?11=210101&16=250101&17=270101
    Read  GS1DL_GTIN12-DMURI-AI-01-17           ]d1https://example.com/01/00012345000058?17=270101
    Read  GS1DL_GTIN12-DMURI-AI-01-10_010001234500005810123  ]d1https://example.com/01/00012345000058/10/123
    Read  GS1DL_GTIN12-DMURI-AI-01-10_010001234500005810aBc  ]d1https://example.com/01/00012345000058/10/aBc
    Read  GS1DL_GTIN12-DMURI-AI-01-21_010001234500005821987   ]d1https://example.com/01/00012345000058/21/987
    Read  GS1DL_GTIN12-DMURI-AI-01-3202_01000123450000583202001234  ]d1https://example.com/01/00012345000058?3202=001234
    Read  GS1DL_GTIN12-DMURI-AI-01-8007             ]d1https://example.com/01/00012345000058?8007=TEST
    Read  GS1DL_GTIN12-DMURI-AI-01-10-21-11-16-17       ]d1https://example.com/01/00012345000058/10/123/21/987?11=210101&16=250101&17=270101

TC22xx _ Mode 2 + Send GS1 Element String Format of 2D and/or Digital Watermark Label(s) minus Web Address
    [Documentation]  CI_GS1_DIGITAL_LINK_2D_TRANSMIT_FORMAT GDTF01=01=Send original type, stripping web address part
    ...
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                           Expected result
    Send  $S,CGDTM03,CGDTF01,CAIEN01,Ar                     $>,>,>,>
    Read  GS1DL_GTIN12-GS1DM-AI-01-17_010001234500005817271231  ]d2010001234500005817271231
    Read  GS1DL_GTIN12-GS1DM-AI-17-01_172712310100012345000058  ]d2172712310100012345000058
    Read  GS1DL_GTIN12-GS1DM-AI-01-17-10                    ]d201000123450000581727123110ABC123
    Read  GS1DL_GTIN12-GS1DM-AI-01-10-17-21                 ]d2010001234500005810ABC123{GS}1727123121123456
    Read  GS1DL_GTIN12-GS1DM-AI-01-3202-17                  ]d20100012345000058320200125617271231
    Read  GS1DL_GTIN13-GS1DM-AI-01-10-17-3102-8200          ]d2010871932644520510STR210401{GS}1721041331020000508200WWW.PRODUCT-LABEL.NL
    Read  GS1DL_GTIN13-GS1DM-AI-01-15-3103-3922-10          ]d2010933968709800215220901310300063039220001575{GS}10ABC123
    Read  GS1DL_GTIN13-QRURI-AI-01-17                       ]Q3010952110153001817271231
    Read  GS1DL_GTIN13-QRURI-AI-01-22-17                    ]Q3010952110153001822ABC{GS}17271231
    Read  GS1DL_GTIN13-QRURI-AI-01-10-17                    ]Q3010952110153001810ABC123{GS}17271231
    Read  GS1DL_GTIN13-QRURI-AI-01-10-17-21                 ]Q3010952110153001810ABC123{GS}21123456{GS}17271231
    Read  GS1DL_GTIN13-QRURI-AI-01-3202-17                  ]Q30109521101530018172712313200001256
    Read  GS1DL_GTIN13-DMURI-AI-01-17                       ]d2010952110153001817271231
    Read  GS1DL_GTIN13-DMURI-AI-01-22-17                    ]d2010952110153001822ABC{GS}17271231
    Read  GS1DL_GTIN13-DMURI-AI-01-10-17                    ]d2010952110153001810ABC123{GS}17271231
    Read  GS1DL_GTIN13-DMURI-AI-01-10-17-21                 ]d2010952110153001810ABC123{GS}21123456{GS}17271231
    Read  GS1DL_GTIN13-DMURI-AI-01-3202-17                  ]d20109521101530018320200125617271231
    Read  GS1DL_GTIN12-UPCA-NonGS1QR-Near-90d               ]E00952153101151
    Read  GS1DL_GTIN12-UPCA-NonGS1DM-Near-135d-315d         ]E00952183201166

TC23xx _ Mode 2 + Transmit Only GTIN Portion of 2D and/or Digital Watermark Label(s)
    [Documentation]  CI_GS1_DIGITAL_LINK_2D_TRANSMIT_FORMAT GDTF01=01=Send original type, stripping web address part
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                           Expected result



TC31xx _ Mode 3 + Send Complete GS1 2D or DWM labels including Wed Address
    [Documentation]  CI_GS1_DIGITAL_LINK_TRANSMIT_MODE = 02=Mode 3 - Send all GS1 labels
    ...  CI_GS1_DIGITAL_LINK_2D_TRANSMIT_FORMAT 00=Send original type
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                           Expected result
    Send  $S,CGDTM02,CGDTF01,CAIEN01,Ar                     $>,>,>,>
    Read  GS1DL_GTIN12-UPCA-DMURI-AI-01-10-21-17-Near       $nxxxxxxxx]E00051000006011\n$nxxxxxxxx~]d1https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229  OR/ $nxxxxxxxx~]E00051000006011  OR/ $nxxxxxxxx~]d1https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229
    Read  GS1DL_GTIN12-UPCA-DMURI-AI-01-10-21-17-Near       $nxxxxxxxx~]E00051000006011\n$nxxxxxxxx~]Q1https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229  OR/ $nxxxxxxxx~]E00051000006011  OR/ $nxxxxxxxx~]Q1https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229
    Read  GS1DL_GTIN8-EAN8-DMURI-AI-01-10-17-310-Near       $nxxxxxxxx~]E400616218\n$nxxxxxxxx~]d1https://www.traderjoes.com/home/discover/entertaining/quick-crispyturkey-less-stuffed-roast/01/00000000616218/10/21260?17=230101&310=3001134  OR/ $nxxxxxxxx~]E400616218  OR/ $nxxxxxxxx~]d1https://www.traderjoes.com/home/discover/entertaining/quick-crispyturkey-less-stuffed-roast/01/00000000616218/10/21260?17=230101&310=3001134
    Read  GS1DL_GTIN8-EAN8-QRURI-AI-01-10-17-310-Near       $nxxxxxxxx~]E400616218\n$nxxxxxxxx~]Q1https://www.traderjoes.com/home/discover/entertaining/quick-crispyturkey-less-stuffed-roast/01/00000000616218/10/21260?17=230101&310=3001134  OR/ $nxxxxxxxx~]E400616218  OR/ $nxxxxxxxx~]Q1https://www.traderjoes.com/home/discover/entertaining/quick-crispyturkey-less-stuffed-roast/01/00000000616218/10/21260?17=230101&310=3001134
    Read  GS1DL_GTIN13-EAN13-DMURI-AI-01-10-16-310-Near     $nxxxxxxxx~]E05400141060218\n$nxxxxxxxx~]d1https://www.collectandgo.be/colruyt/fr/assortiment/boni-poivronsmix-4-pi%C3%A8ces/01/05400141060218/10/BE-BIO-02?16=230112&310=3000420  OR/ $nxxxxxxxx~]E05400141060218 OR/ $nxxxxxxxx~]d1https://www.collectandgo.be/colruyt/fr/assortiment/boni-poivronsmix-4-pi%C3%A8ces/01/05400141060218/10/BE-BIO-02?16=230112&310=3000420
    Read  GS1DL_GTIN13-EAN13-QRURI-AI-01-10-16-310-Near     $nxxxxxxxx~]E05400141060218\n$nxxxxxxxx~]Q1https://www.collectandgo.be/colruyt/fr/assortiment/boni-poivronsmix-4-pi%C3%A8ces/01/05400141060218/10/BE-BIO-02?16=230112&310=3000420 OR/ $nxxxxxxxx~]E05400141060218 OR/ $nxxxxxxxx~]Q1https://www.collectandgo.be/colruyt/fr/assortiment/boni-poivronsmix-4-pi%C3%A8ces/01/05400141060218/10/BE-BIO-02?16=230112&310=3000420
    Read  GS1DL_GTIN12-DataBarStackedOmni-DMURI-AI-01-16-310-Near  $nxxxxxxxx~]e00100033383084091\n$nxxxxxxxx~]d1https://www.harristeeter.com/p/jonathanapples/01/00033383084091?fulfillment=IN_STORE&16=221105&310=3000907  OR/ $nxxxxxxxx~]e00100033383084091 OR/ $nxxxxxxxx~]d1https://www.harristeeter.com/p/jonathanapples/01/00033383084091?fulfillment=IN_STORE&16=221105&310=3000907
    Read  GS1DL_GTIN12-DataBarStackedOmni-QRURI-AI-01-16-310-Near       $nxxxxxxxx~]e00100033383084091\n$nxxxxxxxx~]Q1https://www.harristeeter.com/p/jonathanapples/01/00033383084091?fulfillment=IN_STORE&16=221105&310=3000907  OR/ $nxxxxxxxx~]e00100033383084091 OR/ $nxxxxxxxx~]Q1https://www.harristeeter.com/p/jonathanapples/01/00033383084091?fulfillment=IN_STORE&16=221105&310=3000907
