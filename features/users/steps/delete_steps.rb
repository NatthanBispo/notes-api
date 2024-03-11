When('ele solicita que sua conta seja deletada') do
  @create_user_response = @test_client.make_delete('api/v1/users/me')
end

Then('a conta dele é deletada') do
  expect(@test_client.success?).to be true
  expect(User.exists?(@user.id)).to be false
end