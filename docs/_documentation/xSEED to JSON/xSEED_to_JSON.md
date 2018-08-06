---
layout: documentation
category: Data Validation Tools
order: 4
title: xSEED to JSON
---

## Introduction

xSEED to JSON prints the contents of a selected xSEED file to the terminal in JSON format.

## Help

xSEED to JSON usage information:

```
Program to print an xSEED file in JSON format:

Usage: ./xseed2json [options] -f infile

         ## Options ##
     -h help    Display usage information
     -f file    File to print
     -v verbose Verbosity level
```

## Typical Usage

```
./xseed2json <xSEED input file>
add -v for verbosity, add vs for more verbose
```

## Example Usage

```
./xseed2json -f reference-baseline-record-steim2.mseed3 -vvv
```

