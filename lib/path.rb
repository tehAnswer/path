class Path
  attr_reader :current_path

  def initialize(path = '/')
    @current_path = path
  end

  def cd(new_path)
    # An absolute path will overwrite completely the former one, although it
    # might contain aliases.
    return @current_path = resolve_alias(new_path) if new_path.start_with?('/')
    # In the case of a relative path, we append the new path with a trailling
    # slash and resolve the aliases.
    @current_path = resolve_alias(@current_path + new_path.prepend('/'))
  end

  private

  def resolve_alias(path)
    # Eliminates empty strings for leading and trailling slashes.
    directories = path.split('/').reject(&:empty?)
    directories.each_with_object([]) do |dir, obj|
      if dir == '..'
        # Eliminates the last element of the array.
        obj.pop
      else
        obj << dir
      end
    end.compact.join('/').prepend('/')
  end
end
