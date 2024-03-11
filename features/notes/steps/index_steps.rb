When('ele solicita a listagem de suas notas') do
  @response = @test_client.make_get('api/v1/users/me/notes')
end

Then('é rotornada uma lista contendo todas as {int} notas') do |quantity|
  expect(@test_client.success?).to be true
  expect(@response.count).to eq quantity
end