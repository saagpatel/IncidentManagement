# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.0.0] - 2026-03-21

### Added

- Initial scaffold: Tauri 2 + React 19 + TypeScript with full Phase 1 & 2
- Phases 3–4: DOCX reports, CSV import, dark mode, and polish
- Comprehensive security audit with 154 tests
- Phases 5–8: dashboard visualization, content features, UX polish, reports enhancement
- Phases 9.1–9.6: tests, SLA, audit, reports, and UX overhaul
- Major overhaul: service catalog, roles, lifecycle, analytics, AI, post-mortems
- PIR: readiness check and action-item justification
- PIR: action-item follow-through fields
- PIR: filtered learnings search and PIR brief export
- Lean dev workflow and cleanup scripts
- UI gates and blocking Lighthouse budgets
- Comprehensive E2E tests and CI/CD pipeline
- Optional Codacy main analysis and status badges

### Fixed

- 47 bugs across 3 audit waves
- PIR: gate post-mortem finalization on review content
- CI: configure pnpm and Linux deps for workflow
- CI: resolve Codacy check failures
- CI: prevent Codacy upload from failing main
- CI: disable Codacy Docker tools to avoid trivy parse error
- CI: avoid secrets in Codacy job condition
- Core: resolve audit findings and harden migrations
- Database: terminate SQL migrations for static analysis
- UI: stabilize cross-OS visual test flake and mobile snapshot tolerance

### Changed

- Prepared public migration baseline
- Finalized codex OS bootstrap baseline
- Bootstrapped codex OS guardrails
- Pruned non-essential project artifacts
- Reduced startup bundle and added budget guard
- Optimized dashboard renders and added budget workflow
- Aligned test commands with CI in README
