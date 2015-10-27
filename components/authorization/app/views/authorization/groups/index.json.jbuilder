json.set! 'draw', @draw
json.set! 'recordsTotal', @total
json.set! 'recordsFiltered', @filteredCount
json.data do
  json.array! @groups do |group|
    json.name group.name
    json.description  group.description
    json.application_scope      group.application_scope.nil? ? "" : group.application_scope.name
    json.users render partial: 'authorization/groups/members.html'.html_safe,  :locals => { :group => group }
    # need to append .html to force rendering of HTML partials
    json.actions    render partial: 'authorization/groups/actions.html'.html_safe,  :locals => { :group => group }
  end
end