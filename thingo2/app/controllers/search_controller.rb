class SearchController < ApplicationController
  
    def index
      @search = Obj.search(params[:search])
      @usersa = @search.all
    end


  def company
   
  end

  def item
  end

  def person
    @search = Obj.search(params[:search])
    @usersa = @search.all
  end

 
end
