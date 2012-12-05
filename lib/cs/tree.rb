class Tree
  attr_accessor :root, :data_array

  def initialize
    @data_array = []
  end

  def insert(word)
    if @root.nil?
      @root = Node.new(word)
    else
      insert_node(@root, word)
    end
  end

  def sort
    start_sort(@root)
    @data_array
  end

  def start_sort(node)
    start_sort(node.prv) if node.prv
    @data_array << node.data
    start_sort(node.nxt) if node.nxt
  end

  # def to_s
  #   "#{prv.try(:data) || 0} <- #{data} -> #{nxt.try(:data) || 0}"
  # end

  def insert_node(node, value)
    if (value <= node.data) && (node.prv.nil?)
      node.prv = Node.new(value)
    elsif (value > node.data) && (node.nxt.nil?)
      node.nxt = Node.new(value)
    elsif (value <= node.data) && (node.prv)
      insert_node(node.prv, value)
    elsif (value > node.data) && (node.nxt)
      insert_node(node.nxt, value)
    end
  end
end
