[![Gem Version](https://badge.fury.io/rb/rubolph.svg)](http://badge.fury.io/rb/rubolph)
[![Build Status](https://travis-ci.org/dliggat/rubolph.svg?branch=master)](https://travis-ci.org/dliggat/rubolph)

# Rubolph

A secret santa assignment chooser. Each person is assigned as both a giver and a receiver, subject to the exclusion constraints.


## Participants

Configure the `participants.yml` file accordingly:

```yml
# participants.yml
participants:
  - dad
  - mum
  - bro
  - sis
  - browife

exclusions:
  mum:     dad
  dad:     mum
  bro:     browife
  browife: bro
```

## Generate

```bash
bundle exec rubolph:generate
```

Assignment files will appear as `./output/*.txt`. Send one to each participant.

## Clean

```bash
bundle exec rubolph:clean
```

This will remove all the generated files.


## Test

```bash
bundle exec rspec
```

This will execute the tests.
