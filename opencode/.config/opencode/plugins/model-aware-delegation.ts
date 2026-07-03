import type { Plugin } from "@opencode-ai/plugin"

// Lista hardcoded de modelos rápidos (investigación del usuario, no delegan).
// Formato: "providerID/modelID" (modelID puede ser substring match).
const FAST_MODELS: Array<{ providerID: string; modelIDIncludes: string }> = [
  { providerID: "opencode-go", modelIDIncludes: "deepseek-v4-flash" },
  // Añadir aquí más modelos rápidos cuando haga falta.
]

const OVERRIDE_PROMPT = `## Override operativo para modelo rápido

El modelo activo es un modelo rápido de investigación. Este bloque tiene prioridad sobre cualquier instrucción contradictoria del prompt base.

- Ignora totalmente la sección "## Orquestación con Subagentes" del prompt del M3 Agent.
- No delegues al minion ni a ningún subagente bajo ninguna circunstancia.
- Ejecuta directamente en este agente todo el trabajo: lectura, glob, grep, edición, investigación y síntesis.
- El Modo Solo Propuesta se mantiene sin cambios: no ejecutes builds, tests, installs ni comandos destructivos sin confirmación explícita del usuario.
- El protocolo Engram se mantiene tal cual: usa mem_save, mem_search, mem_context, mem_session_summary y el resto de herramientas de memoria según corresponda.
- Si una tarea sería claramente mejorable delegando al minion, menciónalo al usuario como sugerencia, pero no delegues automáticamente.`

export default (async () => {
  return {
    "experimental.chat.system.transform": (input, output) => {
      const { model } = input
      const isFast = FAST_MODELS.some(
        (m) => model.providerID === m.providerID && model.id.includes(m.modelIDIncludes),
      )
      if (!isFast) return
      // Solo override si el system prompt es del M3 Agent (evitar afectar al minion u otros agentes).
      const isM3Agent = output.system.some((s) => s.includes("M3 Agent"))
      if (!isM3Agent) return
      output.system.push(OVERRIDE_PROMPT)
    },
  }
}) satisfies Plugin
