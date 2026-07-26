# Volta Compute — Pilot Order Form

> Modello operativo da validare con consulente legale/fiscale prima della firma. Non sostituisce un contratto completo o un DPA.

## 1. Parti

**Fornitore:** Volta Energy S.r.l. SB, operante con il brand Volta Compute  
**Cliente:** [ragione sociale]  
**Referente business:** [nome, e-mail]  
**Referente tecnico:** [nome, e-mail]

## 2. Obiettivo del pilot

Validare il seguente workload su capacità GPU privata in Europa:

- Use case: [una frase]
- Dataset iniziale: [sintetico / anonimizzato / reale sotto DPA]
- Modello o pipeline: [da definire]
- Risultato atteso: [metrica misurabile]

Il pilot non comprende training frontier, workload multi-GPU tightly coupled o applicazioni mission-critical, salvo accordo scritto separato.

## 3. Perimetro

- durata: [10 / 30] giorni dalla data di go-live;
- capacità inclusa: [80 / 250 / 300 / 720] GPU-ore;
- regione: Unione europea;
- un ambiente isolato;
- un endpoint compatibile OpenAI, se applicabile;
- una sola integrazione/use case;
- telemetria tecnica ed economica;
- report finale con raccomandazione go/no-go.

## 4. Prezzo e pagamento

- prezzo fisso: €[importo] + IVA;
- pagamento: 100% anticipato;
- avvio del provisioning: dopo accredito e ricezione delle informazioni tecniche minime;
- extra capacity: €4,50/GPU-ora, acquistata anticipatamente in blocchi da 100 ore;
- le ore non utilizzate scadono al termine del pilot, salvo indisponibilità imputabile a Volta.

## 5. Dati, riservatezza e proprietà

- il Cliente conserva la proprietà dei propri dati e output;
- i dati del Cliente non vengono usati per addestrare modelli per terzi;
- Volta può utilizzare metriche aggregate e anonimizzate del pilot per migliorare il servizio;
- l'uso di dati personali o confidenziali richiede NDA/DPA e approvazione del data-handling plan;
- la cancellazione avviene entro [7] giorni dalla chiusura del pilot, salvo obblighi di conservazione concordati;
- modelli e componenti open-source restano soggetti alle rispettive licenze.

## 6. Disponibilità e responsabilità

Il pilot è un servizio di validazione pre-produzione. Non include SLA mission-critical, business continuity certificata o penali di disponibilità. Volta applicherà ragionevoli misure tecniche e predisporrà failover cloud dove concordato, ma il Cliente non deve affidare al pilot processi la cui indisponibilità causi danni rilevanti.

## 7. Criteri di successo

Il pilot sarà valutato sulle seguenti metriche:

- qualità/output: [metrica];
- latenza P50/P95: [target];
- throughput: [target];
- utilizzo GPU: [target];
- costo equivalente per unità di output/GPU-ora: [target];
- conformità a data residency e cancellazione: sì/no;
- decisione finale: API esterna / private inference cloud / nodo fisico behind-the-meter.

Il mancato raggiungimento di una metrica non comporta rimborso, salvo inadempimento del perimetro concordato: lo scopo del pilot è produrre evidenza, compreso un eventuale no-go.

## 8. Governance

- kick-off: [data]
- checkpoint settimanale: [giorno/ora]
- decision meeting finale: [data]
- approvatore Cliente: [nome]
- approvatore Volta: Pierpaolo Laurito

## 9. Accettazione

Per il Cliente  
Nome:  
Ruolo:  
Data:  
Firma:

Per Volta Energy S.r.l. SB  
Nome:  
Ruolo:  
Data:  
Firma:
