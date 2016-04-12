class Lexiconomitron
  def eat_t(input)
    return false if !input.is_a?(String)
    input.gsub!(/[Tt]/,'')
  end

  def shazam(array)
    array.map {|i| eat_t(i.reverse!)}
    [array.first, array.last]
  end

  def oompa_loompa(array)
    array.delete_if {|i| i.size > 3 || !i.is_a?(String)}
  end
end
