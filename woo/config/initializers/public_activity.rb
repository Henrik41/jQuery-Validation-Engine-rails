PublicActivity::Activity.table_name = 'events'

PublicActivity::Activity.class_eval do
  attr_accessible :notif
end