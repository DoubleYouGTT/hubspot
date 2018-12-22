
<!-- README.md is generated from README.Rmd. Please edit that file -->
hubspot
=======

<!-- badges: start -->
[![Project Status: WIP - Initial development is in progress, but there has not yet been a stable, usable release suitable for the public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip) [![Travis build status](https://travis-ci.org/lockedata/hubspot.svg?branch=master)](https://travis-ci.org/lockedata/hubspot) <!-- badges: end -->

The goal of `hubspot` is to enable access to [Hubspot CRM](//hubspot.com) data.

Installation
------------

``` r
remotes::install_github("lockedata/hubspot")
```

Example
-------

``` r
library(hubspot)
deal_props = get_deal_properties("demo")
deals = get_deals("demo", properties = deal_props, max_iter = 1)
```
