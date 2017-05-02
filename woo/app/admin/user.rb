ActiveAdmin.register User do
  remove_filter :profile

 
  module MetaSearch
      class Builder
          def matches_attribute_method(method_id)
              method_name = preferred_method_name(method_id)
              where = Where.new(method_id) rescue nil
              return nil unless method_name && where
              match = method_name.match("^(.*)_(#{where.name})=?$")
              if match
                  attribute, predicate = match.captures
                  attributes = attribute.split(/_or_/)
                  if attributes.all? {|a| where.types.include?(column_type(a))}
                      return match
                  end
              end
              nil
          end
      end
      module Utility
          private
          def preferred_method_name(method_id)
              method_name = method_id.to_s
              where = Where.new(method_name) rescue nil
              return nil unless where
              where.aliases.each do |a|
                  break if method_name.sub!(/_#{a}(=?)$/, "_#{where.name}\\1")
              end
              method_name
          end
      end
  end
  form do |f|
  f.inputs :email, :password, :password_confirmation
  f.buttons :commit
  
  end
end
