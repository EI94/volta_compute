# Same-Day Go-Live Checklist

## T-0 — prima di spendere

- [ ] Cliente e workload selezionati.
- [ ] Pilot Order Form approvato.
- [ ] Fattura/proforma inviata.
- [ ] Accredito ricevuto.
- [ ] NDA/DPA completati se necessari.
- [ ] Success metric e dataset sintetico disponibili.

## T+0–1h — provisioning

- [ ] Creare progetto/account cloud dedicato.
- [ ] Selezionare regione UE e GPU corretta per VRAM/workload.
- [ ] Creare istanza Ubuntu 24.04 LTS.
- [ ] Allocare volume cifrato e IP pubblico.
- [ ] Configurare firewall: 22 solo da allowlist/VPN; 80/443 pubblici.
- [ ] Creare record DNS `pilot.compute.voltaenergy.xyz` o hostname dedicato.
- [ ] Registrare provider, SKU, prezzo orario e ora di accensione.

## T+1–2h — hardening e runtime

- [ ] Aggiornare il sistema operativo.
- [ ] Creare utente non-root con sudo e chiavi SSH.
- [ ] Disabilitare login SSH con password.
- [ ] Installare Docker, Compose e NVIDIA Container Toolkit.
- [ ] Clonare il branch del pilot.
- [ ] Copiare `.env.example` in `.env`.
- [ ] Generare API key con `openssl rand -hex 32`.
- [ ] Inserire dominio, modello, token e limiti di memoria.
- [ ] Eseguire `chmod +x scripts/*.sh`.
- [ ] Eseguire `./scripts/preflight.sh`.

## T+2–4h — avvio e test

- [ ] `docker compose pull`.
- [ ] `docker compose up -d`.
- [ ] Attendere healthcheck e verificare i log.
- [ ] Eseguire `./scripts/smoke-test.sh`.
- [ ] Avviare `./scripts/collect-metrics.sh 60` in sessione persistente.
- [ ] Testare restart della VM e auto-start dei container.
- [ ] Verificare TLS, API key, firewall e log.
- [ ] Creare snapshot golden senza dati cliente.

## T+4–6h — workload

- [ ] Eseguire benchmark sintetico con 20–100 richieste.
- [ ] Registrare TTFT, token/s, GPU utilization, VRAM e costo.
- [ ] Confermare che il modello/licenza sia adeguato.
- [ ] Consegnare al Cliente endpoint, key e quick-start minimale.
- [ ] Caricare un dataset campione soltanto dopo il data-handling sign-off.

## Fine giornata

- [ ] Report di baseline condiviso.
- [ ] Budget alert impostato.
- [ ] Istanza configurata per spegnersi quando inutilizzata, salvo dedicated pilot.
- [ ] Checkpoint Cliente fissato entro 48 ore.
- [ ] Cloud failover o procedura di recovery documentati.

## Kill switch

Spegnere immediatamente l'istanza e revocare le chiavi se:

- compare un accesso non autorizzato;
- la spesa supera il budget alert senza workload concordato;
- il modello genera errori persistenti o supera i limiti di VRAM;
- vengono caricati dati non autorizzati;
- il cliente chiede un workload mission-critical fuori perimetro.
