*** settings ***
Resource  ../Root_path.resource
Resource    ${root}Resources/HHS/Keywords.resource
Suite Setup     Open Com port and set Interface    ${interface_name}    ${COMPORT}      ${reading_mode}


*** Variables ***
${current_directory}         ${data_source}\\Quick_Test


*** test cases ***
ATQ_GS1DigitalLink_LabelSetID
    [Documentation]  This test case verify set GS1 Label Set ID Character(s).
    ...   This is a field identifier for the GS1 Label Set that is transmitted. Located before the label data.
    ...   This configuration item is active when GDTM = 2 -> Send all labels and It can be disabled by setting value to NULL characters.
    ...   An 8 digit decimal number that is added in frony of labels from the same GS1 Label Set.
	...   Configuation: CI_GS1_DIGITAL_LINK_LABEL_SET_ID.
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                           Expected result
    Send  $S,CGDTM02,Ar		                $>,>,>
    Send  $S,cGDSI,s		                $>,>246E00,>
    Read  GS1 Digital Link Label Set		$n000000015400141060218 OR/ $n00000001https://www.collectandgo.be/colruyt/fr/assortiment/boni-poivrons-mix-4-pi%C3%A8ces/01/05400141060218/10/BE-BIO-02?16=230112&310=3000420
    Read  GS1 Digital Link Label Set		$n000000025400141060218 OR/ $n00000002https://www.collectandgo.be/colruyt/fr/assortiment/boni-poivrons-mix-4-pi%C3%A8ces/01/05400141060218/10/BE-BIO-02?16=230112&310=3000420
    Read  GS1 Digital Link Label Set		$n000000035400141060218 OR/ $n00000003https://www.collectandgo.be/colruyt/fr/assortiment/boni-poivrons-mix-4-pi%C3%A8ces/01/05400141060218/10/BE-BIO-02?16=230112&310=3000420
    Read  GS1 Digital Link Label Set		$n000000045400141060218 OR/ $n00000004https://www.collectandgo.be/colruyt/fr/assortiment/boni-poivrons-mix-4-pi%C3%A8ces/01/05400141060218/10/BE-BIO-02?16=230112&310=3000420
    Read  GS1 Digital Link Label Set		$n000000055400141060218 OR/ $n00000005https://www.collectandgo.be/colruyt/fr/assortiment/boni-poivrons-mix-4-pi%C3%A8ces/01/05400141060218/10/BE-BIO-02?16=230112&310=3000420
    Read  GS1 Digital Link Label Set		$n000000065400141060218 OR/ $n00000006https://www.collectandgo.be/colruyt/fr/assortiment/boni-poivrons-mix-4-pi%C3%A8ces/01/05400141060218/10/BE-BIO-02?16=230112&310=3000420
    Read  GS1 Digital Link Label Set		$n000000075400141060218 OR/ $n00000007https://www.collectandgo.be/colruyt/fr/assortiment/boni-poivrons-mix-4-pi%C3%A8ces/01/05400141060218/10/BE-BIO-02?16=230112&310=3000420
    Read  GS1 Digital Link Label Set		$n000000085400141060218 OR/ $n00000008https://www.collectandgo.be/colruyt/fr/assortiment/boni-poivrons-mix-4-pi%C3%A8ces/01/05400141060218/10/BE-BIO-02?16=230112&310=3000420
    Read  GS1 Digital Link Label Set		$n000000095400141060218 OR/ $n00000009https://www.collectandgo.be/colruyt/fr/assortiment/boni-poivrons-mix-4-pi%C3%A8ces/01/05400141060218/10/BE-BIO-02?16=230112&310=3000420
    Read  GS1 Digital Link Label Set		$n000000105400141060218 OR/ $n000000010https://www.collectandgo.be/colruyt/fr/assortiment/boni-poivrons-mix-4-pi%C3%A8ces/01/05400141060218/10/BE-BIO-02?16=230112&310=3000420
    Read  GS1 Digital Link Label Set		$n000000115400141060218 OR/ $n000000011https://www.collectandgo.be/colruyt/fr/assortiment/boni-poivrons-mix-4-pi%C3%A8ces/01/05400141060218/10/BE-BIO-02?16=230112&310=3000420
    Read  $P,R,P
    Send  $S,CGDSI677331,Ar		            $>,>,>
    Read  GS1 Digital Link Label Set		gs1000000015400141060218 OR/ gs100000001https://www.collectandgo.be/colruyt/fr/assortiment/boni-poivrons-mix-4-pi%C3%A8ces/01/05400141060218/10/BE-BIO-02?16=230112&310=3000420
    Read  GS1 Digital Link Label Set		gs1000000025400141060218 OR/ gs100000002https://www.collectandgo.be/colruyt/fr/assortiment/boni-poivrons-mix-4-pi%C3%A8ces/01/05400141060218/10/BE-BIO-02?16=230112&310=3000420
    Read  GS1 Digital Link Label Set		gs1000000035400141060218 OR/ gs100000003https://www.collectandgo.be/colruyt/fr/assortiment/boni-poivrons-mix-4-pi%C3%A8ces/01/05400141060218/10/BE-BIO-02?16=230112&310=3000420
    Read  GS1 Digital Link Label Set		gs1000000045400141060218 OR/ gs100000004https://www.collectandgo.be/colruyt/fr/assortiment/boni-poivrons-mix-4-pi%C3%A8ces/01/05400141060218/10/BE-BIO-02?16=230112&310=3000420
    Read  GS1 Digital Link Label Set		gs1000000055400141060218 OR/ gs100000005https://www.collectandgo.be/colruyt/fr/assortiment/boni-poivrons-mix-4-pi%C3%A8ces/01/05400141060218/10/BE-BIO-02?16=230112&310=3000420
    Read  GS1 Digital Link Label Set		gs1000000065400141060218 OR/ gs100000006https://www.collectandgo.be/colruyt/fr/assortiment/boni-poivrons-mix-4-pi%C3%A8ces/01/05400141060218/10/BE-BIO-02?16=230112&310=3000420
    Read  GS1 Digital Link Label Set		gs1000000075400141060218 OR/ gs100000007https://www.collectandgo.be/colruyt/fr/assortiment/boni-poivrons-mix-4-pi%C3%A8ces/01/05400141060218/10/BE-BIO-02?16=230112&310=3000420
    Read  GS1 Digital Link Label Set		gs1000000085400141060218 OR/ gs100000008https://www.collectandgo.be/colruyt/fr/assortiment/boni-poivrons-mix-4-pi%C3%A8ces/01/05400141060218/10/BE-BIO-02?16=230112&310=3000420
    Read  GS1 Digital Link Label Set		gs1000000095400141060218 OR/ gs100000009https://www.collectandgo.be/colruyt/fr/assortiment/boni-poivrons-mix-4-pi%C3%A8ces/01/05400141060218/10/BE-BIO-02?16=230112&310=3000420
    Read  GS1 Digital Link Label Set		gs1000000105400141060218 OR/ gs1000000010https://www.collectandgo.be/colruyt/fr/assortiment/boni-poivrons-mix-4-pi%C3%A8ces/01/05400141060218/10/BE-BIO-02?16=230112&310=3000420
    Read  GS1 Digital Link Label Set		gs1000000115400141060218 OR/ gs1000000011https://www.collectandgo.be/colruyt/fr/assortiment/boni-poivrons-mix-4-pi%C3%A8ces/01/05400141060218/10/BE-BIO-02?16=230112&310=3000420
    Read  $P,R,P
    Send  $S,CGDSI503F5E,Ar		            $>,>,>
    Read  GS1 Digital Link Label Set		P?^000000015400141060218 OR/ P?^00000001https://www.collectandgo.be/colruyt/fr/assortiment/boni-poivrons-mix-4-pi%C3%A8ces/01/05400141060218/10/BE-BIO-02?16=230112&310=3000420
    Read  GS1 Digital Link Label Set		P?^000000025400141060218 OR/ P?^00000002https://www.collectandgo.be/colruyt/fr/assortiment/boni-poivrons-mix-4-pi%C3%A8ces/01/05400141060218/10/BE-BIO-02?16=230112&310=3000420
    Read  GS1 Digital Link Label Set		P?^000000035400141060218 OR/ P?^00000003https://www.collectandgo.be/colruyt/fr/assortiment/boni-poivrons-mix-4-pi%C3%A8ces/01/05400141060218/10/BE-BIO-02?16=230112&310=3000420
    Read  GS1 Digital Link Label Set		P?^000000045400141060218 OR/ P?^00000004https://www.collectandgo.be/colruyt/fr/assortiment/boni-poivrons-mix-4-pi%C3%A8ces/01/05400141060218/10/BE-BIO-02?16=230112&310=3000420
    Read  GS1 Digital Link Label Set		P?^000000055400141060218 OR/ P?^00000005https://www.collectandgo.be/colruyt/fr/assortiment/boni-poivrons-mix-4-pi%C3%A8ces/01/05400141060218/10/BE-BIO-02?16=230112&310=3000420
    Read  GS1 Digital Link Label Set		P?^000000065400141060218 OR/ P?^00000006https://www.collectandgo.be/colruyt/fr/assortiment/boni-poivrons-mix-4-pi%C3%A8ces/01/05400141060218/10/BE-BIO-02?16=230112&310=3000420
    Read  GS1 Digital Link Label Set		P?^000000075400141060218 OR/ P?^00000007https://www.collectandgo.be/colruyt/fr/assortiment/boni-poivrons-mix-4-pi%C3%A8ces/01/05400141060218/10/BE-BIO-02?16=230112&310=3000420
    Read  GS1 Digital Link Label Set		P?^000000085400141060218 OR/ P?^00000008https://www.collectandgo.be/colruyt/fr/assortiment/boni-poivrons-mix-4-pi%C3%A8ces/01/05400141060218/10/BE-BIO-02?16=230112&310=3000420
    Read  GS1 Digital Link Label Set		P?^000000095400141060218 OR/ P?^00000009https://www.collectandgo.be/colruyt/fr/assortiment/boni-poivrons-mix-4-pi%C3%A8ces/01/05400141060218/10/BE-BIO-02?16=230112&310=3000420
    Read  GS1 Digital Link Label Set		P?^000000105400141060218 OR/ P?^000000010https://www.collectandgo.be/colruyt/fr/assortiment/boni-poivrons-mix-4-pi%C3%A8ces/01/05400141060218/10/BE-BIO-02?16=230112&310=3000420
    Read  GS1 Digital Link Label Set		P?^000000115400141060218 OR/ P?^000000011https://www.collectandgo.be/colruyt/fr/assortiment/boni-poivrons-mix-4-pi%C3%A8ces/01/05400141060218/10/BE-BIO-02?16=230112&310=3000420
    Read  $P,R,P
