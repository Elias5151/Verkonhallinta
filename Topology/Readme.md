                  r1
                   |
                  r2
         ----------+----------
         |                    |
      client1              web1
         |
      attacker

         |
      management

      ansible
      grafana
      prometheus
      zabbix


# Selite

2 reititintä
2 palvelinta/työasemaa
1 hyökkääjäkone
monitorointipalvelut

Ympäristö pyörii useimmilla 16 GB RAM -koneella, mutta sisältää silti kaikki verkonhallinnan kurssin kannalta tärkeät osa-alueet. Ympäristö hyötyy merkittävästi suuremmasta muistinmäärästä.

Client Network
10.10.10.0/24

r1 = 10.10.10.1

client1  = 10.10.10.101
attacker = 10.10.10.200

Server Network
10.10.20.0/24

r2 = 10.10.20.1

web1 = 10.10.20.101
db1  = 10.10.20.102

Router Links

r1-r2 = 10.255.12.0/30

r1 = 10.255.12.1
r2 = 10.255.12.2

r2-r3 = 10.255.23.0/30

r2 = 10.255.23.1
r3 = 10.255.23.2