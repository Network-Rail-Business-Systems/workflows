#!/bin/bash

# Get arguments
artisan=${1:-true}

# Get the list of test suites
suites=( $(php ./vendor/bin/phpunit --list-suites | grep -) )

# Run each testing suite in turn
for suite in ${suites[@]}
do
    if [ $suite = "-" ]
    then
        continue
    fi

    echo "Running PHPUnit for the $suite test suite..."

    if [ $artisan = true ]
    then
        php artisan test --parallel --testsuite $suite
    else
        php ./vendor/bin/phpunit --testsuite $suite
    fi
done
