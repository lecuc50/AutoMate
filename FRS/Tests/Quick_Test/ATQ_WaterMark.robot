*** settings ***
Resource  ../Root_path.resource
Resource    ${root}Resources/HHS/Keywords.resource
Suite Setup     Open Com port and set Interface    ${interface_name}    ${COMPORT}      ${reading_mode}


*** Variables ***
${current_directory}         ${data_source}\\Quick_Test
*** test cases ***
ATQ_WaterMark
    [Documentation]  Test case checks the capability to decode the Watermark labels. Make sure that WaterMark labels is used directly, not via screen of PC.
    [Tags]      RS232_STD    RS232_WN  RS232_OPOS
    # Description                                   Expected result
    Read  $P,CDWEN03,P
    Read  SO01	        8004060764683
    Read  SO02	        8004060764683
    Read  SO03	        8004060764683
    Read  SO04	        8004060764683
    Read  SO05	        8004060764683
    Read  SO06	        8004060764683
    Read  SO07	        8004060764683
    Read  SO08	        01{NUL}{NUL}{NUL}{NUL}{NUL}{NUL}{NUL}{NUL}{NUL}{NUL}{NUL}{NUL}{NUL}{NUL}
    Read  SO09	        01{NUL}{NUL}{NUL}{NUL}{NUL}{NUL}{NUL}{NUL}{NUL}{NUL}{NUL}{NUL}{NUL}{NUL}
    Read  SO10	        01{NUL}{NUL}{NUL}{NUL}{NUL}{NUL}{NUL}{NUL}{NUL}{NUL}{NUL}{NUL}{NUL}{NUL}
    Read  SO11	        01{NUL}{NUL}{NUL}{NUL}{NUL}{NUL}{NUL}{NUL}{NUL}{NUL}{NUL}{NUL}{NUL}{NUL}
    Read  DG023-1	    852596004326
    Read  DG024-2	    852596004609
    Read  DG022-6	    077890190289
    Read  DG150WPI	    850000790438
    Read  DG75WPI	    856107006854
    Read  DG014	        859323005762
