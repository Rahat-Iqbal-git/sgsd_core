# SGSD-Core — Secure Geo-Sync Dispatch Core

This is a take-home assessment project, built in about two days. It's a small
Flutter app for a delivery/field agent: see your list of deliveries, tap one
to get a driving route and a live map, and have your GPS breadcrumbs recorded
and synced in the background — even when you lose signal.

It's Android-only. Not because iOS was hard, but because I only had a Linux
machine to test on, and shipping untested `Info.plist`/Swift felt worse than
just saying so. See [Known limitations](#known-limitations--future-work).

---

## What it actually does

- **Delivery list** — pulls "dispatch items" from a mock API and shows them
  as a list, with a status badge (Pending / In progress / Delivered).
- **Works offline** — the list is read from a local encrypted database, not
  fetched live every time. Pull to refresh syncs it, but you'll see your data
  immediately even with no signal, because it's already on disk.
- **Tap a delivery → live map** — shows a driving route to the destination
  (blue line) and your current GPS position (green dot), rendered on
  OpenStreetMap tiles inside a WebView.
- **Address labels** — coordinates get turned into readable addresses
  (reverse geocoding), and cached so we're not hammering the geocoding
  service every time.
- **Background location tracking** — a toggle in the app bar starts/stops
  GPS tracking. It's motion-aware: sitting still turns GPS off and just
  listens to the accelerometer; once you start moving it turns GPS back on,
  and it records more often the faster you're moving. This is the "don't
  drain the battery" requirement.
- **Offline-safe sync** — GPS points are buffered in memory, written to disk
  in small batches (not one write per point), and pushed to the server when
  you're online. If you're offline, they just queue up and retry with
  exponential backoff once you're back.

## What it deliberately does *not* do

- No login/auth screen — the mock API just needs a bearer token, not a
  real user session.
- No push notifications, no multi-device sync, no admin dashboard. Wasn't
  asked for, so it's not here.

---

## Getting started

You'll need Flutter `3.44.x` and an Android device or emulator (see
[Known limitations](#known-limitations--future-work) for why not iOS).

### 1. Set up your environment file

Secrets aren't committed. Copy the example and fill in your own values:

```sh
cp env/dev.example.json env/dev.json
```

```json
{
  "GOREST_TOKEN": "demo-token",
  "ORS_API_KEY": "your-openrouteservice-api-key"
}
```

- `GOREST_TOKEN` — any non-empty string works against the mock API
  (`demo-token` is fine). It's not a real secret.
- `ORS_API_KEY` — this one's real. Get a free key at
  [openrouteservice.org](https://openrouteservice.org/dev/#/signup) — without
  it, the driving-route map won't load (you'll get a 401).

Do the same for `env/staging.json` and `env/prod.json` if you plan to run
those flavors.

### 2. Run it

```sh
# Development
flutter run --flavor development -t lib/main_development.dart --dart-define-from-file=env/dev.json

# Staging
flutter run --flavor staging -t lib/main_staging.dart --dart-define-from-file=env/staging.json

# Production
flutter run --flavor production -t lib/main_production.dart --dart-define-from-file=env/prod.json
```

If you're using VS Code or Android Studio, the launch configurations do this
for you — just pick a flavor and hit run.

---

## How it's put together

Feature-first, clean-ish architecture. The short version:

```
lib/
  app/          # app shell, routes
  core/         # shared stuff: failures, env config, geo types
  features/
    dispatch/   # the delivery list
    routing/    # the map + driving route
    tracking/   # the GPS on/off toggle
  services/
    location/   # the motion-aware GPS engine
    sync/       # buffering + batching + offline retry
    db/         # encrypted local database
```

Each feature is split into three layers that only talk to each other in one
direction: **presentation → domain ← data**.

- `domain` is plain Dart — no Flutter, no database, no network code. Just
  business rules and interfaces. If this layer imports `flutter`, that's a bug.
- `data` implements those interfaces — talks to the API, talks to the
  database, and converts raw JSON/rows into clean domain objects.
- `presentation` is the UI. It never fetches data directly — it just
  subscribes to a stream from the database and rebuilds when something
  changes (so the UI always reflects local disk, not "whatever the last
  network call happened to return").

State management is Bloc/Cubit (it shipped with the starter template, and
splitting state management further wasn't worth the time).

## Security, briefly

The local database is encrypted (SQLCipher), and the encryption key isn't
hardcoded anywhere. Here's the chain:

1. A random key is generated once and stored in the OS's secure storage
   (Android Keystore).
2. That key gets run through PBKDF2 (a slow, intentionally-expensive hashing
   function) tens of thousands of times to derive the actual database key.
3. All of that — plus all database reads/writes — happens on a background
   thread/isolate, so it never blocks the UI, even under heavy sync activity.

## The APIs it talks to

- **GoRest** (mock API) — only has a `/users` resource. There's no real
  "dispatch task" or "logs" endpoint. So: a GoRest user *is* the delivery
  (their name/email is the recipient), and instead of a dedicated log
  endpoint, the sync engine's batched GPS logs are pushed as `PATCH
  /users/:id` calls. The batching, offline queue, and retry-with-backoff are
  all real and fully working — it's just riding on the closest endpoint the
  mock API actually offers, since there isn't a better one.
- **OpenRouteService** — real driving directions, needs the API key above.
- **Nominatim** — reverse geocoding only (coordinates → address). It's
  rate-limited to 1 request/second, so results are cached locally instead of
  re-requesting the same spot repeatedly.

---

## Testing

```sh
flutter test --coverage
```

Coverage focuses on the parts that are actually risky to get wrong — backoff
math, the velocity/motion state machine, key derivation, and repositories —
rather than chasing 100% on things like static widget layout.

```sh
flutter analyze                                    # must come back clean
dart format --set-exit-if-changed .
dart run build_runner build --delete-conflicting-outputs   # after touching DI/drift/freezed code
```

---

## Known limitations / Future work

Being upfront about what's rough or missing, rather than pretending it isn't:

- **iOS isn't built.** Background location modes, `Info.plist` entries, and
  a background activity session would all be needed, and I had no way to
  test any of it. Writing it blind felt worse than leaving it out.
- **Delivery status is currently read-only in the UI.** It syncs in from the
  mock API and is stored locally, but there's no "Mark as started / Mark as
  delivered" button wired up yet — the repository is already shaped to
  support it (status is meant to become locally-owned once an agent acts on
  it), the UI action just isn't there yet.
- **Destination coordinates are synthetic.** The mock API has no lat/lng, so
  each user is mapped to a fixed, made-up coordinate. It's stable across
  refreshes (same user always gets the same point), just not real.
- **Map tiles need network.** The map's JS/CSS is bundled locally so the app
  never depends on fetching its own map code, but the OpenStreetMap tile
  images themselves still need a connection — no offline tile cache.
- Nice-to-haves that were deliberately left out to protect time for the
  location/sync engines: retry-queue UI, delivery search/filter, dark-mode
  polish beyond the theme defaults.

---

## Releases

Pushing a version tag (`git tag v1.0.0 && git push origin v1.0.0`) triggers
`.github/workflows/release.yaml`: it builds a release APK and attaches it to
a new GitHub Release. You can also trigger it manually from the Actions tab
("release" workflow → "Run workflow") to build any flavor without tagging —
useful for handing a reviewer a build without committing to a version number.

That APK is **debug-signed**, not store-signed. It uses a throwaway keystore
generated fresh in CI (reusing the env-var-driven signing config already in
`android/app/build.gradle.kts`). It installs fine on a device for demoing,
but isn't what you'd use to publish anywhere real. To make it a properly
signed release instead: generate a keystore (`keytool -genkeypair -v
-keystore release.keystore -alias sgsd -keyalg RSA -keysize 2048 -validity
10000`), base64-encode it, and add it plus the alias/passwords as repo
secrets (`ANDROID_KEYSTORE_BASE64`, `ANDROID_KEYSTORE_ALIAS`,
`ANDROID_KEYSTORE_PASSWORD`, `ANDROID_KEYSTORE_PRIVATE_KEY_PASSWORD`) — the
build.gradle.kts signing config already knows how to pick those up.

## Housekeeping

- `dart run bloc_tools:bloc lint .` — checks Bloc/Cubit usage against
  [bloc_lint](https://pub.dev/packages/bloc_lint) rules.
- Translations live in `lib/l10n/arb/` (ARB files) — run
  `flutter gen-l10n --arb-dir="lib/l10n/arb"` after editing them, or just
  `flutter run`, which regenerates them automatically.
- CI runs analyze/format/test/lint on every PR via GitHub Actions
  (`.github/workflows/`), plus spell-check and license-compliance checks.
