class Sandbox
  include Enumerable

  def initialize
    @name = "Poetkoe"
  end



end



a = [1,2,3,4,5]

a.my_each {|x| puts x}
