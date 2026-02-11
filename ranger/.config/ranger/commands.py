from ranger.api.commands import Command
import subprocess

class z(Command):
    """
    :z <query>

    Jump to a directory using zoxide
    """
    def execute(self):
        query = self.arg(1)
        if not query:
            self.fm.notify("Usage: :z <keyword>", bad=True)
            return

        try:
            result = subprocess.check_output(
                ["zoxide", "query", query],
                universal_newlines=True
            ).strip()

            if result:
                self.fm.cd(result)
        except Exception:
            self.fm.notify("No match found", bad=True)
