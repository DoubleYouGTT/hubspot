
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

Developer notes
---------------

### Welcome contributions

We welcome changes and contributions from new to R folks to experts. We'll happilly mentor you through the process and you can join our [Slack channel](https://join.slack.com/t/lockedata/shared_invite/enQtMjkwNjY3ODkwMzg2LTI1OGU1NTM3ZGIyZGFiNTdlODI3MzU2N2ZlNDczMjM4M2U2OWVmNDMzZTQ1ZGNlZDQ3MGM2MGVjMjI2MWIyMjI) to interact with us.

In terms of the sorts of contributions that you can make, we love to see things like:

-   Raising Issues for suggestions and bugs
-   Helping Issue raisers produce [minimum working examples](https://www.jessemaegan.com/post/so-you-ve-been-asked-to-make-a-reprex/) or improve their descriptions of problems / new features
-   Writing or enhancing documentation like this README, the function documentation, or the vignettes
-   Improving tests by extending existing tests or writing new ones
-   Improving existing code to be more maintainable or faster
-   Fixing bugs
-   Adding new functionality or extending existing functions

### Naming conventions

-   `get_*()` returns a raw response from an API endpoint
-   `entity_aspects()` returns a cleaned up table of the entity and some specific set of information from the raw response
-   `utils-*.R` files are used for any toolkit functions
-   [Tidyverse naming conventions](//style.tidyverse.org/functions.html#naming) are generally adhered to

### Submission checklist

-   When writing a view function, use a default `get_` that is as minimal as possible to enable a reasonable return
-   Run `devtools::document()` to ensure all documentation is updated
-   Write tests to verify your work
-   If you add functionality, do substantial refactoring, extend documentation, or improve the test base, add your info to the `DESCRIPTION` file
-   Add a succinct description of the change to the `NEWS.md` file
-   There is a lintr commit hooks that tidy up R function code, make sure any amendments are committed too
-   When making a Pull Request, reference any issue you're code fixes with \#IssueNo in the body of the PR
