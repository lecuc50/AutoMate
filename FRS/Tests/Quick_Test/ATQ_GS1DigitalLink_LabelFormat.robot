*** settings ***
Resource  ../Root_path.resource
Resource    ${root}Resources/HHS/Keywords.resource
Suite Setup     Open Com port and set Interface    ${interface_name}    ${COMPORT}      ${reading_mode}


*** Variables ***
${current_directory}         ${data_source}\\Quick_Test


*** test cases ***
ATQ_GS1DigitalLink_LabelFormat
    [Documentation]  This test case verify the output data when combine setting format:
    ...   <Label Set Number ID><Label Set Number><Symbology Label ID><AIM ID><Label Data>
    ...   Adding Prefix + Suffix.

    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                                                   Expected result
    Send  $S,CGDTM02,Ar				                                $>,>,>
    EnterSP				                                            $>
    Send  $CIDCO01				                                    $>
    Send  $CAIEN01				                                    $>
    Send  $CLFPR5F70725F				                            $>
    Send  $CLFSU5F73755F0D				                            $>
    Send  $C4BEN01				                                    $>
    Send  $CLBEN01				                                    $>
    Send  $CXBEN01				                                    $>
    Send  $Ar				                                        $>
    Send  $S,CGDTF00,Ar				                                $>,>,>
    Read  Label Set 1-UPCA_Campbells Tomato Soup_Datamatrix			$n00000001_pr_F]E00051000006011_su_ OR/ $n000000xx_pr_Dg]d2https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229_su_
    Read  Label Set 1-UPCA_Campbells Tomato Soup_QRCode				$n00000001_pr_F]E00051000006011_su_ OR/ $n000000xx_pr_Dg]d2https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229_su_
    Read  Label Set 2 EAN8_Datamatrix				                $n000000xx_pr_FF]E400616218_su_ OR/ $n000000xx_pr_Dg]d2https://www.traderjoes.com/home/discover/entertaining/quick-crispy-turkey-less-stuffed-roast/01/00000000616218/10/21260?17=230101&310=3001134_su_
    Read  Label Set 2 EAN8_QRCode				                    $n000000xx_pr_FF]E400616218_su_ OR/ $n000000xx_pr_Dg]d2https://www.traderjoes.com/home/discover/entertaining/quick-crispy-turkey-less-stuffed-roast/01/00000000616218/10/21260?17=230101&310=3001134_su_
    Read  Label Set 3 EAN13_Datamatrix				                $n000000xx_pr_F]E05400141060218_su_ OR/ $n000000xx_pr_Dg]d2https://www.collectandgo.be/colruyt/fr/assortiment/boni-poivrons-mix-4-pi%C3%A8ces/01/05400141060218/10/BE-BIO-02?16=230112&310=3000420_su_
    Read  Label Set 3 EAN13_QRCode				                    $n000000xx_pr_F]E05400141060218_su_ OR/ $n000000xx_pr_Dg]d2https://www.collectandgo.be/colruyt/fr/assortiment/boni-poivrons-mix-4-pi%C3%A8ces/01/05400141060218/10/BE-BIO-02?16=230112&310=3000420_su_
    Read  Label Set 4-Databar14_QRCode				                $n000000xx_pr_R4]e00100033383084091_su_ OR/ $n000000xx_pr_Dg]d2https://www.harristeeter.com/p/jonathan-apples/01/00033383084091?fulfillment=IN_STORE&16=221105&310=3000907_su_
    Read  Label Set 4-Databar14_Datamatrix				            $n000000xx_pr_R4]e00100033383084091_su_ OR/ $n000000xx_pr_Dg]d2https://www.harristeeter.com/p/jonathan-apples/01/00033383084091?fulfillment=IN_STORE&16=221105&310=3000907_su_
    Read  Label Set 5- Databar14 Limited_QRCode				        $n000000xx_pr_RL]e00100614141999996_su_ OR/ $n000000xx_pr_Dg]d2https://www.harristeeter.com/p/jonathan-apples/01/00614141999996?fulfillment=IN_STORE&16=221105&310=3000907_su_
    Read  Label Set 5- Databar14 Limited_Datamatrix				    $n000000xx_pr_RL]e00100614141999996_su_ OR/ $n000000xx_pr_Dg]d2https://www.harristeeter.com/p/jonathan-apples/01/00614141999996?fulfillment=IN_STORE&16=221105&310=3000907_su_
    Read  Label Set 6- Databar14 Stacked_QRCode				        $n000000xx_pr_RX]e0010789604830096610ExtremelyWired{GS}3103000500_su_ OR/ $n000000xx_pr_Dg]d2https://www.lojacafepacaembu.com.br/01/07896048300966/10/ExtremelyWired?16=240515&310=3000500_su_
    Read  Label Set 6- Databar14 Stacked_Datamatrix				    $n000000xx_pr_RX]e0010789604830096610ExtremelyWired{GS}3103000500_su_ OR/ $n000000xx_pr_Dg]d2https://www.lojacafepacaembu.com.br/01/07896048300966/10/ExtremelyWired?16=240515&310=3000500_su_
    Send  $S,CGDTF01,Ar				                                $>,>,>
    Read  Label Set 1-UPCA_Campbells Tomato Soup_Datamatrix			$n00000001_pr_F]E00051000006011_su_ OR/ $n000000xx_pr_Dg]d2https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229_su_
    Read  Label Set 1-UPCA_Campbells Tomato Soup_QRCode				$n00000001_pr_F]E00051000006011_su_ OR/ $n000000xx_pr_Dg]d2https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229_su_
    Read  Label Set 2 EAN8_Datamatrix				                $n000000xx_pr_FF]E400616218_su_ OR/ $n000000xx_pr_Dg]d2https://www.traderjoes.com/home/discover/entertaining/quick-crispy-turkey-less-stuffed-roast/01/00000000616218/10/21260?17=230101&310=3001134_su_
    Read  Label Set 2 EAN8_QRCode				                    $n000000xx_pr_FF]E400616218_su_ OR/ $n000000xx_pr_Dg]d2https://www.traderjoes.com/home/discover/entertaining/quick-crispy-turkey-less-stuffed-roast/01/00000000616218/10/21260?17=230101&310=3001134_su_
    Read  Label Set 3 EAN13_Datamatrix				                $n000000xx_pr_F]E05400141060218_su_ OR/ $n000000xx_pr_Dg]d2https://www.collectandgo.be/colruyt/fr/assortiment/boni-poivrons-mix-4-pi%C3%A8ces/01/05400141060218/10/BE-BIO-02?16=230112&310=3000420_su_
    Read  Label Set 3 EAN13_QRCode				                    $n000000xx_pr_F]E05400141060218_su_ OR/ $n000000xx_pr_Dg]d2https://www.collectandgo.be/colruyt/fr/assortiment/boni-poivrons-mix-4-pi%C3%A8ces/01/05400141060218/10/BE-BIO-02?16=230112&310=3000420_su_
    Read  Label Set 4-Databar14_QRCode				                $n000000xx_pr_R4]e00100033383084091_su_ OR/ $n000000xx_pr_Dg]d2https://www.harristeeter.com/p/jonathan-apples/01/00033383084091?fulfillment=IN_STORE&16=221105&310=3000907_su_
    Read  Label Set 4-Databar14_Datamatrix				            $n000000xx_pr_R4]e00100033383084091_su_ OR/ $n000000xx_pr_Dg]d2https://www.harristeeter.com/p/jonathan-apples/01/00033383084091?fulfillment=IN_STORE&16=221105&310=3000907_su_
    Read  Label Set 5- Databar14 Limited_QRCode				        $n000000xx_pr_RL]e00100614141999996_su_ OR/ $n000000xx_pr_Dg]d2https://www.harristeeter.com/p/jonathan-apples/01/00614141999996?fulfillment=IN_STORE&16=221105&310=3000907_su_
    Read  Label Set 5- Databar14 Limited_Datamatrix				    $n000000xx_pr_RL]e00100614141999996_su_ OR/ $n000000xx_pr_Dg]d2https://www.harristeeter.com/p/jonathan-apples/01/00614141999996?fulfillment=IN_STORE&16=221105&310=3000907_su_
    Read  Label Set 6- Databar14 Stacked_QRCode				        $n000000xx_pr_RX]e0010789604830096610ExtremelyWired{GS}3103000500_su_ OR/ $n000000xx_pr_Dg]d2https://www.lojacafepacaembu.com.br/01/07896048300966/10/ExtremelyWired?16=240515&310=3000500_su_
    Read  Label Set 6- Databar14 Stacked_Datamatrix				    $n000000xx_pr_RX]e0010789604830096610ExtremelyWired{GS}3103000500_su_ OR/ $n000000xx_pr_Dg]d2https://www.lojacafepacaembu.com.br/01/07896048300966/10/ExtremelyWired?16=240515&310=3000500_su_
    Send  $S,CGDTF02,Ar				                                $>,>,>
    Read  Label Set 1-UPCA_Campbells Tomato Soup_Datamatrix			$n00000001_pr_F]E00051000006011_su_ OR/ $n000000xx_pr_Dg]d2https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229_su_
    Read  Label Set 1-UPCA_Campbells Tomato Soup_QRCode				$n00000001_pr_F]E00051000006011_su_ OR/ $n000000xx_pr_Dg]d2https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229_su_
    Read  Label Set 2 EAN8_Datamatrix				                $n000000xx_pr_FF]E400616218_su_ OR/ $n000000xx_pr_Dg]d2https://www.traderjoes.com/home/discover/entertaining/quick-crispy-turkey-less-stuffed-roast/01/00000000616218/10/21260?17=230101&310=3001134_su_
    Read  Label Set 2 EAN8_QRCode				                    $n000000xx_pr_FF]E400616218_su_ OR/ $n000000xx_pr_Dg]d2https://www.traderjoes.com/home/discover/entertaining/quick-crispy-turkey-less-stuffed-roast/01/00000000616218/10/21260?17=230101&310=3001134_su_
    Read  Label Set 3 EAN13_Datamatrix				                $n000000xx_pr_F]E05400141060218_su_ OR/ $n000000xx_pr_Dg]d2https://www.collectandgo.be/colruyt/fr/assortiment/boni-poivrons-mix-4-pi%C3%A8ces/01/05400141060218/10/BE-BIO-02?16=230112&310=3000420_su_
    Read  Label Set 3 EAN13_QRCode				                    $n000000xx_pr_F]E05400141060218_su_ OR/ $n000000xx_pr_Dg]d2https://www.collectandgo.be/colruyt/fr/assortiment/boni-poivrons-mix-4-pi%C3%A8ces/01/05400141060218/10/BE-BIO-02?16=230112&310=3000420_su_
    Read  Label Set 4-Databar14_QRCode				                $n000000xx_pr_R4]e00100033383084091_su_ OR/ $n000000xx_pr_Dg]d2https://www.harristeeter.com/p/jonathan-apples/01/00033383084091?fulfillment=IN_STORE&16=221105&310=3000907_su_
    Read  Label Set 4-Databar14_Datamatrix				            $n000000xx_pr_R4]e00100033383084091_su_ OR/ $n000000xx_pr_Dg]d2https://www.harristeeter.com/p/jonathan-apples/01/00033383084091?fulfillment=IN_STORE&16=221105&310=3000907_su_
    Read  Label Set 5- Databar14 Limited_QRCode				        $n000000xx_pr_RL]e00100614141999996_su_ OR/ $n000000xx_pr_Dg]d2https://www.harristeeter.com/p/jonathan-apples/01/00614141999996?fulfillment=IN_STORE&16=221105&310=3000907_su_
    Read  Label Set 5- Databar14 Limited_Datamatrix				    $n000000xx_pr_RL]e00100614141999996_su_ OR/ $n000000xx_pr_Dg]d2https://www.harristeeter.com/p/jonathan-apples/01/00614141999996?fulfillment=IN_STORE&16=221105&310=3000907_su_
    Read  Label Set 6- Databar14 Stacked_QRCode				        $n000000xx_pr_RX]e0010789604830096610ExtremelyWired{GS}3103000500_su_ OR/ $n000000xx_pr_Dg]d2https://www.lojacafepacaembu.com.br/01/07896048300966/10/ExtremelyWired?16=240515&310=3000500_su_
    Read  Label Set 6- Databar14 Stacked_Datamatrix				    $n000000xx_pr_RX]e0010789604830096610ExtremelyWired{GS}3103000500_su_ OR/ $n000000xx_pr_Dg]d2https://www.lojacafepacaembu.com.br/01/07896048300966/10/ExtremelyWired?16=240515&310=3000500_su_
    Send  $S,CGDTF03,Ar				                                $>,>,>
    Read  Label Set 1-UPCA_Campbells Tomato Soup_Datamatrix			$n00000001_pr_F]E00051000006011_su_ OR/ $n000000xx_pr_Dg]d2https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229_su_
    Read  Label Set 1-UPCA_Campbells Tomato Soup_QRCode				$n00000001_pr_F]E00051000006011_su_ OR/ $n000000xx_pr_Dg]d2https://www.campbells.com/products/condensed/tomato-soup/01/00051000006011/10/RealGood?21=FirstOneShipped&17=240229_su_
    Read  Label Set 2 EAN8_Datamatrix				                $n000000xx_pr_FF]E400616218_su_ OR/ $n000000xx_pr_Dg]d2https://www.traderjoes.com/home/discover/entertaining/quick-crispy-turkey-less-stuffed-roast/01/00000000616218/10/21260?17=230101&310=3001134_su_
    Read  Label Set 2 EAN8_QRCode				                    $n000000xx_pr_FF]E400616218_su_ OR/ $n000000xx_pr_Dg]d2https://www.traderjoes.com/home/discover/entertaining/quick-crispy-turkey-less-stuffed-roast/01/00000000616218/10/21260?17=230101&310=3001134_su_
    Read  Label Set 3 EAN13_Datamatrix				                $n000000xx_pr_F]E05400141060218_su_ OR/ $n000000xx_pr_Dg]d2https://www.collectandgo.be/colruyt/fr/assortiment/boni-poivrons-mix-4-pi%C3%A8ces/01/05400141060218/10/BE-BIO-02?16=230112&310=3000420_su_
    Read  Label Set 3 EAN13_QRCode				                    $n000000xx_pr_F]E05400141060218_su_ OR/ $n000000xx_pr_Dg]d2https://www.collectandgo.be/colruyt/fr/assortiment/boni-poivrons-mix-4-pi%C3%A8ces/01/05400141060218/10/BE-BIO-02?16=230112&310=3000420_su_
    Read  Label Set 4-Databar14_QRCode				                $n000000xx_pr_R4]e00100033383084091_su_ OR/ $n000000xx_pr_Dg]d2https://www.harristeeter.com/p/jonathan-apples/01/00033383084091?fulfillment=IN_STORE&16=221105&310=3000907_su_
    Read  Label Set 4-Databar14_Datamatrix				            $n000000xx_pr_R4]e00100033383084091_su_ OR/ $n000000xx_pr_Dg]d2https://www.harristeeter.com/p/jonathan-apples/01/00033383084091?fulfillment=IN_STORE&16=221105&310=3000907_su_
    Read  Label Set 5- Databar14 Limited_QRCode				        $n000000xx_pr_RL]e00100614141999996_su_ OR/ $n000000xx_pr_Dg]d2https://www.harristeeter.com/p/jonathan-apples/01/00614141999996?fulfillment=IN_STORE&16=221105&310=3000907_su_
    Read  Label Set 5- Databar14 Limited_Datamatrix				    $n000000xx_pr_RL]e00100614141999996_su_ OR/ $n000000xx_pr_Dg]d2https://www.harristeeter.com/p/jonathan-apples/01/00614141999996?fulfillment=IN_STORE&16=221105&310=3000907_su_
    Read  Label Set 6- Databar14 Stacked_QRCode				        $n000000xx_pr_RX]e0010789604830096610ExtremelyWired{GS}3103000500_su_ OR/ $n000000xx_pr_Dg]d2https://www.lojacafepacaembu.com.br/01/07896048300966/10/ExtremelyWired?16=240515&310=3000500_su_
    Read  Label Set 6- Databar14 Stacked_Datamatrix				    $n000000xx_pr_RX]e0010789604830096610ExtremelyWired{GS}3103000500_su_ OR/ $n000000xx_pr_Dg]d2https://www.lojacafepacaembu.com.br/01/07896048300966/10/ExtremelyWired?16=240515&310=3000500_su_
