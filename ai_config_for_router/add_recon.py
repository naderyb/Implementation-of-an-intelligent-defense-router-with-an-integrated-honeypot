import pandas as pd
import random

df = pd.read_csv('/home/narie/ai/dataset_ready.csv')

#generate synthetic RECON-COWRIE samples
recon_templates = [
	"source:cowrie event:recon ip:{ip} username:- password:- command:- request:-",
	"source:cowrie event:cowrie.session.connect ip:{ip} username:- password:- command:- request:-",
	"source:cowrie event:cowrie.client.version ip:{ip} username:- password:- command:- request:SSH-2.0-OpenSSH",
	"source:cowrie event:cowrie.client.kex ip:{ip} username:- password:- command:- request:-"
	"source:cowrie event:recon ip:{ip} username:root password:- command:- request:-"
]

ips = [f"{random.randint(1,255)}.{random.randint(1,255)}.{random.randint(1,255)}.{random.randint(1,255)}" for _ in range(500)]

new_rows = []
for ip in ips:
	template = random.choice(recon_templates)
	new_rows.append({
		'text': template.format(ip=ip),
		'label': 'RECON-COWRIE'
	})

new_df = pd.DataFrame(new_rows)
df = pd.concat([df, new_df], ignore_index=True).sample(frac=1).reset_index(drop=True)
df.to_csv('/home/narie/ai/dataset_ready.csv', index=False)
print(f"added {len(new_rows)} RECON-COWRIE samples")
print(df['label'].value_counts())
