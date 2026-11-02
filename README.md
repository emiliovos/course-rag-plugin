# course-rag-plugin

Plugin de Claude Code para buscar en una biblioteca privada de conocimiento. Solo funciona con un correo autorizado.

## Instalar

```bash
claude plugin marketplace add emiliovos/course-rag-plugin
claude plugin install course-rag@vostec
```

Después abre `claude`, escribe `/mcp`, elige `course-rag` y entra con Google. Hazlo en la máquina donde está tu navegador.

## Actualizar

```bash
claude plugin marketplace update vostec
claude plugin update course-rag@vostec
```

Una sesión abierta conserva la versión que cargó: corre `/reload-plugins` o reinicia.

## Si algo falla

- **Cloudflare niega el acceso:** tu correo no está autorizado.
- **El servidor pide autenticación:** abre `/mcp` y vuelve a entrar. La sesión dura hasta 2 semanas.

## Publicar una versión

1. Cambia el plugin y sube `version` en `plugin.json`, por PR.
2. Con CI en verde, haz merge y crea el tag con `claude plugin tag plugins/course-rag`.
3. Cambia `ref` en `marketplace.json` al tag nuevo, por PR.
4. Instala desde cero en una máquina limpia y prueba una llamada real.

Licencia: MIT.
