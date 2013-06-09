class BizspecsController < ApplicationController
  # GET /bizspecs
  # GET /bizspecs.xml
  def index
    @bizspecs = Bizspec.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bizspecs }
    end
  end

  # GET /bizspecs/1
  # GET /bizspecs/1.xml
  def show
    @bizspec = Bizspec.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bizspec }
    end
  end

  # GET /bizspecs/new
  # GET /bizspecs/new.xml
  def new
    @bizspec = Bizspec.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bizspec }
    end
  end

  # GET /bizspecs/1/edit
  def edit
    @bizspec = Bizspec.find(params[:id])
        
     respond_to do |format|
       format.js {}
        format.html { @user = current_user
        @user.bizspec ||= Bizspec.new
        @bizspec = @user.bizspec
        render :layout => 'myinfo'}# new.html.erb
        format.xml  { render :xml => @spec }
      end
  end

  # POST /bizspecs
  # POST /bizspecs.xml
  def create
    @bizspec = Bizspec.new(params[:bizspec])

    respond_to do |format|
      if @bizspec.save
        format.html { redirect_to(@bizspec, :notice => 'Bizspec was successfully created.') }
        format.xml  { render :xml => @bizspec, :status => :created, :location => @bizspec }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bizspec.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bizspecs/1
  # PUT /bizspecs/1.xml
  def update
    @bizspec = Bizspec.find(params[:id])

    respond_to do |format|
      if @bizspec.update_attributes(params[:bizspec])
        format.html { redirect_to(@bizspec, :notice => 'Bizspec was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bizspec.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bizspecs/1
  # DELETE /bizspecs/1.xml
  def destroy
    @bizspec = Bizspec.find(params[:id])
    @bizspec.destroy

    respond_to do |format|
      format.html { redirect_to(bizspecs_url) }
      format.xml  { head :ok }
    end
  end
end
