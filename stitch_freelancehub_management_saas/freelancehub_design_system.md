---
name: "FreelanceHub Design System"
description: "Modern, clean, and structured SaaS design system for FreelanceHub, a cross-platform freelancer management platform built for Flutter."
---

## Overview

FreelanceHub is a production-ready Freelancer Management Platform built for independent professionals managing clients, projects, tasks, deadlines, payments, and financial analytics in one unified workspace.

The visual direction is **Corporate / Modern Minimalism**: crisp, uncluttered, and high-trust. Every screen prioritizes clear visual hierarchy, generous yet efficient spacing, subtle borders, and restrained elevation. Excessive gradients, decorative glassmorphism, and unnecessary visual complexity are strictly avoided. All patterns are designed for seamless **Flutter implementation** across Mobile (360–599px), Tablet (600–1023px), and Desktop (1024px+), with complete Light, Dark, and System Default theme parity.

## Colors

Purple anchors the brand identity, paired with cool slate neutrals for high legibility and calm focus. Semantic colors communicate status (success, warning, error, info) and are never used decoratively.

- **Primary:** Purple (`#6D5CE8` in Light, `#8B7CF6` in Dark) drives primary actions, active navigation states, and key data highlights.
- **Background & Surface:** Crisp off-white (`#F8FAFC`) and pure white (`#FFFFFF`) in Light mode; deep slate (`#0F172A`) and elevated slate (`#1E293B`) in Dark mode—never pure `#000000`.
- **Borders & Text:** Subtle `1px` borders (`#E2E8F0` Light, `#334155` Dark) define card and table boundaries without heavy drop shadows.

```yaml
colors:
  brand-purple: "#6D5CE8"
  brand-purple-dark: "#8B7CF6"
  success: "#10B981"
  on-success: "#393939"
  warning: "#F59E0B"
  on-warning: "#0F172A"
  error: "#EF4444"
  on-error: "#1C1C1C"
  info: "#3B82F6"
  on-info: "#1E1E1E"
  light:
    background: "#F8FAFC"
    on-background: "#0F172A"
    surface: "#FFFFFF"
    on-surface: "#0F172A"
    surface-subtle: "#F1F5F9"
    on-surface-subtle: "#627188"
    primary: "#6D5CE8"
    on-primary: "#FFFFFF"
    primary-container: "#EEF2FF"
    on-primary-container: "#4338CA"
    border: "#E2E8F0"
    success-container: "#ECFDF5"
    on-success-container: "#065F46"
    warning-container: "#FFFBEB"
    on-warning-container: "#92400E"
    error-container: "#FEF2F2"
    on-error-container: "#991B1B"
    info-container: "#EFF6FF"
    on-info-container: "#1E40AF"
  dark:
    background: "#0F172A"
    on-background: "#F8FAFC"
    surface: "#1E293B"
    on-surface: "#F8FAFC"
    surface-subtle: "#283548"
    on-surface-subtle: "#94A3B8"
    primary: "#8B7CF6"
    on-primary: "#0F172A"
    primary-container: "#2E2759"
    on-primary-container: "#DDD6FE"
    border: "#334155"
    success-container: "#064E3B"
    on-success-container: "#A7F3D0"
    warning-container: "#78350F"
    on-warning-container: "#FDE68A"
    error-container: "#7F1D1D"
    on-error-container: "#FECACA"
    info-container: "#1E3A8A"
    on-info-container: "#BFDBFE"
```

## Typography

**Wix Madefor Display** brings geometric clarity to page titles, KPI figures, and section headings. **Instrument Sans** handles all UI controls, navigation labels, and body copy with high legibility at small sizes. **Source Code Pro** is reserved for invoice numbers, project codes, and technical metadata. All currency, metrics, and table figures use `tabular-nums`.

```yaml
typography:
  display-lg:
    fontFamily: "Wix Madefor Display"
    fontSize: 36px
    fontWeight: 700
    lineHeight: 44px
    letterSpacing: -0.5px
  display-lg-mobile:
    fontFamily: "Wix Madefor Display"
    fontSize: 28px
    fontWeight: 700
    lineHeight: 34px
    letterSpacing: -0.25px
  headline-lg:
    fontFamily: "Wix Madefor Display"
    fontSize: 24px
    fontWeight: 600
    lineHeight: 32px
    letterSpacing: -0.25px
  headline-md:
    fontFamily: "Wix Madefor Display"
    fontSize: 20px
    fontWeight: 600
    lineHeight: 28px
    letterSpacing: -0.15px
  title-lg:
    fontFamily: "Instrument Sans"
    fontSize: 16px
    fontWeight: 600
    lineHeight: 24px
    letterSpacing: 0px
  title-md:
    fontFamily: "Instrument Sans"
    fontSize: 14px
    fontWeight: 600
    lineHeight: 20px
    letterSpacing: 0px
  body-lg:
    fontFamily: "Instrument Sans"
    fontSize: 16px
    fontWeight: 400
    lineHeight: 24px
    letterSpacing: 0px
  body-md:
    fontFamily: "Instrument Sans"
    fontSize: 14px
    fontWeight: 400
    lineHeight: 20px
    letterSpacing: 0px
  body-sm:
    fontFamily: "Instrument Sans"
    fontSize: 12px
    fontWeight: 400
    lineHeight: 16px
    letterSpacing: 0.1px
  label-lg:
    fontFamily: "Instrument Sans"
    fontSize: 14px
    fontWeight: 500
    lineHeight: 20px
    letterSpacing: 0.1px
  label-md:
    fontFamily: "Instrument Sans"
    fontSize: 12px
    fontWeight: 500
    lineHeight: 16px
    letterSpacing: 0.2px
  label-sm:
    fontFamily: "Instrument Sans"
    fontSize: 11px
    fontWeight: 500
    lineHeight: 14px
    letterSpacing: 0.2px
  mono-md:
    fontFamily: "Source Code Pro"
    fontSize: 13px
    fontWeight: 500
    lineHeight: 18px
    letterSpacing: 0px
```

## Layout & Spacing

FreelanceHub uses a strict **4px/8px spatial grid** across three intentional adaptive layouts—never stretching mobile layouts onto larger screens:

- **Mobile (`360–599px`):** Single-column fluid layout with `16px` page margins, `16px` card gaps, touch-friendly `44px+` tap targets, and a fixed bottom navigation bar for the 5 primary destinations (Dashboard, Clients, Projects, Tasks, Finance).
- **Tablet (`600–1023px`):** Compact `72px` Navigation Rail on the left, `24px` page margins, and flexible two-column grids for metrics and project cards.
- **Desktop (`1024px+`):** Persistent `240px` left sidebar, sticky `64px` top header with search, theme switcher, notifications, and user menu, plus multi-column dashboards, data tables, and master-detail views.

```yaml
spacing:
  xs: 4px
  sm: 8px
  md: 12px
  lg: 16px
  xl: 24px
  2xl: 32px
  3xl: 48px
```

## Elevation & Depth

Hierarchy is established primarily through **surface contrast and crisp 1px borders** (`light-border` / `dark-border`), rather than heavy shadows. Cards sit on `surface` over `background` with a `1px` border and a subtle ambient shadow (`0 1px 2px rgba(15, 23, 42, 0.04)` in Light mode; border-only in Dark mode). Modals, dropdowns, and popovers use a slightly stronger elevation shadow (`0 8px 24px rgba(15, 23, 42, 0.12)`). Glassmorphism and backdrop blurs are avoided.

## Shapes

Consistent, moderate corner radii keep the interface approachable yet business-ready. Nested elements step their radius down relative to their parent container.

```yaml
rounded:
  sm: 6px
  DEFAULT: 8px
  md: 12px
  lg: 16px
  full: 9999px
```

## Motion & Micro-interaction

Motion is crisp, purposeful, and directly translatable to Flutter's `Curves.easeOutCubic` and `AnimatedContainer` primitives. Interactive state changes (hover, press, focus) resolve within `120ms`. Drawers, modals, and panel transitions decelerate smoothly over `220ms`. Decorative looping animations are prohibited, and `prefers-reduced-motion` is respected.

```yaml
motion:
  state-change:
    duration: 120ms
    delay: 0ms
    timingFunction: cubic-bezier(0.2, 0, 0, 1)
  surface-enter:
    duration: 220ms
    delay: 0ms
    timingFunction: cubic-bezier(0.2, 0, 0, 1)
  surface-exit:
    duration: 150ms
    delay: 0ms
    timingFunction: cubic-bezier(0.4, 0, 1, 1)
```

## Voice & Content Strategy

- **Tone:** Direct, calm, and operational—written for solo business owners who want clarity, not marketing fluff.
- **Capitalisation:** Sentence case for headings, labels, buttons, and table headers (`New project`, `Export CSV`, `Overdue invoices`).
- **Action Labels:** Always verb-first (`Create invoice`, `Add client`, `Log hours`), never vague (`Submit`, `OK`).
- **States:** Empty states explain what belongs there and offer one primary action. Error states state what failed and how to recover.
- **Formatting:** Currency uses standard `$X,XXX.XX` or `$X,XXX` with `tabular-nums`; dates use `Nov 19, 2026` or `Nov 19` for compact tables.

## Components

Component implementations live as individual HTML sticker sheet files in
`components/`. Each file contains the canonical, styled HTML components with
`<!-- COMPONENT: name -->` comment markers. Read each file before use.

- **Badge** → `@components/badge.html`: `badge-numeric`, `badge-dot`
- **Button** → `@components/button.html`: `button-primary`, `button-icon`, `button-with-icon`
- **Card** → `@components/card.html`: `card-elevated`, `card-action`, `card-interactive`, `card-interactive-2`
- **Input Field** → `@components/input-field.html`: `input-field-text`, `input-field-icon`
- **Table** → `@components/table.html`: `table-standard`, `table-interactive`, `table-selectable`
