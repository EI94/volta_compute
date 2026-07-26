# Data Handling Checklist — prima di ricevere dati cliente

## Classificazione

- [ ] Il workload è descritto in una pagina.
- [ ] È indicato se i dati sono pubblici, sintetici, anonimizzati, confidenziali o personali.
- [ ] Sono identificati titolare, responsabile e utenti autorizzati.
- [ ] È verificato se esistono categorie particolari di dati o vincoli settoriali.
- [ ] È definito quali dati non devono entrare nel pilot.

## Contratti

- [ ] NDA firmato, se necessario.
- [ ] DPA firmato prima di trattare dati personali.
- [ ] Regione di elaborazione e subfornitore cloud comunicati al Cliente.
- [ ] Licenza del modello verificata per l'uso commerciale previsto.
- [ ] Termini del pilot e limiti di responsabilità accettati.

## Ambiente

- [ ] Regione UE confermata.
- [ ] Account e progetto dedicati al pilot.
- [ ] MFA attiva sugli account amministrativi.
- [ ] Accesso least-privilege e lista utenti approvata.
- [ ] API key unica per il Cliente, salvata in secret manager e non nel codice.
- [ ] Disco e backup cifrati.
- [ ] Porte pubbliche ridotte al minimo; amministrazione via VPN/allowlist.
- [ ] Logging attivo senza registrare prompt o documenti in chiaro, salvo accordo.
- [ ] Snapshot automatici disattivati o configurati secondo retention.

## Ingestione

- [ ] Primo test eseguito con dati sintetici.
- [ ] Dataset reale ridotto al minimo necessario.
- [ ] Dati trasferiti con canale cifrato.
- [ ] Hash/inventario del dataset registrato.
- [ ] Nessun dato cliente inviato a servizi terzi non approvati.
- [ ] Modello configurato per non fare training o retention dei prompt.

## Operazioni

- [ ] Monitoring di GPU, applicazione, accessi e costi attivo.
- [ ] Runbook per incidente e contatti escalation condivisi.
- [ ] Failover cloud testato, se incluso.
- [ ] Recovery e riavvio remoto testati.
- [ ] Checkpoint settimanale con il Cliente.

## Chiusura

- [ ] Export degli output concordati consegnato.
- [ ] Accessi e API key revocati.
- [ ] Istanze, volumi, snapshot e cache eliminati.
- [ ] Cancellazione verificata e registrata.
- [ ] Report finale consegnato senza dati confidenziali.
- [ ] Il Cliente conferma rinnovo, conversione o chiusura.
