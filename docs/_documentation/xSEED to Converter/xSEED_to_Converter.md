---
layout: documentation
category: Data Validation Tools
order: 3
title: xSEED Converter
---

## Description

xSEED Converter converts an mSEED file <= v2 to v3 with optional extra header inject via a user-provided JSON file.

## Help

xSEED to Converter usage information:

```
Usage: mseedconvert [options] -o outfile infile

 ## Options ##
 -V             Report program version
 -h             Show this usage message
 -v             Be more verbose, multiple flags can be used
 -f             Force full repack, do not use shortcut
 -R bytes       Specify record length in bytes for packing
 -E encoding    Specify encoding format for packing
 -F version     Specify output format version, default is 3
 -eh JSONFile   Specify replacement extra headers in JSON format

 -o outfile     Specify the output file, required

 infile         Input miniSEED file

Each record is converted independently. This can lead to unfilled records
that contain padding depending on the conversion options.
```

## Typical Usage

```
./mseedconvert -eh <JSON file for extra header injection (optional)> -o <Output xSEED fileame> <input miniSEED filename>
```

## Example Usage
```
./mseedconvert -eh ExtraHeader-Full_FDSN.json -o reference-baseline-record-steim2.xseed reference-baseline-record-steim2.mseed -vvv
```