# NOTE: If you need to override the standard devise views
# (i.e. app/views/devise/sessions/new) you will want to require 'devise'
# before you require your engine. This way the view order will get configured
# appropriately and you can manage the overrides within your
# engine rather than the main app.

require 'devise'
require "authentication/engine"

module Authentication
end
