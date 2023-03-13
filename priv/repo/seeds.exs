# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Tracker.Repo.insert!(%Tracker.SomeSchema{})
# delete from sets;
# delete from exercise;
# delete from workout;
# delete from results;
# delete from users;
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Tracker.Repo
alias Tracker.Accounts
alias Tracker.Training.{Exercise, Results, Sets, Workout}

{ _, user_1} = Accounts.register_user(%{email: "bitofmarvin@gmail.com", password: "Th1s1sMyP@ssw0rd!"})
{ _, user_2} = Accounts.register_user(%{email: "tattoodude91@gmail.com", password: "Th1s1sMyP@ssw0rd!"})

bicep_curl = Repo.insert!(%Exercise{body_part: "bicep long head", name: "seated bicep curl", equipment: "dumbbells", description: "Incline bench to a 60 degree angle. Proceed to sit with back against bench with arms perpendicular to the floor. Curl up making sure your arms above elbo don't move."})
preacher_curl = Repo.insert!(%Exercise{body_part: "bicep short head", name: "preacher curl", equipment: "dumbbells", description: "Incline bench to a 60 degree angle. Stand in front of the bench and lay your arms on the bench. Proceed to curl up. "})
bench_press = Repo.insert!(%Exercise{body_part: "chest", name: "bench press", equipment: "barbell", description: "Lay on flat bench, pinch shoulders together, and lift barbell up keeping forearms perpendicular to the floor."})
cable_flys = Repo.insert!(%Exercise{body_part: "chest", name: "cable flys", equipment: "cable machine", description: "Set cables to match chest height. Stand with machine to your back with arms out in a T pose and pinch your shoulders together. Keeping your arms slightly bend, swing them in front of you clapping your hands together. "})

day1 = Repo.insert!(%Workout{workout_type: "arms", duration: 30.0, inserted_at: ~N[2023-03-03 21:23:19], updated_at: ~N[2023-03-03 21:23:19], user_id: user_1.id})
day2 = Repo.insert!(%Workout{workout_type: "chest", duration: 35.0, inserted_at: ~N[2023-03-04 21:23:19], updated_at: ~N[2023-03-04 21:23:19], user_id: user_1.id})

Repo.insert!(%Sets{workout_id: day1.id, exercise_id: bicep_curl.id, max_weight: 35, num_sets: 5})
Repo.insert!(%Sets{workout_id: day1.id, exercise_id: preacher_curl.id, max_weight: 25, num_sets: 6})

Repo.insert!(%Sets{workout_id: day2.id, exercise_id: bench_press.id, max_weight: 180, num_sets: 4})
Repo.insert!(%Sets{workout_id: day2.id, exercise_id: cable_flys.id, max_weight: 40, num_sets: 6})

Repo.insert!(%Results{waist: 40.5, arms: 14.5, weight: 170.0, inserted_at: ~N[2023-03-03 21:23:19], updated_at: ~N[2023-03-03 21:23:19], user_id: user_1.id })
Repo.insert!(%Results{waist: 40.0, arms: 15.0, weight: 165.0, inserted_at: ~N[2023-03-04 21:23:19], updated_at: ~N[2023-03-04 21:23:19], user_id: user_1.id })
Repo.insert!(%Results{waist: 40.0, arms: 15.0, weight: 164.0, inserted_at: ~N[2023-03-05 21:23:19], updated_at: ~N[2023-03-05 21:23:19], user_id: user_1.id })
Repo.insert!(%Results{waist: 39.5, arms: 15.0, weight: 162.0, inserted_at: ~N[2023-03-06 21:23:19], updated_at: ~N[2023-03-06 21:23:19], user_id: user_1.id })
Repo.insert!(%Results{waist: 39.0, arms: 15.5, weight: 160.0, inserted_at: ~N[2023-03-07 21:23:19], updated_at: ~N[2023-03-07 21:23:19], user_id: user_1.id })

day1 = Repo.insert!(%Workout{workout_type: "arms", duration: 40.0, inserted_at: ~N[2023-03-03 21:23:19], updated_at: ~N[2023-03-03 21:23:19], user_id: user_2.id })
day2 = Repo.insert!(%Workout{workout_type: "chest", duration: 45.0, inserted_at: ~N[2023-03-04 21:23:19], updated_at: ~N[2023-03-04 21:23:19], user_id: user_2.id })

Repo.insert!(%Sets{workout_id: day1.id, exercise_id: bicep_curl.id, max_weight: 40, num_sets: 4})
Repo.insert!(%Sets{workout_id: day1.id, exercise_id: preacher_curl.id, max_weight: 35, num_sets: 8})

Repo.insert!(%Sets{workout_id: day2.id, exercise_id: bench_press.id, max_weight: 200, num_sets: 5})
Repo.insert!(%Sets{workout_id: day2.id, exercise_id: cable_flys.id, max_weight: 50, num_sets: 7})

Repo.insert!(%Results{waist: 60.5, arms: 11.0, weight: 190.0, inserted_at: ~N[2023-03-03 21:23:19], updated_at: ~N[2023-03-03 21:23:19], user_id: user_2.id })
Repo.insert!(%Results{waist: 60.0, arms: 12.0, weight: 195.0, inserted_at: ~N[2023-03-04 21:23:19], updated_at: ~N[2023-03-04 21:23:19], user_id: user_2.id })
Repo.insert!(%Results{waist: 60.0, arms: 13.0, weight: 194.0, inserted_at: ~N[2023-03-05 21:23:19], updated_at: ~N[2023-03-05 21:23:19], user_id: user_2.id })
Repo.insert!(%Results{waist: 60.5, arms: 14.0, weight: 192.0, inserted_at: ~N[2023-03-06 21:23:19], updated_at: ~N[2023-03-06 21:23:19], user_id: user_2.id })
Repo.insert!(%Results{waist: 59.0, arms: 15.5, weight: 190.0, inserted_at: ~N[2023-03-07 21:23:19], updated_at: ~N[2023-03-07 21:23:19], user_id: user_2.id })
