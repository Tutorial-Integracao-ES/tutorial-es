require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "deve salvar usuario corretamente criado" do
    user = User.new(
      'username'=> 'Gust4vo-Sales',
      'email'=> 'manoel_teste@gmail.com',
      'password'=> '1234teste56',
    )

    assert user.save
  end

  test "nao deve salvar usuario sem senha" do
    user = User.new(
      'username'=> 'Gust4vo-Sales2',
      'email'=> 'manoel_teste@gmail.com',
      'password'=> '',
    )

    assert_not user.save
  end

  test "nao deve salvar usuario com username ja em uso" do
    # Fixtures permitem que você preencha seu banco de dados de teste com dados   
    # predefinidos antes de seus testes serem executados. Eu criei um mock de usuario com username Gust4-Sales

    user = User.new(
      'username'=> 'Gust4-Sales',
      'email'=> 'manoel_teste@gmail.com',
      'password'=> '1234teste56',
    )

    assert_not user.save
  end

  test "nao deve salvar usuario com email invalido" do
    # Fixtures permitem que você preencha seu banco de dados de teste com dados   
    # predefinidos antes de seus testes serem executados. Eu criei um mock de usuario com username Gust4-Sales

    user = User.new(
      'username'=> 'Gust4vo-Sales',
      'email'=> 'string_sem_formato_de_email',
      'password'=> '1234teste56',
    )

    assert_not user.save
  end


end
