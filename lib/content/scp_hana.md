## What is SAP Cloud Platform (SCP) renamed to => BTP (Business Technology Platform)

SAP Cloud Platform (SCP) is a platform-as-a-service (PaaS) product that provides development and runtime environments.

### Environments: NEO vs CF

The SAP Cloud Platform supports three different environments. 

* Cloud Foundry
* Neo
* ABAP (more on that [here...](https://blogs.sap.com/2018/09/04/sap-cloud-platform-abap-environment/))

The following picture briefly describes the differences between CF and NEO.

![Enviroment](https://raw.githubusercontent.com/wiki/wridgeu/wridgeu.github.io/images/scpenvironments.png)

## What is Cloud Foundry?

Cloud Foundry is an open source, industry standard Platforms as a Service (PaaS) technology for developing and deploying cloud applications in both private and public cloud environments. It is designed to run on a variety of Infrastructure as a Service (IaaS), such as Amazon Web Services, OpenStack, Google Cloud Platform and Microsoft Azure. It enables developers to use different programming languages, runtimes and data / backing services. SAP is a founding Platinum level member of the Cloud Foundry Foundation, which oversees the development of Cloud Foundry Software and ecosystem.

### How does CF fit to the strategy of SCP?

[SAP Cloud Platform](https://help.sap.com/viewer/65de2977205c403bbc107264b8eccf4b/Cloud/en-US) has adopted the open source Cloud Foundry technology being a certified Cloud Foundry platform, allowing customers and partners to leverage community innovations in a simple and integrated manner.

## What is SAP HANA?

"SAP HANA" is an in-memory database and application development platform for processing high volumes of data in real time. Not to confuse with "SAP S/4 HANA" which is the successor SAP ERP system to the current "R/3" ERP system.

Classical databases are usually row-oriented whereas SAP HANA databases save data in an column-oriented fashion.

### Row-Oriented vs Column-Oriented

Row-Oriented vs Column-Oriented 

![ColumnStorage](https://raw.githubusercontent.com/wiki/wridgeu/wridgeu.github.io/images/hanacolumnarstorage.png)

Disk Based DB vs HANA (simplified)

![SAPHana](https://raw.githubusercontent.com/wiki/wridgeu/wridgeu.github.io/images/saphana.png)

For more technical info check out: [SAP HANA Basics for Developers](https://www.youtube.com/watch?v=2_P6jcbFzeo).

# Credits

* [SAP Q & A about CF](https://wiki.scn.sap.com/wiki/display/SAPHCP/Cloud+Foundry+environment+within+SAP+Cloud+Platform%3A+FAQ)
* [SAP Cloud Platform](https://www.sap.com/germany/products/cloud-platform.html)
* [Cloud Foundry](https://www.cloudfoundry.org/)
* [Cloud Application Programming](https://cap.cloud.sap/docs/)
* [In Memory Database](https://www.slideshare.net/SAPTechnology/inmemory-database-platform-for-big-data)
* [3 Reasons for HANA](https://ankaa-pmo.com/3-reasons-businesses-run-on-sap-hana/)
* [SAP Cloud Platform Environments](https://blogs.sap.com/2019/02/24/sap-cloud-platform-environment-cloud-foundry-vs-neo/)
* [SAP SCP Tutorial](https://medium.com/@fsp_bgd/integrating-sap-commerce-cloud-hybris-with-sap-crm-erp-via-scpi-step-by-step-tutorial-part-2162f223931d)