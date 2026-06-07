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

<!-- portfolio-context:start -->
# Portfolio Context

## What This Project Is

Incident management desktop app built on Tauri 2 + React + TypeScript + Vite. CI-enforced bundle budget. Local-first, no backend.

## Current State

Active development. Tauri 2 scaffold operational with React frontend and Rust backend. Bundle budget CI enforcement configured.

## Stack

- **Desktop shell**: Tauri 2 (Rust + WebView)
- **Frontend**: React + TypeScript + Vite
- **Build**: pnpm
- **Bundle gate**: automated budget check

## How To Run

```
pnpm install
pnpm dev:lean
```

Full Tauri: `pnpm tauri dev`. Bundle check: `pnpm bundle:check`. Production: `pnpm build`.

## Known Risks

- CI enforces bundle budget — adding heavy dependencies without checking impact will fail CI
- Tauri 2 patterns differ from v1; consult migration guide before porting old code
- Bundle size tests (`pnpm test:bundle`) must pass before merging

## Next Recommended Move

Identify the next feature phase from the implementation roadmap. Run `pnpm bundle:check` after any dependency changes.

<!-- portfolio-context:end -->
