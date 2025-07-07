from pathlib import Path
from traitlets.config.loader import JSONFileConfigLoader

c = get_config()  # noqa

config_d = Path(__file__).parent / "jupyter_server_config.d"
if config_d.exists():
    for cfg in config_d.glob("*.json"):
        c.merge(JSONFileConfigLoader(cfg.name, str(cfg.parent)).load_config())
