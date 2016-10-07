class CreateEcmStaffPositionTranslations < ActiveRecord::Migration
  def up
    Ecm::Staff::Position.create_translation_table!({
                                                     name: :string,
                                                     description: :text,
                                                     slug: :string
                                                   }, migrate_data: true)
  end

  def down
    Ecm::Staff::Position.drop_translation_table!(migrate_data: true)
  end
end
