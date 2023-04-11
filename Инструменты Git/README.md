
# netology study devops
## 1 Вопрос
git show aefea
## 2 Вопрос
 v0.12.23
## 3 Вопрос
git cat-file -p b8d720\
parent 56cd7859e05c36c06b56d013b55a252d0bb7e158\
parent 9ea88f22fc6269854151c571162c5bcf958bee2b\

## 4 вопрос
git log --pretty=format:"%h %s" v0.12.23..v0.12.24\
или\
git log --pretty=format:"%h %ad | %aN | %s" --date=short v0.12.23..v0.12.24\

>33ff1c03bb v0.12.24\
b14b74c493 [Website] vmc provider links\
3f235065b9 Update CHANGELOG.md\
6ae64e247b registry: Fix panic when server is unreachable\
5c619ca1ba website: Remove links to the getting started guide's old location\
06275647e2 Update CHANGELOG.md\
d5f9411f51 command: Fix bug when using terraform login on Windows\
4b6d06cc5d Update CHANGELOG.md\
dd01a35078 Update CHANGELOG.md\
225466bc3e Cleanup after v0.12.23 release\


