class Category2sController < ApplicationController
  # GET /category2s
  # GET /category2s.xml
  def index
    @category2s = Category2.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @category2s }
    end
  end

  # GET /category2s/1
  # GET /category2s/1.xml
  def show
    @category2 = Category2.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @category2 }
    end
  end

  # GET /category2s/new
  # GET /category2s/new.xml
  def new
    @category2 = Category2.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @category2 }
    end
  end

  # GET /category2s/1/edit
  def edit
    @category2 = Category2.find(params[:id])
  end

  # POST /category2s
  # POST /category2s.xml
  def create
    @category2 = Category2.new(params[:category2])

    respond_to do |format|
      if @category2.save
        format.html { redirect_to(@category2, :notice => 'Category2 was successfully created.') }
        format.xml  { render :xml => @category2, :status => :created, :location => @category2 }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @category2.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /category2s/1
  # PUT /category2s/1.xml
  def update
    @category2 = Category2.find(params[:id])

    respond_to do |format|
      if @category2.update_attributes(params[:category2])
        format.html { redirect_to(@category2, :notice => 'Category2 was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @category2.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /category2s/1
  # DELETE /category2s/1.xml
  def destroy
    @category2 = Category2.find(params[:id])
    @category2.destroy

    respond_to do |format|
      format.html { redirect_to(category2s_url) }
      format.xml  { head :ok }
    end
  end
end
