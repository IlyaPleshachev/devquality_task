*** Settings *** 
Documentation		Suite of 3 critical API-tests for https://robotframework.org/
Library		Selenium2Library		implicit_wait=2		run_on_failure=Capture Page Screenshot
Suite Setup  		log to console			Tester name = Pleshachev_I
Suite Teardown		Close All Browsers

Test Setup 			Go to Robotframework Site
Test Teardown		Close Browser

*** Variables ***
${url}				https://robotframework.org/
${browser}			Chrome

*** Test Cases ***
TC_1
	[Documentation]    						Tests if user could go to guide section
	Click Element							//*[@id="app"]/div[5]/div[2]/div[2]/div/div[1]/button[3]
	Click Element							//*[@id="app"]/div[5]/div[2]/div[2]/div/div[2]/div/div[2]/a
	Location Should Be						https://robotframework.org/robotframework/#user-guide

TC_2
	[Documentation]    						Tests if user could share API window
	Page Should Not Contain					Link copied to clipboard!
	Click Element							//*[@id="app"]/div[5]/div[2]/div[2]/div/div[2]/div/div/div[1]/div[1]/div[1]/div[2]/button[1]/div
	Wait Until Page Contains				Link copied to clipboard!

TC_3
	[Documentation]    						Tests if compiler runs
	Page Should Contain Element				//*[@id="app"]/div[5]/div[2]/div[2]/div/div[2]/div/div/div[1]/div[1]/div[1]/div[1]/button
	Click Element							//*[@id="app"]/div[5]/div[2]/div[2]/div/div[2]/div/div/div[1]/div[1]/div[1]/div[1]/button
	Click Element							//*[@id="app"]/div[5]/div[2]/div[2]/div/div[2]/div/div/div[1]/div[1]/div[1]/div[1]/div/button[3]
	Wait Until Page Contains				Access All Users With Admin Rights
	Page Should Not Contain	Element			//*[@id="app"]/div[5]/div[2]/div[2]/div/div[2]/div/div/div[4]/h4
	Click Element							//*[@id="app"]/div[5]/div[2]/div[2]/div/div[2]/div/div/div[2]/div[2]/button/div
	Wait Until Page Contains Element		//*[@id="app"]/div[5]/div[2]/div[2]/div/div[2]/div/div/div[4]/h4
		
*** Keywords *** 
Go to Robotframework Site
	Open Browser				${url}		${browser}