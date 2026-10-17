# Asimov AR — Círculo Vicioso (WebAR)

Proyecto interactivo de Realidad Aumentada sobre las **Tres Leyes de la Robótica** de Isaac Asimov,
ambientado en el relato *Círculo vicioso* (*Runaround*, 1942) y el dilema del robot **Speedy**.

**Demo en vivo (HTTPS, apto para móvil):** https://samorwno.github.io/asimov-ar-circulo-vicioso/

## Tarjeta todo-en-uno (QR + marcador)

`markers/tarjeta-ar.png` (A4, 2480×3508) reúne **las dos cosas en una sola imagen**:

- **Código QR** → abre esta experiencia en el móvil.
- **Marcador Hiro** → es lo que la cámara "lee" para colocar el robot en 3D.

> ¿Por qué no un único QR que haga las dos cosas? Se intentó: se generó un patrón AR.js
> a partir del propio QR. Aunque la detección se dispara, **la transformación que calcula
> AR.js es inválida** (el contenido acaba a miles de unidades de distancia), porque un QR
> tan denso no da esquinas fiables al rastreador. Por eso se usan: **QR para abrir** y
> **marcador Hiro para el 3D**, ambos en la misma tarjeta.

También puedes imprimir solo `markers/hiro.png` (marcador) y `markers/qr-asimov-ar.png` (QR) por separado.
Imprime el marcador **sin recortar el borde negro**.

## Cómo ejecutarlo

1. Arranca un servidor local en esta carpeta:

   ```bash
   ./iniciar.sh
   # o bien:
   python3 -m http.server 8000
   ```

2. Abre `http://localhost:8000` en el navegador (en el ordenador basta con permitir la webcam).

   > En móvil la cámara solo funciona por **HTTPS**. Puedes desplegarlo en Vercel o GitHub Pages.
   > El proyecto incluye `vercel.json` con las cabeceras CORS necesarias.

3. Pulsa **INICIAR EXPERIENCIA** (activa sonido y narración). Verás primero una **presentación
   frontal de Speedy** que explica las **Tres Leyes de la Robótica** y recuerda a su «padre»,
   **Isaac Asimov**; avanza con **Continuar**. Después, apunta la cámara al marcador Hiro:
   la historia avanza con **Continuar** y al final eliges una de las tres decisiones.

## Experiencia interactiva

- **Presentación frontal**: antes del AR, un **plano frontal de Speedy** de cuerpo entero, de pie,
  presenta la escena y recita las **Tres Leyes de la Robótica**, con mención a **Isaac Asimov**.
  Se avanza con **Continuar** (texto + narración) y luego se entra al diorama en AR.
- **Diorama de Mercurio** sobre el marcador: la base minera (cúpula, placas solares, rover,
  columnas, rocas) alrededor del **pozo de selenio** brillante.
- **Historia guiada** paso a paso con el botón **Continuar** (texto en pantalla + narración).
- **Narración de voz** en español con la **voz del propio dispositivo** (Web Speech API); se puede
  silenciar con 🗣️. No requiere archivos de audio.
- **Ambiente sonoro** sintetizado en el navegador (Web Audio API): drone ambiental + efectos de
  acierto, fallo y bucle. Se silencia con 🔊.
- **Robot animado**: Speedy es un mech con **18 animaciones** (Idle, Hello, Walk, Run, Yes…);
  camina, saluda y corre según la historia.

## El dilema de Speedy (interacción)

Speedy está atrapado en un bucle lógico entre la **Segunda Ley** (órdenes) y la **Tercera Ley**
(peligro). Solo la **Primera Ley** rompe el círculo:

- **A. Ordenar con más fuerza (Ley 2)** → falla: el peligro lo repele de nuevo.
- **B. Lanzar ácido al camino (Ley 3)** → falla: aparece un nuevo punto de equilibrio.
- **C. Exponer tu vida al peligro (Ley 1)** → éxito: Speedy sale del bucle para salvarte.

## Contenido

| Archivo | Descripción |
| --- | --- |
| `index.html` | Escena A-Frame + AR.js, diorama, historia guiada, voz y sonido |
| `robot.glb` | Robot *Speedy* (mech, CC0 Quaternius) con 18 animaciones |
| `modelos/` | Escenografía CC0 (cúpula, placas solares, rover, rocas, columnas…) |
| `texturas/` | Texturas procedurales del suelo y del pozo |
| `img/speedy-frontal.png` | Retrato frontal de Speedy para la presentación (render transparente) |
| `_render.html` | Fuente para regenerar el retrato frontal de Speedy |
| `lib/aframe.min.js` | A-Frame 1.4.2 (local, sin CDN) |
| `lib/aframe-ar.js` | AR.js para A-Frame (local, sin CDN) |
| `markers/hiro.png` | Marcador Hiro listo para imprimir |
| `markers/qr-asimov-ar.png` / `.svg` | Código QR que abre la experiencia |
| `markers/tarjeta-ar.png` | Tarjeta A4 con QR + marcador juntos |
| `diagnostico.html` | Página de diagnóstico (estado de cámara y detección) |
| `tarjeta.html` | Fuente de la tarjeta imprimible |
| `vercel.json` | Cabeceras CORS para desplegar en Vercel |
| `iniciar.sh` | Servidor local rápido |

## Cambios respecto al zip original

El paquete original estaba **incompleto**: el `index.html` cargaba `robot.glb`, pero ese archivo
no estaba incluido, y las librerías se tomaban de CDNs externos.

Se ha corregido así:

- **Añadido `robot.glb`** (inicialmente *RobotExpressive* CC0; ahora un **mech CC0 de Quaternius**
  con animaciones, optimizado con `gltf-transform`).
- **Librerías locales** en `lib/` (A-Frame 1.4.2 y AR.js): funciona sin conexión a internet.
- **Añadido el marcador imprimible** `markers/hiro.png`.
- Ajuste de la escala del modelo para el marcador.

## Créditos

- Relato y leyes: Isaac Asimov, *Círculo vicioso* (*Runaround*, 1942).
- Modelo 3D del robot y escenografía: **Quaternius** (CC0) — [quaternius.com](https://quaternius.com/).
- Framework: [A-Frame](https://aframe.io/) y [AR.js](https://ar-js-org.github.io/AR.js-Docs/).
