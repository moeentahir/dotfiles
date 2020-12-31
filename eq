[1mdiff --git a/ansible/playbook.yml b/ansible/playbook.yml[m
[1mindex 1cdebc0..87e62d2 100644[m
[1m--- a/ansible/playbook.yml[m
[1m+++ b/ansible/playbook.yml[m
[36m@@ -1,16 +1,4 @@[m
[31m-- name: Create directories and copy files[m
[31m-  hosts: localhost[m
[31m-  tasks:[m
[31m-  - name: Create directory[m
[31m-    file:[m
[31m-      path: ~/.config/vim[m
[31m-      state: directory[m
[31m-      recurse: yes[m
[31m-  - copy:[m
[31m-      src: "../git"[m
[31m-      dest: "~/.dotfiles/"[m
[31m-[m
[31m-- name: Ensure homebrew packages are installed.[m
[32m+[m[32m- name: Install packages[m
   hosts: localhost[m
   tasks:[m
     - name: Install packages[m
[36m@@ -21,10 +9,27 @@[m
           - tree[m
           - tmux[m
         state: latest[m
[32m+[m
[32m+[m[32m- name: Copy files[m
[32m+[m[32m  hosts: localhost[m
[32m+[m[32m  tasks:[m
[32m+[m[32m  - name: Copy files[m
[32m+[m[32m    copy:[m
[32m+[m[32m      src: "../{{ item }}"[m
[32m+[m[32m      dest: "~/.dotfiles/"[m
[32m+[m[32m    with_items:[m
[32m+[m[32m      - git[m
[32m+[m[32m      - vim[m[41m [m
[32m+[m[32m      - shell[m
[32m+[m
 - name: Create symbolic link [m
   hosts: localhost[m
   tasks:[m
[31m-  - file:[m
[31m-      src: "~/.dotfiles/git/gitconfig"[m
[31m-      dest: "~/.gitconfig"[m
[32m+[m[32m  - name: Create symbolic link[m[41m [m
[32m+[m[32m    file:[m
[32m+[m[32m      src: "{{ item.src }}"[m
[32m+[m[32m      dest: "{{ item.dest }}"[m
       state: link[m
[32m+[m[32m    with_items:[m
[32m+[m[32m      - { dest: "~/.gitconfig", src: "~/.dotfiles/git/gitconfig" }[m
[32m+[m[32m      - { dest: "~/.vimrc", src: "~/.dotfiles/vim/vimrc" }[m
[1mdiff --git a/shell/rc b/shell/rc[m
[1mindex 3faea86..9140780 100644[m
[1m--- a/shell/rc[m
[1m+++ b/shell/rc[m
[36m@@ -1,6 +1,3 @@[m
[31m-set number[m
[31m-set relativenumber[m
[31m-[m
 alias pbcopy="xclip -selection c" [m
 alias pbpaste="xclip -selection clipboard -o" [m
 [m
