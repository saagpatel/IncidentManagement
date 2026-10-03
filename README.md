# IncidentManagement

[![Rust](https://img.shields.io/badge/Rust-%23dea584?style=flat-square&logo=rust)](#) [![License](https://img.shields.io/badge/license-MIT-blue?style=flat-square)](#) [![CI](https://github.com/saagpatel/IncidentManagement/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/saagpatel/IncidentManagement/actions/workflows/ci.yml)

> Quarterly incident review prep used to take hours of manual data gathering. Now it takes one click.

IncidentManagement is a local-first macOS desktop app for tracking IT incidents, running blameless post-mortems, detecting service trends, and generating polished DOCX and PDF reports for quarterly leadership reviews. Built with Tauri 2 + React 19 + Rust + SQLite + Ollama AI — zero subscription, zero cloud dependency.

## Features

- **Full Incident Lifecycle** — 5-state directed-graph machine (Active → Acknowledged → Monitoring → Resolved → Post-Mortem) with auto-computed P0–P4 priority from severity × impact matrix
- **Blameless Post-Mortems** — Structured post-mortem templates with Markdown editing for root cause, resolution, lessons learned, and action items
- **Service Trend Detection** — SQL-based comparisons of incident counts over the last 7 days and the previous 7 days flag degrading services and high incident volume
- **One-Click Reports** — Generate DOCX or PDF quarterly review reports with executive summaries and action item roll-ups; the current report UI does not supply chart images
- **Service Catalog** — Registry of services with owner, tier (T1–T4), runbook, and dependency graph with cycle detection
- **Full-Text Search** — FTS5 across titles, root causes, resolutions, and notes; bulk operations for status updates and cleanup

## Quick Start

### Prerequisites

- Node.js 24 (the version used by [ci.yml](.github/workflows/ci.yml) and supported by the locked test dependencies)
- pnpm 10 (the version used by CI)
- Rust toolchain (stable) + Tauri v2 prerequisites for macOS
- [Ollama](https://ollama.ai) with a pulled model (optional — used for AI summaries and suggestions)

### Installation

```bash
git clone https://github.com/saagpatel/IncidentManagement.git
cd IncidentManagement
pnpm install --frozen-lockfile --ignore-scripts
```

### Run (development)

```bash
# Frontend preview only (no Rust backend):
pnpm dev
# Native desktop app, with macOS/Tauri prerequisites:
pnpm tauri dev
```

Native launch opens the app-data SQLite database and checks local Ollama health. Use a disposable OS account with synthetic incidents for native/report walkthroughs; do not use your real incident database or start/download an Ollama model merely to check instructions. Ollama is optional for frontend verification.

### Build (desktop app)

```bash
pnpm tauri build
```

## Verification

Run commands from the repository root. The frozen install above skips `prepare` (Husky), avoiding automatic changes to Git hook configuration; enable hooks separately with `pnpm exec husky` in your own development clone if desired. Use a feature branch for the branch-name guard.

```bash
# Focused hook tests with mocked Tauri calls; no native database or Ollama:
pnpm test:run src/hooks/use-dashboard.test.ts
# Broader frontend unit tests; pnpm test is the interactive watch mode:
pnpm test:run
# Configured ESLint/stylelint scope and TypeScript checking:
pnpm ui:gate:static
# TypeScript, frontend bundle and CI bundle budgets:
pnpm test:bundle
```

No CI formatter check is configured; the pre-commit hook runs `lint-staged` with `prettier --write`. For backend changes, CI's library lane is `cargo test --manifest-path src-tauri/Cargo.toml --lib` when run from the repository root; select a Rust test name by appending its filter when appropriate. `make check`, `make test` and `make lint` also target that manifest (`make test` adds `--locked`). Rust compilation needs the platform Tauri libraries (CI lists Linux GTK/WebKit packages in [ci.yml](.github/workflows/ci.yml)); the desktop package build uses `pnpm tauri build`.

For UI changes, install Playwright Chromium with `pnpm exec playwright install chromium`, then run `pnpm ui:gate:regression` for the existing visual and accessibility tests. [playwright.config.ts](playwright.config.ts) starts the frontend on 127.0.0.1:4103 and may reuse a running server: confirm the port belongs to this checkout or choose a free matching port with `PLAYWRIGHT_BASE_URL` and `PLAYWRIGHT_WEB_SERVER_CMD`. These browser tests do not verify native storage or generated reports. For report changes, inspect synthetic report output in a disposable account and temporary output folder. Documentation-only edits do not require these walkthroughs.

The broader [verification command list](.codex/verify.commands) includes branch/secret guards and performance lanes; use it for changes requiring those gates. Keep required PR checks intact. Local focused tests are not proof of a native launch, provider CI, or a release.

## Tech Stack

| Layer         | Technology                   |
| ------------- | ---------------------------- |
| Desktop shell | Tauri 2 + Rust               |
| Frontend      | React 19 + TypeScript + Vite |
| Styling       | Tailwind CSS                 |
| Storage       | SQLite with FTS5             |
| AI analysis   | Ollama (local LLM)           |
| Reports       | DOCX + PDF generation (Rust) |
| Charts        | Recharts                     |

## Architecture

Incident records live in a local SQLite database managed by the Rust Tauri backend; attachments are stored as local files. The state machine is enforced in the Rust query layer — invalid transitions reject status updates before they are committed. Service trend detection asynchronously queries SQLite incident counts; Ollama provides AI summaries and suggestions, with no clustering or cluster-assignment storage implemented. DOCX/PDF document generation happens in Rust; the DOCX builder can embed supplied PNG chart images, but the current report UI supplies none and the PDF builder does not embed charts.

## License

MIT
