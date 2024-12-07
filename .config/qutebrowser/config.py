# pylint: disable=C0111

from qutebrowser.config.configfiles import ConfigAPI  # noqa: F401
from qutebrowser.config.config import ConfigContainer  # noqa: F401

config: ConfigAPI = config  # noqa: F821 pylint: disable=E0602,C0103
c: ConfigContainer = c  # noqa: F821 pylint: disable=E0602,C0103

# --config
config.load_autoconfig(True)
# config.set("colors.webpage.darkmode.enabled", True)
config.set("colors.webpage.preferred_color_scheme", "dark")

# ** keybindings **
config.bind(",ce", "config-edit")
config.bind(",r", "config-source")
config.bind(",p", "config-cycle -p content.plugins ;; reload")
config.bind(",cd", "set colors.webpage.darkmode.enabled true")
config.bind(",cl", "set colors.webpage.darkmode.enabled false")
config.bind(",cr", "spawn -d chromium-browser {url}")
config.bind(",cg", "spawn -d google-chrome {url}")

config.bind(" ll", "message-info :)")
config.bind(" x", "tab-close")
config.bind(" wq", "quit --save")
# search on selected text on google
config.bind(" sg", "open https://www.google.com")
# quickmarks
config.bind(" m", "set-text-cmd -s :quickmark-load")
config.bind(" qa", "quickmark-save")
config.bind(
    " yd", """spawn -v -m bash -c 'cd ~/Videos/YT/ && youtube-dl "$@"' _ {url}"""
)
config.bind(" sm", "messages")
config.bind(" tr", "spawn --userscript translate")
config.bind(" tx", "spawn --userscript translate --text")
# --c
c.editor.command = ["nvim-qt", "{}"]
c.tabs.background = True
c.tabs.show = "multiple"
# c.new_instance_open_target = 'window'
c.downloads.position = "bottom"
c.content.javascript.enabled = True
c.content.javascript.log_message.excludes = {
    "userscript:_qute_stylesheet": [
        "*Refused to apply inline style because "
        "it violates the following Content Security "
        "Policy directive: *"
    ],
    "userscript:_qute_js": ["*TrustedHTML*"],
}
c.url.searchengines["g"] = "https://www.google.com/search?q={}"
c.url.searchengines["yt"] = "https://www.youtube.com/results?search_query={}"
# c.content.blocking.whitelist = ['*']
# ** aliases **
c.aliases["lab"] = "spawn jupyter lab"
# ** fonts **
# font = "Source Code Pro"
font = "Inconsolata"
font_size = "11pt"
c.fonts.default_family = f'"{font}"'
c.fonts.default_size = font_size
c.fonts.completion.entry = f'{font_size} "{font}"'
c.fonts.debug_console = f'{font_size} "{font}"'
c.fonts.prompts = "default_size sans-serif"
c.fonts.statusbar = f'{font_size} "{font}"'

# ** colors **
config.source("gruvbox.py")
# config.source("onedark.py")
# config.source("dracula.py")
