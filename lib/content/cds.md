## Introduction

This is a collection of several slides from one of the openSAP courses, regarding the topic 'What is CDS?' and some of it's domain specific languages.

# Overview

## What is CDS?

* CDS stands for Core Data Services
* It is a set of [domain-specific languages](https://cap.cloud.sap/docs/cds/)
* The backbone of the SAP Cloud Application Programming Model

[[images/cdsoverview.png]]


[[images/whatiscds.png]]

## Definition Language (CDL)

### Entities

[[images/cdlentities.png]]

### Views

[[images/cdlviews.png]]

### Associations

[[images/cdlassociations.png]]

### Aspects

[[images/cldaspects.png]]

### Types

[[images/cdltypes.png]]

### Service definitions

[[images/cdlservicedefinitions.png]]

## Core Schema Notation (CSN)

* A compact JSON representation of data and service models
* Similiar to JSON Schema but goes beyond with the ability to capture full-blown entity-relationship models
* Perfect source to generate target models, such as OData/EDM interfaces, as well as persistance models for SQL or NoSQL databases

[[images/cdlintocsnexample.png]]

[[images/cdlintocsnexample2.png]]

## Query Language (CQL)

CDS QL is based on standard SQL with some enhancements:

### Postfix projections

[[images/cqlpostfixexpr.png]]

### Path expressions

[[images/cqlpathexpr.png]]

### CDL-style casts

[[images/cqlcdlstylecasts.png]]

### Excluding clause

[[images/cqlexcludingclause.png]]

### Query-local mixins

[[images/cqlquerymixins.png]]

# Credits

* [Official Documentation](https://cap.cloud.sap/docs/about/)
* [CDS](https://cap.cloud.sap/docs/cds/)
* [CDL](https://cap.cloud.sap/docs/cds/cdl)
* [CSN](https://cap.cloud.sap/docs/cds/csn)
* [CQL](https://cap.cloud.sap/docs/cds/cql)
* [Building Applications with SAP Cloud Application Programming Model](https://open.sap.com/courses/cp7) 