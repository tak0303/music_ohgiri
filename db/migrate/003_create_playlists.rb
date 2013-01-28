Sequel.migration do
  up do
    create_table :playlists do
      primary_key :id
      Integer :vodeo_id
      Integer :topic_id
      Integer :user_id
    end
  end

  down do
    drop_table :playlists
  end
end
