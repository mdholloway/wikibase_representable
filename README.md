# wikibase-data-model-ruby

Provides Wikibase data model classes and support (by way of [representable](https://rubygems.org/gems/representable)) for serializing and deserializing Wikibase data objects to and from JSON.

## Install
```zsh
bundle install
```

## Example usage
```ruby
# Deserialize an object from JSON
json = '{"type":"item","id":"Q42","labels":{"en":{"language":"en","value":"Douglas Adams"}}}'
item = ItemRepresenter.new(Item.new).from_json(json)
# => #<Wikibase::DataModel::Entity::Item:0x0000000...

# Serialize an object to JSON
json = ItemRepresenter.new(item).to_json
# => "{\"type\":\"item\",\"id\":\"Q42\"...
```

## Test (run RSpec and RuboCop)
```zsh
rake
```