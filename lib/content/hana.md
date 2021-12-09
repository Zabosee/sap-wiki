## Introduction

SAP HANA Extended Application Services (or, just XS for short) is a key aspect of SAP HANA as a platform. XS is a small-footprint application server, web server, and basis for an application development platform – that lives inside SAP HANA. XS is not a complete separate technology that happens to be installed on the same hardware server as SAP HANA; XS is actually an extension of, and tightly integrated into, the SAP HANA database. It offers the ability to create applications that have an HTTP-based end-user UI (e.g. browsers and mobile apps), which run directly on SAP HANA without additional external servers or system landscape components.

SAP HANA includes it's own repository for content life-cycle management for all kinds of development artifacts and objects. The scope of applications that can be built using XS is quite open and reaches from a lightweight small web-based applications to complex enterprise applications.

Nowadays you differentiate between XSC and XSA where the "C" stands for "Classic" and the "A" for "Advanced". As you can imagine XSC is the predecessor of the newer XSA.

### XSA / CF?

I was confused for a while. Is XSA the same as when we use the SAP Cloud Platform (and with it Cloud Foundry)? 

Turns out they're two different things. As XSA is the On-Premise runtime opposed to Cloud Foundry environments as runtime in the cloud.

*The following picture shows a comparison between On-Premise(left) and the Cloud(right)*.

[[images/hanaxsaonpremisecf.png]]

## Basic Approach Overview

[[images/hanaxsoverview.png]]

## Architecture Overview

[[images/xsaarchitecture.png]]

# Security Overview

This section should provide some overview on how spaces, organizations, authentication and authorization work.

"XSUAA, SSO, JWT, IdP ..." these and many more are some of the acronyms related to [security](https://help.sap.com/viewer/65de2977205c403bbc107264b8eccf4b/Cloud/en-US/e129aa20c78c4a9fb379b9803b02e5f6.html), not only on SAP HANA XSA. 

* [XSUAA](https://blogs.sap.com/2019/01/07/uaa-xsuaa-platform-uaa-cfuaa-what-is-it-all-about/): User Authentication and Authorization service
* [SSO](https://en.wikipedia.org/wiki/Single_sign-on): Single Sign On
* [JWT](https://jwt.io/): JSON Web Token
* [IdP](https://en.wikipedia.org/wiki/Identity_provider): Identity Provider
* [OAuth](https://oauth.net/2/): Industry-Standard protocol for authorization 
* [SAML](https://en.wikipedia.org/wiki/Security_Assertion_Markup_Language): Security Assertion Markup Language

## Architectural Overview

### Spaces / Organizations

[[images/hanaxsasecurity2.png]]

### Authentication & Authorization

[[images/hanaxsasecurity1.png]]

Not related to the above picture, another depiction of authentication/authorization in a sequence diagram.

[[images/hanaxsaauthentication.png]]

[[images/hanaxsasecurity.png]]

There is a lot ground to cover which I definitely can't just simply summarize in this wiki page therefore go ahead and check out some of the SAP blogs, YT videos, openSAP courses or documentation related to this topic.

# Credits

* [Introduction Blog](https://blogs.sap.com/2013/04/25/introducing-sap-hana-extended-application-services-xs/)
* [SAP HANA Extended Application Services](https://blogs.sap.com/2012/11/29/sap-hana-extended-application-services/)
* [SAP HANA Platform](https://help.sap.com/viewer/product/SAP_HANA_PLATFORM/2.0.04/en-US)
* [openSAP Course](https://open.sap.com/courses/hana7)
* [XSA For Not So Dummies #1](https://blogs.sap.com/2017/09/04/xs-advanced-for-not-so-dummies/)
* [XSA For Not So Dummies #2](https://blogs.sap.com/2017/09/05/xs-advanced-for-not-so-dummies-pt-2-multi-target-applications/)
* [XSA For Not So Dummies #3](https://blogs.sap.com/2017/09/22/xs-advanced-for-not-so-dummies-pt-3-microservices/)
* [Developer Tutorial](https://developers.sap.com/tutorials/cp-connectivity-consume-odata-service-approuter.html)
* [General Availability of XS Adv. Programming Model](https://blogs.sap.com/2017/05/16/general-availability-of-the-xs-advanced-programming-model-with-cloud-foundry-on-sap-cloud-platform/)
* [SAP HANA XSA Administration Guide](https://help.sap.com/viewer/6b94445c94ae495c83a19646e7c3fd56/2.0.02/en-US/5fb6e7a65b1d447fabeebd3d5051cf32.html)
* [SAP HANA XSA ADministration Guide #1](https://help.sap.com/viewer/6b94445c94ae495c83a19646e7c3fd56/2.0.02/en-US/f9aba40d6c4c4ae48cce461db4d42d88.html)