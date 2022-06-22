class FibonacciController < ApplicationController
  def get_position
    initialize_render_concern(get_fibonacci_position)

    render_result_serializer
  end

  def acumulate
    initialize_render_concern(acumulate_fibonacci_position)

    render_result_serializer
  end

  private

  def get_fibonacci_position
    FibonacciInteractor::GetFibonacciPosition.call(
      position: route_params
    )
  end

  def acumulate_fibonacci_position
    FibonacciInteractor::AcumulateFibonacciPosition.call(
      position: route_params
    )
  end

  def route_params
    params[:position]
  end

  # This is an example of an API runing under the Single Responsability Principle of SOLID design principles
  # Each endpoint for this controller instantiates a render concern to fire an Interactor to execute a singleton
  # and run what is expected for each method in the controller; however each singleton doesnt lock itself to a specific
  # response, but passes a response in the context for the general api_controller to use a generic serializer method.
  # As such, we can have general serializers for specific controllers, or if needed, specify a more robust serialzier
  # for the response of a certain interactor
end
