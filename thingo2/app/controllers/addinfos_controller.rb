class AddinfosController < ApplicationController
  # GET /addinfos
  # GET /addinfos.xml
  def index
    @addinfos = Addinfo.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @addinfos }
    end
  end

  # GET /addinfos/1
  # GET /addinfos/1.xml
  def show
    @addinfo = Addinfo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @addinfo }
    end
  end

  # GET /addinfos/new
  # GET /addinfos/new.xml
  def new
    @addinfo = Addinfo.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @addinfo }
    end
  end

  # GET /addinfos/1/edit
  def edit
    @addinfo = Addinfo.find(params[:id])
  end

  # POST /addinfos
  # POST /addinfos.xml
  def create
    @addinfo = Addinfo.new(params[:addinfo])

    respond_to do |format|
      if @addinfo.save
        format.html { redirect_to(@addinfo, :notice => 'Addinfo was successfully created.') }
        format.xml  { render :xml => @addinfo, :status => :created, :location => @addinfo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @addinfo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /addinfos/1
  # PUT /addinfos/1.xml
  def update
    @addinfo = Addinfo.find(params[:id])

    respond_to do |format|
      if @addinfo.update_attributes(params[:addinfo])
        format.html { redirect_to(@addinfo, :notice => 'Addinfo was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @addinfo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /addinfos/1
  # DELETE /addinfos/1.xml
  def destroy
    @addinfo = Addinfo.find(params[:id])
    @addinfo.destroy

    respond_to do |format|
      format.html { redirect_to(addinfos_url) }
      format.xml  { head :ok }
    end
  end
end
