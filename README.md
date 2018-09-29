# SonarQube Project Quality Gate Status
It is always recommended that you maintain a certain quality of software. There are many tools available in the market for static code analysis. One of the most widely tool is SonarQube. This PowerShell script can be used to get the SonarQube quality gate rating, once the code analysis is complete for a Sonar Project. If the Quality Gate status is not OK, it throws an exception.

This script can be used as part of Continuous Integration Process to determine if the code committted pass throgh the criteria defined. If not, it can be used to fail the builld.

## Getting Started
These instructions will allow you to run the PowerShell script. This script uses the basic cmdlets which are available from PowerShell version 3.0 or later.

## Prerequisites
* You need to have your own SonarQube Server and it should be accessible from the build agent.
* You need to have PowerShell installed on the build agent.

## Parameters
* SonarToken - This is a token which belongs to one of the user accounts in the SonarQube which has access to the Sonar Project referred. 
* SonarProjectKey - This key is used to uniquely identify a Sonar Project 
* SonarServerName - This is the fully qualified domain name or DNS name of the Sonar Server. It needs to be accessible from the build agent.

## Examples
* Example 1:<br/> .\sonarqube-fetch-qualitygate-status.ps1 -SonarServerName "my-sonar-server-name.fqdn.com" -SonarProjectKey "teraVis-App-CI" -SonarToken "c501b24d-e00a-44cb-b67d-4e6465a8c255"

    In this case, it will return the status of the SonarProject associated with the Sonar Project Key.

* Example 2:<br/>
$SonarServerName = "my-sonar-server-name.fqdn.com"<br/>
$SonarProjectKey = "teraVis-App-CI"<br/>
$SonarToken =  "c501b24d-e00a-44cb-b67d-4e6465a8c255"<br/>

   .\sonarqube-fetch-qualitygate-status.ps1 -SonarServerName $(SonarServerName) -SonarProjectKey $(SonarProjectKey) -SonarToken $(SonarToken)

    In this case, it will return the status of the SonarProject associated with the Sonar Project Key.
