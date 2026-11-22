import os
from urllib.request import urlopen


config.load_autoconfig(False)


def enable_catppuccin_theme(theme_type: str) -> None:
    if not os.path.exists(config.configdir / "catppuccin.py"):
        theme = "https://raw.githubusercontent.com/catppuccin/qutebrowser/main/setup.py"
        with urlopen(theme) as theme_html:
            with open(config.configdir / "catppuccin.py", "a") as file:
                file.writelines(theme_html.read().decode("utf-8"))

    if os.path.exists(config.configdir / "catppuccin.py"):
        import catppuccin
        catppuccin.setup(c, theme_type, True)
enable_catppuccin_theme("latte")

c.auto_save.session = True
c.editor.command = ["nvim", "{file}"]
c.tabs.position = "left"
c.content.blocking.enabled = True
# For Enthium keyboard layout
c.hints.chars = "ciaehtns"
c.tabs.select_on_remove = "prev"
c.tabs.width = 200
default_page =  "qute://help"
c.url.default_page = default_page
c.url.start_pages = default_page
c.url.searchengines = { "DEFAULT": "https://www.google.com/search?q={}" }
c.colors.webpage.preferred_color_scheme = "auto"

config.unbind("M", mode="normal")
config.unbind("m", mode="normal")
config.bind("m", "mode-enter set_mark")

config.unbind("`", mode="normal")
config.bind("`", "mode-enter jump_mark")

config.unbind("d", mode="normal")
config.bind("d", "quickmark-save")
config.bind("D", "bookmark-add")
config.bind("W", "tab-close")

config.bind("e", "tab-select")
config.bind("<space>p", "tab-pin")

config.unbind("<Ctrl-p>", mode="command")
config.bind("<Ctrl-p>", "completion-item-focus prev", mode="command")
config.unbind("<Ctrl-n>", mode="command")
config.bind("<Ctrl-n>", "completion-item-focus next", mode="command")
