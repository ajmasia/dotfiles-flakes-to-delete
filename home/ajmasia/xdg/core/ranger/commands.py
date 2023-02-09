from ranger.api.commands import *

# https://github.com/ranger/ranger/wiki/Integrating-File-Search-with-fzy
# Now, simply bind this function to a key, by adding this to your ~/.config/ranger/rc.conf: map <C-f> fzy_find
class fzy_find(Command):
    """
    :fzy_find

    Find a file using fzy.

    With a prefix argument select only directories.

    See: https://github.com/junegunn/fzy
    """
    def execute(self):
        import subprocess
        if self.quantifier:
            # match only directories
            command="find -L . \( -path '*/\.*' -o -fstype 'dev' -o -fstype 'proc' \) -prune \
            -o -type d -print 2> /dev/null | sed 1d | cut -b3- | fzy"
        else:
            # match files and directories
            command="ag -l 2> /dev/null | fzy"
        fzy = self.fm.execute_command(command, stdout=subprocess.PIPE)
        stdout, stderr = fzy.communicate()
        if fzy.returncode == 0:
            fzy_file = os.path.abspath(stdout.decode('utf-8').rstrip('\n'))
            if os.path.isdir(fzy_file):
                self.fm.cd(fzy_file)
            else:
                self.fm.select_file(fzy_file)
# fzy_locate
class fzy_locate(Command):
    """
    :fzy_locate

    Find a file using fzy.

    With a prefix argument select only directories.

    See: https://github.com/junegunn/fzy
    """
    def execute(self):
        import subprocess
        if self.quantifier:
            command="locate home media | fzy"
        else:
            command="locate home media | fzy"
        fzy = self.fm.execute_command(command, stdout=subprocess.PIPE)
        stdout, stderr = fzy.communicate()
        if fzy.returncode == 0:
            fzy_file = os.path.abspath(stdout.decode('utf-8').rstrip('\n'))
            if os.path.isdir(fzy_file):
                self.fm.cd(fzy_file)
            else:
                self.fm.select_file(fzy_file)
