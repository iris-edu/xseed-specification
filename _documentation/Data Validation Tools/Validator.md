---
layout: documentation
category: Data Validation Tools
order: 2
title: Validator
---
## Description

Validator is a program that validates xSEED format files. This program checks xSEED files for a valid fixed header and payload; and optionally validates extra headers stored in the xSEED records with JSON schema files.

***Note:***  *All information on the xSEED file is printed to the terminal.*

Additional characteristics of Validator include:

- Command‐line utility that provides details of non‐conformance as well as a simple pass/fail notification
- Optional validation of data decoding, i.e., decoding without errors.

## Help

Validator usage information:

```
Program to validate xSEED format files:

Usage: ./xseed-validator [options] infile(s)

         ## Options ##
	 -h help    Display usage information
	 -j json    Json schema
	 -v verbose Verbosity level
	 -d data    Print data payload
	 -W         Option flag  *e.g* -W error,skip-payload 
```

## Typical Usage
```
./xseed-validator <xSEED file(s) to validate> -j <JSON schema to validate extra headers against (optional)>
add -d to print record data-payload
add -v for verbosity level, add vs for more verbose
```


## Example Usage
```
xseed-utils/bin/xseed-validator xseed-utils/share/ref_datasets/reference-baseline-record-sinusoid-steim2.xseed
```
## Example Usage Output
```
**********xseed-validator STARTING validation**********
---------------------------------------------------------

Reading file xseed-utils/share/ref_datasets/reference-baseline-record-sinusoid-steim2.xseed
*** Completed processing 1 records ***
xseed-validator RESULT - file xseed-utils/share/ref_datasets/reference-baseline-record-sinusoid-steim2.xseed is VALID xSEED

----------------------------------------------------------
*xseed-validator COMPLETE - 1 record(s) processed in 1 file(s)*
****xseed-validator SUCCESSFULLY validated 1 file(s)****
```