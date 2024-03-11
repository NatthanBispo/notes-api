class Api::V1::Users::NotesController < Api::ApiController
  before_action :authenticate_user_from_token!
  before_action :fetch_note, only: [:update, :destroy]

  def index
    render_success(current_user.notes)
  end

  def create
    note = current_user.notes.new(note_params)

    return render_created(note) if note.save

    render_unprocessable_entity(note.errors.full_messages)
  end

  def update
    return render_success(@note) if @note.update(note_params)

    render_unprocessable_entity(@note.errors.full_messages)
  end

  def destroy
    return render_success(@note) if @note.destroy

    render_unprocessable_entity(@note.errors.full_messages)
  end

  private

  def fetch_note
    @note = current_user.notes.find_by(id: params[:id])

    render_not_found if @note.nil?
  end

  def note_params
    params.permit(:title, :content)
  end
end
