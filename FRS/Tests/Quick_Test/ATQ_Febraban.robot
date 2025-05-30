*** settings ***
Resource  ../Root_path.resource
Resource    ${root}Resources/HHS/Keywords.resource
Suite Setup     Open Com port and set Interface    ${interface_name}    ${COMPORT}      ${reading_mode}
*** Variables ***
${current_directory}         ${data_source}\\Quick_Test

*** test cases ***
ATQ_Febraban_Disable
    [Documentation]  When disable, HH will not parse an Interleaved 2/5 code with 44 digits (Febraban format) to Febraban.
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                   Expected result
    EnterSP					        $>
    Send  $CI2EN01					$>
    Send  $CI2FE00					$>
    Send  $Ar					    $>
    Read  image001					83695560300002414343389191130362469501468840
    Read  image002					83795560300002414343389191130362469501468840
    Read  image003					83895560300002414343389191130362469501468840
    Read  image004					83995560300002414343389191130362469501468840
    Read  image005					23795560300002414343389191130362469501468840
    Read  image006					82640000000293300971400203701091192918913042
    Read  image007					39998000000000000004085833043017253200200002
    Read  image008					00198697500000295511569245382633820000951917
    Read  image009					23796000000000000004150090130349760200022450
    Read  image010					39998000000000000004085833043017253200200002
    Read  image011					83690000001348201103010355817300210028954955
    Read  image012					82630000000493500310980010100201855383488488
    Read  image013					11111222223333344444555556666677777888889999
    Read  image014					82640000000293300971400203701091192918913042
    Read  image015					84610000000055403052016111502100000231551856
ATQ_Febraban_Enable
    [Documentation]  When enalbe, HH will parse an Interleaved 2/5 code with 44 digits (Febraban format) to Febraban.
    ...   depending on the first digit of the code
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                   Expected result
    EnterSP					        $>
    Send  $CI2FE01					$>
    Send  $Ar					    $>
    Read  image001					836955603003002414343380919113036249695014688409
    Read  image002					837955603001002414343380919113036249695014688409
    Read  image003					838955603003002414343383919113036246695014688403
    Read  image004					839955603001002414343383919113036246695014688403
    Read  image005					23793389129113036246995014688402556030000241434
    Read  image006					826400000004293300971406020370109116929189130420
    Read  image007					39994085803304301725132002000027800000000000000
    Read  image008					00191569264538263382900009519174869750000029551
    Read  image009					23794150099013034976502000224507600000000000000
    Read  image010					39994085803304301725132002000027800000000000000
    Read  image011					836900000016348201103010035581730021100289549550
    Read  image012					826300000005493500310989001010020186553834884882
    Read  image013					11114555545666667777078888899990122222333334444
    Read  image014					826400000004293300971406020370109116929189130420
    Read  image015					846100000005055403052016611150210007002315518569
ATQ_Febraban_DisableFebarban And Interleaved 2/5
    [Documentation]  When disable Febarban And Interleaved 2/5, HH will not able read these barcode
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                   Expected result
    EnterSP					        $>
    Send  $CI2EN00					$>
    Send  $CI2FE00					$>
    Send  $Ar					    $>
    Read  image001                  ${EMPTY}
    Read  image002                  ${EMPTY}
    Read  image003                  ${EMPTY}
    Read  image004                  ${EMPTY}
    Read  image005                  ${EMPTY}
    Read  image006                  ${EMPTY}
    Read  image007                  ${EMPTY}
    Read  image008                  ${EMPTY}
    Read  image009                  ${EMPTY}
    Read  image010                  ${EMPTY}
    Read  image011                  ${EMPTY}
    Read  image012                  ${EMPTY}
    Read  image013                  ${EMPTY}
    Read  image014                  ${EMPTY}
    Read  image015                  ${EMPTY}
ATQ_Febraban_EnableFebarban And DisableInterleaved 2/5
    [Documentation]  When Enable Febarban And Disable Interleaved 2/5, HH will not able read these barcode
    [Tags]      RS232_STD    RS232_WN   RS232_OPOS   USB_COM   USB_CPS
    # Description                   Expected result
    EnterSP					        $>
    Send  $CI2EN00					$>
    Send  $CI2FE01					$>
    Send  $Ar					    $>
    Read  image001                  ${EMPTY}
    Read  image002                  ${EMPTY}
    Read  image003                  ${EMPTY}
    Read  image004                  ${EMPTY}
    Read  image005                  ${EMPTY}
    Read  image006                  ${EMPTY}
    Read  image007                  ${EMPTY}
    Read  image008                  ${EMPTY}
    Read  image009                  ${EMPTY}
    Read  image010                  ${EMPTY}
    Read  image011                  ${EMPTY}
    Read  image012                  ${EMPTY}
    Read  image013                  ${EMPTY}
    Read  image014                  ${EMPTY}
    Read  image015                  ${EMPTY}
