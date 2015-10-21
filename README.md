# markov chains

This repo is just me messing around with markov chains in Ruby. This code is horrible, though I TDD'd it as sort of a secondary exercise. I probably wont come back and make it nicer, either. Bleh.

## Usage
1. `require './markov'`
2. `markov = Markov.new`
3. `markov.ingest(<all of your sample text>)` (this can be called more than once)
4. `generated_string = markov.generate(<number of words you want in the string>)`

## how it works
It works on a really simple model of building a hash containing keys that correspond to individual words in the given training text, then associating that to arrays of successor words, then "randomly" building a new string of a certain size.

I trained it on a bunch of Hacker News and Reddit comments and it seemed to work well with larger data-sets, though with smaller ones there are some issues. I don't handle the "last" word in the training data at all, so you just get a dead reference after that. I might actually fix that, somehow/someday... but for now, it's a pretty neat 3am PoC.
