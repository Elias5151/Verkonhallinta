# NetBox (Docker Compose)

Tama hakemisto sisaltaa erillisen NetBox-pinon, joka liitetaan containerlabin hallintaverkkoon `clab-mgmt`.

## Miksi erillinen pino?

- NetBox pysyy irti varsinaisesta topologiasta.
- NetBox voidaan kaynnistaa ja sammuttaa ilman muutoksia `golden.clab.yml`-tiedostoon.
- NetBox voi silti tavoittaa kaikki mgmt-verkossa olevat laitteet (`172.20.20.0/24`).

## Kaytto

1. Luo ymparistotiedosto:

```bash
cp configs/netbox/.env.example configs/netbox/.env
```

2. Vaihda ainakin seuraavat arvot tiedostoon `configs/netbox/.env`:

- `POSTGRES_PASSWORD`
- `NETBOX_SECRET_KEY`
- `NETBOX_SUPERUSER_PASSWORD`

3. Kaynnista labra normaalisti:

```bash
bash scripts/deploy.sh
```

Skripti kaynnistaa ensin containerlabin ja sen jalkeen NetBox-pinon.

## Osoite

- NetBox UI: `http://localhost:8000`

## Vianetsinta

NetBox-pino:

```bash
docker compose -f configs/netbox/docker-compose.yml --env-file configs/netbox/.env ps
```

NetBox-lokit:

```bash
docker compose -f configs/netbox/docker-compose.yml --env-file configs/netbox/.env logs -f
```