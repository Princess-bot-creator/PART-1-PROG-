# RaceDay API Plan

| # | Method | Route | Description | Role | Request Body Example | Response |
|---|---|---|---|---|---|---|
| 1 | POST | /api/auth/register | Create a new runner account | Public | { "full_name": "Thando Nkosi", "email": "thando@race.co.za", "password": "R@ce2026" } | 201 Created + user data, 400 Email already used |
| 2 | POST | /api/auth/login | Sign in and receive access token | Public | { "email": "thando@race.co.za", "password": "R@ce2026" } | 200 OK + JWT, 401 Wrong password |
| 3 | GET | /api/users/me | View my own profile information | Authenticated | None | 200 OK + user profile, 401 No token |
| 4 | PUT | /api/users/me | Edit my personal details | Authenticated | { "full_name": "Thando N. Nkosi" } | 200 OK Profile updated, 401 Not logged in |
| 5 | GET | /api/events | Fetch all upcoming races | Any | None | 200 OK + list of events |
| 6 | GET | /api/events/{id} | Fetch single race with full details | Any | None | 200 OK + event, 404 Race not found |
| 7 | POST | /api/events | Add a new racing event | Organizer | { "title": "Cape Town 10K", "event_date": "2026-10-15", "location": "Green Point" } | 201 Race created, 401 Unauthorized |
| 8 | PUT | /api/events/{id} | Modify an event I created | Organizer | { "location": "Sea Point Promenade" } | 200 Updated, 403 Not your event, 404 Missing |
| 9 | DELETE | /api/events/{id} | Remove an event from system | Admin | None | 204 Deleted, 404 Not found |
| 10 | GET | /api/events/{id}/categories | See all race distances for an event | Any | None | 200 OK + categories, 404 Event missing |
| 11 | POST | /api/events/{id}/categories | Create a distance category for event | Organizer | { "category_name": "5km Fun Walk", "distance_km": 5, "entry_fee": 120 } | 201 Category added, 404 Event missing |
| 12 | DELETE | /api/categories/{id} | Delete a category from event | Organizer | None | 204 Removed, 404 Category missing |
| 13 | POST | /api/enrolments | Join a race category as runner | Participant | { "category_id": 2 } | 201 Successfully joined, 409 Already joined, 401 Please login |
| 14 | GET | /api/enrolments/me | List all races I have joined | Participant | None | 200 OK + my enrolments |
| 15 | GET | /api/categories/{id}/enrolments | See all runners in a category | Organizer | None | 200 OK + runners list, 403 Not allowed |
| 16 | POST | /api/results | Record finishing time for runner | Organizer | { "enrolment_id": 1, "finish_time": "00:32:10", "position": 5 } | 201 Result saved, 404 Enrolment missing |
| 17 | GET | /api/events/{id}/results | View final results for whole event | Any | None | 200 OK + results sorted by position |
