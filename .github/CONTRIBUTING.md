# Contributing guide

### Code of Conduct
Anyone getting involved in this package agrees to our [Code of Conduct](CODE_OF_CONDUCT.md). If someone is breaking the [Will Wheaton rule aka *Don't be a dick*](https://dontbeadickday.com/), or breaking the Code of Conduct, please let Steph know at steph@itsalocke.com or [keybase.io/stephlocke](https://keybase.io/stephlocke).

### Bug reports
When you file a bug report, please spend some time making it easy for us to follow and reproduce. The more time you spend on making the bug report coherent, the more time we can dedicate to investigate the bug as opposed to the bug report. We recommend using [`reprex`](https://reprex.tidyverse.org/) when providing minimal examples.

If you need a secure way to communicate with the maintainer of this package, message her via [her Keybase account](https://keybase.io/stephlocke).

### Ideas
Got an idea for how we can improve the package? Awesome stuff!

Please [raise it in the issue tracker](issues) with some succinct information on expected behaviour of the enhancement and why you think it'll improve the package.

### Package development
We really want people to contribute to the package. A great way to start doing this is to look at the help wanted issues and/or contribute an example.

The package interacts with the Hubspot API so you might need to refer to [its docs](developers.hubspot.com/docs/overview).

#### Naming conventions
- `hs_<endpointname>_raw()` returns a raw response from an API endpoint
- `hs_<endpointname>_tidy()` returns a cleaned up table of the entity and some specific set of information from the raw response
- `utils-*.R` files are used for any toolkit functions
- [Tidyverse naming conventions](//style.tidyverse.org/functions.html#naming) are generally adhered to.

#### Submission checklist
- When writing a getter function, use a default `hs_<endpointname>_raw()` that is as minimal as possible to enable a reasonable return.
- Add a link to the endpoint documentation in the `@description` of the manual page. See deals.R
- To document parameters that are used in several functions, create a file under man-roxygen/<paramname>.R. If a parameter with the same name but slightly different meaning is used, use the `@details` section (see how the `view` parameter is documented). Do not use the same parameter name for vastly different things.
- Run `devtools::document()` to ensure all documentation is updated
- Write tests to verify your work. We're glad to help with that if you're new to testing! Our tests use vcr cassettes, see e.g. test-deals.R
- If you add functionality, do substantial refactoring, extend documentation, or improve the test base, add your info to the `DESCRIPTION` file
- Add a succinct description of the change to the `NEWS.md` file
- There is a `styler` pre-commit hook that tidies up R function code
- When making a Pull Request, reference any issue you're code fixes with #IssueNo in the body of the PR

### Auth details for development

#### Default app

A default app was created under the Locke Data dev account. It's called "hubspot-pkg-locke-data", ID 205749. 

Another app was created only for the purpose of testing bringing your own app. It's called "hubspot-byoa-test-pkg", ID 207639.

#### Testing

In tests/testthat/setup.R, the token path is set to "" and the API key to "demo"
which ensures tests are run with the demo key.

For testing access with OAuth, two tokens were created and saved in tests/testthat, see inst/create_test_tokens.R. They were gitignored and Rbuildignored, and encrypted using the workflow https://cran.r-project.org/web/packages/googlesheets/vignettes/managing-auth-tokens.html#encrypting-tokens-for-hosted-continuous-integration except that they were also Rbuildignored.

Cf https://docs.travis-ci.com/user/encrypting-files/#encrypting-multiple-files

```
tar cvf tests/testthat/secrets.tar tests/testthat/.hubspot_token.rds tests/testthat/.hubspot_otherapp.rds
travis encrypt-file tests/testthat/secrets.tar

```

```r
use_git_ignore(c("tests/testthat/secrets.tar", "tests/testthat/.hubspot_token.rds", "tests/testthat/.hubspot_otherapp.rds"))
use_build_ignore(c("tests/testthat/secrets.tar",
"tests/testthat/secrets.tar.enc",
"tests/testthat/.hubspot_token.rds", "tests/testthat/.hubspot_otherapp.rds"))
```


Therefore, R CMD check can't access them. The tests in tests/testthat/test-oauth.R using the OAuth tokens are skipped when they don't exist. On Travis CI, the tests are run on their own after R CMD check, so if they fail the build will fail. 

To run the tests in locally, if you're a regular contributor to the package or your contribution touches OAuth, create tokens by running inst/create_test_tokens.R interactively. 

#### Vignettes and example

At the moment of writing, no rendered code uses something else than the demo API key.
