class DropTranslationTableForBusinessUnits < ActiveRecord::Migration[4.2]
  def change
    reversible do |dir|
      dir.up do
        Ecm::Staff::BusinessUnit.drop_translation_table!(migrate_data: true)
      end

      dir.down do
        Ecm::Staff::BusinessUnit.create_translation_table! name: :string, description: :text, slug: :string
      end
    end
  end
end
