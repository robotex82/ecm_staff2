class DropTranslationTableForOrgansiations < ActiveRecord::Migration[4.2]
  def change
    reversible do |dir|
      dir.up do
        Ecm::Staff::Organisation.drop_translation_table!
      end

      dir.down do
        Ecm::Staff::Organisation.create_translation_table! name: :string, description: :text, slug: :string
      end
    end
  end
end
