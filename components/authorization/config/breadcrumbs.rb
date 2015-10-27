crumb :root do
  link 'Home', root_path
end

crumb :users do
  link 'Users', users_path
  parent :root
end

crumb :groups do
  link_to 'Groups', groups_path
  parent :root
end

crumb :manage_membership do |group|
  link 'Manage Membeship', manage_membership_group_path(group)
  parent :groups
end

crumb :scopes do
  link 'Scopes', application_scopes_path
  parent :root
end

crumb :roles do
  link 'Roles', roles_path
  parent :root
end


# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).