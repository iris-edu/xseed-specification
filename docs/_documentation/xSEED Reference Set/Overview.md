---
layout: documentation
category: xSEED Reference Set
order: 1
title: Overview
---

Intended for use by implementers, data centers, and users of the data format, the xSEED Reference Set illustrates the usage of all key aspects of the data. The reference set includes, but is not limited to, an example of data encoded in each non‐deprecated encoding that exercises as many “states” of the encoding as possible (e.g., all encoding  states in Steim compression schemes):

 - Examples covering each variation of each field as allowed by  the  specification (e.g. sample rate and sampling interval)
 - Examples including every defined (reserved) extra header
 - Examples including some extra headers not defined
 - Examples of various record lengths 128 – 4096 bytes and the maximum length
 - Examples both with and without data samples.

## xSEED Reference Set Examples

The table below provides the file identifier and a description for each reference set example. Click the file identifier link to view the example in text format.

| Example File Identifier                                      | Example File Description                                     |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| [1-reference-record-steim2.xseed](https://xseed.pages.isti.com/xseed-utils/documentation/xSEED%20Reference%20Set/Reference-Set-Example-1/) | - Steim2 encoding<br />- 500 samples<br />- No extra headers |
| [2-reference-record-steim2_EH-FDSN-TQ-ED-TC.xseed](https://xseed.pages.isti.com/xseed-utils/documentation/xSEED%20Reference%20Set/Reference-Set-Example-2/) | - Steim2 encoding<br />- 500 samples<br />- FDSN extra headers:<br />   - Time Quality<br />   - Event Detection<br />   - Time Correction |
| [3-reference-record-steim2_EH-FDSN-TQ-ED-TC-Oper-Manu.xseed](https://xseed.pages.isti.com/xseed-utils/documentation/xSEED%20Reference%20Set/Reference-Set-Example-3/) | - Steim2 encoding<br />- 500 samples<br />- FDSN extra headers:<br />   - Time Quality<br />   - Event Detection<br />   - Time Correction<br />- Non-FDSN headers:<br />   - Manufacturer123<br />   - OperatorXYZ |

