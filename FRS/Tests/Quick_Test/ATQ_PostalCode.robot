*** settings ***
Resource  ../Root_path.resource
Resource    ${root}Resources/HHS/Keywords.resource
Suite Setup     Open Com port and set Interface    ${interface_name}    ${COMPORT}      ${reading_mode}


*** Variables ***
${current_directory}         ${data_source}\\Quick_Test
*** test cases ***
ATQ_PostalCode_RS232_STD
    [Documentation]  This test case verify for decoding Postal Code
    [Tags]      RS232_STD    RS232_WN  RS232_OPOS  USB_COM   USB_CPS
    # Description                                                   Expected result
    Read  $P,CPOEN05,P
    Read  Australian Routing Post	                                11,12345678
    Read  Australian Post		                                    87,12345678
    Read  $P,CPOEN04,P
    Read  Postal_Kix		                                    1230AA12345XHUIS
    Read  $P,CPOEN06,P
    Read  Postal_Japanese		                                15400233-16-4
    Read  Japanese 1 Post		                                1234567
    Read  $P,CPOEN08,P
    Read  Postal_Swedish		                                2,0,2,10000002,2
    Read  $P,CPOEN02,P
    Read  Postal_Planet		                                    401234567891
    Read  $P,CPOEN03,P
    Read  Postal RM	LU178XE2B
    Read  $P,CPOEN07,P
    Read  Postal_IBM		                                    1070012345612345678912345678901
    Read  $P,CPOEN01,P
    Read  Postal Postnet		                                098295123452
    Read  $P,CPOEN09,P
    Read  Postal_Portugal		                                44303210088
    EnterSP		                                                $>
    Send  $CIDCO02		                                        $>
    Send  $CAIEN01		                                        $>
    Send  $CLFPR61415F0000000000000000000000000000000000	    $>
    Send  $CLFSU5F5A7A0D00000000000000000000000000000000	    $>
    Send  $CLFCA02		                                        $>
    Send  $CLFCH3141324200000000		                        $>
    Send  $Ar		                                            $>
    Read  $P,CPOEN05,P
    Read  Australian Routing Post	                            aA_]XcAA,AB345678$K_Zz
    Read  Australian Post		                                aA_]Xc87,AB345678$K_Zz
    Read  $P,CPOEN04,P
    Read  Postal_Kix		                                    aA_]XfAB30aaAB345xhuis$U_Zz
    Read  $P,CPOEN06,P
    Read  Postal_Japanese		                                aA_]XbA5400B33-A6-4$R_Zz
    Read  Japanese 1 Post		                                aA_]XbAB34567$R_Zz
    Read  $P,CPOEN08,P
    Read  Postal_Swedish		                                aA_]XhB,0,B,A000000B,B$X_Zz
    Read  $P,CPOEN02,P
    Read  Postal_Planet		                                    aA_]Xd40AB3456789A$W_Zz
    Read  $P,CPOEN03,P
    Read  Postal RM		                                        aA_]XeluA78xeBb$M_Zz
    Read  $P,CPOEN07,P
    Read  Postal_IBM		                                    aA_]XgA0700AB3456AB3456789AB34567890A$V_Zz
    Read  $P,CPOEN01,P
    Read  Postal Postnet		                                aA_]Xa098B95AB345B$L_Zz
    Read  $P,CPOEN09,P
    Read  Postal_Portugal		                                aA_]Xi44303BA0088$P_Zz
ATQ_PostalCode_RS232_WN
    [Documentation]  This test case verify for decoding Postal Code
    [Tags]      RS232_WN
    # Description                                                   Expected result
    Read  $P,CPOEN05,P
    Read  Australian Routing Post		                            $K11,12345678
    Read  Australian Post				                            $K87,12345678
    Read  $P,CPOEN04,P
    Read  Postal_Kix				                                $U1230AA12345XHUIS
    Read  $P,CPOEN06,P
    Read  Postal_Japanese				                            $R15400233-16-4
    Read  Japanese 1 Post				                            $R1234567
    Read  $P,CPOEN08,P
    Read  Postal_Swedish				                            $X2,0,2,10000002,2
    Read  $P,CPOEN02,P
    Read  Postal_Planet				                                $W401234567891
    Read  $P,CPOEN03,P
    Read  Postal RM				                                    $MLU178XE2B
    Read  $P,CPOEN07,P
    Read  Postal_IBM				                                $V1070012345612345678912345678901
    Read  $P,CPOEN01,P
    Read  Postal Postnet				                            $L098295123452
    Read  $P,CPOEN09,P
    Read  Postal_Portugal				                            $P44303210088
    EnterSP				                                            $>
    Send  $CIDCO02				                                    $>
    Send  $CAIEN01				                                    $>
    Send  $CLFPR61415F0000000000000000000000000000000000		    $>
    Send  $CLFSU5F5A7A0D00000000000000000000000000000000		    $>
    Send  $CLFCA02				                                    $>
    Send  $CLFCH3141324200000000				                    $>
    Send  $Ar				                                        $>
    Read  $P,CPOEN05,P
    Read  Australian Routing Post				                    aA_]XcAA,AB345678$K_Zz
    Read  Australian Post		                                    aA_]Xc87,AB345678$K_Zz
    Read  $P,CPOEN04,P
    Read  Postal_Kix		                                        aA_]XfAB30aaAB345xhuis$U_Zz
    Read  $P,CPOEN06,P
    Read  Postal_Japanese		                                    aA_]XbA5400B33-A6-4$R_Zz
    Read  Japanese 1 Post		                                    aA_]XbAB34567$R_Zz
    Read  $P,CPOEN08,P
    Read  Postal_Swedish				                            aA_]XhB,0,B,A000000B,B$X_Zz
    Read  $P,CPOEN02,P
    Read  Postal_Planet				                                aA_]Xd40AB3456789A$W_Zz
    Read  $P,CPOEN03,P
    Read  Postal RM				                                    aA_]XeluA78xeBb$M_Zz
    Read  $P,CPOEN07,P
    Read  Postal_IBM				                                aA_]XgA0700AB3456AB3456789AB34567890A$V_Zz
    Read  $P,CPOEN01,P
    Read  Postal Postnet				                            aA_]Xa098B95AB345B$L_Zz
    Read  $P,CPOEN09,P
    Read  Postal_Portugal				                            aA_]Xi44303BA0088$P_Zz
ATQ_PostalCode_RS232_OPOS
    [Documentation]  This test case verify for decoding Postal Code
    [Tags]      RS232_OPOS
    # Description                                                   Expected result
    Read  $P,CPOEN05,P
    Read  Australian Routing Post	                                $K11,12345678
    Read  Australian Post	                                        $K87,12345678
    Read  $P,CPOEN04,P
    Read  Postal_Kix	                                            $U1230AA12345XHUIS
    Read  $P,CPOEN06,P
    Read  Postal_Japanese	                                        $R15400233-16-4
    Read  Japanese 1 Post	                                        $R1234567
    Read  $P,CPOEN08,P
    Read  Postal_Swedish	                                        $X2,0,2,10000002,2
    Read  $P,CPOEN02,P
    Read  Postal_Planet	                                            $W401234567891
    Read  $P,CPOEN03,P
    Read  Postal RM	                                                $MLU178XE2B
    Read  $P,CPOEN07,P
    Read  Postal_IBM	                                            $V1070012345612345678912345678901
    Read  $P,CPOEN01,P
    Read  Postal Postnet	                                        $L098295123452
    Read  $P,CPOEN09,P
    Read  Postal_Portugal	                                        $P44303210088
    EnterSP	                                                        $>
    Send  $CIDCO02	                                                $>
    Send  $CAIEN01	                                                $>
    Send  $CLFPR61415F0000000000000000000000000000000000	        $>
    Send  $CLFSU5F5A7A0D00000000000000000000000000000000	        $>
    Send  $CLFCA02	                                                $>
    Send  $CLFCH3141324200000000	                                $>
    Send  $Ar	                                                    $>
    Read  $P,CPOEN05,P
    Read  Australian Routing Post	                                aA_]XcAA,AB345678$K_Zz
    Read  Australian Post	                                        aA_]Xc87,AB345678$K_Zz
    Read  $P,CPOEN04,P
    Read  Postal_Kix	                                            aA_]XfAB30aaAB345xhuis$U_Zz
    Read  $P,CPOEN06,P
    Read  Postal_Japanese	                                        aA_]XbA5400B33-A6-4$R_Zz
    Read  Japanese 1 Post	                                        aA_]XbAB34567$R_Zz
    Read  $P,CPOEN08,P
    Read  Postal_Swedish	                                        aA_]XhB,0,B,A000000B,B$X_Zz
    Read  $P,CPOEN02,P
    Read  Postal_Planet	                                            aA_]Xd40AB3456789A$W_Zz
    Read  $P,CPOEN03,P
    Read  Postal RM	                                                aA_]XeluA78xeBb$M_Zz
    Read  $P,CPOEN07,P
    Read  Postal_IBM	                                            aA_]XgA0700AB3456AB3456789AB34567890A$V_Zz
    Read  $P,CPOEN01,P
    Read  Postal Postnet	                                        aA_]Xa098B95AB345B$L_Zz
    Read  $P,CPOEN09,P
    Read  Postal_Portugal	                                        aA_]Xi44303BA0088$P_Zz



