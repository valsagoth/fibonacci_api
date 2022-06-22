module RenderConcern
  def initialize_render_concern(result, output = :output)
    @result = result
    @output = result.send(output)
    @success_status = result.status || :ok
    @error_status = result.error_status || :bad_request
  end
end
