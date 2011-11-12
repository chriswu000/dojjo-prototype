class EntriesController < ApplicationController
  before_filter :authenticate_user!

  # GET /entries/new
  # GET /entries/new.xml
  def new
    @entry = current_user.entries.create
    @item = @entry.items.build
    @item.is_draft = true

    respond_to do |format|
      format.html { render 'entries/edit' }
    end
  
  end

  # GET /entries/1/edit
  def edit
    @entry = Entry.find(params[:id])

    # if there are no blanks, build a draft item to fill in
    @item = @entry.items.detect { |item| item.content.blank? }
    if @item.nil?
      @item = @entry.items.build
    end

    @item.is_draft = true
  end

  
  # PUT /entries/1
  # PUT /entries/1.xml
  def update
    @entry = Entry.find(params[:id])

    # if there are no blanks, build a draft item to fill in
    @item = @entry.items.detect { |item| item.content.blank? }
    if @item.nil?
      @item = @entry.items.build
    end

    @item.is_draft = true

    respond_to do |format|
      if @entry.update_attributes(params[:entry])
        format.html { render 'entries/edit' }
      else
        format.html { render 'entries/edit' }
      end
    end
  end

  # DELETE /entries/1
  # DELETE /entries/1.xml
  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy

    respond_to do |format|
      format.html { redirect_to user_path(current_user) }
      format.xml  { head :ok }
    end
  end
end
