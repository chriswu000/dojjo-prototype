class EntriesController < ApplicationController
  before_filter :authenticate_user!

  # GET /entries/new
  # GET /entries/new.xml
  def new
    @entry = current_user.entries.create

     respond_to do |format|
        format.html { redirect_to edit_entry_path @entry  }
    end
  
  end

  # GET /entries/1/edit
  def edit
    @entry = Entry.find(params[:id])
    @action = "update"

    if params[:item]
      @item = @entry.items.detect { |item| item.id == Item.find(params[:item]).id }
    else
      # if there are no blanks, build a draft item to fill in
      @item = @entry.items.detect { |item| item.content.blank? }
      if @item.nil?
        @item = @entry.items.build
        @action = "create"
      end
    end
    @item.is_draft = true

    # anchor to the item submitted as a parameter if exists, otherwise nil
    @item_anchor = params[:item_anchor] ? Item.find(params[:item_anchor]) : nil
    if params[:item_anchor]
    else 

    end
  end

  
  # PUT /entries/1
  # PUT /entries/1.xml
  def update
    @entry = Entry.find(params[:id])

     respond_to do |format|
      if @entry.update_attributes(params[:entry])
        flash[:success] = "Entry updated"
        format.html { redirect_to edit_entry_path }
      else
        format.html { redirect_to edit_entry_path }
      end
    end
  end

  # DELETE /entries/1
  # DELETE /entries/1.xml
  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy

    respond_to do |format|
      format.html { redirect_to user_path current_user  }
      format.xml  { head :ok }
    end
  end

  def tag_list
    respond_to do |format|
      format.html
      @tag_list = Entry.tag_counts.where('tags.name like ?', "%#{params[:q]}%").map { |tag| { :id => tag.name, :name => tag.name } }
      @tag_list << { "id" => params[:q], "name" => params[:q] }
      format.json { render :json =>  @tag_list }
    end

  end

end
