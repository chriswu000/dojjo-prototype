class ItemsController < ApplicationController
  before_filter :authenticate_user!

  # POST /items
  # POST /items.xml
  def create
   @entry = Entry.find(params[:item][:entry_id])
   @item = @entry.items.build(params[:item])
   @item_to_edit = @entry.items.build

    respond_to do |format|
      if @item.save
        format.html { render 'entries/edit' }
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
    @entry = @item.entry

    # if there are no blanks, build a draft item to fill in
    @item_to_edit = @entry.items.detect { |item| item.content.blank? }
    if @item_to_edit.nil?
      @item_to_edit = @entry.items.build
    end

    @item_to_edit.is_draft = true


    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { render 'entries/edit' }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @item.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
    @item = Item.find(params[:id])
    @entry = @item.entry
    @entry.items.detect{ |item| item.id == @item.id }.is_draft = true
      
    respond_to do |format|
      format.html { render 'entries/edit' }
    end
  end

  # DELETE /items/1
  # DELETE /items/1.xml
  def destroy
    @item = Item.find(params[:id])
    @entry = @item.entry

    # if there are no blanks, build a draft item to fill in
    @item_to_edit = @entry.items.detect { |item| item.content.blank? }
    if @item_to_edit.nil?
      @item_to_edit = @entry.items.build
    end

    @item_to_edit.is_draft = true


    @item.destroy

    respond_to do |format|
      format.html { render 'entries/edit' }
      format.xml  { head :ok }
    end
  end
end
