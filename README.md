# Volta Compute — Digital Twin

Digital twin 3D interattivo del modello **Volta Compute**: data center distribuiti behind-the-meter, energia ottimizzata e capacità computazionale venduta. Pensato per spiegare il modello internamente e con gli investitori, come un "videogame" del sistema energia + compute.

**Live:** https://ei94.github.io/volta_compute/

## Cosa mostra

Una scena 3D in tempo reale (Three.js) dove si vedono — e si modificano — tutte le grandezze del modello:

- **Energia prodotta** (FV), **stoccata** (batteria/BESS), **consumi** di case e aziende, **compute venduto** (GPU) e **scambio con la rete** (import/export), con flussi animati di particelle.
- **Day/night cycle**: il sole arca sulla scena e guida produzione FV e carichi in tempo reale.
- **4 use case europei** dal white paper Volta, ognuno con il proprio sito 3D:
  - **CER Evoluta** — un vero quartiere con prosumer (FV in tetto), consumer e prosumer che ospitano compute; flussi di *energia condivisa* incentivata.
  - **Biodigestore** — cogeneratore biogas baseload + recupero calore GPU verso il digestore.
  - **Telco Edge** — hotel / supermercato / campus con latenza single-digit ms.
  - **PMI / Edificio Pubblico** — C&I energivora leggera, sovranità del dato.
- **Unit economics live**: ricavi, EBITDA, payback, IRR e NPV calcolati con le formule del modello (8 GPU/nodo, CapEx €340k). Scenari Bear / Base / Bull / Sovereign e slider per prezzo, utilizzo, costo energia e dimensione del fleet.

## Uso

È un singolo file statico (`index.html`), tutto via CDN — nessun build.

- Apri `index.html` nel browser, **oppure**
- servi la cartella: `python3 -m http.server 5172` → http://localhost:5172

### Scorciatoie

`Space` play/pausa · `L` tema chiaro/scuro · `P` pitch mode (auto-orbit) · `R` reset · `Esc` chiude dettaglio · `1`–`4` salta tra i siti.

## Note

I dati di incentivi e regole (CER/CACER D.M. 414/2023, RID, EED/EnEfG, UVAM Terna, Eurostat, InvestAI) sono riportati a scopo illustrativo per il modello e vanno verificati sulle fonti ufficiali (GSE/MASE) prima di un uso formale.
