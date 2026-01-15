# Global Agents.md
## Available Skills

Use these skills for detailed patterns on-demand:

### Generic Skills (Any Project)
| Skill | Description | URL |
|-------|-------------|-----|
| `typescript` | Const types, flat interfaces, utility types | [SKILL.md](skill/typescript/SKILL.md) |
| `react-19` | No useMemo/useCallback, React Compiler | [SKILL.md](skill/react-19/SKILL.md) |
| `nextjs-15` | App Router, Server Actions, streaming | [SKILL.md](skill/nextjs-15/SKILL.md) |
| `tailwind-4` | cn() utility, no var() in className | [SKILL.md](skill/tailwind-4/SKILL.md) |
| `frontend-design` | Create distinctive, production-grade frontend interfaces with high design quality | [SKILL.md](skill/frontend-design/SKILL.md) |
| `payload` | Use when working with Payload CMS projects (payload.config.ts, collections, fields, hooks, access control, Payload API) | [SKILL.md](skill/payload/SKILL.md) |
| `skill-creator` | Creates new AI agent skills following the Agent Skills spec | [SKILL.md](skill/skill-creator/SKILL.md) |

### Auto-invoke Skills

When performing these actions, ALWAYS invoke the corresponding skill FIRST:

| Action | Skill |
|--------|-------|
| App Router / Server Actions | `nextjs-15` |
| Working with Tailwind classes | `tailwind-4` |
| Writing React components | `react-19` |
| Writing TypeScript types/interfaces | `typescript` |
| Building frontend interfaces/components | `frontend-design` |
| Working with Payload CMS projects | `payload` |
| Creating new skills | `skill-creator` |

