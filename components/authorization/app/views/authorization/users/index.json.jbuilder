
json.set! 'draw', @draw
json.set! 'recordsTotal', @total
json.set! 'recordsFiltered', @filteredCount
json.data do
  json.array! @users do |user|
    json.first_name user.first_name
    json.last_name  user.last_name
    json.username   user.username
    json.email      user.email
    json.groups     user.groups.count == 0 ? "" : user.groups[0].name
    json.scope      user.groups.count == 0 ? "" : user.groups[0].application_scope.name
    # need to append .html to force rendering of HTML partials
    json.actions    render partial: 'authorization/users/actions.html'.html_safe,  :locals => { :user => user }
  end
end