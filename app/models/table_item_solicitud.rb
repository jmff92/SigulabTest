class table_items_solicitud < ActiveRecord::Base
  belongs_to :loan
  belongs_to :chemical_substance
  belongs_to :consumable
  belongs_to :equipment
  belongs_to :tool
  belongs_to :instrument
end
