# Flutter LMS Mobile App

A Flutter Learning Management System (LMS) mobile application with three role-based interfaces: **Student**, **Instructor** and **Admin**. The app connects to the supplied Flutter LMS backend, which runs in a Docker container.

## Status

Work in progress (10-day implementation plan).

- [x] Day 1: Project setup and Login UI
- [ ] Day 2: Navigation, forms, validation, theme
- [ ] Day 3: Splash, onboarding, role dashboards
- [ ] Day 4: Docker backend and core API setup
- [ ] Day 5: Authentication and profiles
- [ ] Day 6: Courses, enrollment, lessons, progress
- [ ] Day 7: Quizzes, assignments, reviews, notifications
- [ ] Day 8: Instructor features
- [ ] Day 9: Admin features, state management, navigation
- [ ] Day 10: Responsive design, testing, final submission

## Prerequisites

- Flutter SDK (stable) and Dart SDK
- Android Studio (Android SDK) with an emulator or a real Android phone
- VS Code or Android Studio
- Docker Desktop (running) and a Docker Hub account
- Postman Desktop
- Git and a GitHub account

## Backend Setup (Docker)

The backend is provided as a prepared Docker image. No Node.js or MongoDB setup is needed.

```bash
docker login
docker pull dckuma/flutter-lms-backend:v1.0.0
docker run -d --name flutter-lms-backend --restart unless-stopped -p 5000:5000 dckuma/flutter-lms-backend:v1.0.0
```

Verify the container:

```bash
docker ps
docker inspect --format "{{.State.Health.Status}}" flutter-lms-backend
docker logs -f flutter-lms-backend
```

Manage the container:

```bash
docker stop flutter-lms-backend
docker start flutter-lms-backend
docker restart flutter-lms-backend
docker rm -f flutter-lms-backend
```

Do not use `--env-file`; the configuration is already inside the image.

## Base URL Notes

| Client | Base URL |
|---|---|
| Postman (Windows) | `http://localhost:5000` |
| Android Emulator | `http://10.0.2.2:5000` |
| Real Android phone | `http://<laptop-IP>:5000` (same Wi-Fi, port 5000 allowed in firewall) |
| Chrome (web) | `http://localhost:5000` |

- Do not add `/api/v1` to the Flutter `baseUrl`; the endpoint paths already include it.
- Cleartext HTTP is for local development only. Production should use HTTPS.

## Postman Setup

1. Import the Flutter LMS Backend API Postman collection JSON.
2. Create an environment (e.g. `LMS Local`) and set `baseUrl` to `http://localhost:5000`.
3. Set collection variables such as `studentEmail` and `studentPassword`.
4. Run register, verify and login requests first so tokens are stored.

## Run the App

```bash
flutter pub get
flutter run
```

Use `flutter run -d chrome` to test the UI in a browser.

## Project Structure

```
lib/
  core/
  features/
    auth/
      screens/
      widgets/
  main.dart
```

## Git Commit Standard

Conventional Commits: `type(scope): short description`
Types: feat, fix, docs, style, refactor, perf, test, chore, config, ci, build.
Use lowercase, present tense, and no full stop at the end.

## Project Materials

- Backend API Report: https://drive.google.com/file/d/1Ld_IvM_4GHhoaakGetEbuWAv5LH_aCf3/view?usp=sharing
- Mobile API Integration Guide: https://drive.google.com/file/d/18kwcNqfnkxLb0TZER_TNbocSUFs4Acl2/view?usp=sharing
- Postman Collection JSON: https://drive.google.com/file/d/16DjEWlX0f889g6Njln8Iy38kxUlBXKc/view?usp=sharing

## Known Limitations

To be updated as development progresses.