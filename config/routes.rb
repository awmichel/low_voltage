Rails.application.routes.draw do
  if LowVoltage.configuration.use_routes
    resources :posts, :to => 'low_voltage/posts', :only => [:index, :show], :path => 'blog'
  end
end
