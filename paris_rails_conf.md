# Paris rb conf

## Edge of rails
> Rafael França

- slides: not found yet

BackgroundQueue

- dual boot bundle
- deprecation toolkit

## Event sourcing
> Jenna Blumenthal

- slides: https://github.com/jennaleeb/event_sourcing_for_everyone/blob/master/paris_rb_slides.pdf

Event as first class citizen

- contains all info needed to change one's state
- immutable, append-only
- events are persisted

use CQRS

## Human Errors
> Olivier Lacan

- slides: https://speakerdeck.com/olivierlacan/human-errors
- conclusion: give errors feedback with a context

elm has good error backtrack
https://presentate.com/rtfeldman/talks/make-the-back-end-team-jealous

## RubyGems 3 & 4
> Hiroshi Shibata

###rubygems 3

removed to support for < ruby 2.2

- gem deprecate

all-ruby:  docker image on docker hub
gemsearch for searching methods used in gems

###rubygems 4

--user-install as default

gems willl be install in ~/.gems
rbenv is not support

## Messy human clean code
> Sylvain Abélard

- slides: not found yet
- conclusion: there is no good partern

- YAGNI
- KISS
- DRY
- Skinny controllers, fat models

collaborative
- tell you plan
- follow you plan
- trust, but verify
- choose what/how to delegate


be careful of what you like

## Crystal & ruby
> Luis Lavena

- slides: not found yet
- conclusion: ruby can learn some advantage from compiling language to speedup

- ruby type checker > sorbet.run

- gem bootsnap ~35% boottime reduce
by ruby passe loading time (> ruby 2.3)
ruby -e 'File.binwrite("example.rb")
ruby -e 'RubyVM::

- gem-compilier
update nokogiri gem is a download -> compile process

precompile any gem
reduce nokogiri 8.8MB download to ~700KB from 5min to 4sec

- rufo
ruby formatter

## 99 problems of slow tests
> Vladmir Dementyev

- slides: https://speakerdeck.com/palkan/paris-dot-rb-2018-99-problems-of-slow-tests
- conclusion: lots of things can speedup tests

TestProf slow
TPM test per millsecond

test_ruby_prof
test_rails_prof

factory cascade depth < 3

## Ruby 4.0: To Infinity and Beyond
> Bozhidar Batsov

conclusion: ruby 4 will be good, but we won't have it in live time,
but some other languages inspired by ruby has already things we want

## Aesthetics and the Evolution of Code
> Coraline Ehmke

- video: https://www.youtube.com/watch?v=qmBL4THJtuM
- conclusion: take some time to think and build beautiful code

* pluralism
* hybridism
* absolutism
* eclecticism
