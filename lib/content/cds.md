## Introduction

This is a collection of several slides from one of the openSAP courses, regarding the topic 'What is CDS?' and some of it's domain specific languages.

# Overview

## What is CDS?

* CDS stands for Core Data Services
* It is a set of [domain-specific languages](https://cap.cloud.sap/docs/cds/)
* The backbone of the SAP Cloud Application Programming Model

![Overview](https://raw.githubusercontent.com/wiki/wridgeu/wridgeu.github.io/images/cdsoverview.png)


![CDS](https://raw.githubusercontent.com/wiki/wridgeu/wridgeu.github.io/images/whatiscds.png)

## Definition Language (CDL)

### Entities

![Entities](https://raw.githubusercontent.com/wiki/wridgeu/wridgeu.github.io/images/cdlentities.png)

### Views

![Views](https://raw.githubusercontent.com/wiki/wridgeu/wridgeu.github.io/images/cdlviews.png)

### Associations

![Associations](https://raw.githubusercontent.com/wiki/wridgeu/wridgeu.github.io/images/cdlassociations.png)

### Aspects

![Aspects](https://raw.githubusercontent.com/wiki/wridgeu/wridgeu.github.io/images/cldaspects.png)

### Types

![Types](https://raw.githubusercontent.com/wiki/wridgeu/wridgeu.github.io/images/cdltypes.png)

### Service definitions

![Service](https://raw.githubusercontent.com/wiki/wridgeu/wridgeu.github.io/images/cdlservicedefinitions.png)

## Core Schema Notation (CSN)

* A compact JSON representation of data and service models
* Similiar to JSON Schema but goes beyond with the ability to capture full-blown entity-relationship models
* Perfect source to generate target models, such as OData/EDM interfaces, as well as persistance models for SQL or NoSQL databases

![Example](https://raw.githubusercontent.com/wiki/wridgeu/wridgeu.github.io/images/cdlintocsnexample.png)

![Example2](https://raw.githubusercontent.com/wiki/wridgeu/wridgeu.github.io/images/cdlintocsnexample2.png)

## Query Language (CQL)

CDS QL is based on standard SQL with some enhancements:

### Postfix projections

![PostFix](https://raw.githubusercontent.com/wiki/wridgeu/wridgeu.github.io/images/cqlpostfixexpr.png)

### Path expressions

![Expressions](https://raw.githubusercontent.com/wiki/wridgeu/wridgeu.github.io/images/cqlpathexpr.png)

### CDL-style casts

![Style](https://raw.githubusercontent.com/wiki/wridgeu/wridgeu.github.io/images/cqlcdlstylecasts.png)

### Excluding clause

![ExludingClause](https://raw.githubusercontent.com/wiki/wridgeu/wridgeu.github.io/images/cqlexcludingclause.png)

### Query-local mixins

![Mixins](https://raw.githubusercontent.com/wiki/wridgeu/wridgeu.github.io/images/cqlquerymixins.png)

# Credits

* [Official Documentation](https://cap.cloud.sap/docs/about/)
* [CDS](https://cap.cloud.sap/docs/cds/)
* [CDL](https://cap.cloud.sap/docs/cds/cdl)
* [CSN](https://cap.cloud.sap/docs/cds/csn)
* [CQL](https://cap.cloud.sap/docs/cds/cql)
* [Building Applications with SAP Cloud Application Programming Model](https://open.sap.com/courses/cp7) 