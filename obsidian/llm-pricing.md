---
id: llm-pricing
aliases:
  - llm pricing
tags:
  - pricing
  - gpt
  - llm
---

# Comparación de Precios de LLMs 2025

## OpenAI API Pricing (por 1M tokens)

### Modelos Flagship
| Modelo | Input | Output | Input Cached | Notas |
|--------|-------|--------|--------------|-------|
| GPT-5 | $1.25 | $10.00 | $0.125 | Mejor modelo para coding y tareas agénticas |
| GPT-5 Mini | $0.25 | $2.00 | $0.025 | Versión más rápida y económica |
| GPT-5 Nano | $0.05 | $0.40 | $0.005 | Más rápido y económico para resúmenes/clasificación |

### Modelos Disponibles
| Modelo | Input | Output | Input Cached | Notas |
|--------|-------|--------|--------------|-------|
| GPT-4o | $5.00 | $20.00 | $2.50 | Multimodal (texto, visión, audio) |
| GPT-4o Mini | $0.60 | $2.40 | $0.30 | 90% precisión de GPT-4o con ahorro significativo |

### Servicios Adicionales
| Servicio | Precio | Notas |
|----------|--------|-------|
| Code Interpreter | $0.03 | Por uso |
| File Search Storage | $0.10/GB/día | Primer GB gratuito |
| Web Search | $25/1K llamadas (GPT-4o) | $10/1K (GPT-5/o3) |

## Anthropic Claude Pricing (por 1M tokens)

### Modelos Principales
| Modelo | Input | Output | Input Cached | Batch Input | Batch Output |
|--------|-------|--------|--------------|-------------|--------------|
| Claude Opus 4.1 | $15.00 | $75.00 | $1.50 | $7.50 | $37.50 |
| Claude Sonnet 4 | $3.00 | $15.00 | $0.30 | $1.50 | $7.50 |
| Claude Haiku 3.5 | $0.80 | $4.00 | $0.08 | $0.40 | $2.00 |

### Servicios Adicionales
| Servicio | Precio |
|----------|--------|
| Web Search | $10/1K searches |
| Code Execution | $0.05/hora por contenedor (50 horas gratuitas/día) |

## Google Vertex AI Pricing (por 1M tokens)

### Gemini 2.5 Series
| Modelo | Input (≤200K) | Input (>200K) | Output (≤200K) | Output (>200K) | Batch 50% desc. |
|--------|---------------|---------------|----------------|----------------|------------------|
| Gemini 2.5 Pro | $1.25 | $2.50 | $10.00 | $15.00 | ✓ |
| Gemini 2.5 Flash | $0.30 | $0.30 | $2.50 | $2.50 | ✓ |
| Gemini 2.5 Flash Lite | $0.10 | $0.10 | $0.40 | $0.40 | ✓ |

### Gemini 2.0 Series
| Modelo | Input Text | Input Audio | Output Text | Batch 50% desc. |
|--------|------------|-------------|-------------|------------------|
| Gemini 2.0 Flash | $0.15 | $1.00 | $0.60 | ✓ |
| Gemini 2.0 Flash Lite | $0.075 | $0.075 | $0.30 | ✓ |

### Servicios de Grounding
| Servicio | Precio | Límite Gratuito |
|----------|--------|-----------------|
| Google Search | $35/1K prompts | 1,500/día (Flash), 10,000/día (Pro) |
| Web Grounding Enterprise | $45/1K prompts | N/A |
| Google Maps | $25/1K prompts | 1,500/día (Flash), 10,000/día (Pro) |

## Planes de Suscripción

### OpenAI ChatGPT
| Plan | Precio | Características |
|------|--------|-----------------|
| Free | $0/mes | Acceso básico |
| Plus | $20/mes | Acceso extendido |
| Pro | $200/mes | Acceso completo |
| Team | $25-30/mes/usuario | Workspace, SSO |

### Anthropic Claude
| Plan | Precio | Características |
|------|--------|-----------------|
| Free | $0/mes | Uso básico |
| Pro | $17-20/mes | Más uso, Projects ilimitados |
| Max | $100+/mes | 5x-20x más uso |
| Team Standard | $25-30/mes/usuario | Colaboración |
| Team Premium | $150/mes/usuario | Incluye Claude Code |

## Ranking por Costo-Eficiencia

### Más Económicos (Input/Output por 1M tokens)
1. **OpenAI GPT-5 Nano**: $0.05/$0.40
2. **Google Gemini 2.0 Flash Lite**: $0.075/$0.30
3. **Google Gemini 2.5 Flash Lite**: $0.10/$0.40
4. **Google Gemini 2.0 Flash**: $0.15/$0.60

### Gama Media
1. **OpenAI GPT-5 Mini**: $0.25/$2.00
2. **Google Gemini 2.5 Flash**: $0.30/$2.50
3. **OpenAI GPT-4o Mini**: $0.60/$2.40
4. **Claude Haiku 3.5**: $0.80/$4.00

### Premium/Más Costosos
1. **OpenAI GPT-5**: $1.25/$10.00
2. **Google Gemini 2.5 Pro**: $1.25/$10.00
3. **Claude Sonnet 4**: $3.00/$15.00
4. **OpenAI GPT-4o**: $5.00/$20.00
5. **Claude Opus 4.1**: $15.00/$75.00

## Notas Importantes

- **Variación de precios**: Desde $0.05 hasta $75 por millón de tokens
- **Descuentos por volumen**: Batch processing ofrece 50% descuento
- **Caché**: Hasta 75% descuento en tokens cacheados (OpenAI), hasta 95% (Claude)
- **Contexto largo**: Precios pueden duplicarse para contextos >128K-200K tokens
- **Multimodal**: Audio/video generalmente más caro que texto
- **Grounding**: Servicios de búsqueda web tienen costos adicionales
- **Modelos futuros**: GPT-5 aún no lanzado oficialmente, precios preliminares

---
*Última actualización: Enero 2025*
*Precios en USD según páginas oficiales de OpenAI, Anthropic y Google*
*Los precios pueden variar según región y moneda*
