# IncidentMgmt

Incident management desktop app with CI-enforced bundle budget.

## Stack
Tauri 2 + React + TypeScript + Vite

## Key Commands
- `pnpm dev:lean` — web-only dev
- `pnpm tauri dev` — full Tauri dev
- `pnpm bundle:check` — verify bundle budget
- `pnpm test:bundle` — bundle size tests
- `pnpm build` — production build

## Architecture
- `src/` — React frontend
- `src-tauri/` — Rust backend (Tauri 2)

## Rules
- CI enforces bundle budget — run `pnpm bundle:check` before adding heavy deps
- Check bundle impact with `pnpm perf:bundle` when adding dependencies
