---
permalink: /faq
title: Frequently asked questions
toc: false
classes: wide
sidebar:
  nav: "overview-sidebar"
---

## As a data producer or data center will I be forced to use xSEED instead of miniSEED 2.4?

In general, no.

We expect this format to be adopted initially in scenarios that need
the enhanced capability it offers such as longer identifier codes,
additional extra headers, etc.  Each network operator and data center
can choose when or if they transition to this new format, as each will
make that decision based on a variety of different factors.

## As a data user what will I need to do?

Make sure your software is up to date.  Software products from IRIS
will be updated to support reading both miniSEED 2.4 and this format
seamlessly.

Expanded network, station, location and channel codes are the most
likely changes that will effect data users.

## Will xSEED be usable in combination with the SeedLink protocol?

Optimistically, yes!
