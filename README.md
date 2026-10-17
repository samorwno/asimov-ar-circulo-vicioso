# Asimov AR — Círculo Vicioso (WebAR)

Proyecto interactivo de Realidad Aumentada sobre las **Tres Leyes de la Robótica** de Isaac Asimov,
ambientado en el relato *Círculo vicioso* (*Runaround*, 1942) y el dilema del robot **Speedy**.

**Demo en vivo (HTTPS, apto para móvil):** https://samorwno.github.io/asimov-ar-circulo-vicioso/

Requiere un marcador **Hiro** para visualizar la escena. Imprime `markers/hiro.png`
(o descarga el marcador Hiro clásico) **sin recortar el borde negro** y apunta la cámara a él.

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

3. Apunta la cámara al marcador Hiro y elige una de las tres decisiones en pantalla.

## Interacción (el dilema de Speedy)

Speedy está atrapado en un bucle lógico entre la **Segunda Ley** (órdenes) y la **Tercera Ley**
(peligro). Solo la **Primera Ley** rompe el círculo:

- **A. Ordenar con más fuerza (Ley 2)** → falla: el peligro lo repele de nuevo.
- **B. Lanzar ácido al camino (Ley 3)** → falla: aparece un nuevo punto de equilibrio.
- **C. Exponer tu vida al peligro (Ley 1)** → éxito: Speedy sale del bucle para salvarte.

## Contenido

| Archivo | Descripción |
| --- | --- |
| `index.html` | Escena A-Frame + AR.js y la lógica del dilema |
| `robot.glb` | Modelo del robot (glTF binario) |
| `lib/aframe.min.js` | A-Frame 1.4.2 (local, sin CDN) |
| `lib/aframe-ar.js` | AR.js para A-Frame (local, sin CDN) |
| `markers/hiro.png` | Marcador Hiro listo para imprimir |
| `vercel.json` | Cabeceras CORS para desplegar en Vercel |
| `iniciar.sh` | Servidor local rápido |

## Cambios respecto al zip original

El paquete original estaba **incompleto**: el `index.html` cargaba `robot.glb`, pero ese archivo
no estaba incluido, y las librerías se tomaban de CDNs externos.

Se ha corregido así:

- **Añadido `robot.glb`** (modelo *RobotExpressive*, CC0 — Tomás Laulhé, modificado por Don McCurdy).
- **Librerías locales** en `lib/` (A-Frame 1.4.2 y AR.js): funciona sin conexión a internet.
- **Añadido el marcador imprimible** `markers/hiro.png`.
- Ajuste de la escala del modelo para el marcador.

## Créditos

- Relato y leyes: Isaac Asimov, *Círculo vicioso* (*Runaround*, 1942).
- Modelo 3D: *RobotExpressive* (CC0).
- Framework: [A-Frame](https://aframe.io/) y [AR.js](https://ar-js-org.github.io/AR.js-Docs/).
