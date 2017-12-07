require './lib/linked_list'

class JungleBeat

  attr_reader :list

  def initialize
    @list = LinkedList.new
  end

  def append (sound)
    beat = sound.split(" ")
    beat.each do |sound|
      @list.append(sound)
    end
  end

  def play
    count = @list.count
    beats = @list.find(0, count)
    `say -r 200 -v Cellos #{beats}`
  end

end
