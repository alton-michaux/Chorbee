# Chorbee — Claude Code Guide

## Project Overview

Chorbee is a household chores management app for parents and children. Parents (admins) can create children, assign chores to them, and schedule recurring appointments. The calendar view shows when chores are due based on daily or weekly schedules.

**Future features planned:** marking chores complete, allowance/monetary tracking per child.

---

## Tech Stack

- **Ruby** 3.2
- **Rails** 7.1
- **Database** PostgreSQL
- **Auth** Devise (parent accounts only)
- **Frontend** Bootstrap 5, importmap-rails, turbo-rails
- **Calendar** simple_calendar 3.x + ice_cube (via recurring_select)
- **Charts** Chartkick
- **Testing** RSpec + FactoryBot + Faker

---

## Setup

### Prerequisites

- Ruby 3.2.x (`rbenv install 3.2.4` or `rvm install 3.2.4`)
- PostgreSQL running locally
- Bundler 2.x

### Environment Variables

Copy `.env.example` to `.env` and fill in values (managed via `dotenv-rails` in dev/test):

| Variable | Description |
|----------|-------------|
| `DATABASE_URL` | PostgreSQL connection string (production) |
| `DEVISE_SECRET_KEY` | Secret key for Devise token generation |
| `SECRET_KEY_BASE` | Rails secret key base (production) |

### First-time Setup

```bash
bundle install
rails db:create db:migrate db:seed
rails server
```

---

## Key Commands

```bash
bundle exec rspec          # Run full test suite (69 specs)
rails server               # Start development server at localhost:3000
rails routes               # List all routes
rails db:migrate           # Run pending migrations
rails db:seed              # Load seed data
rails credentials:edit     # Edit encrypted credentials (requires EDITOR env var)
```

---

## Data Model

The core relationship chain: **Parent → Children → Chores → Appointments**

```
Parent
  has_many :children
  has_many :chores, through: :children
  has_many :appointments, through: :chores

Child
  belongs_to :parent
  has_and_belongs_to_many :chores
  has_many :appointments, through: :chores

Chore
  has_and_belongs_to_many :children
  has_one :appointment

Appointment
  belongs_to :chore
  (uses ice_cube for recurrence rules: Daily or Weekly)
```

### Database Tables
- `parents` — Devise-managed auth, `name`, `email`
- `children` — `name`, `age`, `parent_id`
- `chores` — `job`, `description`
- `children_chores` — join table (no primary key)
- `appointments` — `start_time`, `end_time`, `frequency`, `done?`, `chore_id`

---

## Authorization

All routes require a logged-in parent (`authenticate_parent!` in `ApplicationController`). Controllers scope all queries to `current_parent` — children and appointments are filtered to the current parent only. Chores are accessible through the parent's children relationship.

---

## Deployment

Deployed on Heroku with:
- `heroku-postgresql` addon
- Ruby + Node buildpacks (see `app.json`)
- `Procfile`: `web: bundle exec puma -C config/puma.rb`

Post-deploy: `rails db:migrate && rails db:seed`

---

## Testing

```bash
bundle exec rspec                    # All specs
bundle exec rspec spec/models/       # Model specs only
bundle exec rspec spec/requests/     # Request/controller specs only
```

Uses `database_cleaner-active_record` for test isolation and `simplecov` for coverage reporting (output in `coverage/`).
