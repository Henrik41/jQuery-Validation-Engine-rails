class SpecsController < ApplicationController
  # GET /specs
  # GET /specs.xml
  def index
    @specs = Spec.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @specs }
    end
  end

  # GET /specs/1
  # GET /specs/1.xml
  def show
    @spec = Spec.find(params[:id])

    
    respond_to do |format|
      format.js {}
      format.html { redirect_to :controller => "myinfo", :action => "show" } # show.html.erb
      format.xml  { render :xml => @spec }
    end
 
  end

  # GET /specs/new
  # GET /specs/new.xml
  def new
    @spec = Spec.new
    @user = current_user
    @user.spec = @user.id

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @spec }
    end
  end

  # GET /specs/1/edit
  def edit
    if Spec.exists?(params[:id])
      
      @spec = Spec.find(params[:id])

       respond_to do |format|
         format.js {}
          format.html { @user = current_user
          @user.spec ||= Spec.new
          @spec = @user.spec
          render :layout => 'myinfo'}# new.html.erb
          format.xml  { render :xml => @spec }
        end
        

    
    else

      respond_to do |format|
        
        format.html {redirect_to :controller => "myinfo", :action => "show" }
      end
      
    end
  end

  # POST /specs
  # POST /specs.xml
  def create
    @spec = Spec.new(params[:spec])

    respond_to do |format|
      if @spec.save
     
        format.html { redirect_to(@spec, :notice => 'Spec was successfully created.') }
        format.xml  { render :xml => @spec, :status => :created, :location => @spec }
      else
   
        format.html { render :action => "new" }
        format.xml  { render :xml => @spec.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /specs/1
  # PUT /specs/1.xml
  def update
    @spec = Spec.find(params[:id])

    respond_to do |format|
      if @spec.update_attributes(params[:spec])
        format.html { redirect_to(@spec, :notice => 'Spec was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @spec.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /specs/1
  # DELETE /specs/1.xml
  def destroy
    @spec = Spec.find(params[:id])
    @spec.destroy

    respond_to do |format|
      format.html { redirect_to(specs_url) }
      format.xml  { head :ok }
    end
  end
end
