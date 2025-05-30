*** settings ***
Resource  ../Root_path.resource
Resource    ${root}Resources/HHS/Keywords.resource
Suite Setup     Open Com port and set Interface    ${interface_name}    ${COMPORT}      ${reading_mode}


*** Variables ***
${current_directory}         ${data_source}\\Quick_Test
*** test cases ***
ATQ_WaterMark
    [Documentation]  Test case checks the capability to decode the Wechat QR. Make sure that Wechat labels are displayed on Cellphone screen, not via paper.
    [Tags]      RS232_STD    RS232_WN  RS232_OPOS  USB_COM   USB_CPS
    # Description                                   Expected result
    Read  $P,CQREN01,P
    Read  difficulty01          	http://weixin.qq.com/r/Bp1HXyXEInhdrWE898gU
    Read  difficulty02          	http://weixin.qq.com/r/Bp1HXyXEInhdrWE898gU
    Read  IMG_8626	                http://weixin.qq.com/r/Bp1HXyXEInhdrWE898gU
    Read  IMG_8627		            http://weixin.qq.com/r/Bp1HXyXEInhdrWE898gU
    Read  IMG_8628		            http://weixin.qq.com/r/Bp1HXyXEInhdrWE898gU
    Read  IMG_8629		            http://weixin.qq.com/r/Bp1HXyXEInhdrWE898gU
    Read  IMG_8630		            http://weixin.qq.com/r/Bp1HXyXEInhdrWE898gU
    Read  IMG_8631		            http://weixin.qq.com/r/Bp1HXyXEInhdrWE898gU
    Read  IMG_8635		            http://weixin.qq.com/r/Bp1HXyXEInhdrWE898gU
    Read  IMG_8636		            http://weixin.qq.com/r/Bp1HXyXEInhdrWE898gU
    Read  IMG_8637		            http://weixin.qq.com/r/Bp1HXyXEInhdrWE898gU
    Read  IMG_8638		            http://weixin.qq.com/r/Bp1HXyXEInhdrWE898gU
    Read  IMG_8639		            http://weixin.qq.com/r/Bp1HXyXEInhdrWE898gU
    Read  Pattern_Eyes10Eyes_Color120Pattern_Data31Data_Color180    	http://scanova.io/design-qr-code-generator.html#/chooseqr/
    Read  Pattern_Eyes10Eyes_Color120Pattern_Data31Data_Color210    	http://scanova.io/design-qr-code-generator.html#/chooseqr/
    Read  Pattern_Eyes10Eyes_Color120Pattern_Data31Data_Color30	        http://scanova.io/design-qr-code-generator.html#/chooseqr/
    Read  Pattern_Eyes12Eyes_Color180Pattern_Data4Data_Color180	        http://scanova.io/design-qr-code-generator.html#/chooseqr/
    Read  Pattern_Eyes12Eyes_Color180Pattern_Data4Data_Color210	        http://scanova.io/design-qr-code-generator.html#/chooseqr/
    Read  Pattern_Eyes12Eyes_Color180Pattern_Data4Data_Color90	        http://scanova.io/design-qr-code-generator.html#/chooseqr/
    Read  Pattern_Eyes1Eyes_Color0Pattern_Data1Data_Color0	            http://scanova.io/design-qr-code-generator.html#/chooseqr/
    Read  Pattern_Eyes1Eyes_Color0Pattern_Data1Data_Color180	        http://scanova.io/design-qr-code-generator.html#/chooseqr/
    Read  Pattern_Eyes1Eyes_Color0Pattern_Data1Data_Color210	        http://scanova.io/design-qr-code-generator.html#/chooseqr/
    Read  Pattern_Eyes1Eyes_Color120Pattern_Data1Data_Color0	        http://scanova.io/design-qr-code-generator.html#/chooseqr/
    Read  Pattern_Eyes1Eyes_Color120Pattern_Data1Data_Color150	        http://scanova.io/design-qr-code-generator.html#/chooseqr/
    Read  Pattern_Eyes1Eyes_Color120Pattern_Data1Data_Color180	        http://scanova.io/design-qr-code-generator.html#/chooseqr/
    Read  Pattern_Eyes1Eyes_Color210Pattern_Data1Data_Color0	        http://scanova.io/design-qr-code-generator.html#/chooseqr/
    Read  Pattern_Eyes1Eyes_Color210Pattern_Data1Data_Color180      	http://scanova.io/design-qr-code-generator.html#/chooseqr/
    Read  Pattern_Eyes1Eyes_Color210Pattern_Data1Data_Color210	        http://scanova.io/design-qr-code-generator.html#/chooseqr/
    Read  Pattern_Eyes23Eyes_Color0Pattern_Data19Data_Color0	        http://scanova.io/design-qr-code-generator.html#/chooseqr/
    Read  Pattern_Eyes23Eyes_Color0Pattern_Data19Data_Color180	        http://scanova.io/design-qr-code-generator.html#/chooseqr/
    Read  Pattern_Eyes23Eyes_Color0Pattern_Data19Data_Color210	        http://scanova.io/design-qr-code-generator.html#/chooseqr/
    Read  Pattern_Eyes25Eyes_Color60Pattern_Data23Data_Color0	        http://scanova.io/design-qr-code-generator.html#/chooseqr/
    Read  Pattern_Eyes25Eyes_Color60Pattern_Data23Data_Color180	        http://scanova.io/design-qr-code-generator.html#/chooseqr/
    Read  Pattern_Eyes25Eyes_Color60Pattern_Data23Data_Color210	        http://scanova.io/design-qr-code-generator.html#/chooseqr/
    Read  Pattern_Eyes27Eyes_Color60Pattern_Data7Data_Color0	        http://scanova.io/design-qr-code-generator.html#/chooseqr/
    Read  Pattern_Eyes27Eyes_Color60Pattern_Data7Data_Color180      	http://scanova.io/design-qr-code-generator.html#/chooseqr/
    Read  Pattern_Eyes27Eyes_Color60Pattern_Data7Data_Color210	        http://scanova.io/design-qr-code-generator.html#/chooseqr/
    Read  Pattern_Eyes28Eyes_Color90Pattern_Data14Data_Color180     	http://scanova.io/design-qr-code-generator.html#/chooseqr/
    Read  Pattern_Eyes28Eyes_Color90Pattern_Data14Data_Color210     	http://scanova.io/design-qr-code-generator.html#/chooseqr/
    Read  Pattern_Eyes28Eyes_Color90Pattern_Data14Data_Color30      	http://scanova.io/design-qr-code-generator.html#/chooseqr/
    Read  Pattern_Eyes2Eyes_Color0Pattern_Data10Data_Color0	            http://scanova.io/design-qr-code-generator.html#/chooseqr/
    Read  Pattern_Eyes2Eyes_Color0Pattern_Data10Data_Color180       	http://scanova.io/design-qr-code-generator.html#/chooseqr/
    Read  Pattern_Eyes2Eyes_Color0Pattern_Data10Data_Color210       	http://scanova.io/design-qr-code-generator.html#/chooseqr/
    Read  Pattern_Eyes2Eyes_Color0Pattern_Data17Data_Color0	            http://scanova.io/design-qr-code-generator.html#/chooseqr/
    Read  Pattern_Eyes2Eyes_Color0Pattern_Data17Data_Color180	        http://scanova.io/design-qr-code-generator.html#/chooseqr/
    Read  Pattern_Eyes2Eyes_Color0Pattern_Data17Data_Color210       	http://scanova.io/design-qr-code-generator.html#/chooseqr/
    Read  Pattern_Eyes2Eyes_Color0Pattern_Data2Data_Color0	            http://scanova.io/design-qr-code-generator.html#/chooseqr/
    Read  Pattern_Eyes2Eyes_Color0Pattern_Data2Data_Color180        	http://scanova.io/design-qr-code-generator.html#/chooseqr/
    Read  Pattern_Eyes2Eyes_Color0Pattern_Data2Data_Color210        	http://scanova.io/design-qr-code-generator.html#/chooseqr/
    Read  Pattern_Eyes3Eyes_Color0Pattern_Data18Data_Color0	            http://scanova.io/design-qr-code-generator.html#/chooseqr/
    Read  Pattern_Eyes3Eyes_Color0Pattern_Data18Data_Color180       	http://scanova.io/design-qr-code-generator.html#/chooseqr/
    Read  Pattern_Eyes3Eyes_Color0Pattern_Data18Data_Color210       	http://scanova.io/design-qr-code-generator.html#/chooseqr/
    Read  Pattern_Eyes3Eyes_Color0Pattern_Data24Data_Color0	            http://scanova.io/design-qr-code-generator.html#/chooseqr/
    Read  Pattern_Eyes3Eyes_Color0Pattern_Data24Data_Color180       	http://scanova.io/design-qr-code-generator.html#/chooseqr/
    Read  Pattern_Eyes3Eyes_Color0Pattern_Data24Data_Color210       	http://scanova.io/design-qr-code-generator.html#/chooseqr/
    Read  Pattern_Eyes3Eyes_Color0Pattern_Data3Data_Color0          	http://scanova.io/design-qr-code-generator.html#/chooseqr/
    Read  Pattern_Eyes3Eyes_Color0Pattern_Data3Data_Color180        	http://scanova.io/design-qr-code-generator.html#/chooseqr/
    Read  Pattern_Eyes3Eyes_Color0Pattern_Data3Data_Color210        	http://scanova.io/design-qr-code-generator.html#/chooseqr/
