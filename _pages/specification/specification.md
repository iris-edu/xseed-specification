---
permalink: /specification/
title: Specification
toc: false
classes: wide
sidebar:
  nav: "specification-sidebar"
---

{: .notice--warning}
**NOTE**: the current specification for xSEED and the related xFDSN Source
Identifiers are in **DRAFT** and are subject to change.

## Downloads

The current specification for xSEED:

[xSEED - DRAFT 20190506 specification](../docs/xSEED-DRAFT20190506.pdf)

The xSEED specification requires the use of a Uniform Resource Name
(URN) or similar as a source identifier.  To satisfy this requirement
we have developed a specification that combines SEED identifiers into
a URN.  While not specifically part of xSEED, it is closely related
and for expediency the specification is posted here:

[xFDSN Source Identifiers - DRAFT 20190508 specification](../docs/xFDSNSourceIdentifiers-DRAFT20190508.pdf)

## General structure

The fundamental unit of the format is a data record.  A time series is
commonly stored and exchanged as a sequence of these records.  Each
record is independently usable even when presented in a sequence.
There are data encodings for integers, floats, text or compressed data
samples.  To limit problems with timing system drift and resolution in
addition to practical issues of subsetting and resource limitation for
readers of the data, typical record lengths for raw data generation
and archiving are recommended to be in the range of 256 and 4096
bytes.

## Record layout and fields

A record is composed of a header followed by a data payload. The byte
order of binary fields in the header must be least significant byte
first (little endian).The total length of a record is variable and is
the sum of 40 (length of fixed section of header), field 10 (length of
identifier), field 11 (length of extra headers), field 12 (length of
payload).

| Field | Field Name                          | Type    | Length | Offset                   | Content        |
| ----- | ----------------------------------- | ------- | ------ | ------------------------ | -------------- |
| 1     | Record header indicator ('MS')      | CHAR    | 2      | 0                        | ASCII 'MS'     |
| 2     | Format version (3)                  | UINT8   | 1      | 2                        |                |
| 3     | Flags                               | UINT8   | 1      | 3                        |                |
|       | Record Start Time                   |         |        |                          |                |
| 4a    | Nanosecond (0 - 999999999)          | UINT32  | 4      | 4                        |                |
| 4b    | Year (0 - 65535)                    | UINT16  | 2      | 8                        |                |
| 4c    | Day-of-year ( 1 - 366)              | UINT16  | 2      | 10                       |                |
| 4d    | Hour (0 - 23)                       | UINT8   | 1      | 12                       |                |
| 4e    | Minute (0 - 59)                     | UINT8   | 1      | 13                       |                |
| 4f    | Second (0 - 60)                     | UINT8   | 1      | 14                       |                |
| 5     | Data encoding format                | UINT8   | 1      | 15                       |                |
| 6     | Sample rate/period                  | FLOAT64 | 8      | 16                       |                |
| 7     | Number of samples                   | UINT32  | 4      | 24                       |                |
| 8     | CRC of the record                   | UINT32  | 4      | 28                       |                |
| 9     | Data publication version            | UINT8   | 1      | 32                       |                |
| 10    | Length of identifier in bytes       | UINT8   | 1      | 33                       |                |
| 11    | Length of extra headers in bytes    | UINT16  | 2      | 34                       |                |
| 12    | Length of data payload in bytes     | UINT32  | 4      | 36                       |                |
| 13    | Time series identifier              | CHAR    | V      | 40                       | URN identifier |
| 14    | [Extra header](extraheaders) fields | JSON    | V      | 40 + field 10            |                |
| 15    | Data payload                        | encoded | V      | 40 + field 10 + field 11 |                |

All length values are specified in bytes, which are assumed to be 8-bits in length.   Data types for each field are defined as follows:

- **CHAR**    - ASCII encoded character data.
- **UINT8**   - Unsigned 8-bit integer.
- **UINT16**  - Unsigned 16-bit integer (little endian).
- **UINT32**  - Unsigned 32-bit integer (little endian).
- **FLOAT64** - IEEE-754 64-bit floating point number (little endian).
- **JSON**    - JSON Data Interchange Standard as defined by [ECMA-404](https://www.ecma-international.org/publications/files/ECMA-ST/ECMA-404.pdf).
