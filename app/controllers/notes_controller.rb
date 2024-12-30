class NotesController < ApplicationController
  before_action :set_note, only: %i[ show edit update destroy ]

  def index
    filters = params[:filters]&.to_unsafe_h&.symbolize_keys
  
    if filters && filters[:title].present?
      @notes = Note.search_by_title_or_body(filters[:title])
    else
      @notes = Note.order(created_at: :desc)
    end

    if filters && filters[:sort_by].present?
      case filters[:sort_by]
      when 'created_at_asc'
        @notes = @notes.order(created_at: :asc)
      when 'created_at_desc'
        @notes = @notes.order(created_at: :desc)
      when 'title_asc'
        @notes = @notes.order(:title)
      when 'title_desc'
        @notes = @notes.order(title: :desc)
      end
    else
      # Default sorting by created_at descending
      @notes = @notes.order(created_at: :desc)
    end
  
    @notes = @notes.group_by { |note| note.created_at.strftime("%B") }
  end

  def show
  end

  def new
    @note = Note.new
  end

  def edit
  end

  def create
    @note = Note.new(note_params)

    respond_to do |format|
      if @note.save
        format.html { redirect_to note_url(@note), notice: "Note was successfully created." }
        format.json { render :show, status: :created, location: @note }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to note_url(@note), notice: "Note was successfully updated." }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @note.destroy
    respond_to do |format|
      format.html { redirect_to notes_url, notice: "Note was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_note
    @note = Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:title, :body)
  end
end
