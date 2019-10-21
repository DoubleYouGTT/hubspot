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
- `get_*()` returns a raw response from an API endpoint
- `entity_aspects()` returns a cleaned up table of the entity and some specific set of information from the raw response
- `utils-*.R` files are used for any toolkit functions
- [Tidyverse naming conventions](//style.tidyverse.org/functions.html#naming) are generally adhered to

#### Submission checklist
- When writing a view function, use a default `get_` that is as minimal as possible to enable a reasonable return
- Run `devtools::document()` to ensure all documentation is updated
- Write tests to verify your work. We're glad to help with that if you're new to testing!
- If you add functionality, do substantial refactoring, extend documentation, or improve the test base, add your info to the `DESCRIPTION` file
- Add a succinct description of the change to the `NEWS.md` file
- There is a lintr commit hooks that tidy up R function code, make sure any amendments are committed too
- When making a Pull Request, reference any issue you're code fixes with #IssueNo in the body of the PR

