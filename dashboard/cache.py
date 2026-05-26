import threading
real_ip_cache = {}
cache_lock = threading.Lock()
latest_real_ip = None
latest_real_ip_lock = threading.Lock()
