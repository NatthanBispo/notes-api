When('ele solicita a exclusão da nota') do
  @response = @test_client.make_delete("api/v1/users/me/notes/#{@note.id}")
end

Then('a nota deve ter sido excluida') do
  expect(@test_client.success?).to be true
  expect(Note.exists?(@note.id)).to be false
end

Then('a nota não deve ter sido excluida') do
  expect(@test_client.success?).to be false
  expect(Note.exists?(@note.id)).to be true
end