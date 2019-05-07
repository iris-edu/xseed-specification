---
permalink: /faq/
title: Frequently asked questions
toc: false
classes: wide
sidebar:
  nav: "overview-sidebar"
---

## Will data producers or data centers be forced to use xSEED instead of miniSEED 2.4?

In general, no.

Each network operator and data center can choose when or if they
transition to this new format, as each will make that decision based
on a variety of different factors.  We expect this format to be
adopted initially in scenarios that need the enhanced capability it
offers such as longer identifier codes, additional extra headers, etc.

## As a data user what will I need to do?

Make sure your software is up to date.  Software products from IRIS
will be updated to support reading both miniSEED 2.4 and this format
seamlessly.

{: .notice}
**Expanded network, station, location and channel codes are the most
likely changes that will effect data users.  The expansion of these
codes is not defined by the format directly, but will instead be
determined by a separate specification.**

## Is there software for xSEED?

Yes! Important software resources are listed on the [software page](../software/).

## Will xSEED be usable in combination with the SeedLink protocol?

Optimistically, yes!
