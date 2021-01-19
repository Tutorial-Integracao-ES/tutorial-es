Given('Eu estou logado') do
  visit '/users/new'
  fill_in 'user[username]', with: 'Gust4-Sales'
  fill_in 'user[email]', with: 'manoel@gmail.com'
  fill_in 'user[password]', with: '123456'
  click_button 'submit'
  
  visit '/login'
  fill_in 'username', with: 'Gust4-Sales'
  fill_in 'password', with: '123456'
  click_button 'submit'
end

And('Eu estou na pagina de criacao de reclamacao') do 
  visit '/complaints/new'
end

When('Eu preencho o campo de titulo, o campo de conteudo, o campo de categoria e o campo de selecao de empresa, respectivamente, com {string}, {string}, {string} e {string}') do |titulo_str, content_str, category_str, company_str|
  fill_in 'complaint[title]', with: titulo_str
  fill_in 'complaint[content]', with: content_str
  fill_in 'complaint[category]', with: category_str
  select company_str, from: 'complaint[company]'
end

And('Eu clico em criar reclamacao') do 
  click_button 'Create'
end

Then('Eu vejo que a reclamacao com titulo {string} foi criada') do |titulo_str| 
  expect(page).to have_content(titulo_str)
  expect(page).to have_current_path(complaints_path + '/' + Complaint.last.id.to_s)
end

And('A reclamacao de titulo, conteudo, categoria e empresa, respectivamente preenchidos com, {string}, {string}, {string} e {string} existe') do |titulo_str, 
  content_str, category_str, company_str|
  visit '/complaints/new'
  fill_in 'complaint[title]', with: titulo_str
  fill_in 'complaint[content]', with: content_str
  fill_in 'complaint[category]', with: category_str
  select company_str, from: 'complaint[company]'
  click_button 'Create'
end

And('Eu estou na pagina de detalhes da reclamacao com titulo {string}') do |titulo_str|
  expect(page).to have_content(titulo_str)  
end

When('Eu clico em remover reclamacao') do 
  click_link 'delete'
end

Then('Eu vejo que a reclamacao com titulo {string} foi corretamente deletada') do |titulo_str|
  expect(page).to have_current_path('/complaints')
  expect(page).to have_no_content(titulo_str)
end

Then('Eu vejo uma mensagem de erro na criacao da reclamacao') do 
  assert_selector('div#error_explanation', text: '')
end

Given('Eu estou na pagina de listagem de reclamacoes') do
  visit '/complaints'
end

When('Eu acesso a pagina de criar reclamacao') do
  visit '/complaints/new'
end

Then('Eu vejo que nao tenho permissao para entrar naquela routa sendo redirecionado para a pagina de listagem novamente') do
  expect(page).to have_current_path('/complaints')  
end