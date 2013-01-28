Sequel.migration do
  up do
    create_table :todays_topics do
      primary_key :id
      String :topic
    end
  end

  down do
    drop_table :todays_topics
  end
end
