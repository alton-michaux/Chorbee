Parent.create("name"=>"Alton", "email"=>"michaux.alton@gmail.com")
Parent.create("name"=>"Gillian", "email"=>"some.other.alton@good.net")
Child.create("name"=>"Tyson", "age"=>17, "parent_id"=>1)
Child.create("name"=>"Lyric", "age"=>14, "parent_id"=>1)
Child.create("name"=>"AJ", "age"=>9, "parent_id"=>1)
Child.create("name"=>"Aidyn", "age"=>9, "parent_id"=>1)
Child.create("name"=>"Octavian", "age"=>8, "parent_id"=>2)
Child.create("name"=>"Lori", "age"=>13, "parent_id"=>2)
Chore.create("job"=>"Feed the Cats", "description"=>"Refill gravity feeder every morning.", "start_time"=>nil)
Chore.create("job"=>"Trash", "description"=>"Empty all trash cans.", "start_time"=>nil)
Chore.create("job"=>"Bathroom", "description"=>"Clean bathroom toilet, sink and mirrors. Also pick up any trash.", "start_time"=>nil)
Chore.create("job"=>"Dishes", "description"=>"Wash all dishes in sink.", "start_time"=>nil)
Chore.create("job"=>"Rake leaves", "description"=>"Rake all the leaves in the yard and bag them up.", "start_time"=>nil)
Chore.create("job"=>"Clean Room", "description"=>"Pick up any clothes, trash and bootie wipes laying in the floor and put everything back in it's place.", "start_time"=>nil)
Chore.create("job"=>"Clean the Garage", "description"=>"Get all that old and nasty stuff from under the tarps and sweep out the cobwebs.", "start_time"=>nil)
Chore.create("job"=>"Empty Trash", "description"=>"Empty all trash", "start_time"=>nil)
Chore.create("job"=>"Wash Dishes", "description"=>"Wash all dishes.", "start_time"=>nil)
Chore.create("job"=>"Mow Grass", "description"=>"Use the push mower to cut 21 acres of grass and trim all the edges.", "start_time"=>nil)
Appointment.create("start_time"=>Mon, 16 Aug 2021 00:00:00 UTC +00:00, "chore_id"=>2, "frequency"=>"Weekly", "done?"=>false, "end_time"=>Thu, 16 Sep 2021 00:00:00 UTC +00:00) # rubocop:disable Lint/Syntax
Appointment.create("start_time"=>Mon, 16 Aug 2021 00:00:00 UTC +00:00, "chore_id"=>3, "frequency"=>"Weekly", "done?"=>false, "end_time"=>Thu, 16 Sep 2021 00:00:00 UTC +00:00) # rubocop:disable Lint/Syntax
Appointment.create("start_time"=>Mon, 16 Aug 2021 00:00:00 UTC +00:00, "chore_id"=>4, "frequency"=>"Daily", "done?"=>false, "end_time"=>Thu, 16 Sep 2021 00:00:00 UTC +00:00) # rubocop:disable Lint/Syntax
Appointment.create("start_time"=>Mon, 16 Aug 2021 00:00:00 UTC +00:00, "chore_id"=>1, "frequency"=>"Daily", "done?"=>false, "end_time"=>Thu, 16 Sep 2021 00:00:00 UTC +00:00) # rubocop:disable Lint/Syntax
Appointment.create("start_time"=>Sat, 21 Aug 2021 00:00:00 UTC +00:00, "chore_id"=>21, "frequency"=>"Weekly", "done?"=>false, "end_time"=>Sat, 18 Dec 2021 00:00:00 UTC +00:00) # rubocop:disable Lint/Syntax
Appointment.create("start_time"=>Sat, 21 Aug 2021 00:00:00 UTC +00:00, "chore_id"=>25, "frequency"=>"Weekly", "done?"=>false, "end_time"=>Mon, 20 Sep 2021 00:00:00 UTC +00:00) # rubocop:disable Lint/Syntax
Appointment.create("start_time"=>Fri, 20 Aug 2021 00:00:00 UTC +00:00, "chore_id"=>26, "frequency"=>"Weekly", "done?"=>false, "end_time"=>Mon, 20 Sep 2021 00:00:00 UTC +00:00) # rubocop:disable Lint/Syntax
Appointment.create("start_time"=>Fri, 20 Aug 2021 00:00:00 UTC +00:00, "chore_id"=>27, "frequency"=>"Daily", "done?"=>false, "end_time"=>Mon, 20 Sep 2021 00:00:00 UTC +00:00) # rubocop:disable Lint/Syntax
Appointment.create("start_time"=>Fri, 20 Aug 2021 00:00:00 UTC +00:00, "chore_id"=>28, "frequency"=>"Daily", "done?"=>false, "end_time"=>Mon, 20 Sep 2021 00:00:00 UTC +00:00) # rubocop:disable Lint/Syntax
Appointment.create("start_time"=>Fri, 20 Aug 2021 00:00:00 UTC +00:00, "chore_id"=>29, "frequency"=>"Weekly", "done?"=>false, "end_time"=>Wed, 20 Oct 2021 00:00:00 UTC +00:00) # rubocop:disable Lint/Syntax
