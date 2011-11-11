class EntriesController < ApplicationController

  # GET /entries/new
  # GET /entries/new.xml
  def new
    @entry = current_user.entries.create;
    @item_to_edit = @entry.items.build;

    respond_to do |format|
      format.html { render 'entries/edit' }
    end
  
  #  begin
  #    Entry.transaction do
  #      @entry = current_user.entries.create!;
  #      @item_to_edit = @entry.items.create!;
  #    end
  #  rescue
  #    # did not save.  properly
  #    flash[:notice] += @entry.errors if @entry.new_record?
  #    flash[:notice] += @item_to_edit.errors if @entry.new_record?
  #    
  #    respond_to do |format|
  #      format.html redirect_to user_path(current_user)
  #      format.xml # do something here 
  #    end
  #  else
  #    respond_to do |format|
  #      format.html { render 'entries/edit' }
  #      format.xml  { render :xml => @entry, :status => :created, :location => @entry }
  #    end
  #  end
  end

  def show
    @entry = Entry.find(params[:id])
    @items = @entry.items
  end

  # GET /entries/1/edit
  def edit
    @entry = Entry.find(params[:id])
    @item_to_edit = @entry.items.build;
  end

  # POST /entries
  # POST /entries.xml
  def create
    @entry = current_user.entries.build(params[:entry])

    respond_to do |format|
      if @entry.save
        format.html { redirect_to(current_user, :notice => 'Entry was successfully created.') }
        format.xml  { render :xml => @entry, :status => :created, :location => @entry }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @entry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /entries/1
  # PUT /entries/1.xml
  def update
    @entry = Entry.find(params[:id])

    respond_to do |format|
      if @entry.update_attributes(params[:entry])
        format.html { redirect_to(@entry, :notice => 'Entry was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @entry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /entries/1
  # DELETE /entries/1.xml
  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy

    respond_to do |format|
      format.html { redirect_to(entries_url) }
      format.xml  { head :ok }
    end
  end
end
