class DropTranslationTableForPeople < ActiveRecord::Migration[4.2]
  def change
    reversible do |dir|
      dir.up do
        Ecm::Staff::Person.drop_translation_table!(migrate_data: true)
      end

      dir.down do
        Ecm::Staff::Person.create_translation_table! prefix: :string, description: :text, slug: :string
      end
    end
  end
end
