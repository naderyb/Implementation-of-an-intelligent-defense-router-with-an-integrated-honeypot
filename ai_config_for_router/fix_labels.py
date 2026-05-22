import pandas as pd

df = pd.read_csv('/home/narie/ai/dataset_ready.csv')

def fix_label(row):
	text = row['text'].lower()

	if 'source:dvwa' in text:
		if 'sqli' in text or 'or+1' in text or 'union' in text or 'select' in text:
			return 'SQLI-DVWA'
		elif 'xss' in text or 'script' in text or 'alert' in text:
			return 'XSS-DVWA'
		elif 'exec' in text or 'whoami' in text or 'cmd' in text or '%3b' in text:
			return 'CMD_INJECTION-DVWA'
		elif 'login' in text and 'post' in text:
			return 'BRUTE_FORCE_WEB-DVWA'
		else:
			return 'RECON-DVWA' #web recon dtays on DVWA

	elif 'source:cowrie' in text:
		if 'login.failed' in text:
			return 'BRUTE_FORCE_SSH-COWRIE'
		elif 'login.success' in text:
			return 'SSH_SUCCESS-COWRIE'
		elif 'command' in text:
			return 'SSH_COMMAND-COWRIE'
		else:
			return 'RECON-COWRIE'

	return row['label'] #keeps original if unsure

print("before:")
print(df['label'].value_counts())

df['label'] = df.apply(fix_label, axis=1)

print("\nafter:")
print(df['label'].value_counts())

df.to_csv('/home/narie/ai/dataset_ready.csv', index=False)
print("\ndone!!! dataset relabeled")
