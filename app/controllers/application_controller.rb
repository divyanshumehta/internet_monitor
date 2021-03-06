class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :load_groups
  
  rescue_from ActionController::RoutingError, with: :render_not_found

  def load_groups
    access = Category.find_by_slug 'access'
    @groups = DatumSource.where( { category_id: access.id } ).map { |ds| ds.group }.uniq
  end

  def not_found
    raise ActionController::RoutingError.new( 'Not Found' )
  end

  protected

  def render_not_found
    render json: '{ "status": "error", "message": "Not Found" }', status: 404
  end
end
