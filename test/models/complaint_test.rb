require "test_helper"

class ComplaintTest < ActiveSupport::TestCase
  # Fixtures permitem que você preencha seu banco de dados de teste com dados   
  # predefinidos antes de seus testes serem executados. Eu criei um mock de usuario para poder 
  # usar nos testes de Complaint já que as reclamacoes pertencem a um usuario  

  test "deve salvar reclamacao corretamente criada" do
    complaint = Complaint.new(
      'title' => 'Titulo',
      'content' => 'Conteudo de teste...',
      'category' => 'Eletronicos',
      'company' => 'Empresa1',
      'user_id' => users(:mock_user).id
    )

    assert complaint.save
  end

  test "nao deve salvar reclamacao sem titulo" do
    complaint = Complaint.new(
      'title' => '',
      'content' => 'Conteudo de teste...',
      'category' => 'Eletronicos',
      'company' => 'Empresa1',
      'user_id' => users(:mock_user).id
    )

    assert_not complaint.save
  end

  test "nao salvar reclamacao com content menor que 10 chars" do
    complaint = Complaint.new(
      'title' => 'Titulo',
      'content' => 'Curto',
      'category' => 'Eletronicos',
      'company' => 'Empresa1',
      'user_id' => users(:mock_user).id
    )

    assert_not complaint.save
  end

  test "nao salvar reclamacao com empresa invalida" do
    complaint = Complaint.new(
      'title' => 'Titulo',
      'content' => 'Conteudo de teste...',
      'category' => 'Eletronicos',
      'company' => 'Empresa5',
      'user_id' => users(:mock_user).id
    )

    assert_not complaint.save
  end
end
