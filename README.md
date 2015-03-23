---
tags: logic, cs, monkey patching, todo, custom methods
languages: ruby
resources: 1
---

# My Zip

![zipper image](https://s3-us-west-2.amazonaws.com/web-dev-readme-photos/cs/zipper.jpg)

## Objective

You will be building out Ruby's `#zip` method. Instead of calling it `#zip` though, you'll call it `#my_zip`. 

## Ruby's Zip Method

Here are some array's we'll be working with:

```ruby
letters  = [ "a",  "b",     "c"    ]
numbers  = [ 1,    2,       3      ]
reptiles = [:fish, :turtle, :lizard]
```

Here are some examples of `#zip` in action when every array it's given and it works on is of equal length:

```ruby
reptiles.zip(letters)
#=> [[:fish, "a"], [:turtle, "b"], [:lizard, "c"]]

reptiles.zip(numbers)
#=> [[:fish, 1], [:turtle, 2], [:lizard, 3]]

reptiles.zip(letters, numbers)
#=> [[:fish, "a", 1], [:turtle, "b", 2], [:lizard, "c", 3]]
```

Here are some examples of `#zip` in action when the array it works on is shorter than it's arguments:

```ruby
mammals = ["bear","tiger"]

mammals.zip(reptiles)
#=> [["bear", :fish], ["tiger", :turtle]]

mammals.zip(reptiles, numbers)
#=> [["bear", :fish, 1], ["tiger", :turtle, 2]]
```

Here are some examples of `#zip` in action when the array it works on is longer than it's arguments:

```ruby
cars = ["CR-V", "Camry", "Escape", "Forester", "Highlander"]

cars.zip(reptiles)
#=>  
# [
#   ["CR-V",       :fish  ], 
#   ["Camry",      :turtle], 
#   ["Escape",     :lizard], 
#   ["Forester",   nil    ], 
#   ["Highlander", nil    ]
# ]

cars.zip(reptiles, numbers)
#=> 
# [
#   ["CR-V",       :fish,   1  ], 
#   ["Camry",      :turtle, 2  ], 
#   ["Escape",     :lizard, 3  ], 
#   ["Forester",   nil,     nil], 
#   ["Highlander", nil,     nil]
# ]
```

## Notes

Do not call on Ruby's `#zip` method to accomplish this task.

## Resources

* [Ruby's Zip Method](http://ruby-doc.org/core-2.2.0/Array.html#method-i-zip)
