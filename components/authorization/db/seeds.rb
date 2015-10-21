puts ''
puts '---- Adding Roles ----'
Role.destroy_all
admin_role = Role.find_or_create_by(:name => 'admin'.camelize)
owner_role = Role.find_or_create_by(:name => 'owner'.camelize)
user_role = Role.find_or_create_by(:name => 'user'.camelize)
developer_role = Role.find_or_create_by(:name => 'developer'.camelize)
app_admin_role = Role.find_or_create_by(:name => 'application_administrator'.camelize)
app_manager_role = Role.find_or_create_by(:name => 'application_manager'.camelize)
project_manager_role = Role.find_or_create_by(:name => 'project_manager'.camelize)

admins = User.where(:admin => true).all #if User.instance_methods.include? :admin

admins.each do |admin|
  admin.roles << admin_role unless admin.roles.include?(admin_role)
end

if User.instance_methods.include? :admin
  developers = User.where(:admin => false).all
else
  developers = User.all
end

developers.each do |developer|
  developer.roles << developer_role unless developer.roles.include?(developer_role)
end

# Groups
puts '---- Adding default group  ----'
default_group = Group.where(:name => 'default_group').first_or_create

# assign default_group to all users

User.all.each do |user|
  user.groups << default_group unless user.groups.include?(default_group)
end

# Scope
puts ''
puts '---- Adding default application scope ----'
default_scope = ApplicationScope.where(:name => 'defaultscope').first_or_create!

# add default_scope to default group
default_group.application_scope = default_scope

# add sample application classes
application_classes =  [
    {:name => 'activity'.camelize},
    {:name => 'application_scope'.camelize},
    {:name => 'account'.camelize},
    {:name => 'workfile'.camelize},
    {:name => 'data_source'.camelize},
    {:name => 'comment'.camelize},
    {:name => 'task'.camelize},
    {:name => 'user'.camelize},
    {:name => 'group'.camelize},
    {:name => 'role'.camelize},
    {:name => 'sandbox'.camelize},
    {:name => 'note'.camelize},
    {:name => 'tag'.camelize},
]

application_classes.each do |appl_class|
  ApplicationClass.where(:name => appl_class[:name]).first_or_create!
end


puts ''
puts '---- Adding Operations ----'

class_operations = {

    'Activity' =>     %w(create show update destroy),
    'ApplicationScope' =>  %w(create show update destroy manage_scopes),
    'Account' =>      %w(create show update destroy change_password lock unlock),
    'Workfile' =>     %w(create show update destroy create_workflow run_workflow),
    'DataSource' =>   %w(create show update destroy view_schema change_password configure_data_source),
    'Comment' =>      %w(create show update destroy promote_to_insight),
    'Task' =>         %w(create show update destroy run stop),
    'User' =>         %w(create show update destroy change_password edit_dashboard manage_notifications manage_comments manage_notes manage_data_source_credentials),
    'Group' =>        %w(create show update destroy),
    'Role' =>         %w(create show update destroy manage_application_roles),
    'Sandbox' =>      %w(create show update destroy add_to_workspace delete_from_workspace),
    'Note' =>         %w(create show update destroy create_attachment_on demote_from_insight),
    'Tag' =>          %w(create show update destroy apply remove)
}

Operation.destroy_all
class_operations.each do |class_name, operations|
  application_class = ApplicationClass.where(:name => class_name).first
  operations.each_with_index do |operation, index|
    application_class.operations << Operation.create(:name => operation, :sequence => index )
  end
end

puts ''
puts '---- Adding permissions to roles ----'

role_permissions = {

    'Admin' => {
        'Activity' =>     %w(create show update destroy),
        'ApplicationScope' =>  %w(create show update destroy manage_scopes),
        'Account' =>      %w(create show update destroy change_password lock unlock),
        'Workfile' =>     %w(create show update destroy create_workflow run_workflow),
        'DataSource' =>   %w(create show update destroy view_schema change_password configure_data_source),
        'Comment' =>      %w(create show update destroy promote_to_insight),
        'Task' =>         %w(create show update destroy run stop),
        'User' =>         %w(create show update destroy change_password edit_dashboard manage_notifications manage_comments manage_notes manage_data_source_credentials),
        'Group' =>        %w(create show update destroy),
        'Role' =>         %w(create show update destroy manage_application_roles),
        'Sandbox' =>      %w(create show update destroy add_to_workspace delete_from_workspace),
        'Note' =>         %w(create show update destroy create_attachment_on demote_from_insight),
        'Tag' =>          %w(create show update destroy apply remove)

    },

    'Developer' => {
        'Activity' =>     %w(create show update destroy),
        'ApplicationScope' =>  %w(show),
        'Account' =>      %w(show change_password),
        'Workfile' =>     %w(create show update destroy create_workflow),
        'DataSource' =>   %w(create show update destroy view_schema change_password),
        'Comment' =>      %w(create show update destroy promote_to_insight),
        'Task' =>         %w(create show update destroy run),
        'User' =>         %w(show change_password edit_dashboard manage_notifications manage_comments manage_notes manage_data_source_credentials),
        'Group' =>        %w(show),
        'Role' =>         %w(show manage_application_roles),
        'Sandbox' =>      %w(create show update destroy add_to_workspace delete_from_workspace),
        'Note' =>         %w(create show update destroy create_attachment_on demote_from_insight),
        'Tag' =>          %w(create show update destroy apply remove)

    }
}

# Given an array of permission symbols, this function
# returns an integer with the proper permission bits set
def create_permission_mask_for(permissions, operations)
  bits = 0
  return bits if permissions.nil?

  permissions.each do |permission|
    index = operations.index(permission.to_sym)
    puts "#{permission} operation not found" if index.nil?
    bits |= ( 1 << index ) unless index.nil?
  end
  return bits
end

# delete all previously stored permissions
Permission.destroy_all
role_permissions.each do |role_name, permissions_hash|
  role = Role.where(:name => role_name).first
  puts "---- Adding permissions for #{role_name} role ----"

  permissions_hash.each do |class_name, permission_names|
    appl_class = ApplicationClass.where(:name => class_name).first
    #puts "---- Adding permissions for #{role_name} role and #{class_name} ----"
    role.permissions << Permission.create(:role_id => role.id,
                                          :application_class_id => appl_class.id,
                                          :permissions_mask => create_permission_mask_for(permission_names, appl_class.class_operations))
  end
end
