# Gilded Rose Test

This app is a stock management system for a mythical inn that hold a range of products that change in quality in different ways as they approach their sell by date.

The task was to add a new feature to allow the inn to sell a new category of items, whilst maintaining existing functionality.

## Usage

`git clone git@github.com:nateg101/Gilded-Rose.git`
`bundle install`

### Run Tests & Linting

Tests - `rspec`
Linting -  `rubocop`

### How to Manage Inventory

Open a Ruby REPL

Type the following, this will give you access to all items that may be stocked in the Gilded Rose:

* `require './lib/gilded_rose'`
* `require './lib/item'`
* `require './lib/standard_item'`
* `require './lib/time_dependent_items'`
* `require './lib/increase_value_item'`
* `require './lib/conjured_item'`
* `require './lib/legendary_item'`

Create a list of items like the one below:

```
items = [
  StandardItem.new(name = "+5 Dexterity Vest", sell_in = 10, quality = 20),
  IncreaseValueItem.new(name = "Aged Brie", sell_in = 2, quality = 0),
  StandardItem.new(name = "Elixir of the Mongoose", sell_in = 5, quality = 7),
  LegendaryItem.new(name = "Sulfuras, Hand of Ragnaros", sell_in = 0, quality = 80),
  LengedaryItem.new(name = "Sulfuras, Hand of Ragnaros", sell_in = -1, quality = 80),
  TimeDependentItems.new(name = "Backstage passes to a TAFKAL80ETC concert", sell_in = 15, quality = 20),
  TimeDependentItems.new(name = "Backstage passes to a TAFKAL80ETC concert", sell_in = 10, quality = 49),
  TimeDependentItems.new(name = "Backstage passes to a TAFKAL80ETC concert", sell_in = 5, quality = 49),
  ConjuredItem.new(name = "Conjured Mana Cake", sell_in = 3, quality = 6), # <-- :O
]
```
Create a new instance of the Gilded Rose with the list of items:

`gilded_rose = GildedRose.new(items)`

At the end of each day run:

`gilded_rose.update_quality`

This will update the quality of all items in stock in the Gilded Rose.

## Process & Methodology

Firstly I looked at the existing code, and noticed a few things:
1. The GildedRose class was iterating through the items in stock, identifying them by name. This meant that there was a very long `if` statement, which could be refactored. Secondly, identifying items by name means that should new items be added they will not be picked up by the code, this was important to rectify.
2. Many of the items behaved in similar ways e.g. quality falling as sell_in decreased, this meant that there appeared to be an opportunity to allow items to inherit properties from the Item class.
3. As per the requirements, the Item class could not be changed.

From this I decided that the best course of action would be as follows:

1. Extract the Item class from the gilded_rose.rb file.
2. Create a class for item type e.g. `ConjuredItem` or `StandardItem`, these items would inherit from the Item class, which would keep the code as DRY as possible.
3. Where necessary the various item classes would have methods in to handle how their quality changed over time, as stated in the requirements.
4. Once these item classes were created and working as intended, I could then refactor the GildedRose code.
5. It became apparent that the `update_quality` method in the GildedRose class needed to iterate through the items list and call `update_properties` on each item. The only exception to this was for Lengedary Items, whose quality never changes. Therefore I refactored the `update_quality` method to deliver this functionality.
