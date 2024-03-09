Given('com {int} nota\(s) cadastrada') do |int|
  FactoryBot.create_list(:note, int, user: @user)
end

Given('os dados necessarios para editar essa nota') do
  @update_note_params = {
    title: 'Titulo editado',
    content: 'Conteudo editado'
  }
end

Given('a nota a ser editada') do
  @note = @user.notes.first
end

Given('a nota de outro usuario a ser editada') do
  another_user = User.where.not(id: @user.id).first

  @note = another_user.notes.first
end

When('ele solicita a edição da nota') do
  @response = @test_client.make_put("api/v1/users/me/notes/#{@note.id}", @update_note_params)
end

Then('a nota deve ter sido editada com os novos dados') do
  @note.reload

  expect(@response[:title]).to eq @update_note_params[:title]
  expect(@response[:content]).to eq @update_note_params[:content]
  expect(@note.title).to eq @update_note_params[:title]
  expect(@note.content).to eq @update_note_params[:content]
end

Then('a nota não deve ter sido editada com os novos dados') do
  @note.reload

  expect(@test_client.success?).to be false
  expect(@note.title).not_to eq @update_note_params[:title]
  expect(@note.content).not_to eq @update_note_params[:content]
end
