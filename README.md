
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

## Example

``` r
library("hubspot")

deal_props <- get_deal_properties()
deal_props
#>  [1] "amount_in_home_currency"                 
#>  [2] "days_to_close"                           
#>  [3] "hs_analytics_source"                     
#>  [4] "hs_analytics_source_data_1"              
#>  [5] "hs_analytics_source_data_2"              
#>  [6] "hs_campaign"                             
#>  [7] "hs_closed_amount"                        
#>  [8] "hs_closed_amount_in_home_currency"       
#>  [9] "hs_deal_amount_calculation_preference"   
#> [10] "hs_deal_stage_probability"               
#> [11] "hs_is_closed"                            
#> [12] "hs_lastmodifieddate"                     
#> [13] "hs_object_id"                            
#> [14] "hs_projected_amount"                     
#> [15] "hs_projected_amount_in_home_currency"    
#> [16] "hubspot_owner_assigneddate"              
#> [17] "dealname"                                
#> [18] "amount"                                  
#> [19] "dealstage"                               
#> [20] "pipeline"                                
#> [21] "closedate"                               
#> [22] "createdate"                              
#> [23] "engagements_last_meeting_booked"         
#> [24] "engagements_last_meeting_booked_campaign"
#> [25] "engagements_last_meeting_booked_medium"  
#> [26] "engagements_last_meeting_booked_source"  
#> [27] "hs_sales_email_last_replied"             
#> [28] "hubspot_owner_id"                        
#> [29] "notes_last_contacted"                    
#> [30] "notes_last_updated"                      
#> [31] "notes_next_activity_date"                
#> [32] "num_contacted_notes"                     
#> [33] "num_notes"                               
#> [34] "hs_createdate"                           
#> [35] "hubspot_team_id"                         
#> [36] "dealtype"                                
#> [37] "hs_all_owner_ids"                        
#> [38] "description"                             
#> [39] "hs_all_team_ids"                         
#> [40] "hs_all_accessible_team_ids"              
#> [41] "num_associated_contacts"                 
#> [42] "closed_lost_reason"                      
#> [43] "closed_won_reason"

deals <- get_deals(properties = deal_props, max_iter = 1)
deals
#> named list()
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

### Token refreshing

If the token expires in less than 60 seconds, it’ll be refreshed and
cached thanks to the refresh token.

Find more details on each method [in the vignette about
authorization](https://itsalocke.com/hubspot/articles/auth).

## Contributions welcome\!

Wanna report a bug or suggest a feature? Great stuff\! For more
information on how to contribute check out [our contributing
guide](.github/CONTRIBUTING.md).

Please note that this project is released with a [Contributor Code of
Conduct](CONDUCT.md). By participating in this project you agree to
abide by its terms.
