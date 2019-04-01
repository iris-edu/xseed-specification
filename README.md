[xSEED specification project on GitHub](https://github.com/iris-edu/xseed-specification)

To contribute, ask questsions, etc. please use the [project issues](https://github.com/iris-edu/xseed-specification/issues)

Current draft of the IRIS xSEED and time series identifiers specifications:

[xSEED - DRAFT 20180511.pdf](/xseed-specification/xSEED%20-%20DRAFT%2020180511.pdf)

[xFDSN Source Identifiers - DRAFT 20190115.pdf](/xseed-specification/xFDSN%20Source%20Identifiers%20-%20DRAFT%2020190115.pdf)

# Extra headers

Extra headers are documented in JSON Schema.  The reserved, FDSN headers are documented here:

[ExtraHeaders-FDSN.schema.json](/xseed-specification/ExtraHeaders/ExtraHeaders-FDSN.schema.json)

Examples of fictional extentions to the headers by Manufacturer123 and OperatorXYZ:

[ExtraHeaders-Manufacturer123.schema.json](/xseed-specification/ExtraHeaders/ExtraHeaders-Manufacturer123.schema.json)

[ExtraHeaders-OperatorXYZ.schema.json](/xseed-specification/ExtraHeaders/ExtraHeaders-OperatorXYZ.schema.json)

All schemas, or selected schemas can be trivially combined using references in JSON Schema:

[all-schemas.github.json](/xseed-specification/ExtraHeaders/all-schemas.github.json)

## Browsing of extra header schemas

JSON is not particularly readable by humans.  Here is a simple documentation generator that makes it a little easer:

[Docson documentation from JSON Schema](https://lbovet.github.io/docson/#https://iris-edu.github.io/xseed-specification/ExtraHeaders/all-schemas.github.json)

## Examples of extra headers

All reserved, FDSN extra headers: [Example-ExtraHeaders-FDSN.json](ExtraHeaders/Example-ExtraHeaders-FDSN.json)

FDSN plus none-FDSN extra headers: [Example-ExtraHeaders-FDSN-Plus.json](ExtraHeaders/Example-ExtraHeaders-FDSN-Plus.json)
