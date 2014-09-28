Sequel.migration do
  change do
    create_table(:users) do
      primary_key :id
      String :email, :size=>500, :null=>false
      String :name, :size=>255, :null=>false
      String :google_id, :size=>127
      String :gender, :size=>127
      FalseClass :admin
      String :password_digest
    end

    create_table(:documents) do
      primary_key :id
      String :title, :size=>255, :null=>false
      DateTime :created_at, :default=>Sequel::CURRENT_TIMESTAMP
    end

    create_table(:permissions) do
      primary_key :id
      foreign_key :user_id, :users, :null=>false, :key=>[:id]
      foreign_key :document_id, :documents, :null=>false, :key=>[:id]
      String :role, :size=>127, :null=>false
    end

    create_table(:versions) do
      primary_key :id
      foreign_key :user_id, :users, :null=>false, :key=>[:id]
      foreign_key :document_id, :documents, :null=>false, :key=>[:id]
      String :content, :null=>false
      DateTime :created_at, :default=>Sequel::CURRENT_TIMESTAMP
    end

    create_table(:tags) do
      primary_key :id
      String :tag, :size=>127, :null=>false
    end

  end
end
