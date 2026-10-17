# Johdanto
---

  Infrastructure as Code (IaC) tarkoittaa infrastruktuurin hallintaa ohjelmakoodin avulla. Käytännössä se tarkoittaa, että ylläpitäjä kirjoittaa esim. yml-tiedostoon
  halutun tilan laitteelle/laiteille ja jokin automaatiotyökalu esim. ansible asettaa tämän.

---

## Inventory
---

  Inventory sisältää reitittimiä, web-servereitä ja päätelaitteita. Ryhmät on muodostettu verkkosegmentien mukaan.
  Ryhmiä ovat user_network, server_network ja branch_office. Ryhmät ovat hyödyllisiä, koska kaikki laitteet eivät ole samankaltaisia,
  joten jakamalla samankaltaisia laitteita omiin ryhmiinsä saavutetaan tehokkaampi ja helpompi tapa määritellä laitteita.
  
---

## SNMP Playbook
---

### SNMP playbookin yml-tiedosto

```

- name: Install and configure SNMP
  hosts: web1, db1, branch-client

  become: true

  vars:
    snmp_community: public

  tasks:

    - name: Update package cache
      apt:
        update_cache: yes

    - name: Install SNMP packages
      apt:
        name:
          - snmp
          - snmpd
        state: present

    - name: Configure SNMP community
      copy:
        dest: /etc/snmp/snmpd.conf
        content: |
          rocommunity {{ snmp_community }}

          sysLocation HAMK Virtual Lab
          sysContact Administrator

          agentaddress udp:161

      notify: restart snmpd

    - name: Check for running SNMPD
      command: pgrep snmpd
      register: snmpd_status
      failed_when: false
      changed_when: false

    - name: Start SNMPD
      command: /usr/sbin/snmpd
      when: snmpd_status.rc != 0

    - name: Verify SNMP process
      shell: pgrep snmpd
      register: snmpd_process
      changed_when: false

    - name: Display verification
      debug:
        msg: "SNMP agent running on {{ inventory_hostname }}"

  handlers:

    - name: restart snmpd
      shell: pkill snmpd ; /usr/sbin/snmmpd
      ignore_errors: yes

```

### Tulokset

```

PLAY [Install and configure SNMP] ********************************************************************************

TASK [Update package cache] **************************************************************************************
ok: [db1]
ok: [branch-client]
ok: [web1]

TASK [Install SNMP packages] *************************************************************************************
ok: [branch-client]
ok: [web1]
ok: [db1]

TASK [Configure SNMP community] **********************************************************************************
ok: [branch-client]
ok: [web1]
ok: [db1]

TASK [Check for running SNMPD] ***********************************************************************************
ok: [db1]
ok: [branch-client]
ok: [web1]

TASK [Start SNMPD] ***********************************************************************************************
skipping: [web1]
skipping: [db1]
skipping: [branch-client]

TASK [Verify SNMP process] ***************************************************************************************
ok: [web1]
ok: [db1]
ok: [branch-client]

TASK [Display verification] **************************************************************************************
ok: [web1] => {
    "msg": "SNMP agent running on web1"
}
ok: [db1] => {
    "msg": "SNMP agent running on db1"
}
ok: [branch-client] => {
    "msg": "SNMP agent running on branch-client"
}

PLAY RECAP *******************************************************************************************************
branch-client              : ok=6    changed=0    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0
db1                        : ok=6    changed=0    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0
web1                       : ok=6    changed=0    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

```

---

## Node Exporter Playbook
---

### Node Exporter yml-tiedosto

```

- name: Install Prometheus Node Exporter
  hosts: ubuntu_hosts
  become: true

  vars:
    node_exporter_version: "1.9.1"

  tasks:

    - name: Install prerequisite packages
      apt:
        name:
          - wget
          - tar
        state: present
        update_cache: yes

    - name: Create installation directory
      file:
        path: /opt/node_exporter
        state: directory
        mode: "0755"

    - name: Download Node Exporter
      get_url:
        url: "https://github.com/prometheus/node_exporter/releases/download/v{{ node_exporter_version }}/node_exporter-{{ node_exporter_version }}.linux-amd64.tar.gz"
        dest: /tmp/node_exporter.tar.gz

    - name: Extract archive
      unarchive:
        src: /tmp/node_exporter.tar.gz
        dest: /tmp
        remote_src: yes

    - name: Install exporter binary
      copy:
        src: "/tmp/node_exporter-{{ node_exporter_version }}.linux-amd64/node_exporter"
        dest: /opt/node_exporter/node_exporter
        mode: "0755"
        remote_src: yes

    - name: Start node_exporter
      shell: |
        pkill node_exporter || true
        nohup /opt/node_exporter/node_exporter > /tmp/node_exporter.log 2>&1 &
      args:
        executable: /bin/bash

    - name: Verify exporter responds
      uri:
        url: http://localhost:9100/metrics
        status_code: 200
      register: result

    - name: Show verification result
      debug:
        msg: "Node Exporter running on {{ inventory_hostname }}"

```

### Tulokset

```

PLAY [Install Prometheus Node Exporter] **************************************************************************

TASK [Install prerequisite packages] *****************************************************************************
ok: [client1]
ok: [branch-client]
ok: [db1]
ok: [web1]

TASK [Create installation directory] *****************************************************************************
ok: [branch-client]
ok: [web1]
ok: [client1]
ok: [db1]

TASK [Download Node Exporter] ************************************************************************************
ok: [web1]
ok: [branch-client]
ok: [db1]
ok: [client1]

TASK [Extract archive] *******************************************************************************************
ok: [db1]
ok: [web1]
ok: [client1]
ok: [branch-client]

TASK [Install exporter binary] ***********************************************************************************
ok: [client1]
ok: [db1]
ok: [web1]
ok: [branch-client]

TASK [Start node_exporter] ***************************************************************************************
changed: [branch-client]
changed: [db1]
changed: [client1]
changed: [web1]

TASK [Verify exporter responds] **********************************************************************************
ok: [branch-client]
ok: [db1]
ok: [web1]
ok: [client1]

TASK [Show verification result] **********************************************************************************
ok: [client1] => {
    "msg": "Node Exporter running on client1"
}
ok: [web1] => {
    "msg": "Node Exporter running on web1"
}
ok: [db1] => {
    "msg": "Node Exporter running on db1"
}
ok: [branch-client] => {
    "msg": "Node Exporter running on branch-client"
}

PLAY RECAP *******************************************************************************************************
branch-client              : ok=8    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
client1                    : ok=8    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
db1                        : ok=8    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
web1                       : ok=8    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

```

---

## Vertailu
---

  Käsintehdyt asennukset oli nopea tehdä yhdelle laitteelle, mutta niissä tuli toistoa, kun sama asia piti tehdä monelle laitteelle.
  Ansiblella tehdyt asennukset taas olivat hieman haastavampia ja vei vähän enemmän aikaa mutta toistoa ei tullut,
  kun samat asiat meni kerralla useammalle laitteelle.

  Automaation hyöty tulee selväksi kun toimitaan isommassa ympäristössä ja laitteita on kymmeniä tai enemmän. Aikaa säästyy paljon konfiguraatiossa ja
  sen päivittämisessä, josta tulee myös helpompaa. Myös dokumentoimisesta tulee helpompaa, kun esim Ansiblea käytettäessä itse playbook toimii dokumentaationa.
  Versionhallinta on tällöin helppoa esim. työntämällä päivitysten jälkeen playbookin git:iin.

  Automaatio on välttämätöntä, kun ympäristön koko kasvaa niin suureksi, että laitekohtainen käsin konfiguroiminen ei ole enää ajankäytön kannalta mahdollista.
  Se on välttämätöntä myös silloin, kun järjestelmän tulee täyttää viranomais- tai auditointivaatimukset, koska auditoijat vaativat täydellisen lokin siitä,
  kuka muutti mitä ja milloin.

  ---

  ## Yhteenveto
  ---

  Tässä harjoituksessa tuli opittua ansiblen käyttöäsekä yml:ää ja automaation hyödyistä.  

  ---
