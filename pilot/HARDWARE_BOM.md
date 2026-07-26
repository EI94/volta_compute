# Hardware BOM — nodo pilota a 1 GPU

## Decisione architetturale

Per il primo nodo fisico non serve replicare un mini data center. Serve una macchina:

- rivendibile;
- riparabile con componenti standard;
- abbastanza silenziosa e semplice da ospitare in un sito C&I;
- capace di eseguire inference, RAG, embedding, reranking e batch;
- identica, lato software, alla GPU cloud usata in Fase 0.

**Scelta raccomandata per un pilot cliente:** NVIDIA RTX A6000 48 GB, usata o refurbished, in una workstation enterprise ricondizionata. È una scheda attivamente raffreddata e quindi non richiede il fan wall di un server per GPU passive.

**Scelta ultra-light solo per laboratorio interno:** RTX A5000 24 GB, se il workload entra in 24 GB. Non usarla per promettere capacità che richieda 48 GB.

**Da evitare nel tower pilot:** A40, A100, H100, H200 e altre schede passive. Funzionano soltanto con chassis server e airflow ad alta pressione validato dal costruttore. Una GPU passiva in una workstation è un piccolo barbecue molto costoso.

## BOM raccomandata

| Componente | Specifica minima | Target procurement | Criterio di rifiuto |
|---|---|---:|---|
| GPU | RTX A6000 48 GB ECC, active blower | usata/refurbished, garanzia 12 mesi, seriale e burn-in | artefatti, errori ECC/Xid, ventola instabile, nessuna prova d'acquisto |
| Workstation | Dell Precision 7820/7920, HP Z8 G4 o equivalente | ricondizionata, chassis full-length dual-slot | PSU proprietario senza cavo GPU disponibile, slot ostruito, airflow insufficiente |
| CPU | 16 core fisici complessivi o più | Xeon Silver/Gold o Threadripper Pro usato | CPU troppo vecchia da limitare I/O, assenza AVX2 |
| RAM | 128 GB ECC | 8×16 GB o 4×32 GB | meno di 64 GB, DIMM misti non validati |
| Storage sistema | NVMe enterprise 1 TB | nuovo | SMART degradato |
| Storage modelli/dati | NVMe enterprise 2–4 TB | nuovo, cifrato | SSD consumer senza endurance nota per dati cliente |
| Rete | 1 GbE minimo; 10 GbE preferito | NIC Intel/Mellanox | Wi-Fi come uplink di produzione |
| PSU | 1.000–1.400 W, 80 Plus Platinum, OEM validated | incluso nella workstation | adattatori improvvisati, potenza continua insufficiente |
| Misura energia | contatore DIN o smart meter con export | lettura W/kWh via API o CSV | presa consumer senza misura affidabile |
| Sensori | temperatura ambiente + inlet/exhaust | 2 sonde | nessun allarme sopra soglia |
| Sicurezza fisica | locale chiuso, staffa/lock, inventario seriali | incluso nel sito | accesso pubblico/non controllato |

## Raffreddamento

Per una sola RTX A6000 **non acquistare un sistema liquid cooling**.

La macchina completa dissiperà tipicamente circa 500–700 W sotto carico, cioè circa 1.700–2.400 BTU/h. Una stanza tecnica già climatizzata gestisce facilmente questo carico se:

- temperatura ambiente resta idealmente tra 18 e 27 °C;
- l'aria calda non ricircola verso l'aspirazione;
- ci sono almeno due ventole frontali e una posteriore ad alta portata;
- il nodo viene spento o throttled se GPU/VRAM superano le soglie definite;
- filtri e polvere vengono controllati mensilmente.

Liquid cooling diventa sensato quando passiamo a più GPU dense, recuperiamo calore o il sito non ha sufficiente capacità HVAC. Sul singolo pilot aggiunge costi e punti di failure senza comprare informazione utile.

## Alimentazione e sito

- circuito dedicato 230 V, 16 A;
- protezione magnetotermica/differenziale verificata da elettricista;
- presa e cablaggio dimensionati per funzionamento continuativo;
- misura separata del consumo del nodo;
- fibra o connettività business con IP pubblico/VPN;
- accesso remoto fuori banda, dove disponibile;
- cloud di riserva per failover.

Un UPS/BESS non è obbligatorio nel primo test: costa più dell'informazione che genera. Per workload batch accettiamo lo stop controllato; per workload cliente manteniamo il failover cloud. Inserire UPS online da 2–3 kVA soltanto se il contratto richiede continuità locale.

## Budget target, IVA esclusa

### Fase 0 — nessun hardware

- GPU cloud europea: a consumo;
- dominio, storage e logging;
- cash a rischio iniziale: poche centinaia di euro, coperto dal prepagamento cliente.

### Nodo laboratorio ultra-light

- workstation ricondizionata: €1.000–1.800;
- RTX A5000 24 GB usata/refurbished: €1.200–2.000;
- NVMe, NIC, misura e sensori: €400–800;
- target totale: **€2.600–4.600**.

### Nodo cliente 48 GB

- workstation ricondizionata: €1.200–2.000;
- RTX A6000 48 GB usata/refurbished: target €3.500–4.500;
- NVMe, NIC, misura e sensori: €500–1.000;
- target totale: **€5.200–7.500**.

Se la sola RTX A6000 supera €5.000 senza garanzia forte o buy-back, restiamo sul cloud e aspettiamo. Non siamo obbligati a comprare un cattivo affare per dimostrare di essere imprenditori.

## Acceptance test hardware

Prima del saldo o entro la finestra DOA:

1. inventario seriali e foto componenti;
2. aggiornamento BIOS/firmware;
3. SMART completo di tutti i dischi;
4. MemTest/ECC check;
5. almeno 12 ore di burn-in GPU;
6. controllo `nvidia-smi -q` e assenza di errori Xid/ECC;
7. test inference continuo con log di temperatura, potenza e throughput;
8. misurazione kWh alla presa;
9. spegnimento, riavvio e recovery remoto;
10. cancellazione sicura del dataset di test.
