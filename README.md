 ### Environment variables

| Name                         | Description                                                                  | Default value |
| ---------------------------- |:----------------------------------------------------------------------------:| -------------:|
| **RELAY_TYPE**               | The type of relay (bridge, middle or exit)                                   | middle        |
| **RELAY_NICKNAME**           | The nickname of your relay                                                   | ChangeMe      |
| **CONTACT_GPG_FINGERPRINT**  | Your GPG ID or fingerprint                                                   | none          |
| **CONTACT_NAME**             | Your name                                                                    | none          |
| **CONTACT_EMAIL**            | Your contact email                                                           | none          |
| **RELAY_BANDWIDTH_RATE**     | Limit how much traffic will be allowed through your relay (must be > 20KB/s) | 100 KBytes    |
| **RELAY_BANDWIDTH_BURST**    | Allow temporary bursts up to a certain amount                                | 200 KBytes    |
| **RELAY_ORPORT**             | Default port used for incoming Tor connections (ORPort)                      | 9001          |
| **RELAY_DIRPORT**            | Default port used for directory (DirPort)                                    | 9030          |
| **RELAY_CTRLPORT**           | Default port used for control interface (ControlPort)                        | 9051          |
| **RELAY_ACCOUNTING_MAX**     | Default threshold for sent and recieve (AccountingMax)                       | 1 GBytes      |
| **RELAY_ACCOUNTING_START**   | threshold rest (AccountingStart)                                             | day 00:00     |