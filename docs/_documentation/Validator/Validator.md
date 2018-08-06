---
layout: documentation
category: Data Validation Tools
order: 2
title: Validator
---
## Description

Validator checks an xSEED file for: 

1. Valid fixed header.
2. Valid payload.
3. Valid extra header via user provided JSON schema (optional).

***Note:***  *All information on the xSEED file is printed to the terminal.*

## Help

Validator usage information:

```
Program to validate xSEED format files:

Usage: ./xseedValidator [options] -f infile

         ## Options ##
     -h help    Display usage information
     -f file    File to validate
     -j json    Json schema
     -v verbose Verbosity level
     -W         Warning flag
```

## Typical Usage
```
./xseedvalidator -f <xSEED file to validate> -j <JSON schema to validate extra headers against (optional)>
add -v for verbosity level, add vs for more verbose
```


## Example Usage
```
./xseedValidator -f reference-baseline-record-steim2.mseed3 -j ExtraHeaders-FDSN.schema.json -vvv
```
