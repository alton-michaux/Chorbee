# Chorbee

A chores management app for parents and kids.

Chorbee lets parents keep track of their children's chores. The current version allows parents to create children, assign chores to each child, and schedule recurring appointments with a calendar view rendered on a daily or weekly basis.

**Planned for future versions:** marking chores complete and tracking allowance per child.

---

## Tech Stack

- **Ruby** 3.2
- **Rails** 7.1
- **Database** PostgreSQL
- **Auth** Devise
- **Frontend** Bootstrap 5, Turbo (Hotwire), importmap-rails
- **Calendar** simple_calendar + ice_cube (via recurring_select)
- **Charts** Chartkick

---

## Setup

### Prerequisites

- Ruby 3.2.x
- PostgreSQL
- Bundler 2.x

### Install and Run

```bash
bundle install
rails db:create db:migrate db:seed
rails server
```

Visit `http://localhost:3000` and sign up as a parent.

### Environment Variables

| Variable | Description |
|----------|-------------|
| `DATABASE_URL` | PostgreSQL connection string (production) |
| `DEVISE_SECRET_KEY` | Secret key for Devise tokens |
| `SECRET_KEY_BASE` | Rails secret key base (production) |

---

## Testing

**Framework:** RSpec  
**Number of tests:** 69  
**Types:** Model specs and request/controller specs

```bash
bundle exec rspec                    # Full suite
bundle exec rspec spec/models/       # Model specs only
bundle exec rspec spec/requests/     # Request specs only
```

---

## Key Gems

| Gem | Purpose |
|-----|---------|
| `devise` | Parent authentication (sign up, sign in, password reset) |
| `simple_calendar` | Calendar rendering on the appointments index page |
| `recurring_select` | UI modal for selecting recurring event schedules |
| `ice_cube` | Recurring event logic (dependency of recurring_select) |
| `chartkick` | Productivity charts and graphs |
| `turbo-rails` | Hotwire Turbo for fast page navigation |
| `bootstrap` | CSS framework for styling and responsive UI |

---

## Deployment

Hosted on Heroku with a PostgreSQL addon.

```bash
# After deploying
heroku run rails db:migrate
heroku run rails db:seed
```

See `Procfile` and `app.json` for Heroku configuration.
