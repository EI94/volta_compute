# Pricing — Volta Compute Pilot

Il cliente non compra una GPU-ora nuda. Compra un ambiente privato, la messa in produzione di un workload e dati utili per decidere se scalare.

Tutti i pilot sono **prepagati**. La capacità viene accesa dopo incasso e firma di NDA/DPA quando necessario.

## 1. Benchmark Sprint

**€2.500 + IVA — 10 giorni lavorativi — 100% anticipato**

Include:

- ambiente GPU in regione europea;
- massimo 80 GPU-ore classe A6000/A40;
- benchmark di un modello e un workload;
- misure di latenza, throughput, VRAM, costo e consumo stimato;
- confronto sintetico cloud API vs modello self-hosted;
- report finale con raccomandazione go/no-go.

Ideale per: batch, embedding, reranking, classificazione documentale, primo test di un modello privato.

## 2. Founding Design Partner

**€4.900 + IVA — 30 giorni — 100% anticipato**

Prezzo speciale per i primi tre partner.

Include:

- ambiente isolato in Europa;
- endpoint compatibile OpenAI;
- fino a 300 GPU-ore classe A6000/A40;
- installazione di un modello compatibile con la memoria disponibile;
- integrazione di un solo use case;
- logging, telemetria e report settimanale;
- runbook di failover e cancellazione dati;
- benchmark finale e TCO per un nodo behind-the-meter;
- diritto di prelazione sul primo nodo fisico Volta.

Extra capacity: **€4,50/GPU-ora**, preacquistata in blocchi da 100 ore.

## 3. Dedicated Private Pilot

**€6.900 + IVA/mese — minimo 1 mese — anticipato**

Include:

- una GPU dedicata per l'intero mese, fino a 720 ore;
- ambiente privato, API e monitoraggio;
- un workload production-like non mission-critical;
- supporto operativo e capacity report;
- cloud failover configurato ma fatturato a consumo se attivato.

Setup per integrazioni custom: da **€2.500** una tantum.

## 4. Contratto Reserved dopo il pilot

Per capacità continuativa:

- prezzo floor: **€3,50/GPU-ora equivalente**;
- target commerciale: **€4,50–6,00/GPU-ora** per workload sovrani/edge;
- minimo: 300 GPU-ore/mese per 3 mesi;
- hardware dedicato soltanto con anticipo o take-or-pay;
- sconto massimo del 10% per pagamento trimestrale anticipato;
- nessuno sconto in cambio di una promessa vaga di volumi futuri.

## Regole economiche

1. Non acquistare hardware per un cliente senza deposito non rimborsabile o take-or-pay.
2. Il pilot deve coprire al 100% cloud, storage, trasferimenti dati e tempo tecnico minimo.
3. I prezzi includono capacità e servizio, non la proprietà dell'hardware.
4. Le ore non utilizzate scadono alla fine del periodo, salvo disservizio Volta.
5. I dati cliente non vengono usati per training e vengono cancellati secondo il DPA.
6. Workload mission-critical, dati sanitari o requisiti regolati richiedono scoping e quotazione separata.

## Offerta anchor consigliata

Per NATIVA o altro cliente già attivo con Lateral Space:

**€3.900 + IVA, 30 giorni, fino a 250 GPU-ore, un use case, pagamento anticipato.**

È deliberatamente sotto il prezzo standard in cambio di:

- accesso rapido al workload;
- feedback settimanale;
- diritto a usare risultati anonimizzati come case study;
- disponibilità a discutere un commitment successivo.
