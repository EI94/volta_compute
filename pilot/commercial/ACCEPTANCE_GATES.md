# Acceptance Gates — quando spendere e quando fermarsi

## Gate A — Vendere prima di accendere

Non accendiamo capacità cloud finché non esistono:

- un cliente identificato;
- un workload descritto in una pagina;
- prezzo e limiti del pilot accettati;
- pagamento ricevuto;
- NDA/DPA firmati se entrano dati non pubblici.

Eccezione: massimo 10 GPU-ore autofinanziate per demo interne e smoke test.

## Gate B — Validare la domanda

Passiamo dalla capacità cloud al primo nodo fisico soltanto quando sono vere almeno quattro condizioni:

1. almeno **un pilot pagato** e due ulteriori LOI qualificate;
2. ricavi/prepagamenti cumulati di almeno **€7.500**;
3. domanda indicata di almeno **300 GPU-ore/mese** per i tre mesi successivi;
4. disponibilità a pagare non inferiore a **€3,50/GPU-ora equivalente**;
5. un workload che beneficia realmente di privacy, località, latenza o energy orchestration;
6. cliente disposto a fornire dati di utilizzo e feedback.

Se queste condizioni non arrivano, non compriamo hardware. Il test ha già funzionato: ci ha evitato il CapEx.

## Gate C — Acquistare una GPU fisica

L'acquisto è autorizzabile solo se:

- il prezzo all-in del nodo rientra nel target BOM;
- la GPU ha almeno 12 mesi di garanzia o un buy-back concordato;
- il venditore fornisce seriale, condition report e burn-in;
- esiste un sito con energia, rete e accesso tecnico senza nuovo contratto immobiliare;
- il payback semplice, sulla domanda contrattualizzata, è inferiore a 18 mesi;
- il cloud resta disponibile come failover.

Ordine di preferenza:

1. consignment o revenue share;
2. noleggio/leasing con restituzione;
3. acquisto usato con buy-back;
4. acquisto usato puro;
5. nuovo — vietato nel pilot salvo anticipo cliente che lo copra integralmente.

## Gate D — Considerare il pilot riuscito

### Commerciale

- almeno un rinnovo o conversione a reserved capacity;
- prezzo effettivo ≥ €3,50/GPU-ora equivalente;
- pipeline qualificata ≥ 3× la capacità disponibile;
- incasso prima del sostenimento dei principali costi.

### Tecnico

- endpoint disponibile ≥99% nel periodo concordato, esclusa manutenzione notificata;
- zero perdita di dati cliente;
- recovery test superato;
- throughput e latenza compatibili con il workload;
- telemetria GPU ed energia completa per almeno il 95% delle ore attive.

### Economico

- margine lordo del pilot ≥60% prima del tempo founder;
- costo cloud/hardware misurato, non stimato;
- nessun singolo cliente oltre il 70% della domanda prevista a regime;
- payback del nodo fisico proiettato <18 mesi e comunque ben sotto la vita economica della GPU.

### Host/site

- nessun problema termico o acustico;
- accesso per manutenzione entro 24 ore;
- host disposto a rinnovare o ospitare un secondo nodo;
- costo energia e hosting dentro la finestra economica Volta.

## Kill criteria

Fermiamo o ridisegniamo il progetto se:

- nessuno paga un pilot entro 8 settimane;
- il mercato accetta solo prezzi commodity sotto €2,50/GPU-ora;
- l'utilizzo previsto resta sotto il 40%;
- il cliente vuole training multi-GPU tightly coupled come requisito principale;
- i requisiti di sicurezza/SLA costano più del valore del pilot;
- la capacità cloud resta strutturalmente più economica del nodo fisico, anche includendo il valore energetico behind-the-meter.

L'obiettivo non è dimostrare che avevamo ragione. È scoprire rapidamente quale versione del business merita capitale.
