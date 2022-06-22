module FibonacciInteractor
  class GetFibonacciPosition
    include Interactor

    def call
      context.output = get_fibonacci_position(position)
    end

    private

    delegate :position, to: :context

    def get_fibonacci_position(position, memo = {})
      check = Float(position) rescue nil
      context.fail!(errors: "Value is not an Integer", error_status: :unprocessable_entity) unless check
      
      position = position.to_i
      value = if position == 0 || position == 1
                position
              else
                memo[position] ||= get_fibonacci_position(position - 1, memo) + get_fibonacci_position(position - 2, memo)
              end

      context.status = :ok
      value
    end
  end
end
