module FibonacciInteractor
  class AcumulateFibonacciPosition
    include Interactor

    def call
      context.output = acumulate_fibonacci_position(position)
    end

    private
    
    delegate :position, to: :context

    def acumulate_fibonacci_position(position, memo = {})
      var = "Diferent process"
      var
    end
  end
end
