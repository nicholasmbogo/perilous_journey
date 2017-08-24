require  './lib/linked_list'

class WagonTrain

    attr_reader :list, :node

  def initialize
    @list = LinkedList.new
  end

  def append(surname)
    @list.append(surname)
  end

end
