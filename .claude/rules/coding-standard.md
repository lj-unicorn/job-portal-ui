## Coding Standards

### General

- **No TypeScript** — plain JSX throughout; do not add `.ts`/`.tsx` files
- **Functional components only** — no class components
- **Named exports** preferred over default exports for components
- Keep components focused — extract reusable pieces into `src/components/`

### Styling

- Use **Tailwind CSS utility classes** exclusively — no inline styles, no CSS modules
- Follow mobile-first responsive design (`sm:`, `md:`, `lg:` breakpoints)
- Dark mode via `ThemeContext` — use conditional class toggling, not `dark:` variants

### State & Data

- Use React Context for shared state — no external state library
- Do not fetch data directly in page components; use services in `src/services/`
- All async service calls must use `delay()` to simulate latency
- Persist user-specific data to localStorage using the established key pattern (`{entity}_{userId}`)

### Naming

- Components: `PascalCase` (e.g., `JobCard.jsx`)
- Variables/functions: `camelCase`
- Constants: `UPPER_SNAKE_CASE`
- Files: match the default export name (e.g., `JobCard.jsx` exports `JobCard`)

### ESLint

Flat config (`eslint.config.js`). The `no-unused-vars` rule ignores variables starting with uppercase or underscore (`varsIgnorePattern: '^[A-Z_]'`). Run `npm run lint` before committing.

