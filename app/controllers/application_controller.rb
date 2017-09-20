class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def nested_params_keys(key, nested_key)
    (params[key].try(:fetch, nested_key, {}) || {}).keys
  end
end
