
class Question 
  attr_reader :math_question, :correctAnswer

  def initialize()
    @num1 = rand(1..20)
    @num2 = rand(1..20)
    @correctAnswer = @num1+@num2
    @math_question = "What does #{@num1} plus #{@num2} equal? "
  end

end
