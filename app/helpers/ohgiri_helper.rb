MusicOhgiri.helpers do
  # Failure response
  #
  # @params String message error message.
  # @params Object ingredient append variables.
  # @return String error response
  def failure message=nil, ingredient=nil
    response = ({
      :status => "NG",
      :message => message.nil? ? "Error!" : message
    })
    response.merge! ingredient if !ingredient.nil? and ingredient.is_a?(Hash)
    return build_response(response)
  end
end