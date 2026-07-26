# Volta Compute — Single-GPU Pilot

Questo pacchetto serve a validare **domanda, prezzo, utilizzo e operatività** prima di comprare un nodo multi-GPU.

La regola è semplice:

> cliente prepagato → capacità cloud europea → evidenza operativa → solo dopo, 1 GPU fisica reversibile.

## Cosa mette online

- un endpoint LLM compatibile con le API OpenAI, basato su vLLM;
- accesso protetto da API key;
- TLS e reverse proxy tramite Caddy;
- telemetria GPU/energia esportabile in CSV;
- la stessa configurazione può girare prima su una GPU cloud e poi su una workstation fisica.

## Cosa non è

- non è ancora una piattaforma multi-tenant;
- non è un cluster per training frontier;
- non promette SLA enterprise finché non esiste failover su un secondo provider;
- non richiede liquid cooling per il pilot a una GPU.

## Percorso operativo

### Fase 0 — oggi, senza hardware

1. Firmare e incassare un pilot.
2. Accendere una GPU in una regione UE.
3. Installare questo stack.
4. Eseguire un workload reale del cliente per 30 giorni.
5. Misurare costo, latenza, throughput, utilizzo e disponibilità a pagare.

### Fase 1 — dopo il primo deposito

1. Acquistare una workstation ricondizionata e una RTX A6000 48 GB usata/refurbished.
2. Installare lo stesso stack.
3. Spostare un workload batch/non mission-critical sul nodo fisico.
4. Mantenere il cloud come failover.

## Requisiti software

- Ubuntu Server 24.04 LTS;
- driver NVIDIA compatibile con la GPU;
- Docker Engine + Docker Compose;
- NVIDIA Container Toolkit;
- una GPU NVIDIA con almeno 24 GB di VRAM; 48 GB raccomandati;
- un dominio DNS che punti al nodo, per l'accesso esterno in HTTPS.

## Avvio rapido

```bash
cd pilot
cp .env.example .env

# Genera una API key robusta e inseriscila in .env
openssl rand -hex 32

chmod +x scripts/*.sh
./scripts/preflight.sh
docker compose pull
docker compose up -d
./scripts/smoke-test.sh
```

Per vedere i log:

```bash
docker compose logs -f vllm
```

Per raccogliere telemetria GPU locale:

```bash
./scripts/collect-metrics.sh 60
```

Per spegnere senza cancellare la cache dei modelli:

```bash
docker compose down
```

## Modello predefinito

Il default è un modello quantizzato prudente per il primo avvio. Va sostituito in `.env` in funzione del workload, della licenza e della VRAM disponibile.

Prima di caricare dati reali del cliente:

- firmare NDA/DPA;
- definire retention e cancellazione;
- utilizzare dataset sintetici per il test iniziale;
- cifrare il disco del nodo;
- non esporre direttamente la porta 8000 a Internet;
- ruotare API key tra clienti e pilot;
- prevedere un endpoint cloud di failover.

## Metriche minime del pilot

- GPU-hours acquistate e vendute;
- utilizzo GPU medio e P95;
- VRAM media e picco;
- throughput in token/s;
- latenza time-to-first-token P50/P95;
- consumo elettrico e kWh per 1.000 richieste;
- uptime applicativo;
- costo cloud effettivo;
- ricavo, margine lordo e prezzo equivalente per GPU-hour.

I gate economici e tecnici sono in [`commercial/ACCEPTANCE_GATES.md`](commercial/ACCEPTANCE_GATES.md). La configurazione hardware consigliata è in [`HARDWARE_BOM.md`](HARDWARE_BOM.md). L'offerta commerciale iniziale è in [`commercial/PRICING.md`](commercial/PRICING.md).
