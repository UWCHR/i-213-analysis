#  i-213-analysis

Public analysis of non-sensitive scraped content from ICE/CBP I-213 forms obtained by UWCHR via FOIA lawsuit against DHS.

## Data scraping

PDF forms delivered by ICE/CBP are parsed, scraped, and cleaned in a separate repository developed by @HRDAG and maintained by UWCHR. Scraping and cleaning code available upon request.

## Non-public data

Dataset in this repo consists of scraped I-213 forms, withholding descriptive "narrative" fields which may contain sensitive information.

## `mentions_*` fields

The following fields are generated in separate scraping repository by simple regex string searches of I-213 narrative fields, as below:

```
mentions_airport: '[Aa]irport'
mentions_anonymous_tip: '[Aa]nonymous tip|concerned citizen'
mentions_border_patrol: '[Bb]order [Pp]atrol'
mentions_bus: '([Bb]us |[Bb]us\.|[Bb]us,)'
mentions_corrections: '[Cc]orrections'
mentions_courthouse: '([Cc]ourthouse|[Cc]ourt [Hh]ouse)'
mentions_database: '[Dd]atabase'
mentions_detainer: '[Dd]etainer|[I1]-247|[I1]-2[0Oo][0Oo]'
mentions_family_unit: '[Ff]amily [Uu]nit'
mentions_greyhound: '([Gg]reyhound|[Gg]rey [Hh]ound)'
mentions_hsi: 'HSI|[Hh]omeland [Ss]ecurity [Ii]nvestigation'
mentions_jail: '[Jj]ail'
mentions_juvenile: '[Jj]uvenile'
mentions_police: '[Pp]olice'
mentions_prison: '[Pp]rison'
mentions_probation_office: '[Pp]robation [Oo]ffice'
mentions_secure_comm: '[Ss]ecure [Cc]ommunities|Immigration Alien Response|(IAR)'
mentions_sheriff: '[Ss]heriff'
mentions_state_patrol: '[Ss]tate [Pp]atrol'
mentions_surveillance: 'surveillance'
mentions_task_force: '[Tt]ask [Ff]orce'
mentions_traffic: 'traffic'
poss_collateral: 'another known|collateral'
poss_passive: '[Rr]oster|jail check' 
poss_proactive: '[Rr]eferral from|[Ee]-?mail from|[Cc]all from|[Ll]ead from|[Cc]all for|[Cc]ontacted by'
```