---
name: search-courses
description: Busca en la biblioteca privada de cursos antes de responder. Úsala cuando el usuario pregunte qué dicen los cursos, pida un ejemplo de una lección o quiera aplicar lo aprendido en un curso a su proyecto.
---

# Buscar en los cursos

1. Si no sabes qué cursos hay, usa `list_courses`.
2. Busca con `search_course`:
   - Escribe la consulta autocontenida, con el dominio, el objetivo y la herramienta del proyecto actual. El buscador no conoce tu proyecto, solo ve la consulta.
   - Pasa `collection` con el prefijo del curso si ya sabes cuál aplica: es bastante más preciso. Sin él, busca en todos.
   - `n` admite de 1 a 10.
3. Antes de responder, abre el mejor resultado con `get_note`, usando su `file`.
4. Cita las lecciones por su `file`. Si los cursos no cubren el tema, dilo en vez de completar de memoria.

Si las herramientas no aparecen o piden autenticación, indica al usuario que abra `/mcp`, elija `course-rag` y entre con Google. Si Cloudflare le niega el acceso, su correo aún no está autorizado.
