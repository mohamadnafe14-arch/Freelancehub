# FreelanceHub — Project Guidelines

## 1. Project Overview

**Project Name:** FreelanceHub  
**Tagline:** Your freelance business, organized.

FreelanceHub is a freelancer management platform designed for solo freelancers.

The application helps users manage:
- Clients.
- Projects.
- Tasks.
- Income and payments.
- Deadlines.
- Notifications.
- Business activity and analytics.

### Supported Platforms
- Flutter Web (primary desktop experience).
- Android.
- iOS compatibility should be considered for future support.

### Localization
- English is the primary language.
- Keep the application ready for future Arabic localization and RTL support.
- Never hardcode user-facing strings directly inside widgets. Use Flutter localization resources.

### Important Existing Setup
The Flutter project has already been created.

Firebase is already connected. The currently used Firebase project is named `ecommerce`.

Supabase is also connected.

**Important instructions:**
- Do not recreate the Flutter project.
- Do not rename, replace, or reconfigure the existing Firebase project without explicit approval.
- Do not assume that the Firebase project name is the same as its project ID.
- Inspect existing Firebase and Supabase configuration before making changes.
- Preserve working configurations.
- Do not overwrite existing configuration files blindly.
- Do not initialize Git, create a remote repository, or push anything unless explicitly requested.

---

## 2. Core Development Principles

Follow these principles throughout the project:

1. Write clean, readable, maintainable code.
2. Prefer simple solutions over unnecessary abstractions.
3. Avoid overengineering.
4. Do not introduce packages unless they solve a real problem.
5. Keep responsibilities clear.
6. Avoid duplicated logic.
7. Use strong typing and null safety.
8. Handle errors explicitly.
9. Write tests for important application behavior.
10. Never implement functionality using hardcoded fake data when the feature is expected to use real backend data.
11. Do not make unrelated changes while implementing a feature.
12. Follow existing project conventions before introducing new ones.

Before implementing a feature, inspect the relevant existing files and understand their responsibilities.

Do not generate large amounts of boilerplate or empty folders without a clear implementation need.

---

## 3. Technology Stack

Use the following stack unless a technical limitation requires discussion first.

### Framework and Language
- Flutter.
- Dart.
- Material 3.

### State Management
- flutter_bloc.
- Cubit.
- Equatable.

### Functional Error Handling
- fpdart.
- Either.

### Dependency Injection
- GetIt.

### Navigation
- GoRouter.

### Backend
- Firebase Authentication.
- Cloud Firestore.
- Firebase Cloud Messaging.

### File Storage
- Supabase Storage.

### Utilities
- intl.
- file_picker.
- flutter_localizations.

### Testing
- flutter_test.
- bloc_test.
- mocktail.

Before adding a new dependency:
- Check whether the functionality already exists in the Flutter SDK or current dependencies.
- Check compatibility with the current Flutter and Dart SDK.
- Explain why the dependency is needed.
- Avoid adding dependencies for trivial functionality.

Do not add Dio unless an external REST API is introduced that genuinely requires it. Firebase and Supabase SDKs are sufficient for their current responsibilities.

---

## 4. Architecture

Use **MVVM with Cubit as the ViewModel**.

Do not introduce a Domain Layer.

Keep the architecture feature-based.

### Main Structure

```text
lib/
├── core/
│   ├── config/
│   ├── constants/
│   ├── errors/
│   ├── extensions/
│   ├── routing/
│   ├── services/
│   ├── theme/
│   ├── utils/
│   └── widgets/
│
├── features/
│   ├── authentication/
│   │   ├── data/
│   │   │   ├── models/
│   │   │   └── repositories/
│   │   └── presentation/
│   │       ├── cubit/
│   │       ├── views/
│   │       └── widgets/
│   │
│   ├── clients/
│   │   ├── data/
│   │   │   ├── models/
│   │   │   └── repositories/
│   │   └── presentation/
│   │       ├── cubit/
│   │       ├── views/
│   │       └── widgets/
│   │
│   ├── projects/
│   ├── tasks/
│   ├── finance/
│   ├── dashboard/
│   ├── notifications/
│   └── profile/
│
├── firebase_options.dart
└── main.dart
```

Create each feature's folders incrementally when needed.

### Architectural Responsibilities

**Presentation**
- Views.
- Widgets.
- Cubits.
- Cubit states.
- UI-related logic.

**Data**
- Models.
- Repository contracts when useful.
- Repository implementations.
- Data mapping.
- Backend communication.

**Core**
- Shared infrastructure.
- App-wide configuration.
- Theme.
- Routing.
- Common widgets.
- Error handling.
- Shared utilities.
- Shared models only when genuinely reused.

### Important Rules

- Each feature owns its own data and presentation layers.
- Do not create a shared data layer for all features.
- Do not put feature-specific models inside Core.
- Core may contain genuinely shared models.
- Do not create a Domain Layer.
- Do not create Use Cases for every repository method.
- Do not introduce unnecessary managers, factories, services, or abstraction layers.
- A repository should have a clear responsibility.
- Separate data sources only when doing so provides meaningful separation or testability.

Avoid circular dependencies between features.

A feature should not directly depend on another feature's internal implementation. Use a clear public interface or shared functionality when cross-feature communication is necessary.

---

## 5. Models

Models must be explicit, predictable, and easy to understand.

Every model should:
- Have clearly typed properties.
- Use `final` fields by default.
- Have a clear constructor.
- Handle nullable fields correctly.
- Implement `fromJson` and `toJson` when serialization is needed.
- Support Firestore serialization when required.
- Use consistent date and timestamp handling.
- Implement Equatable when value equality is useful.
- Avoid storing unnecessary duplicated data.

Example:

```dart
class ClientModel extends Equatable {
  const ClientModel({
    required this.id,
    required this.name,
    this.email,
    this.phone,
    this.company,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
    this.isArchived = false,
  });

  final String id;
  final String name;
  final String? email;
  final String? phone;
  final String? company;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isArchived;

  factory ClientModel.fromJson(Map<String, dynamic> json) {
    return ClientModel(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      company: json['company'] as String?,
      notes: json['notes'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      isArchived: json['isArchived'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'company': company,
      'notes': notes,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'isArchived': isArchived,
    };
  }

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        phone,
        company,
        notes,
        createdAt,
        updatedAt,
        isArchived,
      ];
}
```

This is an illustrative example. Adapt timestamp serialization to the actual Firestore representation.

### Model Rules

- Do not use `dynamic` when a proper type is available.
- Do not use `Map<String, dynamic>` as a replacement for proper application models.
- Do not put UI logic inside models.
- Do not create duplicate models representing exactly the same data without a real reason.
- Avoid unnecessary serialization packages or code generation for simple models.
- Validate required fields and handle missing or malformed backend values safely.
- Keep Firestore document IDs explicit and map them correctly.

---

## 6. Error Handling — Either and Failure

Use `fpdart` and `Either` for operations that can fail.

The standard result type is:

```dart
typedef Result<T> = Either<Failure, T>;
```

For asynchronous repository operations:

```dart
Future<Result<T>>
```

### Failure Architecture

Create a general Failure class under:

```text
core/errors/failure.dart
```

Example:

```dart
abstract class Failure {
  const Failure(this.message);

  final String message;
}
```

Create specialized failures under:

```text
core/errors/
├── failure.dart
├── auth_failure.dart
├── firestore_failure.dart
├── storage_failure.dart
└── network_failure.dart
```

Only create specialized failure classes when there are meaningful errors to represent.

Examples:

```dart
class AuthFailure extends Failure {
  const AuthFailure(super.message);
}

class FirestoreFailure extends Failure {
  const FirestoreFailure(super.message);
}

class StorageFailure extends Failure {
  const StorageFailure(super.message);
}
```

Add specific subclasses when necessary:

```dart
class InvalidCredentialsFailure extends AuthFailure {
  const InvalidCredentialsFailure()
      : super('Invalid email or password.');
}
```

### Error Handling Rules

- Every expected backend or SDK exception must be mapped to an appropriate Failure.
- Do not expose raw Firebase or Supabase exceptions to the presentation layer.
- Preserve useful error information without exposing sensitive backend details.
- Do not silently swallow exceptions.
- Do not return a fake success when an operation fails.
- Do not use `null` to represent failure.
- Do not throw exceptions for normal business failures.
- Use `Either.left` for failure and `Either.right` for success.

Example repository behavior:

```dart
Future<Result<ClientModel>> getClient(String id) async {
  try {
    final client = await remoteDataSource.getClient(id);

    return Right(client);
  } on FirebaseException catch (e) {
    return Left(
      FirestoreFailure(mapFirestoreError(e)),
    );
  } catch (e) {
    return Left(
      const FirestoreFailure('Something went wrong.'),
    );
  }
}
```

The example is illustrative. Implement error mapping based on actual SDK exceptions and operations.

### Exception Mapping

Handle known exceptions explicitly.

Examples:
- FirebaseAuthException.
- FirebaseException.
- StorageException.
- SocketException where applicable.
- FormatException for malformed data when appropriate.

Avoid one generic exception handler that maps every possible problem to the same failure.

Unexpected exceptions should be logged safely in development and reported through an appropriate error-reporting mechanism when one is introduced.

Never log passwords, tokens, secret keys, or sensitive user information.

---

## 7. Repository Pattern

Repositories are responsible for communicating with data sources and returning application-friendly results.

A repository should:
- Expose clear methods.
- Return `Future<Result<T>>` for fallible operations.
- Map SDK exceptions to Failure objects.
- Map backend data to models.
- Avoid presentation logic.
- Avoid returning raw SDK snapshots to Cubits.

Example:

```dart
abstract class ClientsRepository {
  Future<Result<List<ClientModel>>> getClients();

  Future<Result<ClientModel>> getClient(String id);

  Future<Result<void>> createClient(ClientModel client);

  Future<Result<void>> updateClient(ClientModel client);

  Future<Result<void>> archiveClient(String id);
}
```

Create an implementation when required:

```text
clients/
└── data/
    ├── models/
    └── repositories/
        ├── clients_repository.dart
        └── clients_repository_impl.dart
```

Do not add interfaces or data source layers without a practical reason.

The goal is testability and clear responsibilities, not maximum abstraction.

---

## 8. Cubit and State Management

Use Cubit for feature-level state management.

Cubit responsibilities:
- Call repository methods.
- Emit loading, success, and failure states.
- Coordinate UI state.
- Handle feature-specific presentation logic.
- Never communicate directly with Firebase or Supabase SDKs.

### State Management Rules

- Keep Cubits focused on one feature or cohesive responsibility.
- Use immutable states.
- Use Equatable for state equality.
- Avoid unnecessary state duplication.
- Avoid putting widgets or BuildContext inside Cubits.
- Do not navigate directly from Cubits.
- Use BlocListener for side effects.
- Use BlocBuilder or BlocSelector for UI rendering.
- Handle loading and errors explicitly.
- Avoid unnecessary global state.

A typical state lifecycle:

```text
Initial
  ↓
Loading
  ↓
Success

or

Initial
  ↓
Loading
  ↓
Failure
```

Use more detailed states only when the feature requires them.

For example, distinguish initial loading from refreshing or pagination when those behaviors actually exist.

---

## 9. Dependency Injection

Use GetIt for dependency injection.

- Register dependencies in one organized configuration.
- Keep registrations easy to understand.
- Use lazy singletons or factories according to lifecycle requirements.
- Avoid accessing GetIt throughout arbitrary business logic.
- Inject dependencies through constructors.
- Register repositories and Cubits in a predictable manner.

Do not introduce complicated dependency injection abstractions.

---

## 10. Firebase and Firestore

Use Firebase for:

### Authentication
- Email and password registration.
- Login.
- Logout.
- Password reset.
- Email verification.
- Persistent authentication session.

### Cloud Firestore
Store user-owned application data.

Proposed structure:

```text
users/{uid}/
    profile
    clients/{clientId}
    projects/{projectId}
    tasks/{taskId}
    transactions/{transactionId}
    activity_logs/{activityId}
```

Review actual query requirements before finalizing the schema.

### Firestore Rules

Security rules are mandatory.

- Users must only access their own data.
- Never rely on UI filtering for security.
- Validate ownership and permitted operations in rules.
- Protect sensitive operations.
- Never deploy unrestricted test rules.
- Do not assume Firebase API keys provide data protection.

### Firestore Practices

- Use document IDs consistently.
- Use server timestamps where appropriate.
- Avoid unnecessary document duplication.
- Use transactions or batch writes when multiple related writes must remain consistent.
- Design indexes based on actual queries.
- Implement pagination when data volume requires it.
- Avoid fetching entire collections unnecessarily.

Do not introduce Cloud Functions or paid Firebase services without discussing the billing implications first.

---

## 11. Supabase Storage

Use Supabase Storage for file storage only.

Potential use cases:
- Profile avatars.
- Project contracts.
- Project deliverables.
- Project documents.

Suggested storage paths:

```text
{uid}/avatars/
{uid}/projects/{projectId}/contracts/
{uid}/projects/{projectId}/deliverables/
{uid}/projects/{projectId}/documents/
```

Store file metadata and storage paths in Firestore when appropriate.

### Security

- Never include a Supabase Service Role key or Secret key in Flutter code.
- Never expose privileged credentials in the application.
- Use appropriate private bucket policies.
- Enforce user ownership and access restrictions.
- Do not make private files publicly accessible as a workaround.
- Verify the existing Firebase authentication integration with Supabase before implementing authenticated uploads.

If the current Firebase-to-Supabase authentication setup requires additional backend services or billing, explain the options and costs before implementation.

Do not assume that simply initializing the Supabase client provides secure user authentication.

File upload functionality should not block the implementation of unrelated features.

---

## 12. Business Rules

Respect the following rules.

### Clients
- Clients can be created, viewed, edited, and archived.
- Clients with associated projects cannot be permanently deleted.
- Archiving a client does not automatically archive its projects.
- Archived clients should not appear in the default client picker when creating projects.

### Projects
- A project belongs to one client.
- A project has a budget and a currency.
- Budget cannot be negative.
- End date cannot precede start date.
- A completed project cannot receive new tasks unless reopened.
- Archiving a project must not delete its financial transactions.

Project statuses:

```text
Planned
In Progress
On Hold
Completed
Cancelled
```

### Tasks
- Each task belongs to one project.
- Tasks have priority and status.
- Completed tasks are not overdue.
- Overdue tasks must be calculated consistently.
- Project progress is calculated as:

```text
Completed Tasks / Total Tasks * 100
```

- If a project has no tasks, progress is 0%.

Priorities:

```text
Low
Medium
High
```

Statuses:

```text
To Do
In Progress
Done
```

### Finance
- Financial transactions belong to a project.
- Transactions use the project's currency.
- Payments cannot exceed the project budget in version 1.
- Outstanding balance = Project Budget - Total Payments.
- Archiving a project does not delete its transactions.
- Editing or deleting a transaction must preserve financial consistency.
- Different currencies must never be combined into one misleading total.

### Money Representation

Avoid using `double` for financial calculations.

Use integer minor units:

```text
$10.50 = 1050 cents
EGP 100.25 = 10025 piastres
```

Use appropriate formatting for display.

---

## 13. Responsive UI and Design System

The existing Google Stitch design is the primary visual reference.

The Flutter implementation must follow the approved FreelanceHub visual identity.

### Brand Colors

Primary:
- Light: `#6D5CE8`
- Dark: `#8B7CF6`

Light theme:
- Background: `#F8FAFC`
- Surface: `#FFFFFF`
- Primary text: `#0F172A`
- Secondary text: `#64748B`
- Border: `#E2E8F0`

Dark theme:
- Background: `#0F172A`
- Surface: `#1E293B`
- Primary text: `#F8FAFC`
- Secondary text: `#94A3B8`
- Border: `#334155`

### Responsive Breakpoints

Use responsive layouts rather than fixed dimensions.

Guidelines:

```text
Mobile:          360–599
Compact Tablet:  600–767
Tablet:          768–1023
Desktop:         1024–1439
Large Desktop:   1440+
```

### Layout Rules

Mobile:
- Bottom navigation.
- Single-column layouts.
- Touch-friendly controls.
- Full-screen forms where appropriate.

Tablet:
- Adaptive NavigationRail or collapsible navigation.
- Flexible multi-column layouts.
- Appropriate content density.

Desktop:
- Persistent sidebar.
- Top header.
- Multi-column dashboard.
- Tables where appropriate.
- Dialogs and side panels.

### Theme Rules

- Support Light, Dark, and System themes.
- Avoid hardcoded colors inside widgets.
- Use ThemeData and centralized theme tokens.
- Ensure charts and status indicators work in both themes.
- Maintain accessible contrast.
- Persist the selected theme preference.

### UI Implementation Rules

- Reuse shared widgets when they are genuinely reusable.
- Avoid building one giant reusable widget with dozens of unrelated parameters.
- Keep feature-specific widgets inside their feature.
- Keep global widgets inside Core.
- Avoid deeply nested widget trees when extraction improves readability.
- Use const constructors where possible.
- Avoid unnecessary rebuilds.
- Use LayoutBuilder and MediaQuery appropriately.
- Do not rely on flutter_screenutil for every dimension.
- Prefer responsive constraints and flexible layouts.

The HTML designs from Stitch are visual references, not production Flutter code.

Rebuild them using real Flutter widgets.

---

## 14. Testing Strategy

Testing is required throughout development, not just at the end.

Focus on meaningful tests instead of chasing an arbitrary test count.

### Unit Tests

Test:
- Model serialization and deserialization.
- Repository success scenarios.
- Repository failure scenarios.
- Exception-to-Failure mapping.
- Business calculations.
- Task progress calculations.
- Outstanding balance calculations.
- Currency handling.
- Input validation where applicable.

### Cubit Tests

Use `bloc_test` and `mocktail`.

Test:
- Initial state.
- Loading state.
- Successful operations.
- Failed operations.
- Correct Failure propagation.
- State transitions.
- Empty results.
- Refresh and pagination when implemented.

### Widget Tests

Test important UI behavior:
- Rendering expected content.
- Form validation.
- User interactions.
- Loading indicators.
- Error messages.
- Empty states.
- Navigation triggers.
- Theme-dependent rendering where useful.

### Integration Tests

Add integration tests for critical user journeys when the application becomes sufficiently implemented.

Examples:
- Register and login.
- Create a client.
- Create a project.
- Add tasks.
- Record a payment.
- Verify dashboard updates.

### Testing Rules

- Never depend on real Firebase or Supabase services in ordinary unit tests.
- Mock repository dependencies.
- Use Firebase Emulator Suite when integration testing against Firebase is appropriate.
- Do not write tests that simply repeat implementation details.
- Tests must verify actual behavior.
- Fix failing tests instead of ignoring or disabling them.

Every significant feature should include relevant tests before it is considered complete.

---

## 15. Git and Secret Management

Git has not been initialized yet.

Before initializing Git or creating the first commit:

1. Inspect the current project files.
2. Inspect existing `.gitignore`.
3. Update `.gitignore` to exclude local secrets, generated files, build artifacts, and machine-specific configuration.
4. Inspect tracked/untracked candidates before the first commit.
5. Verify no credentials or private keys are included.

### Files to Ignore

At minimum, review these patterns:

```gitignore
# Environment files
.env
.env.*
!.env.example

# Private credentials
*.pem
*.p12
*.key
service-account*.json
*-service-account.json

# Dart / Flutter generated files
.dart_tool/
.packages
.pub-cache/
.pub/
build/
.flutter-plugins
.flutter-plugins-dependencies

# IDE
.idea/
.vscode/

# OS
.DS_Store
Thumbs.db

# Logs
*.log

# Local generated files
coverage/
```

Adapt the ignore list to the actual project.

### Firebase Configuration

Do not automatically classify every Firebase configuration file as a secret.

Firebase client configuration files such as:

- `firebase_options.dart`
- `google-services.json`

generally contain client configuration, not privileged server credentials.

They can normally be committed when needed for reproducible builds.

However:
- Never commit Firebase Admin SDK private keys.
- Never commit service account credentials.
- Never commit privileged backend credentials.
- Ensure Firestore Security Rules are properly configured.

### Supabase Configuration

- Never commit Service Role or Secret keys.
- Never put privileged keys in Dart source code.
- Keep local environment files out of Git.
- A Supabase publishable/anon key is a client-side key, not a secret. Its security depends on correctly configured authorization and database/storage policies.
- Add `.env.example` with placeholders when environment variables are used.

Remember that `--dart-define` and Flutter environment variables are not a secure way to hide secrets inside a distributed client application.

### Git Workflow

Do not run `git init`, create commits, configure remotes, or push without explicit user approval.

When requested:
- Review the complete `.gitignore`.
- Check `git status`.
- Check for sensitive files.
- Use clear commit messages.
- Never force-push or rewrite history without explicit approval.

---

## 16. Code Quality and Formatting

Before considering implementation complete:

Run:

```bash
dart format .
```

Then:

```bash
flutter analyze
```

Then run the relevant tests:

```bash
flutter test
```

Fix all newly introduced analysis errors and warnings where practical.

Do not suppress analyzer warnings without a valid reason.

Avoid:
- Unnecessary `!` operators.
- Excessive `dynamic`.
- Unnecessary `late`.
- Unnecessary global variables.
- Large methods.
- Large Cubits with unrelated responsibilities.
- Business logic inside widgets.
- Duplicated validation.
- Magic strings and numbers.
- Unnecessary comments that simply repeat the code.

Write comments to explain non-obvious decisions, not obvious operations.

---

## 17. Copilot Working Agreement

Follow this workflow when working on a task.

### Step 1 — Inspect

Before editing:
- Inspect relevant files.
- Understand the current architecture.
- Check existing dependencies.
- Check current Firebase and Supabase initialization.
- Identify any existing implementation that can be reused.

### Step 2 — Plan

For non-trivial tasks:
- Explain the intended changes briefly.
- Identify the files that need to be created or modified.
- Mention important architectural decisions.
- Identify potential risks.

Do not produce an unnecessarily large implementation plan for a trivial change.

### Step 3 — Implement

- Implement only the requested scope.
- Follow this document.
- Preserve existing working code.
- Avoid unrelated refactoring.
- Write tests for meaningful behavior.
- Do not create unnecessary abstractions.

### Step 4 — Verify

After implementation:
- Format changed code.
- Run Flutter analyze.
- Run relevant tests.
- Fix problems introduced by the implementation.
- Report any remaining limitations.

### Step 5 — Report

At the end of each task, provide:

1. What was implemented.
2. Files created or modified.
3. Important architectural decisions.
4. Tests added and their results.
5. Commands executed and their results.
6. Any remaining issues or manual setup required.

Never claim that a test passed unless it was actually executed successfully.

Never claim that Firebase or Supabase integration works unless it has been verified.

### Important Restrictions

- Do not rewrite the entire project without approval.
- Do not delete existing files without checking their purpose.
- Do not change Firebase project configuration without approval.
- Do not add paid services without discussing costs.
- Do not commit or push changes without approval.
- Ask before making a significant architectural change.
- If an existing implementation conflicts with these guidelines, explain the conflict before making a disruptive change.

---

## 18. Feature Development Order

Implement the project incrementally in this order:

1. Project foundation and configuration.
2. Core errors and shared infrastructure.
3. Theme and responsive foundation.
4. Authentication.
5. Profile.
6. Clients.
7. Projects.
8. Tasks.
9. Finance.
10. Dashboard.
11. Notifications.
12. Final integration and quality review.

Do not implement all features in one massive change.

Complete each feature in manageable, testable steps.

A feature is considered complete only when:
- Its data model is implemented.
- Its repository is implemented.
- Its Cubit and states are implemented.
- Its UI is implemented.
- Loading, empty, and error states are handled.
- Responsive layouts are supported.
- Important business rules are enforced.
- Relevant tests pass.

---

## 19. Final Principle

Build FreelanceHub as a real, maintainable application that demonstrates professional Flutter development skills.

Prioritize:
- Correctness.
- Security.
- Readability.
- Testability.
- Maintainability.
- Good user experience.

Do not confuse more files, more abstractions, or more packages with better architecture.

**Keep the implementation simple, explicit, feature-focused, and reliable.**
## 20. Google Stitch UI Design Reference

The complete FreelanceHub UI/UX design is available inside the project root directory:

```text
stitch_freelancehub_management_saas/
```

This folder contains the exported Google Stitch designs, including HTML screens and design references.

### Mandatory Rules

1. Before implementing any UI screen, inspect the relevant HTML design files inside `stitch_freelancehub_management_saas/`.
2. Treat Google Stitch designs as the primary visual reference for the Flutter implementation.
3. Match the approved layouts, colors, typography, spacing, component styles, navigation, and visual hierarchy as closely as reasonably possible.
4. Respect the Desktop, Tablet, and Mobile layouts instead of simply shrinking desktop screens.
5. Follow the Light and Dark theme designs.
6. Reuse the established design system and shared UI components.
7. Do not invent a different UI design when a corresponding Stitch screen already exists.
8. If a required screen or state is missing from the Stitch exports, identify the gap and propose a consistent design based on the existing design system.
9. If a design appears inconsistent with the documented business rules or application behavior, explain the conflict before making significant design changes.
10. Do not modify or delete the original Stitch reference files.

### Important Implementation Notes

- Stitch HTML files are design references, not production Flutter source code.
- Rebuild the interfaces using native Flutter widgets.
- Do not embed HTML pages or screenshots as substitutes for Flutter UI.
- Do not copy generated HTML or CSS directly into the Flutter application.
- Keep the implementation responsive and accessible.
- Extract reusable Flutter components when they are genuinely shared across screens.

Before implementing a feature, report which Stitch reference screens you inspected and identify any missing design details that affect implementation.

The goal is to make the Flutter application visually consistent with the approved FreelanceHub design.