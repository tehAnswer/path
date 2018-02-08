task :example do |_, _|
  require_relative 'lib/path'
  puts 'Creating path at /Users/Don'
  path = Path.new('/Users/Don')

  puts '$ cd ../../../FBI'
  path.cd('../../../FBI')
  puts path.current_path.prepend("$ pwd\n  =>")

  puts '$ cd /Users/Don/Pictures/Ivanka'
  path.cd('/Users/Don/Pictures/Ivanka')
  puts path.current_path.prepend("$ pwd\n  =>")
end
