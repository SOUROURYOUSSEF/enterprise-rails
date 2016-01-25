Rails.application.routes.draw do

  mount StateMachines::Engine => "/state_machines"
end
