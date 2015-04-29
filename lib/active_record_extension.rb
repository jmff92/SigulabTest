class ActiveRecord::Base
  def self.attr_localized(*fields)
    fields.each do |field|
      define_method("#{field}=") do |value|
        self[field] = value.is_a?(String) ? value.to_delocalized_decimal : value
      end
    end
  end
end
