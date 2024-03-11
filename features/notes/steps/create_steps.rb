Given('os dados validos para cirar uma nova nota') do
  @note_params = { title: 'Titulo', content: 'Conteudo' }
end

When('ele solicita a criação da nova nota') do
  @response = @test_client.make_post('api/v1/users/me/notes', @note_params)
end

Then('a nota deve ter sido criada e adicionada na listagem de notas do usuario') do
  expect(@test_client.success?).to be true
  expect(@user.notes.count).to be 1
  expect(@user.notes.last.title).to eq @note_params[:title]
  expect(@user.notes.last.content).to eq @note_params[:content]
end

Given('os dados invalidos para cirar uma nova nota') do
  @note_params = { title: 'Titulo' }
end

Then('a nota não deve ser criada e uma mensagem de erro é informada') do
  expect(@response[:errors].present?).to be true
  expect(@user.notes.count.zero?).to be true
end