# Como usuário raiz, crie um back up do /etc/ em formato bz2 no diretório /tmp
dnf install bzip2
dnf install tar

# /-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/
# 1st Option
# -c - Create
# -v - Verbose - Print files on screen
# -f - File
tar -cvf etc.tar /etc
bzip2 etc.tar
mv etc.tar.bz2 /tmp

# /-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/
# 2nd Option
# -c - Create
# -v - Verbose - Print files on screen
# -f - File
# -j - compress to bz2
tar -cvjf etc.tar.bz2 /etc
mv etc.tar.bz2 /tmp


