class ObjsController < ApplicationController
  before_filter :get_user
  # GET /objs
  # GET /objs.xml
  def index
    @objs = @user.objs.page(params[:page])
    
       
    respond_to do |format|
      format.html  { render :layout => 'myinfo' }# index.html.erb
      format.xml  { render :xml => @objs }
    end
  end

  # GET /objs/1
  # GET /objs/1.xml
  def show
    @obj = @user.objs.find(params[:id])
    @parametre = Parametre.all
    @commenta = @obj.comments.new
    @albums = @obj.albums.all
    
    respond_to do |format|
  
      format.html {   render :layout => 'objs2' }# show.html.erb
      format.xml  { render :xml => @obj }
    end
  end

  # GET /objs/new
  # GET /objs/new.xml
  def new
    
    @obj = @user.objs.build
    time1 = Time.new
    @IDname = @user.spec.country + time1.year.to_s + time1.month.to_s + time1.day.to_s + time1.hour.to_s + time1.min.to_s + time1.sec.to_s
    @obj.idthingo = @IDname
    respond_to do |format|
      format.html {  render :layout => 'myinfo' }# new.html.erb
      format.xml  { render :xml => @obj }
    end
  end

  # GET /objs/1/edit
  def edit
    @obj = @user.objs.find(params[:id])

    
    render :layout => 'myinfo'
  end

  # POST /objs
  # POST /objs.xml
  def create
    @obj = @user.objs.build(params[:obj])

    respond_to do |format|
      if @obj.save
        format.html { redirect_to(@obj, :notice => 'Obj was successfully created.') }
        format.xml  { render :xml => @obj, :status => :created, :location => @obj }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @obj.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /objs/1
  # PUT /objs/1.xml
  def update
    @obj = Obj.find(params[:id])

    respond_to do |format|
      if @obj.update_attributes(params[:obj])
        format.html { redirect_to(@obj, :notice => 'Obj was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @obj.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /objs/1
  # DELETE /objs/1.xml
  def destroy
    @obj = @user.objs.find(params[:id])
    @obj.destroy

    respond_to do |format|
      format.html { redirect_to(objs_url) }
      format.xml  { head :ok }
    end
  end
  
   def follow
     @obj = Obj.find(params[:id])
     @user.follow(@obj)
     respond_to do |format|
        format.js {}
     end
   end
   
   def unfollow
     @obj = Obj.find(params[:id])
     @user.stop_following(@obj)
     respond_to do |format|
        format.js {}
     end
   end
   
   def rate
     @obj =  Obj.find(params[:id])
     @obj.rate(params[:stars], current_user, params[:dimension])
     respond_to do |format|
        format.js {}
     end
   end
     
    def save_comment
       @obj = @user.objs.find(params[:commenta][:commentable_id])      
       @obj.comments.create!(:comment => params[:commenta][:comment], :user_id => @user.id)
       @obj.save
     end
     
     def save_comment_through_index
       @obj = @user.objs.find(params[:comment][:commentable_id])      
       @obj.comments.create!(:comment => params[:comment][:comment], :user_id => @user.id)
       @obj.save 
        redirect_to :action => 'index' 
       
     end
     
     def remove_comment
       @obj = @user.objs.find(params[:idobj])
       @c = @obj.comments.find(params[:id])
       @c.destroy
       redirect_to :action => 'index' 
     end

     
  private
  def get_user
    @user = current_user
  end
  
end
