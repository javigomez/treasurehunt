# TreasureHunt Ruby Kata

You need to create a treasure hunt game.

The game should be a CLI application written in Ruby and the implementation should be simple (not UI thingies for instance)

You should create a 10x10 map of integers. In a random position store the number 1 (this is going to be the treasure).

Get the user to enter coordinates where they think the treasure is until they find it, if the number is 1 display 'Success'.

If the treasure is one position far, display "Hot", if the treasure is two position far, display "Warm", if is further display "Cold".


# Tests
do: `$ bundle exec rspec --format d`

you should get:

```
TreasureHunt
  .initialise
    given Treasure Hunt game is started
      there is a Board
      there is a Treasure
      the Treasure is hidden in the Board

Board
  .initialise
    given there is a Board
      has 10x10 squares

Treasure
  .initialise
    given there is a treasure
      the Treasure has a x axis position between 0 and 9
      the Treasure has a y axis position between 0 and 9
  .placed_at?
    given there is a treasure placed at x:1 and y:1
      returns 'Success' when I guess that is placed_at x:1 and y:1
      returns 'Hot' when I guess that is placed 1 horizontal square away
      returns 'Hot' when I guess that is placed 1 vertical square away
      returns 'Warm' when I guess that is placed 2 horizontal squares away
      returns 'Warm' when I guess that is placed 2 vertical and 2 horizontal squares away
      returns 'Cold' when I guess that is placed 3 or more squares away

Finished in 0.00515 seconds (files took 0.09409 seconds to load)
12 examples, 0 failures
```

# Running the game
do:
`$ bundle install`
`$ ruby play.rb`

# Solution
One possible solution is available at lib/treasure_hunt.rb
