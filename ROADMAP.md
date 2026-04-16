# Chorbee Roadmap

A running record of what has been built, fixed, and what's planned next.

---

## Foundation & Setup

- [x] Initial Rails app scaffolded with Parent, Child, Chore, Appointment models
- [x] Many-to-many relationship between Children and Chores (join table `children_chores`)
- [x] Devise authentication for Parent accounts
- [x] PostgreSQL database with Heroku deployment (`Procfile`, `app.json`)
- [x] RSpec test suite with FactoryBot and Faker
- [x] `CLAUDE.md` created documenting architecture, setup, and key commands

---

## Upgrades

- [x] Upgraded Ruby 2.6.6 → 3.2.4
- [x] Upgraded Rails 5.0.7.2 → 7.2
- [x] Replaced deprecated `turbolinks` gem with `turbo-rails`
- [x] Replaced `sass-rails` / LibSass with `dartsass-rails` (Dart Sass)
- [x] Replaced `uglifier` JS compressor (removed, no longer needed)
- [x] Replaced `coffee-rails` and all `.coffee` files (removed)
- [x] Upgraded `pg` 0.x → 1.5 (EOL upgrade)
- [x] Upgraded `puma` 3.x → 6.x
- [x] Upgraded `devise` → 4.9 (Rails 7 support)
- [x] Upgraded `simple_calendar` 2.x → 3.x
- [x] Added `importmap-rails` and `stimulus-rails`
- [x] Fixed Sprockets manifest — removed `DoubleLinkError` caused by double-linking `application.css`
- [x] Fixed Turbo ESM/Sprockets conflict — moved Turbo to importmap, kept Bootstrap/Chartkick in Sprockets bundle

---

## Bug Fixes

- [x] `Child#pluck` — removed infinite-recursion method override (`def pluck(*args); self.pluck(*args); end`)
- [x] `Child#each`, `Chore#each`, `Appointment#each` — removed empty stubs that broke enumerable iteration
- [x] `Chore` validation — fixed `value.to_s.nil?` (always false) → `value.empty?` in `validates_each :child_ids`
- [x] `Appointment#frequency` comparisons — fixed `===` → `==` (case equality vs. string equality)
- [x] `AppointmentsController` — fixed `params.fetch(start_date, ...)` → `params.fetch(:start_date, ...)` (missing symbol colon)
- [x] `AppointmentsController` — fixed `rescue_from StandardError` (too broad) → `rescue_from NoMethodError`
- [x] `ChildrenController` — fixed `Child.all` → `current_parent.children` (authorization scope)
- [x] `ChildrenController` — fixed `Child.find(params[:id])` → scoped to `current_parent.children`
- [x] `ChildrenController` — removed `parent_id` from permitted params (prevented cross-parent assignment)
- [x] `ChoresController` — fixed `Chore.all` → `current_parent.chores`
- [x] `AppointmentsController#set_appointment` — scoped to `current_parent.appointments`
- [x] Routes — fixed `root to: 'parents#login'` (non-existent action) → `root to: 'parents#index'`
- [x] Devise secret key — moved hardcoded value to `ENV['DEVISE_SECRET_KEY']`
- [x] Seed data — replaced real email addresses with placeholder values
- [x] RSpec factories — fixed `f.done?` attribute after column rename to `completed`
- [x] `data: { confirm: }` → `data: { turbo_confirm: }` across all delete/confirm buttons (Turbo compatibility)
- [x] Sign-out link — replaced `link_to method: :delete` with `button_to` (required for Turbo DELETE requests)
- [x] Graphs not rendering — removed stale `window.addEventListener('load', ...)` handler referencing removed CSS classes, which was throwing `TypeError` and blocking Chartkick initialization
- [x] `Uncaught SyntaxError: Unexpected token 'export'` — `turbo-rails` 2.x ships ESM only; removed `//= require turbo` from Sprockets bundle

---

## Features

- [x] Calendar view on Schedule page (weekly calendar via `simple_calendar`)
- [x] Mark appointments complete / incomplete (toggle with visual status indicator)
- [x] Allowance amount per chore (`allowance_amount` decimal field)
- [x] Allowance balance per child (`balance` decimal field, auto-credited on completion)
- [x] Dashboard with stat cards: children count, chores count, total balance owed, pending chores
- [x] Dashboard chart: chores per child (`column_chart` via Chartkick)

---

## UI / UX

- [x] Consolidated 4 separate layouts (child, chore, appointment, application) into a single unified layout
- [x] New navbar design with Chorbee branding and gold accent color (`#f5c518`)
- [x] Bootstrap 5 responsive table layouts across all index views
- [x] Accessible navbar — replaced `<a href="#">` dropdown toggles with `<button>` elements
- [x] ARIA attributes on nav (`aria-label`, `aria-haspopup`, `aria-expanded`)
- [x] Focus-visible keyboard navigation styles
- [x] Bootstrap 5 dismissible flash alerts (success/warning)
- [x] Sticky footer with welcome message for signed-in parents
- [x] Responsive layout using Bootstrap grid (mobile, tablet, desktop)
- [x] Google Fonts — Lato (body) + Yellowtail (brand)

---

## Planned

- [ ] Pay out / reset a child's balance (mark allowance as paid)
- [ ] Per-child chore completion history / activity log
- [ ] Recurring appointment auto-reset (mark pending again at the start of each week/day)
- [ ] Notifications or reminders for pending chores
- [ ] Child-facing view (read-only dashboard a child can see their own chores and balance)
- [ ] Chore image customization (upload or choose from preset icon set)
- [ ] Sort and filter on index tables (by status, frequency, allowance amount)
- [ ] Drag-and-drop chore assignment from chore list to child
- [ ] Export chore/allowance history to CSV
- [ ] Dark mode toggle
