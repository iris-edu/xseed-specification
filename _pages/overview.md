---
permalink: /
title: Overview
toc: false
classes: wide
sidebar:
  nav: "overview-sidebar"
---

The xSEED (extended miniSEED) data format is primarily designed as an
archive and exchange format for time series data.  As an evolution of
[miniSEED](http://ds.iris.edu/ds/nodes/dmc/data/formats/miniseed/)
the format is particularly suited for seismological and related data.

Go straight to [the specification](specification/).

The format was developed to match the [requirements for a next
generation format
(NGF)](https://docs.google.com/document/d/1ymAe9v1rUuucpY7ai5ilKsD7V1ejwt6GxQQmJ5IevDI/edit)
identified by [FDSN Working Group II](http://www.fdsn.org/wg/wgII/).
Further context is provided for this FDSN WG II effort in the [mailing
list annoucement](http://www.fdsn.org/message-center/thread/514/#m-944).

### Motivation

The key issue motivating changes to miniSEED 2.4 are limitations with
identifiers for deployments with a very large number of nodes, new
instruments and other data source types, e.g. synthetic data.  In
addition, there are many anachronisms and omissions in the format that
can now be addressed.  See the [enhancements](#xseed-enhancements) for
a complete list of changes that address these problems.

### xSEED enhancements

Significant enhancements in xSEED relative to miniSEED 2.4:

* Convert usage of FDSN source identifier codes (`network`, `station`,
  `location`, `channel`) to a variable length Uniform Resource Name (URN)
  for enhanced flexibility and to allow nearly unlimited future
  re-definition.
  * This new identifier can be used to allow significant expansion of
  the semantic codes, for example 8 characters network, station, and
  location codes.
  * The definition of a source identifier URN and the individual codes,
   including an expansion of the codes is documented in a separate
   document
* Incorporate critical details previously in blockettes (actual sample
  rate, encoding, microseconds) into the fixed section of the data
  header
* Increase sample rate/period representation to a 64-bit floating point value
* Increase start time resolution to nanoseconds
* Specify fixed byte order (little endian) for the binary portions of
  the headers and define a byte order for each data encoding
* Drop legacy data encodings and reserve their values so they are not used again in the future
* Add a format version
* Add a data publication version, a functional replacement for the miniSEED 2.4 quality code
* Add CRC field for validating integrity of record
* Add a “mass position off scale” flag
* Add “Recenter” (mass, gimbal, etc.) headers
* Add “ProvenanceURI” header to identify provenance documentation
* Replace the blockette structure with flexible [Extra Header](specification/extraheaders/) construct:
  * A reserved set of extra headers defined by the FDSN, provided schema for validation
  * miniSEED 2.4 flags and blockette contents defined in reserved Extra Headers
  * Allow arbitrary headers to be included in a record
* Remove the restriction on record length to be powers of 2, allow variable length
* A encoding for opaque data - only for use in special scenarios, not intended for long term archiving

### Unsupported data structures

The data format includes near complete preservation of miniSEED 2.4
data. Information that is **not retained** is limited to:

* Clock model specification per timing exception, potentially multiple per record
  * The xSEED specification only allows a single clock model specification per record
* Blockettes 400 (Beam) & 405 (Beam Delay), unused functionality
* Blockette 2000 (Opaque Data), functional substitution is an opaque payload encoding

### History and context

Adopted by the FDSN in 1987, the
[SEED](http://www.fdsn.org/publications/) format has become the
canonical format for passive source seismic (and other) data.  The
current release of the SEED standard is 2.4.

For continuous data collection, archiving and delivery it has become
common to handle the data and metadata separately.  The part
containing the data is called "miniSEED" and the part containing the
metadata is called "dataless".
