
json.set! 'draw', @draw
json.set! 'recordsTotal', @total
json.set! 'recordsFiltered', @filteredCount
json.data do
  json.array! @users do |user|
    json.first_name user.first_name
    json.last_name  user.last_name
    json.username   user.username
    json.email      user.email
    json.department user.department
    # need to append .html to force rendering of HTML partials
    json.actions    render partial: 'authorize_it/users/actions.html',  :locals => { :user => user }
  end
end