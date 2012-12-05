class HomeController < ApplicationController
  def index
  end

  def search
    @data = []
    url = params[:url]
    @data = HTTParty.get(url)
    @data = @data.split(' ')
    sort_tree(@data)
    @sentence = @new_data
    render :json => @sentence
    # binding.pry
  end

  def sort_tree(arry)
    t = Tree.new
    arry.each do |word|
      t.insert(word)
    end
    @new_data = t.sort
   end
end