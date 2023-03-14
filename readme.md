# GitHub Actions

This repository contains callable workflows for use by other repositories.

These callable workflows avoid duplication by providing reusable common tasks, such as running tests and creating builds.

Changing the callable workflows in this repository will immediately make those changes available everywhere else.

For more information, refer to the [GitHub Reusing Workflows](https://docs.github.com/en/actions/using-workflows/reusing-workflows) documentation.

## Workflows available

| Name       | Description                 | Parameters                       |
|------------|-----------------------------|----------------------------------|
| build-dev  | Create a development build  | composer, npm, php               |
| build-prod | Create a production build   | composer, npm, php               |
| unit-tests | Run PHPUnit tests           | artisan, composer, env, npm, php |

## Adding and amending workflows to this repository

Callable workflows are created in the same manner as other workflows, except with an `on` section defined before the `jobs` section.

```yaml
name: My callable workflow
  
on:
  workflow_call:
    inputs:
      php:
        required: true
        type: number
        
jobs:
  # Jobs as normal
```

Details of each callable workflow must be added to the reference table above.

Further guidance can be found in the documentation above.

## Referencing these workflows from other repositories

To use a callable workflow add the `uses` command to the relevant workflow in the repository.

```yaml
name: 'Run tests whenever a pull request is opened'

on: [pull_request]

jobs:
  test:
    uses: network-rail-business-systems/actions/unit-tests.yml@main
    with:
      php: '8.0'
```

The name of the workflow file and the version determine which callable workflow will be run.

In the example above, the `test.yml` workflow is being called from the `main` branch, and the PHP version is set in the `with` block.
