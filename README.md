
<!-- README.md is generated from README.Rmd. Please edit that file -->

# hubspot

> Access Hubspot CRM data in R

<!-- badges: start -->

[![Project Status: WIP - Initial development is in progress, but there
has not yet been a stable, usable release suitable for the
public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)
[![Travis build
status](https://travis-ci.org/lockedata/hubspot.svg?branch=master)](https://travis-ci.org/lockedata/hubspot)
[![Locke Data
Slack](https://img.shields.io/badge/Slack-discuss-blue.svg?logo=slack&longCache=true&style=flat)](https://join.slack.com/t/lockedata/shared_invite/enQtMjkwNjY3ODkwMzg2LTI1OGU1NTM3ZGIyZGFiNTdlODI3MzU2N2ZlNDczMjM4M2U2OWVmNDMzZTQ1ZGNlZDQ3MGM2MGVjMjI2MWIyMjI)
[![Codecov test
coverage](https://codecov.io/gh/lockedata/hubspot/branch/master/graph/badge.svg)](https://codecov.io/gh/lockedata/hubspot?branch=master)
<!-- badges: end -->

The goal of `hubspot` is to enable access to [Hubspot
CRM](//hubspot.com) data. It uses the [Hubspot
API](developers.hubspot.com/docs/overview).

All functions are named following a
`hs_<endpointname>_raw()`/`hs_<endpointname>_tidy()`, with
`hs_<endpointname>_tidy()` offering at least one view: e.g. get a nested
list of deals data with `hs_deals_raw()` and transform it to a tibble of
associations, properties history, properties or stages history using
`hs_deals_tidy()`.

Refer to the [online reference](https://itsalocke.com/hubspot/reference)
to see what endpoints are supported at the moment. Feel free to suggest
new “getters” (`hs_<endpointname>_raw()`) and tidier options (`view` of
`hs_<endpointname>_tidy()`) in the [issue
tracker](https://github.com/lockedata/hubspot/issues).

## Example

``` r
library("hubspot")

deal_props <- hs_deal_properties_tidy()
head(deal_props)
#> [1] "amount_in_home_currency"    "days_to_close"             
#> [3] "hs_analytics_source"        "hs_analytics_source_data_1"
#> [5] "hs_analytics_source_data_2" "hs_campaign"

deals <- hs_deals_raw(properties = deal_props, max_iter = 1)
str(deals)
#> List of 1
#>  $ 931633510:List of 7
#>   ..$ portalId    : int 62515
#>   ..$ dealId      : int 931633510
#>   ..$ isDeleted   : logi FALSE
#>   ..$ associations:List of 4
#>   .. ..$ associatedVids      : list()
#>   .. ..$ associatedCompanyIds: list()
#>   .. ..$ associatedDealIds   : list()
#>   .. ..$ associatedTicketIds : list()
#>   ..$ properties  :List of 24
#>   .. ..$ hs_closed_amount_in_home_currency   :List of 5
#>   .. .. ..$ value    : chr "0"
#>   .. .. ..$ timestamp: num 1.57e+12
#>   .. .. ..$ source   : chr "CALCULATED"
#>   .. .. ..$ sourceId : NULL
#>   .. .. ..$ versions :List of 1
#>   .. .. .. ..$ :List of 6
#>   .. .. .. .. ..$ name          : chr "hs_closed_amount_in_home_currency"
#>   .. .. .. .. ..$ value         : chr "0"
#>   .. .. .. .. ..$ timestamp     : num 1.57e+12
#>   .. .. .. .. ..$ source        : chr "CALCULATED"
#>   .. .. .. .. ..$ sourceVid     : list()
#>   .. .. .. .. ..$ sourceMetadata: chr ""
#>   .. ..$ dealname                            :List of 5
#>   .. .. ..$ value    : chr "Example deal"
#>   .. .. ..$ timestamp: num 1.57e+12
#>   .. .. ..$ source   : chr "CRM_UI"
#>   .. .. ..$ sourceId : chr "dadams@hubspot.com"
#>   .. .. ..$ versions :List of 1
#>   .. .. .. ..$ :List of 6
#>   .. .. .. .. ..$ name     : chr "dealname"
#>   .. .. .. .. ..$ value    : chr "Example deal"
#>   .. .. .. .. ..$ timestamp: num 1.57e+12
#>   .. .. .. .. ..$ sourceId : chr "dadams@hubspot.com"
#>   .. .. .. .. ..$ source   : chr "CRM_UI"
#>   .. .. .. .. ..$ sourceVid: list()
#>   .. ..$ hs_all_accessible_team_ids          :List of 5
#>   .. .. ..$ value    : chr ""
#>   .. .. ..$ timestamp: num 1.57e+12
#>   .. .. ..$ source   : chr "CRM_UI"
#>   .. .. ..$ sourceId : chr "PermissionsUpdater"
#>   .. .. ..$ versions :List of 2
#>   .. .. .. ..$ :List of 6
#>   .. .. .. .. ..$ name     : chr "hs_all_accessible_team_ids"
#>   .. .. .. .. ..$ value    : chr ""
#>   .. .. .. .. ..$ timestamp: num 1.57e+12
#>   .. .. .. .. ..$ sourceId : chr "PermissionsUpdater"
#>   .. .. .. .. ..$ source   : chr "CRM_UI"
#>   .. .. .. .. ..$ sourceVid: list()
#>   .. .. .. ..$ :List of 6
#>   .. .. .. .. ..$ name     : chr "hs_all_accessible_team_ids"
#>   .. .. .. .. ..$ value    : chr "112117"
#>   .. .. .. .. ..$ timestamp: num 1.57e+12
#>   .. .. .. .. ..$ sourceId : chr "PermissionsUpdater"
#>   .. .. .. .. ..$ source   : chr "CRM_UI"
#>   .. .. .. .. ..$ sourceVid: list()
#>   .. ..$ amount                              :List of 5
#>   .. .. ..$ value    : chr "100"
#>   .. .. ..$ timestamp: num 1.57e+12
#>   .. .. ..$ source   : chr "CRM_UI"
#>   .. .. ..$ sourceId : chr "dadams@hubspot.com"
#>   .. .. ..$ versions :List of 1
#>   .. .. .. ..$ :List of 6
#>   .. .. .. .. ..$ name     : chr "amount"
#>   .. .. .. .. ..$ value    : chr "100"
#>   .. .. .. .. ..$ timestamp: num 1.57e+12
#>   .. .. .. .. ..$ sourceId : chr "dadams@hubspot.com"
#>   .. .. .. .. ..$ source   : chr "CRM_UI"
#>   .. .. .. .. ..$ sourceVid: list()
#>   .. ..$ closedate                           :List of 5
#>   .. .. ..$ value    : chr "1564783118291"
#>   .. .. ..$ timestamp: num 1.57e+12
#>   .. .. ..$ source   : chr "CRM_UI"
#>   .. .. ..$ sourceId : chr "dadams@hubspot.com"
#>   .. .. ..$ versions :List of 1
#>   .. .. .. ..$ :List of 6
#>   .. .. .. .. ..$ name     : chr "closedate"
#>   .. .. .. .. ..$ value    : chr "1564783118291"
#>   .. .. .. .. ..$ timestamp: num 1.57e+12
#>   .. .. .. .. ..$ sourceId : chr "dadams@hubspot.com"
#>   .. .. .. .. ..$ source   : chr "CRM_UI"
#>   .. .. .. .. ..$ sourceVid: list()
#>   .. ..$ num_associated_contacts             :List of 5
#>   .. .. ..$ value    : chr "0"
#>   .. .. ..$ timestamp: num 1.57e+12
#>   .. .. ..$ source   : chr "CALCULATED"
#>   .. .. ..$ sourceId : NULL
#>   .. .. ..$ versions :List of 1
#>   .. .. .. ..$ :List of 5
#>   .. .. .. .. ..$ name     : chr "num_associated_contacts"
#>   .. .. .. .. ..$ value    : chr "0"
#>   .. .. .. .. ..$ timestamp: num 1.57e+12
#>   .. .. .. .. ..$ source   : chr "CALCULATED"
#>   .. .. .. .. ..$ sourceVid: list()
#>   .. ..$ hs_all_team_ids                     :List of 5
#>   .. .. ..$ value    : chr ""
#>   .. .. ..$ timestamp: num 1.57e+12
#>   .. .. ..$ source   : chr "CRM_UI"
#>   .. .. ..$ sourceId : chr "PermissionsUpdater"
#>   .. .. ..$ versions :List of 2
#>   .. .. .. ..$ :List of 6
#>   .. .. .. .. ..$ name     : chr "hs_all_team_ids"
#>   .. .. .. .. ..$ value    : chr ""
#>   .. .. .. .. ..$ timestamp: num 1.57e+12
#>   .. .. .. .. ..$ sourceId : chr "PermissionsUpdater"
#>   .. .. .. .. ..$ source   : chr "CRM_UI"
#>   .. .. .. .. ..$ sourceVid: list()
#>   .. .. .. ..$ :List of 6
#>   .. .. .. .. ..$ name     : chr "hs_all_team_ids"
#>   .. .. .. .. ..$ value    : chr "112117"
#>   .. .. .. .. ..$ timestamp: num 1.57e+12
#>   .. .. .. .. ..$ sourceId : chr "PermissionsUpdater"
#>   .. .. .. .. ..$ source   : chr "CRM_UI"
#>   .. .. .. .. ..$ sourceVid: list()
#>   .. ..$ createdate                          :List of 5
#>   .. .. ..$ value    : chr "1565733501511"
#>   .. .. ..$ timestamp: num 1.57e+12
#>   .. .. ..$ source   : chr "CRM_UI"
#>   .. .. ..$ sourceId : chr "dadams@hubspot.com"
#>   .. .. ..$ versions :List of 1
#>   .. .. .. ..$ :List of 6
#>   .. .. .. .. ..$ name     : chr "createdate"
#>   .. .. .. .. ..$ value    : chr "1565733501511"
#>   .. .. .. .. ..$ timestamp: num 1.57e+12
#>   .. .. .. .. ..$ sourceId : chr "dadams@hubspot.com"
#>   .. .. .. .. ..$ source   : chr "CRM_UI"
#>   .. .. .. .. ..$ sourceVid: list()
#>   .. ..$ hs_is_closed                        :List of 5
#>   .. .. ..$ value    : chr "false"
#>   .. .. ..$ timestamp: num 1.57e+12
#>   .. .. ..$ source   : chr "CALCULATED"
#>   .. .. ..$ sourceId : NULL
#>   .. .. ..$ versions :List of 1
#>   .. .. .. ..$ :List of 6
#>   .. .. .. .. ..$ name          : chr "hs_is_closed"
#>   .. .. .. .. ..$ value         : chr "false"
#>   .. .. .. .. ..$ timestamp     : num 1.57e+12
#>   .. .. .. .. ..$ source        : chr "CALCULATED"
#>   .. .. .. .. ..$ sourceVid     : list()
#>   .. .. .. .. ..$ sourceMetadata: chr ""
#>   .. ..$ amount_in_home_currency             :List of 5
#>   .. .. ..$ value    : chr "100"
#>   .. .. ..$ timestamp: num 1.57e+12
#>   .. .. ..$ source   : chr "CALCULATED"
#>   .. .. ..$ sourceId : NULL
#>   .. .. ..$ versions :List of 1
#>   .. .. .. ..$ :List of 6
#>   .. .. .. .. ..$ name          : chr "amount_in_home_currency"
#>   .. .. .. .. ..$ value         : chr "100"
#>   .. .. .. .. ..$ timestamp     : num 1.57e+12
#>   .. .. .. .. ..$ source        : chr "CALCULATED"
#>   .. .. .. .. ..$ sourceVid     : list()
#>   .. .. .. .. ..$ sourceMetadata: chr ""
#>   .. ..$ hs_deal_stage_probability           :List of 5
#>   .. .. ..$ value    : chr "0.59999999999999997779553950749686919152736663818359375"
#>   .. .. ..$ timestamp: num 1.57e+12
#>   .. .. ..$ source   : chr "CALCULATED"
#>   .. .. ..$ sourceId : NULL
#>   .. .. ..$ versions :List of 1
#>   .. .. .. ..$ :List of 6
#>   .. .. .. .. ..$ name          : chr "hs_deal_stage_probability"
#>   .. .. .. .. ..$ value         : chr "0.59999999999999997779553950749686919152736663818359375"
#>   .. .. .. .. ..$ timestamp     : num 1.57e+12
#>   .. .. .. .. ..$ source        : chr "CALCULATED"
#>   .. .. .. .. ..$ sourceVid     : list()
#>   .. .. .. .. ..$ sourceMetadata: chr ""
#>   .. ..$ days_to_close                       :List of 5
#>   .. .. ..$ value    : chr "0"
#>   .. .. ..$ timestamp: num 1.57e+12
#>   .. .. ..$ source   : chr "CALCULATED"
#>   .. .. ..$ sourceId : NULL
#>   .. .. ..$ versions :List of 1
#>   .. .. .. ..$ :List of 6
#>   .. .. .. .. ..$ name          : chr "days_to_close"
#>   .. .. .. .. ..$ value         : chr "0"
#>   .. .. .. .. ..$ timestamp     : num 1.57e+12
#>   .. .. .. .. ..$ source        : chr "CALCULATED"
#>   .. .. .. .. ..$ sourceVid     : list()
#>   .. .. .. .. ..$ sourceMetadata: chr ""
#>   .. ..$ pipeline                            :List of 5
#>   .. .. ..$ value    : chr "default"
#>   .. .. ..$ timestamp: num 1.57e+12
#>   .. .. ..$ source   : chr "CRM_UI"
#>   .. .. ..$ sourceId : chr "dadams@hubspot.com"
#>   .. .. ..$ versions :List of 1
#>   .. .. .. ..$ :List of 6
#>   .. .. .. .. ..$ name     : chr "pipeline"
#>   .. .. .. .. ..$ value    : chr "default"
#>   .. .. .. .. ..$ timestamp: num 1.57e+12
#>   .. .. .. .. ..$ sourceId : chr "dadams@hubspot.com"
#>   .. .. .. .. ..$ source   : chr "CRM_UI"
#>   .. .. .. .. ..$ sourceVid: list()
#>   .. ..$ hubspot_team_id                     :List of 5
#>   .. .. ..$ value    : chr ""
#>   .. .. ..$ timestamp: num 1.57e+12
#>   .. .. ..$ source   : chr "CRM_UI"
#>   .. .. ..$ sourceId : chr "PermissionsUpdater"
#>   .. .. ..$ versions :List of 2
#>   .. .. .. ..$ :List of 6
#>   .. .. .. .. ..$ name     : chr "hubspot_team_id"
#>   .. .. .. .. ..$ value    : chr ""
#>   .. .. .. .. ..$ timestamp: num 1.57e+12
#>   .. .. .. .. ..$ sourceId : chr "PermissionsUpdater"
#>   .. .. .. .. ..$ source   : chr "CRM_UI"
#>   .. .. .. .. ..$ sourceVid: list()
#>   .. .. .. ..$ :List of 6
#>   .. .. .. .. ..$ name     : chr "hubspot_team_id"
#>   .. .. .. .. ..$ value    : chr "112117"
#>   .. .. .. .. ..$ timestamp: num 1.57e+12
#>   .. .. .. .. ..$ sourceId : chr "PermissionsUpdater"
#>   .. .. .. .. ..$ source   : chr "CRM_UI"
#>   .. .. .. .. ..$ sourceVid: list()
#>   .. ..$ hubspot_owner_id                    :List of 5
#>   .. .. ..$ value    : chr "71"
#>   .. .. ..$ timestamp: num 1.57e+12
#>   .. .. ..$ source   : chr "CRM_UI"
#>   .. .. ..$ sourceId : chr "dadams@hubspot.com"
#>   .. .. ..$ versions :List of 1
#>   .. .. .. ..$ :List of 6
#>   .. .. .. .. ..$ name     : chr "hubspot_owner_id"
#>   .. .. .. .. ..$ value    : chr "71"
#>   .. .. .. .. ..$ timestamp: num 1.57e+12
#>   .. .. .. .. ..$ sourceId : chr "dadams@hubspot.com"
#>   .. .. .. .. ..$ source   : chr "CRM_UI"
#>   .. .. .. .. ..$ sourceVid: list()
#>   .. ..$ hs_closed_amount                    :List of 5
#>   .. .. ..$ value    : chr "0"
#>   .. .. ..$ timestamp: num 1.57e+12
#>   .. .. ..$ source   : chr "CALCULATED"
#>   .. .. ..$ sourceId : NULL
#>   .. .. ..$ versions :List of 1
#>   .. .. .. ..$ :List of 6
#>   .. .. .. .. ..$ name          : chr "hs_closed_amount"
#>   .. .. .. .. ..$ value         : chr "0"
#>   .. .. .. .. ..$ timestamp     : num 1.57e+12
#>   .. .. .. .. ..$ source        : chr "CALCULATED"
#>   .. .. .. .. ..$ sourceVid     : list()
#>   .. .. .. .. ..$ sourceMetadata: chr ""
#>   .. ..$ hs_lastmodifieddate                 :List of 5
#>   .. .. ..$ value    : chr "1565735453314"
#>   .. .. ..$ timestamp: num 1.57e+12
#>   .. .. ..$ source   : chr "CALCULATED"
#>   .. .. ..$ sourceId : NULL
#>   .. .. ..$ versions :List of 3
#>   .. .. .. ..$ :List of 5
#>   .. .. .. .. ..$ name     : chr "hs_lastmodifieddate"
#>   .. .. .. .. ..$ value    : chr "1565735453314"
#>   .. .. .. .. ..$ timestamp: num 1.57e+12
#>   .. .. .. .. ..$ source   : chr "CALCULATED"
#>   .. .. .. .. ..$ sourceVid: list()
#>   .. .. .. ..$ :List of 5
#>   .. .. .. .. ..$ name     : chr "hs_lastmodifieddate"
#>   .. .. .. .. ..$ value    : chr "1565733538147"
#>   .. .. .. .. ..$ timestamp: num 1.57e+12
#>   .. .. .. .. ..$ source   : chr "CALCULATED"
#>   .. .. .. .. ..$ sourceVid: list()
#>   .. .. .. ..$ :List of 5
#>   .. .. .. .. ..$ name     : chr "hs_lastmodifieddate"
#>   .. .. .. .. ..$ value    : chr "1565733537449"
#>   .. .. .. .. ..$ timestamp: num 1.57e+12
#>   .. .. .. .. ..$ source   : chr "CALCULATED"
#>   .. .. .. .. ..$ sourceVid: list()
#>   .. ..$ hubspot_owner_assigneddate          :List of 5
#>   .. .. ..$ value    : chr "1565733537449"
#>   .. .. ..$ timestamp: num 1.57e+12
#>   .. .. ..$ source   : chr "CRM_UI"
#>   .. .. ..$ sourceId : chr "dadams@hubspot.com"
#>   .. .. ..$ versions :List of 1
#>   .. .. .. ..$ :List of 6
#>   .. .. .. .. ..$ name     : chr "hubspot_owner_assigneddate"
#>   .. .. .. .. ..$ value    : chr "1565733537449"
#>   .. .. .. .. ..$ timestamp: num 1.57e+12
#>   .. .. .. .. ..$ sourceId : chr "dadams@hubspot.com"
#>   .. .. .. .. ..$ source   : chr "CRM_UI"
#>   .. .. .. .. ..$ sourceVid: list()
#>   .. ..$ dealstage                           :List of 5
#>   .. .. ..$ value    : chr "presentationscheduled"
#>   .. .. ..$ timestamp: num 1.57e+12
#>   .. .. ..$ source   : chr "CRM_UI"
#>   .. .. ..$ sourceId : chr "dadams@hubspot.com"
#>   .. .. ..$ versions :List of 1
#>   .. .. .. ..$ :List of 6
#>   .. .. .. .. ..$ name     : chr "dealstage"
#>   .. .. .. .. ..$ value    : chr "presentationscheduled"
#>   .. .. .. .. ..$ timestamp: num 1.57e+12
#>   .. .. .. .. ..$ sourceId : chr "dadams@hubspot.com"
#>   .. .. .. .. ..$ source   : chr "CRM_UI"
#>   .. .. .. .. ..$ sourceVid: list()
#>   .. ..$ hs_createdate                       :List of 5
#>   .. .. ..$ value    : chr "1565733537449"
#>   .. .. ..$ timestamp: num 1.57e+12
#>   .. .. ..$ source   : chr "CONTACTS"
#>   .. .. ..$ sourceId : chr "CRM_UI"
#>   .. .. ..$ versions :List of 1
#>   .. .. .. ..$ :List of 6
#>   .. .. .. .. ..$ name     : chr "hs_createdate"
#>   .. .. .. .. ..$ value    : chr "1565733537449"
#>   .. .. .. .. ..$ timestamp: num 1.57e+12
#>   .. .. .. .. ..$ sourceId : chr "CRM_UI"
#>   .. .. .. .. ..$ source   : chr "CONTACTS"
#>   .. .. .. .. ..$ sourceVid: list()
#>   .. ..$ hs_object_id                        :List of 5
#>   .. .. ..$ value    : chr "931633510"
#>   .. .. ..$ timestamp: num 1.57e+12
#>   .. .. ..$ source   : chr "CALCULATED"
#>   .. .. ..$ sourceId : NULL
#>   .. .. ..$ versions :List of 1
#>   .. .. .. ..$ :List of 5
#>   .. .. .. .. ..$ name     : chr "hs_object_id"
#>   .. .. .. .. ..$ value    : chr "931633510"
#>   .. .. .. .. ..$ timestamp: num 1.57e+12
#>   .. .. .. .. ..$ source   : chr "CALCULATED"
#>   .. .. .. .. ..$ sourceVid: list()
#>   .. ..$ hs_projected_amount                 :List of 5
#>   .. .. ..$ value    : chr "59.99999999999999777955395074968691915273666381835937500"
#>   .. .. ..$ timestamp: num 1.57e+12
#>   .. .. ..$ source   : chr "CALCULATED"
#>   .. .. ..$ sourceId : NULL
#>   .. .. ..$ versions :List of 1
#>   .. .. .. ..$ :List of 6
#>   .. .. .. .. ..$ name          : chr "hs_projected_amount"
#>   .. .. .. .. ..$ value         : chr "59.99999999999999777955395074968691915273666381835937500"
#>   .. .. .. .. ..$ timestamp     : num 1.57e+12
#>   .. .. .. .. ..$ source        : chr "CALCULATED"
#>   .. .. .. .. ..$ sourceVid     : list()
#>   .. .. .. .. ..$ sourceMetadata: chr ""
#>   .. ..$ hs_all_owner_ids                    :List of 5
#>   .. .. ..$ value    : chr "71"
#>   .. .. ..$ timestamp: num 1.57e+12
#>   .. .. ..$ source   : chr "CRM_UI"
#>   .. .. ..$ sourceId : chr "PermissionsUpdater"
#>   .. .. ..$ versions :List of 1
#>   .. .. .. ..$ :List of 6
#>   .. .. .. .. ..$ name     : chr "hs_all_owner_ids"
#>   .. .. .. .. ..$ value    : chr "71"
#>   .. .. .. .. ..$ timestamp: num 1.57e+12
#>   .. .. .. .. ..$ sourceId : chr "PermissionsUpdater"
#>   .. .. .. .. ..$ source   : chr "CRM_UI"
#>   .. .. .. .. ..$ sourceVid: list()
#>   .. ..$ hs_projected_amount_in_home_currency:List of 5
#>   .. .. ..$ value    : chr "59.99999999999999777955395074968691915273666381835937500"
#>   .. .. ..$ timestamp: num 1.57e+12
#>   .. .. ..$ source   : chr "CALCULATED"
#>   .. .. ..$ sourceId : NULL
#>   .. .. ..$ versions :List of 1
#>   .. .. .. ..$ :List of 6
#>   .. .. .. .. ..$ name          : chr "hs_projected_amount_in_home_currency"
#>   .. .. .. .. ..$ value         : chr "59.99999999999999777955395074968691915273666381835937500"
#>   .. .. .. .. ..$ timestamp     : num 1.57e+12
#>   .. .. .. .. ..$ source        : chr "CALCULATED"
#>   .. .. .. .. ..$ sourceVid     : list()
#>   .. .. .. .. ..$ sourceMetadata: chr ""
#>   ..$ imports     : list()
#>   ..$ stateChanges: list()

deal_stages <- hs_deals_tidy(deals, view = "properties")
deal_stages
#> # A tibble: 1 x 25
#>   dealId hs_closed_amoun… dealname hs_all_accessib… amount closedate          
#>    <dbl>            <dbl> <chr>    <chr>             <dbl> <dttm>             
#> 1 9.32e8                0 Example… ""                  100 2019-08-02 23:58:38
#> # … with 19 more variables: num_associated_contacts <dbl>,
#> #   hs_all_team_ids <chr>, createdate <dttm>, hs_is_closed <chr>,
#> #   amount_in_home_currency <dbl>, hs_deal_stage_probability <dbl>,
#> #   days_to_close <dbl>, pipeline <chr>, hubspot_team_id <chr>,
#> #   hubspot_owner_id <dbl>, hs_closed_amount <dbl>, hs_lastmodifieddate <dttm>,
#> #   hubspot_owner_assigneddate <dttm>, dealstage <chr>, hs_createdate <dttm>,
#> #   hs_object_id <dbl>, hs_projected_amount <dbl>, hs_all_owner_ids <dbl>,
#> #   hs_projected_amount_in_home_currency <dbl>
```

## Installation

``` r
remotes::install_github("lockedata/hubspot")
```

## Authorization for Hubspot APIs

The Hubspot API accepts authorization via

  - an API key,

  - OAuth 2.0.

OAuth 2.0 is the [recommended
method](https://developers.hubspot.com/docs/methods/auth/oauth-overview?_ga=2.108539650.1064389456.1574673541-1134397846.1571640267).
However, this package supports both.

Note that if you do nothing the package will use the “demo” API token
but this won’t give you access to your own Hubspot data. So you’ll need
to spend a little time on setup:

  - For rapid prototyping key, use a Hubspot API key, see
    `hubspot_key_set()`.

  - For more secure use, without a daily limit on API calls, see
    `hubspot_token_create()` to create a Hubspot authorization token
    (OAuth 2.0).

If you have both saved an API key via `hubspot_key_set()` and a token
via `hubspot_token_create()`, priority will be given to using the OAuth
2.0 token. If you don’t want that, explicitely pass `NULL` as value for
the `token_path` argument of all functions.

Find more details on each method [in the vignette about
authorization](https://itsalocke.com/hubspot/articles/auth).

## Contributions welcome\!

Wanna report a bug or suggest a feature? Great stuff\! For more
information on how to contribute check out [our contributing
guide](.github/CONTRIBUTING.md).

Please note that this project is released with a [Contributor Code of
Conduct](CONDUCT.md). By participating in this project you agree to
abide by its terms.
