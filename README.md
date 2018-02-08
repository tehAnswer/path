# path

Simple class that implements UNIX `cd` command in an abstract file-system.

## Usage

```ruby
path = Path.new('/Users/Don')
path.cd('../../../../../FBI/Secrets')
puts path.current_path # => /FBI/Secrets
```

There is also a provided example in a rake task, just run `rake example`.
