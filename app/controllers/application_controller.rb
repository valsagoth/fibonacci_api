class ApplicationController < ActionController::API
  include RenderConcern

  def render_result_serializer
    return if render_error?

    render json: @output
  end

  def render_error?
    return render_error(@result.errors, @error_status) unless @result.success?

    false
  end

  def render_error(errors, status)
    render json: { errors: [errors] }, status: status
  end
end
