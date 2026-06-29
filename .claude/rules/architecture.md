---
description: High level architecture overview - stack, context layers, and key libratires
---

# Architecture

React 19 SPA using Vite 7, Tailwind CSS 4, and React Router 7. No TypeScript — plain JSX throughout.


**Where to look:**

- Adding a new page → `src/pages/` + register route in `App.jsx`
- Shared UI → `src/components/`
- Auth logic → `src/context/AuthContext.jsx`
- Job/application logic → `src/context/JobContext.jsx`
- Mock data changes → `src/data/mockData.js`
- API simulation → `src/services/`

### State Management

Two layers of React Context:

- **`src/context/`** — Core contexts: `AuthContext` (auth + dummy users + localStorage persistence), `JobContext` (applications, saved jobs, employer job CRUD), `ThemeContext`
- **`src/contexts/`** — Data-fetching contexts: `JobsDataContext` (cached job list with 5-min TTL), `CompaniesContext`

Provider nesting order (in App.jsx): AuthProvider → JobsDataProvider → JobProvider → CompaniesProvider → ThemeProvider

### Key Libraries

- Font Awesome + Lucide React for icons
- react-toastify for notifications