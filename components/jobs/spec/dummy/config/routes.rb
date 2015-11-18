Rails.application.routes.draw do

  mount Jobs::Engine => "/jobs"
end
