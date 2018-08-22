---
layout: documentation
category: xSEED
order: 1
title: Home
---

## Welcome to xSEED!

### xSeed Preamble

#### Background and Context

Adopted by the [International Federation of Digital Seismograph Networks](http://www.fdsn.org/) (FDSN) in 1987, the SEED format is now the canonical format for passive-source seismic, as well as other types of data. For continuous data collection, archiving, and delivery, the time series and metadata are often handled separately. The time series portion is known as miniSEED. 

Changes are being proposed to miniSEED due to identifier limitations for: 

- Deployments with a very large number of nodes
- New instruments and other data source types, e.g., synthetics.

However, changing the fundamental identifiers requires changes to key fields in miniSEED that would render it incompatible with the current release (2.4). Such a small yet disruptive change affords the opportunity to evolve to xSEED, a next generation time series data format that addresses a number of historical issues and creates new capability to address future needs.

[Read the canonical xSEED specification](https://github.com/iris-edu/xseed-specification/blob/master/xSEED%20-%20DRAFT%2020180511.pdf).

#### xSEED Benefits

xSEED offers the ability to:

- Convert usage of FDSN time series codes (network, station, location, channel) to a variable length Uniform Resource Name (URN) for enhanced flexibility and to allow nearly unlimited future re-definition.
  - Expansion of the individual network, station and location codes to a maximum of 8 characters.
  - The definition of a time series identifier URN and the individual codes, including an expansion of the codes is documented in a separate document.
- Incorporate critical details previously in blockettes (actual sample rate, encoding, microseconds) into the fixed section of the data header.
- Increase sample rate/period representation to a 64-bit floating point value.
- Increase start time resolution to nanoseconds.
- Specify fixed byte order (little endian) for the binary portions of the headers and define a byte order for each data encoding.
- Drop legacy data encodings and reserve their values so they are not used again in the future.
- Add a format version.
- Add a data publication version.
- Add CRC field for validating integrity of record.
- Add a “mass position off scale” flag.
- Add “Recenter” (mass, gimbal, etc.) headers.
- Add “ProvenanceURI” header to identify provenance documentation.
- Replace the blockette structure with flexible extra header construct:
  - Specify a reserved set of extra headers defined by the FDSN and provide schema for validation
  - Previous flags and blockette contents defined in reserved extra headers
  - Allow arbitrary headers to be included in a record.
- Remove the restriction on record length to be powers of 2 and allow variable length.

Additional benefits include:

- General compression encodings for fundamental sample types and opaque data.
- Near complete preservation of miniSEED 2.4 data. Information that is not retained is limited to:
  - Clock model specification per timing exception (current specification only allows a single clock model specification per record)
  - Blockettes 400 (Beam) & 405 (Beam Delay)
  - Blockette 2000 (Opaque Data). 

#### xSEED Reference Data Set

The xSEED Reference Data Set is a reference data set used for developing and testing software. To learn more about the xSEED Reference Data Set, refer to the [xSEED Data Reference Set Overview](https://iris-edu.github.io/xseed-specification/documentation/xSEED%20Reference%20Set/Overview/).

#### xSEED Utilities

Access documentation for the utilities that convert and verify the xSEED standard for miniSEED files: 

- [Validator](https://iris-edu.github.io/xseed-specification/documentation/Validator/Validator/)
- [xSEED Converter](https://iris-edu.github.io/xseed-specification/documentation/xSEED%20to%20Converter/xSEED_to_Converter/)
- [xSEED to JSON](https://iris-edu.github.io/xseed-specification/documentation/xSEED%20to%20JSON/xSEED_to_JSON/)
- [xSEED to Text](https://iris-edu.github.io/xseed-specification/documentation/xSEED%20to%20Text/xSEED_to_Text/)

**_Note:_** *You may also use the sidebar navigation menu to navigate to the xSEED Reference Data Set overview and examples, utilities, and installation instructions.*

### Overview of miniSEED

#### Purpose

The International Federation of Digital Seismograph Networks (FDSN)1 defines miniSEED as a *data format for digital time series and related information*. Intended uses are primarily data collection, archiving, and exchange of seismological data. Support is also included for time series data for other geophysical-related measurements such as pressure, temperature, tilt, etc. In addition to the time series, supported functionality includes storage of related state-of-health and parameters documenting the state of the recording system. The FDSN metadata counterpart of miniSEED is [StationXML](http://www.fdsn.org/xml/station/), which is used to describe characteristics needed to interpret the data such as location, instrument response, etc.

#### Background

The [Standard for the Exchange of Earthquake Data](http://www.fdsn.org/publications/) (SEED)3 was adopted by the FDSN in the 1980s and has served as the dominant standard for seismological data archiving and exchange for decades. This specification defines a format to store both time series and a rich set of related metadata. In 1992, changes in the SEED format were adopted to officially support “data only” SEED, known as miniSEED. This specification is an evolution of miniSEED and is an extension on what was specified in SEED version 2.4.

#### General Structure

The fundamental unit of the format is a data record. A time series is commonly stored and exchanged as a sequence of these records. Each record is independently usable even when presented in a sequence. There are data encodings for integers, floats, text or compressed data samples. To limit problems with timing system drift & resolution as well as practical issues of subsetting & resource limitation for readers of the data, it is recommended that typical record lengths for raw data generation and archiving be in the range of 256 and 4096 bytes.

#### Record Layout and Fields

A record is composed of a header followed by a time series data payload. The byte order of binary fields in the header must be least significant byte first (little endian).

The total length of a record is variable and is the sum of 40 (length of fixed section of header), field 10 (length of identifier), field 11 (length of extra headers), field 12 (length of payload).

| Field | Field Name                       | Type    | Length | Offset                   | Content        |
| ----- | -------------------------------- | ------- | ------ | ------------------------ | -------------- |
| 1     | Record header indicator ('MS')   | CHAR    | 2      | 0                        | ASCII 'MS'     |
| 2     | Format version (3)               | UINT8   | 1      | 2                        |                |
| 3     | Flags                            | UINT8   | 1      | 3                        |                |
|       | Record Start Time                |         |        |                          |                |
| 4a    | Nanosecond (0 - 999999999)       | UINT32  | 4      | 4                        |                |
| 4b    | Year (0 - 65535)                 | UINT16  | 2      | 8                        |                |
| 4c    | Day-of-year ( 1 - 366)           | UINT16  | 2      | 10                       |                |
| 4d    | Hour (0 - 23)                    | UINT8   | 1      | 12                       |                |
| 4e    | Minute (0 - 59)                  | UINT8   | 1      | 13                       |                |
| 4f    | Second (0 - 60)                  | UINT8   | 1      | 14                       |                |
| 5     | Data encoding format             | UINT8   | 1      | 15                       |                |
| 6     | Sample rate/period               | FLOAT64 | 8      | 16                       |                |
| 7     | Number of samples                | UINT32  | 4      | 24                       |                |
| 8     | CRC of the record                | UINT32  | 4      | 28                       |                |
| 9     | Data publication version         | UINT8   | 1      | 32                       |                |
| 10    | Length of identifier in bytes    | UINT8   | 1      | 33                       |                |
| 11    | Length of extra headers in bytes | UINT16  | 2      | 34                       |                |
| 12    | Length of data payload in bytes  | UINT32  | 2      | 36                       |                |
| 13    | Time series identifier           | CHAR    | V      | 40                       | URN identifier |
| 14    | Extra header fields              | JSON    | V      | 40 + field 10            |                |
| 15    | Data payload                     | encoded | V      | 40 + field 10 + field 11 |                |

All length values are specified in bytes, which are assumed to be 8-bits in length.   Data types for each field are defined as follows:

- **CHAR**    - ASCII encoded character data.
- **UINT8**   - Unsigned 8-bit integer.
- **UINT16**  - Unsigned 16-bit integer (little endian).
- **UINT32**  - Unsigned 32-bit integer (little endian).
- **FLOAT64** - IEEE-754 64-bit floating point number (little endian).
- **JSON**    - JSON Data Interchange Standard as defined by [ECMA-404](https://www.ecma-international.org/publications/files/ECMA-ST/ECMA-404.pdf).
