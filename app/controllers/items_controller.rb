class ItemsController < ApplicationController
  before_filter :authenticate_user!

  # POST /items
  # POST /items.xml
  def create
   @entry = Entry.find(params[:item][:entry_id])
   @item = @entry.items.build(params[:item])

    respond_to do |format|
      if @item.save
        format.html { redirect_to edit_entry_path :id => @item.entry, :item_anchor => @item }
        format.xml  { head :ok }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /items/1
  # PUT /items/1.xml
  def update
    @item = Item.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { redirect_to edit_entry_path :id => @item.entry, :item_anchor => @item }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @item.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
    @item = Item.find(params[:id])
      
    respond_to do |format|
      format.html { redirect_to edit_entry_path :id => @item.entry, :item => @item, :item_anchor => @item }
    end
  end

  # DELETE /items/1
  # DELETE /items/1.xml
  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to edit_entry_path @item.entry }
      format.xml  { head :ok }
    end
  end
end
