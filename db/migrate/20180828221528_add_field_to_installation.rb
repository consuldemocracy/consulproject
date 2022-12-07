class AddFieldToInstallation < ActiveRecord::Migration[5.2]
  def up
    ActiveRecord::Base.connection.execute <<-SQL
      DO $$
      BEGIN
        IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'organization_type') THEN
          CREATE TYPE organization_type AS ENUM ('government', 'ngo', 'university', 'school', 'other');
        END IF;

        IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'installation_status') THEN
          CREATE TYPE installation_status AS ENUM ('in_progress', 'in_production');
        END IF;
      END
      $$;
    SQL

    if table_exists? :installations
      add_column :installations, :website, :string
      add_column :installations, :contact_name, :string
      add_column :installations, :conact_email, :string
      add_column :installations, :location, :string
      add_column :installations, :organization_type, :organization_type
      add_column :installations, :status, :installation_status
      add_column :installations, :notes, :text
    end
  end

  def down
    remove_column :installations, :website if column_exists? :installations, :website
    remove_column :installations, :contact_name if column_exists? :installations, :contact_name
    remove_column :installations, :conact_email if column_exists? :installations, :conact_email
    remove_column :installations, :location if column_exists? :installations, :location
    remove_column :installations, :organization_type if column_exists? :installations, :organization_type
    remove_column :installations, :status if column_exists? :installations, :status
    remove_column :installations, :notes if column_exists? :installations, :notes

    ActiveRecord::Base.connection.execute <<-SQL
      DO $$
      BEGIN
        IF EXISTS (SELECT 1 FROM pg_type WHERE typname = 'organization_type') THEN
          DROP TYPE organization_type;
        END IF;

        IF EXISTS (SELECT 1 FROM pg_type WHERE typname = 'installation_status') THEN
          DROP TYPE installation_status;
        END IF;
      END
      $$;
    SQL
  end
end
