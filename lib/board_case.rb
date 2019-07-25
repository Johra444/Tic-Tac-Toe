class BoardCase # Classe qui crée une nouvelle session de jeu
  attr_accessor :name, :value

  def initialize(name, value)
    @name = name.to_i
    @value = value
  end
end
