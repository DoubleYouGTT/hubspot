
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
library(hubspot)

deal_props <- get_deal_properties("demo")
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
#> [17] "ip__ecomm_bridge__abandoned_cart_url"    
#> [18] "ip__ecomm_bridge__ecomm_synced"          
#> [19] "ip__ecomm_bridge__order_number"          
#> [20] "ip__ecomm_bridge__source_app_id"         
#> [21] "ip__ecomm_bridge__source_store_id"       
#> [22] "application_uuid3"                       
#> [23] "dealname"                                
#> [24] "ip__ecomm_bridge__discount_amount"       
#> [25] "salesforcelastsynctime"                  
#> [26] "amount"                                  
#> [27] "ip__ecomm_bridge__shipment_ids"          
#> [28] "dealstage"                               
#> [29] "onboardingfrontlink"                     
#> [30] "pipeline"                                
#> [31] "closedate"                               
#> [32] "ip__ecomm_bridge__tax_amount"            
#> [33] "onboardingadminlink"                     
#> [34] "createdate"                              
#> [35] "engagements_last_meeting_booked"         
#> [36] "engagements_last_meeting_booked_campaign"
#> [37] "engagements_last_meeting_booked_medium"  
#> [38] "engagements_last_meeting_booked_source"  
#> [39] "hs_sales_email_last_replied"             
#> [40] "hubspot_owner_id"                        
#> [41] "notes_last_contacted"                    
#> [42] "notes_last_updated"                      
#> [43] "notes_next_activity_date"                
#> [44] "num_contacted_notes"                     
#> [45] "num_notes"                               
#> [46] "hs_createdate"                           
#> [47] "hubspot_team_id"                         
#> [48] "dealtype"                                
#> [49] "hs_all_owner_ids"                        
#> [50] "description"                             
#> [51] "hs_all_team_ids"                         
#> [52] "hs_all_accessible_team_ids"              
#> [53] "num_associated_contacts"                 
#> [54] "closed_lost_reason"                      
#> [55] "closed_won_reason"                       
#> [56] "application_uuid2"

deals <- get_deals("demo", properties = deal_props, max_iter = 1)
deals
#> $`931633510`
#> $`931633510`$portalId
#> [1] 62515
#> 
#> $`931633510`$dealId
#> [1] 931633510
#> 
#> $`931633510`$isDeleted
#> [1] FALSE
#> 
#> $`931633510`$associations
#> $`931633510`$associations$associatedVids
#> list()
#> 
#> $`931633510`$associations$associatedCompanyIds
#> list()
#> 
#> $`931633510`$associations$associatedDealIds
#> list()
#> 
#> $`931633510`$associations$associatedTicketIds
#> list()
#> 
#> 
#> $`931633510`$properties
#> $`931633510`$properties$hs_closed_amount_in_home_currency
#> $`931633510`$properties$hs_closed_amount_in_home_currency$value
#> [1] "0"
#> 
#> $`931633510`$properties$hs_closed_amount_in_home_currency$timestamp
#> [1] 1.571769e+12
#> 
#> $`931633510`$properties$hs_closed_amount_in_home_currency$source
#> [1] "CALCULATED"
#> 
#> $`931633510`$properties$hs_closed_amount_in_home_currency$sourceId
#> NULL
#> 
#> $`931633510`$properties$hs_closed_amount_in_home_currency$versions
#> $`931633510`$properties$hs_closed_amount_in_home_currency$versions[[1]]
#> $`931633510`$properties$hs_closed_amount_in_home_currency$versions[[1]]$name
#> [1] "hs_closed_amount_in_home_currency"
#> 
#> $`931633510`$properties$hs_closed_amount_in_home_currency$versions[[1]]$value
#> [1] "0"
#> 
#> $`931633510`$properties$hs_closed_amount_in_home_currency$versions[[1]]$timestamp
#> [1] 1.571769e+12
#> 
#> $`931633510`$properties$hs_closed_amount_in_home_currency$versions[[1]]$source
#> [1] "CALCULATED"
#> 
#> $`931633510`$properties$hs_closed_amount_in_home_currency$versions[[1]]$sourceVid
#> list()
#> 
#> $`931633510`$properties$hs_closed_amount_in_home_currency$versions[[1]]$sourceMetadata
#> [1] ""
#> 
#> 
#> 
#> 
#> $`931633510`$properties$dealname
#> $`931633510`$properties$dealname$value
#> [1] "Example deal"
#> 
#> $`931633510`$properties$dealname$timestamp
#> [1] 1.565734e+12
#> 
#> $`931633510`$properties$dealname$source
#> [1] "CRM_UI"
#> 
#> $`931633510`$properties$dealname$sourceId
#> [1] "dadams@hubspot.com"
#> 
#> $`931633510`$properties$dealname$versions
#> $`931633510`$properties$dealname$versions[[1]]
#> $`931633510`$properties$dealname$versions[[1]]$name
#> [1] "dealname"
#> 
#> $`931633510`$properties$dealname$versions[[1]]$value
#> [1] "Example deal"
#> 
#> $`931633510`$properties$dealname$versions[[1]]$timestamp
#> [1] 1.565734e+12
#> 
#> $`931633510`$properties$dealname$versions[[1]]$sourceId
#> [1] "dadams@hubspot.com"
#> 
#> $`931633510`$properties$dealname$versions[[1]]$source
#> [1] "CRM_UI"
#> 
#> $`931633510`$properties$dealname$versions[[1]]$sourceVid
#> list()
#> 
#> 
#> 
#> 
#> $`931633510`$properties$hs_all_accessible_team_ids
#> $`931633510`$properties$hs_all_accessible_team_ids$value
#> [1] ""
#> 
#> $`931633510`$properties$hs_all_accessible_team_ids$timestamp
#> [1] 1.565735e+12
#> 
#> $`931633510`$properties$hs_all_accessible_team_ids$source
#> [1] "CRM_UI"
#> 
#> $`931633510`$properties$hs_all_accessible_team_ids$sourceId
#> [1] "PermissionsUpdater"
#> 
#> $`931633510`$properties$hs_all_accessible_team_ids$versions
#> $`931633510`$properties$hs_all_accessible_team_ids$versions[[1]]
#> $`931633510`$properties$hs_all_accessible_team_ids$versions[[1]]$name
#> [1] "hs_all_accessible_team_ids"
#> 
#> $`931633510`$properties$hs_all_accessible_team_ids$versions[[1]]$value
#> [1] ""
#> 
#> $`931633510`$properties$hs_all_accessible_team_ids$versions[[1]]$timestamp
#> [1] 1.565735e+12
#> 
#> $`931633510`$properties$hs_all_accessible_team_ids$versions[[1]]$sourceId
#> [1] "PermissionsUpdater"
#> 
#> $`931633510`$properties$hs_all_accessible_team_ids$versions[[1]]$source
#> [1] "CRM_UI"
#> 
#> $`931633510`$properties$hs_all_accessible_team_ids$versions[[1]]$sourceVid
#> list()
#> 
#> 
#> 
#> 
#> $`931633510`$properties$amount
#> $`931633510`$properties$amount$value
#> [1] "100"
#> 
#> $`931633510`$properties$amount$timestamp
#> [1] 1.565734e+12
#> 
#> $`931633510`$properties$amount$source
#> [1] "CRM_UI"
#> 
#> $`931633510`$properties$amount$sourceId
#> [1] "dadams@hubspot.com"
#> 
#> $`931633510`$properties$amount$versions
#> $`931633510`$properties$amount$versions[[1]]
#> $`931633510`$properties$amount$versions[[1]]$name
#> [1] "amount"
#> 
#> $`931633510`$properties$amount$versions[[1]]$value
#> [1] "100"
#> 
#> $`931633510`$properties$amount$versions[[1]]$timestamp
#> [1] 1.565734e+12
#> 
#> $`931633510`$properties$amount$versions[[1]]$sourceId
#> [1] "dadams@hubspot.com"
#> 
#> $`931633510`$properties$amount$versions[[1]]$source
#> [1] "CRM_UI"
#> 
#> $`931633510`$properties$amount$versions[[1]]$sourceVid
#> list()
#> 
#> 
#> 
#> 
#> $`931633510`$properties$closedate
#> $`931633510`$properties$closedate$value
#> [1] "1564783118291"
#> 
#> $`931633510`$properties$closedate$timestamp
#> [1] 1.565734e+12
#> 
#> $`931633510`$properties$closedate$source
#> [1] "CRM_UI"
#> 
#> $`931633510`$properties$closedate$sourceId
#> [1] "dadams@hubspot.com"
#> 
#> $`931633510`$properties$closedate$versions
#> $`931633510`$properties$closedate$versions[[1]]
#> $`931633510`$properties$closedate$versions[[1]]$name
#> [1] "closedate"
#> 
#> $`931633510`$properties$closedate$versions[[1]]$value
#> [1] "1564783118291"
#> 
#> $`931633510`$properties$closedate$versions[[1]]$timestamp
#> [1] 1.565734e+12
#> 
#> $`931633510`$properties$closedate$versions[[1]]$sourceId
#> [1] "dadams@hubspot.com"
#> 
#> $`931633510`$properties$closedate$versions[[1]]$source
#> [1] "CRM_UI"
#> 
#> $`931633510`$properties$closedate$versions[[1]]$sourceVid
#> list()
#> 
#> 
#> 
#> 
#> $`931633510`$properties$num_associated_contacts
#> $`931633510`$properties$num_associated_contacts$value
#> [1] "0"
#> 
#> $`931633510`$properties$num_associated_contacts$timestamp
#> [1] 1.566463e+12
#> 
#> $`931633510`$properties$num_associated_contacts$source
#> [1] "CALCULATED"
#> 
#> $`931633510`$properties$num_associated_contacts$sourceId
#> NULL
#> 
#> $`931633510`$properties$num_associated_contacts$versions
#> $`931633510`$properties$num_associated_contacts$versions[[1]]
#> $`931633510`$properties$num_associated_contacts$versions[[1]]$name
#> [1] "num_associated_contacts"
#> 
#> $`931633510`$properties$num_associated_contacts$versions[[1]]$value
#> [1] "0"
#> 
#> $`931633510`$properties$num_associated_contacts$versions[[1]]$timestamp
#> [1] 1.566463e+12
#> 
#> $`931633510`$properties$num_associated_contacts$versions[[1]]$source
#> [1] "CALCULATED"
#> 
#> $`931633510`$properties$num_associated_contacts$versions[[1]]$sourceVid
#> list()
#> 
#> 
#> 
#> 
#> $`931633510`$properties$hs_all_team_ids
#> $`931633510`$properties$hs_all_team_ids$value
#> [1] ""
#> 
#> $`931633510`$properties$hs_all_team_ids$timestamp
#> [1] 1.565735e+12
#> 
#> $`931633510`$properties$hs_all_team_ids$source
#> [1] "CRM_UI"
#> 
#> $`931633510`$properties$hs_all_team_ids$sourceId
#> [1] "PermissionsUpdater"
#> 
#> $`931633510`$properties$hs_all_team_ids$versions
#> $`931633510`$properties$hs_all_team_ids$versions[[1]]
#> $`931633510`$properties$hs_all_team_ids$versions[[1]]$name
#> [1] "hs_all_team_ids"
#> 
#> $`931633510`$properties$hs_all_team_ids$versions[[1]]$value
#> [1] ""
#> 
#> $`931633510`$properties$hs_all_team_ids$versions[[1]]$timestamp
#> [1] 1.565735e+12
#> 
#> $`931633510`$properties$hs_all_team_ids$versions[[1]]$sourceId
#> [1] "PermissionsUpdater"
#> 
#> $`931633510`$properties$hs_all_team_ids$versions[[1]]$source
#> [1] "CRM_UI"
#> 
#> $`931633510`$properties$hs_all_team_ids$versions[[1]]$sourceVid
#> list()
#> 
#> 
#> 
#> 
#> $`931633510`$properties$createdate
#> $`931633510`$properties$createdate$value
#> [1] "1565733501511"
#> 
#> $`931633510`$properties$createdate$timestamp
#> [1] 1.565734e+12
#> 
#> $`931633510`$properties$createdate$source
#> [1] "CRM_UI"
#> 
#> $`931633510`$properties$createdate$sourceId
#> [1] "dadams@hubspot.com"
#> 
#> $`931633510`$properties$createdate$versions
#> $`931633510`$properties$createdate$versions[[1]]
#> $`931633510`$properties$createdate$versions[[1]]$name
#> [1] "createdate"
#> 
#> $`931633510`$properties$createdate$versions[[1]]$value
#> [1] "1565733501511"
#> 
#> $`931633510`$properties$createdate$versions[[1]]$timestamp
#> [1] 1.565734e+12
#> 
#> $`931633510`$properties$createdate$versions[[1]]$sourceId
#> [1] "dadams@hubspot.com"
#> 
#> $`931633510`$properties$createdate$versions[[1]]$source
#> [1] "CRM_UI"
#> 
#> $`931633510`$properties$createdate$versions[[1]]$sourceVid
#> list()
#> 
#> 
#> 
#> 
#> $`931633510`$properties$hs_is_closed
#> $`931633510`$properties$hs_is_closed$value
#> [1] "false"
#> 
#> $`931633510`$properties$hs_is_closed$timestamp
#> [1] 1.571769e+12
#> 
#> $`931633510`$properties$hs_is_closed$source
#> [1] "CALCULATED"
#> 
#> $`931633510`$properties$hs_is_closed$sourceId
#> NULL
#> 
#> $`931633510`$properties$hs_is_closed$versions
#> $`931633510`$properties$hs_is_closed$versions[[1]]
#> $`931633510`$properties$hs_is_closed$versions[[1]]$name
#> [1] "hs_is_closed"
#> 
#> $`931633510`$properties$hs_is_closed$versions[[1]]$value
#> [1] "false"
#> 
#> $`931633510`$properties$hs_is_closed$versions[[1]]$timestamp
#> [1] 1.571769e+12
#> 
#> $`931633510`$properties$hs_is_closed$versions[[1]]$source
#> [1] "CALCULATED"
#> 
#> $`931633510`$properties$hs_is_closed$versions[[1]]$sourceVid
#> list()
#> 
#> $`931633510`$properties$hs_is_closed$versions[[1]]$sourceMetadata
#> [1] ""
#> 
#> 
#> 
#> 
#> $`931633510`$properties$amount_in_home_currency
#> $`931633510`$properties$amount_in_home_currency$value
#> [1] "100"
#> 
#> $`931633510`$properties$amount_in_home_currency$timestamp
#> [1] 1.565734e+12
#> 
#> $`931633510`$properties$amount_in_home_currency$source
#> [1] "CALCULATED"
#> 
#> $`931633510`$properties$amount_in_home_currency$sourceId
#> NULL
#> 
#> $`931633510`$properties$amount_in_home_currency$versions
#> $`931633510`$properties$amount_in_home_currency$versions[[1]]
#> $`931633510`$properties$amount_in_home_currency$versions[[1]]$name
#> [1] "amount_in_home_currency"
#> 
#> $`931633510`$properties$amount_in_home_currency$versions[[1]]$value
#> [1] "100"
#> 
#> $`931633510`$properties$amount_in_home_currency$versions[[1]]$timestamp
#> [1] 1.565734e+12
#> 
#> $`931633510`$properties$amount_in_home_currency$versions[[1]]$source
#> [1] "CALCULATED"
#> 
#> $`931633510`$properties$amount_in_home_currency$versions[[1]]$sourceVid
#> list()
#> 
#> $`931633510`$properties$amount_in_home_currency$versions[[1]]$sourceMetadata
#> [1] ""
#> 
#> 
#> 
#> 
#> $`931633510`$properties$hs_deal_stage_probability
#> $`931633510`$properties$hs_deal_stage_probability$value
#> [1] "0.59999999999999997779553950749686919152736663818359375"
#> 
#> $`931633510`$properties$hs_deal_stage_probability$timestamp
#> [1] 1.571769e+12
#> 
#> $`931633510`$properties$hs_deal_stage_probability$source
#> [1] "CALCULATED"
#> 
#> $`931633510`$properties$hs_deal_stage_probability$sourceId
#> NULL
#> 
#> $`931633510`$properties$hs_deal_stage_probability$versions
#> $`931633510`$properties$hs_deal_stage_probability$versions[[1]]
#> $`931633510`$properties$hs_deal_stage_probability$versions[[1]]$name
#> [1] "hs_deal_stage_probability"
#> 
#> $`931633510`$properties$hs_deal_stage_probability$versions[[1]]$value
#> [1] "0.59999999999999997779553950749686919152736663818359375"
#> 
#> $`931633510`$properties$hs_deal_stage_probability$versions[[1]]$timestamp
#> [1] 1.571769e+12
#> 
#> $`931633510`$properties$hs_deal_stage_probability$versions[[1]]$source
#> [1] "CALCULATED"
#> 
#> $`931633510`$properties$hs_deal_stage_probability$versions[[1]]$sourceVid
#> list()
#> 
#> $`931633510`$properties$hs_deal_stage_probability$versions[[1]]$sourceMetadata
#> [1] ""
#> 
#> 
#> 
#> 
#> $`931633510`$properties$days_to_close
#> $`931633510`$properties$days_to_close$value
#> [1] "0"
#> 
#> $`931633510`$properties$days_to_close$timestamp
#> [1] 1.565734e+12
#> 
#> $`931633510`$properties$days_to_close$source
#> [1] "CALCULATED"
#> 
#> $`931633510`$properties$days_to_close$sourceId
#> NULL
#> 
#> $`931633510`$properties$days_to_close$versions
#> $`931633510`$properties$days_to_close$versions[[1]]
#> $`931633510`$properties$days_to_close$versions[[1]]$name
#> [1] "days_to_close"
#> 
#> $`931633510`$properties$days_to_close$versions[[1]]$value
#> [1] "0"
#> 
#> $`931633510`$properties$days_to_close$versions[[1]]$timestamp
#> [1] 1.565734e+12
#> 
#> $`931633510`$properties$days_to_close$versions[[1]]$source
#> [1] "CALCULATED"
#> 
#> $`931633510`$properties$days_to_close$versions[[1]]$sourceVid
#> list()
#> 
#> $`931633510`$properties$days_to_close$versions[[1]]$sourceMetadata
#> [1] ""
#> 
#> 
#> 
#> 
#> $`931633510`$properties$pipeline
#> $`931633510`$properties$pipeline$value
#> [1] "default"
#> 
#> $`931633510`$properties$pipeline$timestamp
#> [1] 1.565734e+12
#> 
#> $`931633510`$properties$pipeline$source
#> [1] "CRM_UI"
#> 
#> $`931633510`$properties$pipeline$sourceId
#> [1] "dadams@hubspot.com"
#> 
#> $`931633510`$properties$pipeline$versions
#> $`931633510`$properties$pipeline$versions[[1]]
#> $`931633510`$properties$pipeline$versions[[1]]$name
#> [1] "pipeline"
#> 
#> $`931633510`$properties$pipeline$versions[[1]]$value
#> [1] "default"
#> 
#> $`931633510`$properties$pipeline$versions[[1]]$timestamp
#> [1] 1.565734e+12
#> 
#> $`931633510`$properties$pipeline$versions[[1]]$sourceId
#> [1] "dadams@hubspot.com"
#> 
#> $`931633510`$properties$pipeline$versions[[1]]$source
#> [1] "CRM_UI"
#> 
#> $`931633510`$properties$pipeline$versions[[1]]$sourceVid
#> list()
#> 
#> 
#> 
#> 
#> $`931633510`$properties$hubspot_team_id
#> $`931633510`$properties$hubspot_team_id$value
#> [1] ""
#> 
#> $`931633510`$properties$hubspot_team_id$timestamp
#> [1] 1.565735e+12
#> 
#> $`931633510`$properties$hubspot_team_id$source
#> [1] "CRM_UI"
#> 
#> $`931633510`$properties$hubspot_team_id$sourceId
#> [1] "PermissionsUpdater"
#> 
#> $`931633510`$properties$hubspot_team_id$versions
#> $`931633510`$properties$hubspot_team_id$versions[[1]]
#> $`931633510`$properties$hubspot_team_id$versions[[1]]$name
#> [1] "hubspot_team_id"
#> 
#> $`931633510`$properties$hubspot_team_id$versions[[1]]$value
#> [1] ""
#> 
#> $`931633510`$properties$hubspot_team_id$versions[[1]]$timestamp
#> [1] 1.565735e+12
#> 
#> $`931633510`$properties$hubspot_team_id$versions[[1]]$sourceId
#> [1] "PermissionsUpdater"
#> 
#> $`931633510`$properties$hubspot_team_id$versions[[1]]$source
#> [1] "CRM_UI"
#> 
#> $`931633510`$properties$hubspot_team_id$versions[[1]]$sourceVid
#> list()
#> 
#> 
#> 
#> 
#> $`931633510`$properties$hubspot_owner_id
#> $`931633510`$properties$hubspot_owner_id$value
#> [1] "71"
#> 
#> $`931633510`$properties$hubspot_owner_id$timestamp
#> [1] 1.565734e+12
#> 
#> $`931633510`$properties$hubspot_owner_id$source
#> [1] "CRM_UI"
#> 
#> $`931633510`$properties$hubspot_owner_id$sourceId
#> [1] "dadams@hubspot.com"
#> 
#> $`931633510`$properties$hubspot_owner_id$versions
#> $`931633510`$properties$hubspot_owner_id$versions[[1]]
#> $`931633510`$properties$hubspot_owner_id$versions[[1]]$name
#> [1] "hubspot_owner_id"
#> 
#> $`931633510`$properties$hubspot_owner_id$versions[[1]]$value
#> [1] "71"
#> 
#> $`931633510`$properties$hubspot_owner_id$versions[[1]]$timestamp
#> [1] 1.565734e+12
#> 
#> $`931633510`$properties$hubspot_owner_id$versions[[1]]$sourceId
#> [1] "dadams@hubspot.com"
#> 
#> $`931633510`$properties$hubspot_owner_id$versions[[1]]$source
#> [1] "CRM_UI"
#> 
#> $`931633510`$properties$hubspot_owner_id$versions[[1]]$sourceVid
#> list()
#> 
#> 
#> 
#> 
#> $`931633510`$properties$hs_closed_amount
#> $`931633510`$properties$hs_closed_amount$value
#> [1] "0"
#> 
#> $`931633510`$properties$hs_closed_amount$timestamp
#> [1] 1.571769e+12
#> 
#> $`931633510`$properties$hs_closed_amount$source
#> [1] "CALCULATED"
#> 
#> $`931633510`$properties$hs_closed_amount$sourceId
#> NULL
#> 
#> $`931633510`$properties$hs_closed_amount$versions
#> $`931633510`$properties$hs_closed_amount$versions[[1]]
#> $`931633510`$properties$hs_closed_amount$versions[[1]]$name
#> [1] "hs_closed_amount"
#> 
#> $`931633510`$properties$hs_closed_amount$versions[[1]]$value
#> [1] "0"
#> 
#> $`931633510`$properties$hs_closed_amount$versions[[1]]$timestamp
#> [1] 1.571769e+12
#> 
#> $`931633510`$properties$hs_closed_amount$versions[[1]]$source
#> [1] "CALCULATED"
#> 
#> $`931633510`$properties$hs_closed_amount$versions[[1]]$sourceVid
#> list()
#> 
#> $`931633510`$properties$hs_closed_amount$versions[[1]]$sourceMetadata
#> [1] ""
#> 
#> 
#> 
#> 
#> $`931633510`$properties$hs_lastmodifieddate
#> $`931633510`$properties$hs_lastmodifieddate$value
#> [1] "1565735453314"
#> 
#> $`931633510`$properties$hs_lastmodifieddate$timestamp
#> [1] 1.565735e+12
#> 
#> $`931633510`$properties$hs_lastmodifieddate$source
#> [1] "CALCULATED"
#> 
#> $`931633510`$properties$hs_lastmodifieddate$sourceId
#> NULL
#> 
#> $`931633510`$properties$hs_lastmodifieddate$versions
#> $`931633510`$properties$hs_lastmodifieddate$versions[[1]]
#> $`931633510`$properties$hs_lastmodifieddate$versions[[1]]$name
#> [1] "hs_lastmodifieddate"
#> 
#> $`931633510`$properties$hs_lastmodifieddate$versions[[1]]$value
#> [1] "1565735453314"
#> 
#> $`931633510`$properties$hs_lastmodifieddate$versions[[1]]$timestamp
#> [1] 1.565735e+12
#> 
#> $`931633510`$properties$hs_lastmodifieddate$versions[[1]]$source
#> [1] "CALCULATED"
#> 
#> $`931633510`$properties$hs_lastmodifieddate$versions[[1]]$sourceVid
#> list()
#> 
#> 
#> 
#> 
#> $`931633510`$properties$hubspot_owner_assigneddate
#> $`931633510`$properties$hubspot_owner_assigneddate$value
#> [1] "1565733537449"
#> 
#> $`931633510`$properties$hubspot_owner_assigneddate$timestamp
#> [1] 1.565734e+12
#> 
#> $`931633510`$properties$hubspot_owner_assigneddate$source
#> [1] "CRM_UI"
#> 
#> $`931633510`$properties$hubspot_owner_assigneddate$sourceId
#> [1] "dadams@hubspot.com"
#> 
#> $`931633510`$properties$hubspot_owner_assigneddate$versions
#> $`931633510`$properties$hubspot_owner_assigneddate$versions[[1]]
#> $`931633510`$properties$hubspot_owner_assigneddate$versions[[1]]$name
#> [1] "hubspot_owner_assigneddate"
#> 
#> $`931633510`$properties$hubspot_owner_assigneddate$versions[[1]]$value
#> [1] "1565733537449"
#> 
#> $`931633510`$properties$hubspot_owner_assigneddate$versions[[1]]$timestamp
#> [1] 1.565734e+12
#> 
#> $`931633510`$properties$hubspot_owner_assigneddate$versions[[1]]$sourceId
#> [1] "dadams@hubspot.com"
#> 
#> $`931633510`$properties$hubspot_owner_assigneddate$versions[[1]]$source
#> [1] "CRM_UI"
#> 
#> $`931633510`$properties$hubspot_owner_assigneddate$versions[[1]]$sourceVid
#> list()
#> 
#> 
#> 
#> 
#> $`931633510`$properties$dealstage
#> $`931633510`$properties$dealstage$value
#> [1] "presentationscheduled"
#> 
#> $`931633510`$properties$dealstage$timestamp
#> [1] 1.565734e+12
#> 
#> $`931633510`$properties$dealstage$source
#> [1] "CRM_UI"
#> 
#> $`931633510`$properties$dealstage$sourceId
#> [1] "dadams@hubspot.com"
#> 
#> $`931633510`$properties$dealstage$versions
#> $`931633510`$properties$dealstage$versions[[1]]
#> $`931633510`$properties$dealstage$versions[[1]]$name
#> [1] "dealstage"
#> 
#> $`931633510`$properties$dealstage$versions[[1]]$value
#> [1] "presentationscheduled"
#> 
#> $`931633510`$properties$dealstage$versions[[1]]$timestamp
#> [1] 1.565734e+12
#> 
#> $`931633510`$properties$dealstage$versions[[1]]$sourceId
#> [1] "dadams@hubspot.com"
#> 
#> $`931633510`$properties$dealstage$versions[[1]]$source
#> [1] "CRM_UI"
#> 
#> $`931633510`$properties$dealstage$versions[[1]]$sourceVid
#> list()
#> 
#> 
#> 
#> 
#> $`931633510`$properties$hs_createdate
#> $`931633510`$properties$hs_createdate$value
#> [1] "1565733537449"
#> 
#> $`931633510`$properties$hs_createdate$timestamp
#> [1] 1.565734e+12
#> 
#> $`931633510`$properties$hs_createdate$source
#> [1] "CONTACTS"
#> 
#> $`931633510`$properties$hs_createdate$sourceId
#> [1] "CRM_UI"
#> 
#> $`931633510`$properties$hs_createdate$versions
#> $`931633510`$properties$hs_createdate$versions[[1]]
#> $`931633510`$properties$hs_createdate$versions[[1]]$name
#> [1] "hs_createdate"
#> 
#> $`931633510`$properties$hs_createdate$versions[[1]]$value
#> [1] "1565733537449"
#> 
#> $`931633510`$properties$hs_createdate$versions[[1]]$timestamp
#> [1] 1.565734e+12
#> 
#> $`931633510`$properties$hs_createdate$versions[[1]]$sourceId
#> [1] "CRM_UI"
#> 
#> $`931633510`$properties$hs_createdate$versions[[1]]$source
#> [1] "CONTACTS"
#> 
#> $`931633510`$properties$hs_createdate$versions[[1]]$sourceVid
#> list()
#> 
#> 
#> 
#> 
#> $`931633510`$properties$hs_object_id
#> $`931633510`$properties$hs_object_id$value
#> [1] "931633510"
#> 
#> $`931633510`$properties$hs_object_id$timestamp
#> [1] 1.565734e+12
#> 
#> $`931633510`$properties$hs_object_id$source
#> [1] "CALCULATED"
#> 
#> $`931633510`$properties$hs_object_id$sourceId
#> NULL
#> 
#> $`931633510`$properties$hs_object_id$versions
#> $`931633510`$properties$hs_object_id$versions[[1]]
#> $`931633510`$properties$hs_object_id$versions[[1]]$name
#> [1] "hs_object_id"
#> 
#> $`931633510`$properties$hs_object_id$versions[[1]]$value
#> [1] "931633510"
#> 
#> $`931633510`$properties$hs_object_id$versions[[1]]$timestamp
#> [1] 1.565734e+12
#> 
#> $`931633510`$properties$hs_object_id$versions[[1]]$source
#> [1] "CALCULATED"
#> 
#> $`931633510`$properties$hs_object_id$versions[[1]]$sourceVid
#> list()
#> 
#> 
#> 
#> 
#> $`931633510`$properties$hs_projected_amount
#> $`931633510`$properties$hs_projected_amount$value
#> [1] "59.99999999999999777955395074968691915273666381835937500"
#> 
#> $`931633510`$properties$hs_projected_amount$timestamp
#> [1] 1.571769e+12
#> 
#> $`931633510`$properties$hs_projected_amount$source
#> [1] "CALCULATED"
#> 
#> $`931633510`$properties$hs_projected_amount$sourceId
#> NULL
#> 
#> $`931633510`$properties$hs_projected_amount$versions
#> $`931633510`$properties$hs_projected_amount$versions[[1]]
#> $`931633510`$properties$hs_projected_amount$versions[[1]]$name
#> [1] "hs_projected_amount"
#> 
#> $`931633510`$properties$hs_projected_amount$versions[[1]]$value
#> [1] "59.99999999999999777955395074968691915273666381835937500"
#> 
#> $`931633510`$properties$hs_projected_amount$versions[[1]]$timestamp
#> [1] 1.571769e+12
#> 
#> $`931633510`$properties$hs_projected_amount$versions[[1]]$source
#> [1] "CALCULATED"
#> 
#> $`931633510`$properties$hs_projected_amount$versions[[1]]$sourceVid
#> list()
#> 
#> $`931633510`$properties$hs_projected_amount$versions[[1]]$sourceMetadata
#> [1] ""
#> 
#> 
#> 
#> 
#> $`931633510`$properties$hs_all_owner_ids
#> $`931633510`$properties$hs_all_owner_ids$value
#> [1] "71"
#> 
#> $`931633510`$properties$hs_all_owner_ids$timestamp
#> [1] 1.565734e+12
#> 
#> $`931633510`$properties$hs_all_owner_ids$source
#> [1] "CRM_UI"
#> 
#> $`931633510`$properties$hs_all_owner_ids$sourceId
#> [1] "PermissionsUpdater"
#> 
#> $`931633510`$properties$hs_all_owner_ids$versions
#> $`931633510`$properties$hs_all_owner_ids$versions[[1]]
#> $`931633510`$properties$hs_all_owner_ids$versions[[1]]$name
#> [1] "hs_all_owner_ids"
#> 
#> $`931633510`$properties$hs_all_owner_ids$versions[[1]]$value
#> [1] "71"
#> 
#> $`931633510`$properties$hs_all_owner_ids$versions[[1]]$timestamp
#> [1] 1.565734e+12
#> 
#> $`931633510`$properties$hs_all_owner_ids$versions[[1]]$sourceId
#> [1] "PermissionsUpdater"
#> 
#> $`931633510`$properties$hs_all_owner_ids$versions[[1]]$source
#> [1] "CRM_UI"
#> 
#> $`931633510`$properties$hs_all_owner_ids$versions[[1]]$sourceVid
#> list()
#> 
#> 
#> 
#> 
#> $`931633510`$properties$hs_projected_amount_in_home_currency
#> $`931633510`$properties$hs_projected_amount_in_home_currency$value
#> [1] "59.99999999999999777955395074968691915273666381835937500"
#> 
#> $`931633510`$properties$hs_projected_amount_in_home_currency$timestamp
#> [1] 1.571769e+12
#> 
#> $`931633510`$properties$hs_projected_amount_in_home_currency$source
#> [1] "CALCULATED"
#> 
#> $`931633510`$properties$hs_projected_amount_in_home_currency$sourceId
#> NULL
#> 
#> $`931633510`$properties$hs_projected_amount_in_home_currency$versions
#> $`931633510`$properties$hs_projected_amount_in_home_currency$versions[[1]]
#> $`931633510`$properties$hs_projected_amount_in_home_currency$versions[[1]]$name
#> [1] "hs_projected_amount_in_home_currency"
#> 
#> $`931633510`$properties$hs_projected_amount_in_home_currency$versions[[1]]$value
#> [1] "59.99999999999999777955395074968691915273666381835937500"
#> 
#> $`931633510`$properties$hs_projected_amount_in_home_currency$versions[[1]]$timestamp
#> [1] 1.571769e+12
#> 
#> $`931633510`$properties$hs_projected_amount_in_home_currency$versions[[1]]$source
#> [1] "CALCULATED"
#> 
#> $`931633510`$properties$hs_projected_amount_in_home_currency$versions[[1]]$sourceVid
#> list()
#> 
#> $`931633510`$properties$hs_projected_amount_in_home_currency$versions[[1]]$sourceMetadata
#> [1] ""
#> 
#> 
#> 
#> 
#> 
#> $`931633510`$imports
#> list()
#> 
#> $`931633510`$stateChanges
#> list()
```

## Installation

``` r
remotes::install_github("lockedata/hubspot")
```

## Authentication

### API key

The API key should be set using the `hubspot_key_set()` function, that
relies on the `keyring` package that stores the key in the system
default credential store (see `keyring` docs).

``` r
# Either input the key as parameter
hubspot_key_set("yourapikey")

# Or just call the function,
# the key will be asked interactively
hubspot_key_set()
```

If no API key is set, the “demo” key is used and a message is printed to
the screen.

## Contributions welcome\!

Wanna report a bug or suggest a feature? Great stuff\! For more
information on how to contribute check out [our contributing
guide](.github/CONTRIBUTING.md).

Please note that this project is released with a [Contributor Code of
Conduct](CONDUCT.md). By participating in this project you agree to
abide by its terms.
